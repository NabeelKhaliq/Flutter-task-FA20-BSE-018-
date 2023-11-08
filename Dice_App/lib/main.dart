import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(DiceApp());
}

class DiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
      ),
      home: DiceGame(),
    );
  }
}

class DiceGame extends StatefulWidget {
  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  Random random = Random();
  List<int> diceValues = [1, 1, 1, 1];
  List<String> playerNames = ['Player 1', 'Player 2', 'Player 3', 'Player 4'];
  List<int> scores = [0, 0, 0, 0];
  int currentPlayer = 0;
  int rollsCount = 0;
  String winnerText = '';
  int numberOfRolls = 1;

  void rollDice() {
    setState(() {
      if (rollsCount == 0) {
        scores = [0, 0, 0, 0];
      }

      diceValues[currentPlayer] = random.nextInt(6) + 1;
      scores[currentPlayer] += diceValues[currentPlayer];

      rollsCount++;

      if (rollsCount >= numberOfRolls * playerNames.length) {
        int maxScore = scores.reduce(max);
        List<int> winners = [];
        for (int i = 0; i < playerNames.length; i++) {
          if (scores[i] == maxScore) {
            winners.add(i);
          }
        }
        winnerText = winners.length > 1 ? 'Winners: ' : 'Winner: ';
        for (int i = 0; i < winners.length; i++) {
          winnerText += playerNames[winners[i]];
          if (i < winners.length - 1) {
            winnerText += ', ';
          }
        }
      }

      if (rollsCount % numberOfRolls == 0) {
        currentPlayer = (currentPlayer + 1) % 4;
      }
    });
  }

  void resetGame() {
    setState(() {
      diceValues = [1, 1, 1, 1];
      currentPlayer = 0;
      rollsCount = 0;
      winnerText = '';
      scores = [0, 0, 0, 0];
      numberOfRolls = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final imageAssets = [
      'images/dice1.png',
      'images/dice2.png',
      'images/dice3.png',
      'images/dice4.png',
      'images/dice5.png',
      'images/dice6.png',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Nabeel Dice App'),
        backgroundColor: Colors.brown,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.greenAccent,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (winnerText.isNotEmpty)
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Text(
                      winnerText,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('Player 1'),
                        Dice(
                          value: diceValues[0],
                          imageAssets: imageAssets,
                          isCurrentPlayer: 0 == currentPlayer,
                        ),
                        Text('Score: ${scores[0]}'),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Player 2'),
                        Dice(
                          value: diceValues[1],
                          imageAssets: imageAssets,
                          isCurrentPlayer: 1 == currentPlayer,
                        ),
                        Text('Score: ${scores[1]}'),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('Player 3'),
                        Dice(
                          value: diceValues[2],
                          imageAssets: imageAssets,
                          isCurrentPlayer: 2 == currentPlayer,
                        ),
                        Text('Score: ${scores[2]}'),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Player 4'),
                        Dice(
                          value: diceValues[3],
                          imageAssets: imageAssets,
                          isCurrentPlayer: 3 == currentPlayer,
                        ),
                        Text('Score: ${scores[3]}'),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: winnerText.isNotEmpty ? null : rollDice,
                      child: Text('Roll Dice'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.yellow),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Number of Rolls: $numberOfRolls'),
                    Slider(
                      value: numberOfRolls.toDouble(),
                      min: 1,
                      max: 10,
                      divisions: 9,
                      onChanged: (double value) {
                        setState(() {
                          numberOfRolls = value.toInt();
                        });
                      },
                      activeColor: Colors.orange,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: FloatingActionButton(
              onPressed: resetGame,
              child: Icon(Icons.refresh),
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class Dice extends StatelessWidget {
  final int value;
  final List<String> imageAssets;
  final bool isCurrentPlayer;

  Dice({
    required this.value,
    required this.imageAssets,
    this.isCurrentPlayer = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(
          color: isCurrentPlayer ? Colors.pink : Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Image.asset(
        imageAssets[value - 1],
        width: 60,
        height: 60,
      ),
    );
  }
}
