import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:markworker/screens/menu.dart';
// import 'package:audioplayers/audio_cache.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:markworker/shared/variables.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    // _willPopCallback();
    // double h = MediaQuery.of(context).size.height; //screen height
    // double w = MediaQuery.of(context).size.width; //screen width
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/shared/field.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/shared/worker_with_paint.png'),
              fit: BoxFit.cover,
            )),
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
                  height: 12.0.h,
                  width: 16.0.w,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 25.0.h),
              Container(
                child: isLangChanged
                    ? Text(
                        'SETTINGS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    : Text(
                        'настройки',
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
                      isSoundEnabled = !isSoundEnabled;
                    });
                  },
                  child: isSoundEnabled
                      ? new Image(
                          image: AssetImage(
                              'assets/images/settingScreenImages/s.png'),
                          height: 10.0.h,
                          width: 16.0.w,
                        )
                      : new Image(
                          image: AssetImage(
                              'assets/images/settingScreenImages/no_s.png'),
                          height: 10.0.h,
                          width: 16.0.w,
                        ),
                ),
              ),
              SizedBox(height: 1.0.h),
              Container(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isMusicEnabled = !isMusicEnabled;
                    });
                  },
                  child: isMusicEnabled
                      ? new Image(
                          image: AssetImage(
                              'assets/images/settingScreenImages/music.png'),
                          height: 10.0.h,
                          width: 16.0.w,
                        )
                      : new Image(
                          image: AssetImage(
                              'assets/images/settingScreenImages/no_music.png'),
                          height: 10.0.h,
                          width: 16.0.w,
                        ),
                ),
              ),
              SizedBox(height: 1.0.h),
              Container(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isLangChanged = !isLangChanged;
                    });
                  },
                  child: isLangChanged
                      ? new Image(
                          image: AssetImage(
                              'assets/images/settingScreenImages/en.png'),
                          height: 10.0.h,
                          width: 16.0.w,
                        )
                      : new Image(
                          image: AssetImage(
                              'assets/images/settingScreenImages/ru.png'),
                          height: 10.0.h,
                          width: 16.0.w,
                        ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
