import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markworker/services/canvasPathState.dart';

import 'package:markworker/services/painterCanvas.dart';
import 'package:markworker/services/timer.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:markworker/shared/utils.dart';
import 'package:markworker/services/audio.dart';
// import 'dart:ui' as ui;

// import 'dart:async';

class PlayScreen extends StatefulWidget {
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> with WidgetsBindingObserver {
  List<Offset> points = <Offset>[];
  void _pauseFile() async {
    MusicPlayer.instance1.pauseMusic();
  }

  @override
  void initState() {
    super.initState();
    _pauseFile();
  }

  // @override
  // void dispose() {
  //   WidgetsBinding.instance.removeObserver(this);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: ChangeNotifierProvider(
          create: (_) => CanvasPathsState(),
          child: Stack(
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
              DrawzoCanvas(),
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
            ],
          ),
        ),
      ),
    );
  }
}

// class Sketcher extends CustomPainter {
//   final List<Offset> points;

//   Sketcher(this.points);

//   @override
//   bool shouldRepaint(Sketcher oldDelegate) {
//     return oldDelegate.points != points;
//   }

//   @override
//   bool hitTest(Offset position) {
//     Path path = parseSvgPathData(
//         'M101.092 0H152.81V29.2542H143.646V47.2005C154.579 48.6509 165.3 51.5229 175.533 55.7616C185.037 59.6983 194.005 64.7663 202.25 70.8402L218.272 52.4293L245.747 78.7031L226.815 94.6663C233.938 103.742 239.805 113.764 244.238 124.467C250.618 139.869 253.902 156.378 253.902 173.049C253.902 198.157 246.457 222.702 232.507 243.579C218.557 264.456 198.73 280.728 175.533 290.336C152.336 299.945 126.81 302.459 102.184 297.561C77.558 292.662 54.9376 280.571 37.1832 262.817C19.4288 245.062 7.33785 222.442 2.43941 197.816C-2.45902 173.19 0.0549204 147.664 9.66354 124.467C14.1116 113.728 19.9876 103.712 27.0874 94.6665L8.15491 78.7031L35.6297 52.4293L51.6519 70.8403C53.2132 69.69 54.8032 68.5739 56.4208 67.4931C72.6375 56.6574 91.0673 49.7461 110.255 47.2005V29.2542H101.092V0ZM71.9567 255.349C88.232 266.236 107.37 272.054 126.951 272.065C139.959 272.073 152.841 269.518 164.861 264.545C176.881 259.573 187.804 252.28 197.004 243.085C206.205 233.89 213.504 222.972 218.484 210.955C223.464 198.937 226.027 186.057 226.027 173.049C226.027 153.468 220.221 134.326 209.344 118.045C198.466 101.763 183.005 89.0715 164.916 81.5754C146.826 74.0794 126.921 72.115 107.715 75.9308C88.5093 79.7465 70.8662 89.1711 57.0161 103.013C43.166 116.855 33.731 134.492 29.9037 153.695C26.0764 172.899 28.0288 192.806 35.514 210.9C42.9993 228.994 55.6813 244.462 71.9567 255.349ZM189.953 106.713C206.955 122.859 217.108 144.918 218.317 168.334C169.921 170.261 126.951 173.049 126.951 173.049V81.5648C150.399 81.564 172.951 90.5662 189.953 106.713Z');
//     return path.contains(position);
//   }

//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.black
//       ..strokeCap = StrokeCap.round
//       ..strokeWidth = 20.0;

//     for (int i = 0; i < points.length - 1; i++) {
//       if (points[i] != null && points[i + 1] != null) {
//         canvas.drawLine(points[i], points[i + 1], paint);
//       }
//     }
//   }
// }


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


// GestureDetector(
//                     onPanUpdate: (details) {
//                       points.add(details.globalPosition);
//                       if (details.globalPosition.dy <= 10.0.h ||
//                           details.globalPosition.dx <= 20.0.w) {
//                         setState(() {
//                           RenderBox box = context.findRenderObject();
//                           Offset point =
//                               box.globalToLocal(details.globalPosition);
//                           point = point.translate(
//                               0.0, -(AppBar().preferredSize.height));

//                           points = List.from(points)..add(point);
//                           x -= details.delta.dx;
//                           y -= details.delta.dy;
//                         });
//                       }
//                       print(details.globalPosition);
//                       if (details.globalPosition.dy >= h ||
//                           details.globalPosition.dx >= w - 10.0.w) {
//                         setState(() {
//                           x -= details.delta.dx;
//                           y -= details.delta.dy;
//                         });
//                       } else {
//                         setState(() {
//                           x += details.delta.dx;
//                           y += details.delta.dy;
//                         });
//                       }
//                     },
//                     onPanEnd: (details) {
//                       points.add(null);
//                     },