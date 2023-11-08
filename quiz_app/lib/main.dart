import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.yellow,
      ),
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Islamic Quiz App'),
        backgroundColor: Colors.greenAccent,
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Islamic Quiz App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return QuizPage();
                  }),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                minimumSize: Size(200, 60),
              ),
              child: Text(
                'Start Quiz',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _questionIndex = 0;
  int _score = 0;
  int _seconds = 10;
  bool _answeredCorrectly = false;
  bool _quizComplete = false;
  int _selectedAnswerIndex = -1;
  late Timer _timer;

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What is the first pillar of Islam?',
      'answers': ['Shahada', 'Salah', 'Zakat', 'Sawm'],
      'correctAnswer': 'Shahada',
    },
    {
      'questionText': 'Which prophet is known as the Seal of the Prophets?',
      'answers': ['Adam', 'Moses', 'Jesus', 'Muhammad'],
      'correctAnswer': 'Muhammad',
    },
    {
      'questionText': 'How many times a day should Muslims perform Salah (prayer)?',
      'answers': ['1', '3', '5', '7'],
      'correctAnswer': '5',
    },
    {
      'questionText': 'During which month do Muslims fast from dawn to sunset?',
      'answers': ['Rajab', 'Shawwal', 'Ramadan', 'Dhu al-Qi\'dah'],
      'correctAnswer': 'Ramadan',
    },
    {
      'questionText': 'What is the holy book of Islam?',
      'answers': ['Bible', 'Torah', 'Quran', 'Vedas'],
      'correctAnswer': 'Quran',
    },
    {
      'questionText': 'Who was the first Caliph of Islam?',
      'answers': ['Abu Bakr', 'Umar', 'Uthman', 'Ali'],
      'correctAnswer': 'Abu Bakr',
    },
    {
      'questionText': 'What is the Kaaba?',
      'answers': ['The first mosque', 'A sacred stone', 'A black building', 'A city in Saudi Arabia'],
      'correctAnswer': 'A sacred stone',
    },
    {
      'questionText': 'In which city was the Prophet Muhammad born?',
      'answers': ['Mecca', 'Medina', 'Jerusalem', 'Cairo'],
      'correctAnswer': 'Mecca',
    },
    {
      'questionText': 'Which companion of the Prophet Muhammad was known as the "Sword of Allah"?',
      'answers': ['Abu Bakr', 'Umar', 'Uthman', 'Ali'],
      'correctAnswer': 'Ali',
    },
    {
      'questionText': 'What is the festival that marks the end of Ramadan?',
      'answers': ['Eid al-Adha', 'Eid al-Fitr', 'Hajj', 'Umrah'],
      'correctAnswer': 'Eid al-Fitr',
    },
  ];

  void _answerQuestion(String selectedAnswer) {
    if (_quizComplete) {
      return;
    }

    if (selectedAnswer == _questions[_questionIndex]['correctAnswer']) {
      setState(() {
        _answeredCorrectly = true;
        _score++;
      });
    } else {
      setState(() {
        _answeredCorrectly = false;
      });
    }

    _timer.cancel();
    setState(() {
      _selectedAnswerIndex = (_questions[_questionIndex]['answers'] as List<String>).indexOf(selectedAnswer);
    });

    Future.delayed(Duration(seconds: 2), () {
      if (_questionIndex < _questions.length - 1) {
        setState(() {
          _questionIndex++;
          _seconds = 10;
          _answeredCorrectly = false;
          _selectedAnswerIndex = -1;
        });
        _startTimer();
      } else {
        setState(() {
          _quizComplete = true;
        });
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return ResultPage(_score, _questions.length);
          }),
        );
      }
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        _timer.cancel();
        _answeredCorrectly = false;
        _answerQuestion('');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Islamic Quiz App'),
        backgroundColor: Colors.greenAccent,
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: _questionIndex < _questions.length
            ? Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Question ${_questionIndex + 1}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Time Left: $_seconds seconds',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                _questions[_questionIndex]['questionText'].toString(),
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            ...(_questions[_questionIndex]['answers'] as List<String>)
                .asMap()
                .entries
                .map((entry) {
              final index = entry.key;
              final answer = entry.value;
              final isCorrect = index == _selectedAnswerIndex && _answeredCorrectly;
              final isWrong = index == _selectedAnswerIndex && !_answeredCorrectly;

              return Answer(
                answer,
                _answerQuestion,
                isCorrect,
                isWrong,
              );
            }).toList(),
          ],
        )
            : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Quiz is completed!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                'Your Score: $_score out of ${_questions.length}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return WelcomePage();
                    }),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  minimumSize: Size(200, 60),
                ),
                child: Text(
                  'Restart Quiz',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

class Answer extends StatelessWidget {
  final String answerText;
  final Function selectHandler;
  final bool isCorrect;
  final bool isWrong;

  Answer(this.answerText, this.selectHandler, this.isCorrect, this.isWrong);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: () {
          if (!isCorrect && !isWrong) {
            selectHandler(answerText);
          }
        },
        style: ElevatedButton.styleFrom(
          primary: isCorrect ? Colors.green : (isWrong ? Colors.red : Colors.white),
          minimumSize: Size(200, 60),
        ),
        child: Text(
          answerText,
          style: TextStyle(fontSize: 18, color: isCorrect || isWrong ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final int score;
  final int totalQuestions;

  ResultPage(this.score, this.totalQuestions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Results'),
        backgroundColor: Colors.greenAccent,
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Quiz Complete!',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              'Your Score: $score out of $totalQuestions',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) {
                    return WelcomePage();
                  }),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                minimumSize: Size(200, 60),
              ),
              child: Text(
                'Restart Quiz',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

