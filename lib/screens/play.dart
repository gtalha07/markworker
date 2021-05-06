import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20.0.h),
                Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 5.0.w),
                      child: Image.asset(
                          'assets/images/playScreenImages/score.png'),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0.w, 1.0.h, 0.0, 0.0),
                      child: Text(
                        'Score: ',
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
                Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 5.0.w),
                      child: Image.asset(
                          'assets/images/playScreenImages/time.png'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
