import 'package:flutter/material.dart';
import 'package:markworker/services/timer.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markworker/shared/variables.dart';
import 'dart:async';

class PlayScreen extends StatefulWidget {
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  Widget build(BuildContext context) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.0.h),
              Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 5.0.w),
                    child: SvgPicture.asset(
                        'assets/images/playScreenImages/score.svg'),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0.w, 1.0.h, 0.0, 0.0),
                    child: isLangChanged
                        ? Text(
                            'Score: $score',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 10.0.sp,
                            ),
                            textAlign: TextAlign.center,
                          )
                        : Text(
                            'Очки: ',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 10.0.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                  ),
                ],
              ),
              Spacer(),
              // Stack(
              //   children: <Widget>[
              //     Container(
              //       padding: EdgeInsets.only(right: 5.0.w),
              //       child: SvgPicture.asset(
              //           'assets/images/playScreenImages/time.svg'),
              //     ),
              //   ],
              // ),
              OtpTimer(),
            ],
          ),
          SizedBox(height: 50.0.h),
          Container(
            alignment: Alignment.center,
            child: new Image(
              image: AssetImage(unfilledImages[imageCounter]),
              height: 40.0.h,
              width: 60.0.w,
            ),
          ),
        ],
      ),
    );
  }
}
