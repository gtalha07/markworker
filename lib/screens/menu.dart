import 'package:flutter/material.dart';
import 'package:markworker/screens/play.dart';
import 'package:markworker/screens/settings.dart';
import 'package:sizer/sizer.dart';
import 'package:markworker/screens/results.dart';
import 'package:markworker/shared/variables.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    // double h = MediaQuery.of(context).size.height; //screen height
    // double w = MediaQuery.of(context).size.width; //screen width
    // Future.wait([
    //   precachePicture(
    //     ExactAssetPicture(
    //         SvgPicture.svgStringDecoder, 'assets/images/shared/bttn.svg'),
    //     null,
    //   ),
    //   precachePicture(
    //     ExactAssetPicture(
    //         SvgPicture.svgStringDecoder, 'assets/images/shared/field.svg'),
    //     null,
    //   ),
    //   precachePicture(
    //     ExactAssetPicture(SvgPicture.svgStringDecoder,
    //         'assets/images/shared/worker_with_paint.svg'),
    //     null,
    //   ),
    // ]);
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 25.0.h),
                Container(
                  child: isLangChanged
                      ? Text(
                          'BEST SCORE: $score',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0.sp,
                          ),
                        )
                      : Text(
                          'Лучший результат: $score',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0.sp,
                          ),
                        ),
                ),
                SizedBox(height: 7.0.h),
                Container(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlayScreen()));
                    },
                    child: Container(
                      height: 10.0.h,
                      width: 70.0.w,
                      child: isLangChanged
                          ? new Image(
                              image: AssetImage(
                                'assets/images/menuScreenImages/start.png',
                              ),
                            )
                          : new Image(
                              image: AssetImage(
                                'assets/images/menuScreenImages/start_ru.png',
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 3.0.h),
                Container(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultScreen()));
                    },
                    child: Container(
                      height: 10.0.h,
                      width: 70.0.w,
                      child: isLangChanged
                          ? new Image(
                              image: AssetImage(
                                'assets/images/menuScreenImages/restart.png',
                              ),
                            )
                          : new Image(
                              image: AssetImage(
                                'assets/images/menuScreenImages/restart_ru.png',
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 3.0.h),
                Container(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsScreen()));
                    },
                    child: Container(
                      height: 10.0.h,
                      width: 60.0.w,
                      child: isLangChanged
                          ? new Image(
                              image: AssetImage(
                                'assets/images/menuScreenImages/mm.png',
                              ),
                            )
                          : new Image(
                              image: AssetImage(
                                'assets/images/menuScreenImages/mm_ru.png',
                              ),
                            ),
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
