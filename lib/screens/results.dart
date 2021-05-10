import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
// import 'package:markworker/screens/menu.dart';

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    // double h = MediaQuery.of(context).size.height; //screen height
    // double w = MediaQuery.of(context).size.width; //screen width
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
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
                    image: AssetImage(
                        'assets/images/shared/worker_with_paint.png'),
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
                      Navigator.pop(context);
                    },
                    child: new Image(
                      image: AssetImage('assets/images/shared/bttn.png'),
                      height: 12.0.h,
                      width: 16.0.w,
                    ),
                  ),
                ),
              ),
              Stack(
                children: <Widget>[
                  Positioned(
                    top: 20.0.h,
                    left: 20.0.w,
                    child: new Image(
                      image: AssetImage(
                          'assets/images/playScreenImages/timer.png'),
                      height: 20.0.h,
                      width: 20.0.w,
                    ),
                  ),
                  Positioned(
                    top: 30.0.h,
                    left: 20.0.w,
                    child: new Image(
                      image:
                          AssetImage('assets/images/playScreenImages/time.png'),
                      width: 20.0.w,
                      height: 20.0.h,
                    ),
                  ),
                  Positioned(
                    top: 18.0.h,
                    left: 60.0.w,
                    child: new Image(
                      image:
                          AssetImage('assets/images/playScreenImages/cup.png'),
                      height: 25.0.h,
                      width: 25.0.w,
                    ),
                  ),
                  Positioned(
                    top: 30.0.h,
                    left: 62.0.w,
                    child: new Image(
                      image:
                          AssetImage('assets/images/playScreenImages/time.png'),
                      width: 20.0.w,
                      height: 20.0.h,
                    ),
                  ),
                  Positioned(
                    top: 45.0.h,
                    left: 10.0.w,
                    child: new Image(
                      image:
                          AssetImage('assets/images/playScreenImages/ball.png'),
                      height: 20.0.h,
                      width: 20.0.w,
                    ),
                  ),
                  Positioned(
                    top: 58.0.h,
                    left: 10.0.w,
                    child: new Image(
                      image:
                          AssetImage('assets/images/playScreenImages/time.png'),
                      width: 20.0.w,
                      height: 20.0.h,
                    ),
                  ),
                  Positioned(
                    top: 48.0.h,
                    left: 45.0.w,
                    child: new Image(
                      image:
                          AssetImage('assets/images/playScreenImages/flag.png'),
                      height: 16.0.h,
                      width: 16.0.w,
                    ),
                  ),
                  Positioned(
                    top: 58.0.h,
                    left: 42.0.w,
                    child: new Image(
                      image:
                          AssetImage('assets/images/playScreenImages/time.png'),
                      width: 20.0.w,
                      height: 20.0.h,
                    ),
                  ),
                  Positioned(
                    top: 50.0.h,
                    left: 75.0.w,
                    child: new Image(
                      image: AssetImage(
                          'assets/images/playScreenImages/whistle.png'),
                      height: 16.0.h,
                      width: 16.0.w,
                    ),
                  ),
                  Positioned(
                    top: 60.0.h,
                    left: 75.0.w,
                    child: new Image(
                      image:
                          AssetImage('assets/images/playScreenImages/time.png'),
                      width: 20.0.w,
                      height: 20.0.h,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
