import 'package:flutter/material.dart';
import 'package:markworker/services/image_painter.dart';
import 'package:markworker/services/timer.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markworker/shared/utils.dart';
import 'package:markworker/services/audio.dart';
// import 'dart:ui' as ui;
import 'dart:math';

// import 'dart:async';

class PlayScreen extends StatefulWidget {
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> with WidgetsBindingObserver {
  final _offsets = <Offset>[];
  // ui.Image image;
  // Future loadImage(String path) async {
  //   final data = await rootBundle.load(path);
  //   final bytes = data.buffer.asUint8List();
  //   final image = await decodeImageFromList(bytes);
  //   if (mounted) {
  //     setState(() => this.image = image);
  //   }
  // }
  void _stopFile() async {
    MusicPlayer.instance1.musicStop();
  }

  Offset position = Offset(30.0.w, 70.0.h);
  double x, y;
  Random random = new Random();
  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.paused) {
  //     _pauseFile();
  //   } else if (state == AppLifecycleState.resumed) {
  //     _resumeFile();
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addObserver(this);
    x = position.dx;
    y = position.dy;
    imageCounter = random.nextInt(4);
    _stopFile();
  }

  // @override
  // void dispose() {
  //   WidgetsBinding.instance.removeObserver(this);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double h =
        MediaQuery.of(context).size.height - statusBarHeight; //screen height
    double w = MediaQuery.of(context).size.width; //screen width
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
            Row(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 5.0.w),
                      child: new Image(
                        image: AssetImage(
                          'assets/images/playScreenImages/score.png',
                        ),
                        height: 15.0.h,
                        width: 30.0.w,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0.w, 6.5.h, 0.0, 0.0),
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
                              'Очки: $score',
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
                OtpTimer(),
              ],
            ),
            Container(
              alignment: Alignment.center,
              child: SvgPicture.asset(unfilledImages[imageCounter]),
            ),
            Stack(
              children: <Widget>[
                Positioned(
                    left: x,
                    top: y,
                    child: GestureDetector(
                      // onPanStart: (details) {
                      //   _offsets.add(details.globalPosition);
                      //   // setState(() {
                      //   //   x = details.delta.dx;
                      //   //   y = details.globalPosition.dy;
                      //   // });
                      // },
                      onPanUpdate: (details) {
                        _offsets.add(details.globalPosition);
                        if (details.globalPosition.dy <= 10.0.h ||
                            details.globalPosition.dx <= 20.0.w) {
                          setState(() {
                            x -= details.delta.dx;
                            y -= details.delta.dy;
                          });
                        }
                        print(details.globalPosition);
                        if (details.globalPosition.dy >= h ||
                            details.globalPosition.dx >= w - 10.0.w) {
                          setState(() {
                            x -= details.delta.dx;
                            y -= details.delta.dy;
                          });
                        } else {
                          setState(() {
                            x += details.delta.dx;
                            y += details.delta.dy;
                          });
                        }
                      },
                      onPanEnd: (details) {
                        _offsets.add(null);
                      },
                      child: Container(
                        child: new Image(
                          image: AssetImage(
                              'assets/images/playScreenImages/worker_with_paint.png'),
                          height: 40.0.h,
                          width: 40.0.w,
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


//  GestureDetector(
//         onPanStart: (details) {
//           print('globalPosition: ${details.globalPosition}');
//           setState(() {
//             _offsets.add(details.globalPosition);
//           });
//         },
//         onPanUpdate: (details) {
//           print('globalPosition: ${details.globalPosition}');
//           setState(() {
//             _offsets.add(details.globalPosition);
//           });
//         },
//         onPanEnd: (details) {
//           _offsets.add(null);
//         },



// Draggable(
//                     child: new Image(
//                       image: AssetImage(
//                           'assets/images/playScreenImages/worker_with_paint.png'),
//                       height: 20.0.h,
//                       width: 30.0.w,
//                     ),
//                     feedback: new Image(
//                       image: AssetImage(
//                           'assets/images/playScreenImages/worker_with_paint.png'),
//                       height: 20.0.h,
//                       width: 30.0.w,
//                     ),
//                     childWhenDragging: Container(),
//                     onDragEnd: (dragDetails) {
//                       if (dragDetails.offset.dy <= 0 ||
//                           dragDetails.offset.dx <= 0) {
//                         x = dragDetails.offset.dx;
//                         y = dragDetails.offset.dx;
//                       } else if (dragDetails.offset.dy >= h ||
//                           dragDetails.offset.dx >= w) {
//                         x = dragDetails.offset.dx;
//                         y = dragDetails.offset.dx;
//                       } else {
//                         setState(() {
//                           x = dragDetails.offset.dx;
//                           y = dragDetails.offset.dy;
//                         });
//                         print(x);
//                         print(y);
//                       }
//                     },
//                   ),