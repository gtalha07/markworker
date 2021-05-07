import 'package:flutter/material.dart';
import 'package:markworker/screens/menu.dart';
import 'package:sizer/sizer.dart';
import 'package:markworker/screens/results.dart';
import 'package:markworker/screens/settings.dart';
import 'package:markworker/screens/fail.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
// import 'package:markworker/services/audio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioPlayer _player = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
  AudioCache _cache = AudioCache();
  bool _isPlaying = false;
  Future<bool> _willPopCallback() async {
    //change this whole thing
    if (_isPlaying == false) {
      setState(() {
        _isPlaying = true;
      });
      _player.stop();
    }
    return true;
  }

  openingActions() async {
    //add this
    _player = await _cache.loop('music/background music.mp3');
  }

  @override
  Widget build(BuildContext context) {
    openingActions();
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          home: WillPopScope(
            onWillPop: _willPopCallback,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: MenuScreen(),
            ),
          ),
        );
      },
    );
  }
}
