import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markworker/shared/utils.dart';
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
                    left: 17.0.w,
                    child: SvgPicture.asset(
                      unfilledImages[0],
                      height: 15.0.h,
                      width: 15.0.w,
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
                      top: 22.0.h,
                      left: 58.0.w,
                      child: SvgPicture.asset(
                        unfilledImages[1],
                        height: 14.0.h,
                        width: 14.0.w,
                      )),
                  Positioned(
                    top: 31.0.h,
                    left: 65.0.w,
                    child: new Image(
                      image:
                          AssetImage('assets/images/playScreenImages/time.png'),
                      width: 20.0.w,
                      height: 20.0.h,
                    ),
                  ),
                  Positioned(
                      top: 48.0.h,
                      left: 10.0.w,
                      child: SvgPicture.asset(
                        unfilledImages[2],
                        height: 13.0.h,
                        width: 13.0.w,
                      )),
                  Positioned(
                    top: 56.0.h,
                    left: 12.0.w,
                    child: new Image(
                      image:
                          AssetImage('assets/images/playScreenImages/time.png'),
                      width: 20.0.w,
                      height: 20.0.h,
                    ),
                  ),
                  Positioned(
                      top: 49.0.h,
                      left: 48.0.w,
                      child: SvgPicture.asset(
                        unfilledImages[4],
                        height: 13.0.h,
                        width: 13.0.w,
                      )),
                  Positioned(
                    top: 57.0.h,
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
                      right: 5.0.w,
                      child: SvgPicture.asset(
                        unfilledImages[3],
                        height: 15.0.h,
                        width: 15.0.w,
                      )),
                  Positioned(
                    top: 59.0.h,
                    right: 5.0.w,
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
