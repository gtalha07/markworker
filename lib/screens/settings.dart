import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:markworker/screens/menu.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

bool _isSoundEnabled = true;
bool _isMusicEnabled = true;
bool _isLangChanged = true;
bool _isMute = false;

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  AudioPlayer _player = AudioPlayer(mode: PlayerMode.LOW_LATENCY);

  Future<bool> _willPopCallback() async {
    //change this whole thing
    if (_isMute == false) {
      setState(() {
        _isMute = true;
      });
      _player.stop();
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    _willPopCallback();
    // double h = MediaQuery.of(context).size.height; //screen height
    // double w = MediaQuery.of(context).size.width; //screen width
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/shared/field.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage('assets/images/shared/worker_with_paint.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 5.0.w,
              top: 7.0.h,
              child: Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MenuScreen()));
                  },
                  child: new Image(
                    image: AssetImage('assets/images/shared/bttn.png'),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 25.0.h),
                Container(
                  child: Text(
                    'SETTINGS', //value subjected to change
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 10.0.h),
                Container(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSoundEnabled = !_isSoundEnabled;
                      });
                    },
                    child: new Image(
                      image: _isSoundEnabled
                          ? AssetImage(
                              'assets/images/settingScreenImages/s.png')
                          : AssetImage(
                              'assets/images/settingScreenImages/no_s.png',
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 3.0.h),
                Container(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isMusicEnabled = !_isMusicEnabled;
                        _isMute = !_isMute;
                      });
                    },
                    child: new Image(
                      image: _isMusicEnabled
                          ? AssetImage(
                              'assets/images/settingScreenImages/music.png')
                          : AssetImage(
                              'assets/images/settingScreenImages/no_music.png'),
                    ),
                  ),
                ),
                SizedBox(height: 3.0.h),
                Container(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isLangChanged = !_isLangChanged;
                      });
                    },
                    child: new Image(
                      image: _isLangChanged
                          ? AssetImage(
                              'assets/images/settingScreenImages/en.png')
                          : AssetImage(
                              'assets/images/settingScreenImages/ru.png'),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
