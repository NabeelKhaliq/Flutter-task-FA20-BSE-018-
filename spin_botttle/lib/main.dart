import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: CenteredButtonSliderScreen(),
    );
  }
}

class CenteredButtonSliderScreen extends StatefulWidget {
  @override
  _CenteredButtonSliderScreenState createState() =>
      _CenteredButtonSliderScreenState();
}

class _CenteredButtonSliderScreenState
    extends State<CenteredButtonSliderScreen> {
  double _playerCount = 0;
  bool isVolumeOn = true;
  final ValueNotifier<double> _rotationAngle = ValueNotifier<double>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nabeel Spin Bottle App'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.black12,
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SimpleScreen(playerCount: _playerCount),
                        ),
                      );
                    },
                    child: Text('Simple Spin'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrangeAccent,
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TruthScreen(
                            playerControllers: List.generate(
                              _playerCount.toInt(),
                                  (index) => TextEditingController(),
                            ),
                            playerCount: _playerCount,
                          ),
                        ),
                      );
                    },
                    child: Text('Truth & Spin'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrangeAccent,
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 350,
                    child: Slider(
                      value: _playerCount,
                      min: 0,
                      max: 10,
                      onChanged: (double value) {
                        setState(() {
                          _playerCount = value;
                        });
                      },
                      activeColor: Colors.green,
                      inactiveColor: Colors.red,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Select the number of players: ${_playerCount.toInt().toString()}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Contact Us',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isVolumeOn = !isVolumeOn;
                    });
                  },
                  icon: Icon(
                    isVolumeOn ? Icons.volume_up : Icons.volume_off,
                    size: 40,
                    color: isVolumeOn ? Colors.green : Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SimpleScreen extends StatelessWidget {
  final double playerCount;
  final List<TextEditingController> playerControllers;

  SimpleScreen({required this.playerCount})
      : playerControllers = List.generate(
      playerCount.toInt(), (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nabeel Spin Bottle App'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.black12,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int i = 0; i < playerCount.toInt(); i++)
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Player ${i + 1}: '),
                        Container(
                          width: 150,
                          child: TextField(
                            controller: playerControllers[i],
                            decoration: InputDecoration(
                              labelText: '',
                              labelStyle: TextStyle(color: Colors.black26),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ElevatedButton(
                  onPressed: () {
                    List<String> playerNames = [];
                    for (int i = 0; i < playerCount.toInt(); i++) {
                      playerNames.add(playerControllers[i].text);
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SpinningBottleScreen(
                          playerNames: playerNames,
                          selectedImage: null,
                        ),
                      ),
                    );
                  },
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.brown,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final selectedImage = await selectImages(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SpinningBottleScreen(
                          playerNames: [],
                          selectedImage: selectedImage,
                        ),
                      ),
                    );
                  },
                  child: Text('Select Images'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.brown,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SpinningBottleScreen extends StatefulWidget {
  final List<String> playerNames;
  final String? selectedImage;

  SpinningBottleScreen({
    required this.playerNames,
    required this.selectedImage,
  });

  @override
  _SpinningBottleScreenState createState() => _SpinningBottleScreenState();
}

class _SpinningBottleScreenState extends State<SpinningBottleScreen> {
  final Random _random = Random();
  final ValueNotifier<double> _rotationAngle = ValueNotifier<double>(0);
  Timer? _rotationTimer;

  @override
  void initState() {
    super.initState();
    _startRotationTimer();
  }

  @override
  void dispose() {
    _rotationTimer?.cancel();
    _rotationAngle.dispose();
    super.dispose();
  }

  void _startRotationTimer() {
    _rotationTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      final double randomAngle = _random.nextDouble() * 360;
      _rotationAngle.value = randomAngle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spinning Bottle Screen'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.black12,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedBuilder(
                animation: _rotationAngle,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _rotationAngle.value * (pi / 180),
                    child: Image.asset(
                      widget.selectedImage ?? 'images/pic.jpg',
                      width: 150,
                      height: 150,
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _rotationTimer?.cancel();
                  _startRotationTimer();
                },
                child: Text('Start Rotation'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              for (int i = 0; i < widget.playerNames.length; i++)
                Container(
                  alignment: _getAlignment(i, widget.playerNames.length),
                  child: Text(
                    widget.playerNames[i],
                    style: TextStyle(fontSize: 18),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Alignment _getAlignment(int index, int length) {
    if (index == 0) {
      return Alignment.topLeft;
    } else if (index == 1) {
      return Alignment.topRight;
    } else if (index == 2) {
      return Alignment.bottomLeft;
    } else if (index == 3) {
      return Alignment.bottomRight;
    } else {
      return Alignment.center;
    }
  }
}

class TruthScreen extends StatefulWidget {
  final List<TextEditingController> playerControllers;
  final double playerCount;

  TruthScreen({required this.playerControllers, required this.playerCount});

  @override
  _TruthScreenState createState() => _TruthScreenState();
}

class _TruthScreenState extends State<TruthScreen> {
  TextEditingController taskController = TextEditingController();
  List<String> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Truth Screen'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.black12,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (int i = 0; i < widget.playerCount.toInt(); i++)
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Player ${i + 1}: '),
                      Container(
                        width: 150,
                        child: TextField(
                          controller: widget.playerControllers[i],
                          decoration: InputDecoration(
                            labelText: '',
                            labelStyle: TextStyle(color: Colors.black26),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ElevatedButton(
                onPressed: () {
                  List<String> playerNames = [];
                  for (int i = 0; i < widget.playerCount.toInt(); i++) {
                    playerNames.add(widget.playerControllers[i].text);
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SpinningBottleScreen(
                        playerNames: playerNames,
                        selectedImage: null,
                      ),
                    ),
                  );
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final selectedImage = await selectImages(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SpinningBottleScreen(
                        playerNames: [],
                        selectedImage: selectedImage,
                      ),
                    ),
                  );
                },
                child: Text('Select Images'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _showTaskTextField(context);
                },
                child: Text('Task'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyanAccent,
                ),
              ),
              SizedBox(height: 20),
              for (int i = 0; i < tasks.length; i++)
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('Task ${i + 1}: ${tasks[i]}'),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showTaskTextField(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Task'),
          content: TextField(
            controller: taskController,
            decoration: InputDecoration(
              hintText: 'Enter your task',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  tasks.add(taskController.text);
                  taskController.clear();
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

Future<String?> selectImages(BuildContext context) async {
  final List<String> images = [
    'images/pic.jpg',
    'images/pic2.png',
    'images/pic3.jpg',
    'images/pic5.jpg',
    'images/pic6.png',
  ];

  return await showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('Select an Image'),
        children: images
            .map((image) => SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, image);
          },
          child: Image.asset(image, width: 50, height: 50),
        ))
            .toList(),
      );
    },
  );
}
