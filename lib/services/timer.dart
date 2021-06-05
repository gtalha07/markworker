import 'dart:async';
import 'package:flutter/material.dart';
import 'package:markworker/screens/fail.dart';
import 'package:sizer/sizer.dart';
import 'package:markworker/shared/utils.dart';
import 'package:markworker/services/audio.dart';

class OtpTimer extends StatefulWidget {
  @override
  _OtpTimerState createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  final interval = const Duration(seconds: 1);
  int timerMaxSeconds = secondCounter;
  int currentSeconds = 0;
  void _playFile() async {
    MusicPlayer.instance3.playLoseSound(loseSound);
  }

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        print(timer.tick);
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) {
          timer.cancel();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoseScreen()));
          if (isSoundEnabled == true) {
            _playFile();
          }
          imageCounter = random.nextInt(5);
        }
      });
    });
  }

  // void inc() async {
  //   while (imageCounter < 5) {
  //     // print(imgnumber);
  //     await Future.delayed(Duration(seconds: secondCounter));
  //     setState(() {
  //       imageCounter++;
  //       secondCounter -= 2;
  //     });
  //   }
  // }

  @override
  void initState() {
    startTimeout();
    // Pinc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(right: 5.0.w),
                child: new Image(
                  image: AssetImage('assets/images/playScreenImages/time.png'),
                  height: 10.0.h,
                  width: 20.0.w,
                )),
            Container(
              padding: EdgeInsets.fromLTRB(5.0.w, 4.0.h, 0.0, 0.0),
              child: Text(
                timerText,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
