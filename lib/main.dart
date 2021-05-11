import 'package:flutter/material.dart';
import 'package:markworker/screens/menu.dart';
import 'package:sizer/sizer.dart';
import 'package:markworker/shared/utils.dart';
import 'package:markworker/services/audio.dart';
import 'package:flutter/services.dart';

class _Handler extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (isMusicEnabled == true) MusicPlayer.instance1.resumeMusic(bgMusic);
    } else {
      MusicPlayer.instance1.pauseMusic();
    }
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  WidgetsBinding.instance.addObserver(new _Handler());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
  // AudioCache audioCache = AudioCache();
  // Future<bool> _willPopCallback() async {
  //   if (isPlaying == false) {
  //     setState(() {
  //       isPlaying = true;
  //     });
  //     audioPlayer.stop();
  //   }
  //   return true;
  // }

  // openingActions() async {
  //   audioPlayer = await audioCache.loop('music/background music.mp3');
  // }

  // @override
  // void initState() {
  //   openingActions();
  //   super.initState();
  // }
  void _playFile() async {
    MusicPlayer.instance1.playMusic(bgMusic);
  }

  @override
  Widget build(BuildContext context) {
    _playFile();
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          home: WillPopScope(
            onWillPop: () => Future.value(false),
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
