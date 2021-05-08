import 'dart:async';
import 'dart:developer';
import 'package:markworker/modals/level.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markworker/screens/fail.dart';
import 'package:sizer/sizer.dart';
import 'package:markworker/shared/variables.dart';

class OtpTimer extends StatefulWidget {
  @override
  _OtpTimerState createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  final interval = const Duration(seconds: 1);
  int timerMaxSeconds = secondCounter;
  int currentSeconds = 0;

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
        }
      });
    });
  }

  void inc() async {
    while (imageCounter < 5) {
      // print(imgnumber);
      await Future.delayed(Duration(seconds: secondCounter));
      setState(() {
        imageCounter++;
        secondCounter -= 2;
      });
    }
  }

  @override
  void initState() {
    startTimeout();
    // inc();
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
              child:
                  SvgPicture.asset('assets/images/playScreenImages/time.svg'),
            ),
            //     SizedBox(
            //   width: 5,
            // ),
            Container(
              padding: EdgeInsets.fromLTRB(4.0.w, 1.0.h, 0.0, 0.0),
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
