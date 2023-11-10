import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AudioPlayerApp());
}

class AudioPlayerApp extends StatefulWidget {
  const AudioPlayerApp({super.key});

  @override
  State<AudioPlayerApp> createState() => _AudioPlayerAppState();
}

class _AudioPlayerAppState extends State<AudioPlayerApp> {
  final player = AudioPlayer();
  bool isMuted = false;
  List<String> audioUrls = [
    'assets/audio/note1.wav',
    'assets/audio/note2.wav',
    'assets/audio/note3.wav',
    'assets/audio/note4.wav',
    'assets/audio/note5.wav',
    'assets/audio/note6.wav',
    'assets/audio/note7.wav',
  ];

  Future<void> playAudioFromUrl(String url) async {
    await player.play(UrlSource(url));
  }

  void toggleMute() {
    setState(() {
      isMuted = !isMuted;
      player.setVolume(isMuted ? 0.0 : 1.0);
    });
  }

  List<Color> barColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  Widget buildXylophoneBar({required Color color, required String audioUrl}) {
    double _height = MediaQuery.of(context).size.height;
    return Expanded(
      child: InkWell(
        onTap: () {
          playAudioFromUrl(audioUrl);
        },
        child: Container(
          height: _height * 0.143,
          color: color,
          child: Center(
            child: TextButton(
              onPressed: () {
                playAudioFromUrl(audioUrl);
              },
              child: Text('Play'),
            ),
          ),
        ),
      ),
    );
  }

  void addXylophoneBar() {
    if (audioUrls.length < 7) {
      audioUrls.add('assets/audio/note${audioUrls.length + 1}.wav');
      setState(() {});
    }
  }

  void removeXylophoneBar() {
    if (audioUrls.length > 0) {
      audioUrls.removeLast();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Color greenColor = Colors.green;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Xylophone App'),
          backgroundColor: Colors.greenAccent,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 0; i < audioUrls.length; i++)
              buildXylophoneBar(
                color: i < barColors.length ? barColors[i] : Colors.transparent,
                audioUrl: audioUrls[i],
              ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: addXylophoneBar,
              tooltip: 'Add bars',
              child: Icon(Icons.add),
              backgroundColor: Colors.yellow,
            ),
            FloatingActionButton(
              onPressed: removeXylophoneBar,
              tooltip: 'Remove bars',
              child: Icon(Icons.remove),
              backgroundColor: Colors.deepOrangeAccent,
            ),
            FloatingActionButton(
              onPressed: toggleMute,
              tooltip: isMuted ? 'Unmute' : 'Mute',
              child: Icon(isMuted ? Icons.volume_off : Icons.volume_up),
              backgroundColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
