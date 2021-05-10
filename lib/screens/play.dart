import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:markworker/services/image_painter.dart';
import 'package:markworker/services/timer.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markworker/shared/variables.dart';
import 'package:path_drawing/path_drawing.dart';
import 'dart:ui' as ui;
import 'dart:math';
// import 'dart:async';

class PlayScreen extends StatefulWidget {
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  // final _offsets = <Offset>[];
  // ui.Image image;
  // Future loadImage(String path) async {
  //   final data = await rootBundle.load(path);
  //   final bytes = data.buffer.asUint8List();
  //   final image = await decodeImageFromList(bytes);
  //   if (mounted) {
  //     setState(() => this.image = image);
  //   }
  // }
  Offset position = Offset(150.0, 700.0);
  double x, y;
  Random random = new Random();
  final paintPath = parseSvgPathData(
      'M71.6572 13.6049C75.3743 13.6049 79.0915 13.5596 82.803 13.5052C88.8603 13.4235 94.9177 13.351 100.969 13.1968C104.165 13.1061 107.361 12.8431 110.551 12.6708L125.607 11.8908C129.573 11.7004 133.597 11.5462 137.591 11.3285C138.555 11.2832 139.507 11.0655 140.464 10.9295C141.121 10.8388 141.637 10.6483 141.835 9.92276C141.915 9.63254 142.368 9.43301 142.657 9.19721L144 8.0726C143.706 7.94354 143.407 7.84361 143.105 7.77332C140.708 7.64635 138.317 7.4196 135.925 7.4196C130.44 7.4196 124.95 7.55565 119.465 7.63727C119.099 7.67222 118.734 7.59211 118.388 7.40148C118.622 7.23985 118.867 7.12413 119.119 7.05683C121.385 6.87545 123.663 6.72127 125.953 6.5943C130.741 6.30408 135.534 6.04107 140.323 5.75992C141.184 5.78245 142.043 5.58655 142.867 5.17948V4.78949C142.345 4.726 141.824 4.6081 141.303 4.6081C138.912 4.6889 136.521 4.51013 134.146 4.07301C133.198 3.98905 132.247 4.08647 131.313 4.36323C130.76 4.51104 130.213 4.71092 129.675 4.96181C128.196 2.90306 126.038 2.77608 123.737 2.80329C119.742 2.80329 115.747 2.72168 111.753 2.71261C109.526 2.71261 107.299 2.81236 105.072 2.82143C99.9268 2.82143 94.7836 2.82143 89.6423 2.82143C89.2471 2.80586 88.8556 2.69581 88.4807 2.49494C94.2264 1.85101 100.029 2.21378 105.899 1.81473C105.741 1.61521 105.712 1.53358 105.678 1.53358C102.154 1.42475 98.7255 0.318282 95.1274 0.835237C93.6881 1.04383 92.1695 0.7264 90.6906 0.71733C81.8284 0.71733 72.9661 0.71734 64.1096 0.599438C58.0578 0.508744 52.0061 0.064336 45.9771 0.00991969C39.1208 -0.0444966 32.2588 0.13689 25.4081 0.263861C21.7514 0.324324 18.0966 0.442225 14.4436 0.617567C14.3813 0.617567 14.336 0.617567 14.2736 0.617567L12.7607 1.24336C12.657 1.39685 12.5322 1.50891 12.3962 1.57038C12.2603 1.63185 12.1173 1.641 11.9788 1.59706C10.8965 2.09588 9.84252 2.64004 8.8339 3.25676C8.66261 3.38012 8.47112 3.41234 8.28755 3.34868C8.10397 3.28502 7.93798 3.12883 7.81395 2.90305C3.54716 5.44248 1.3316 11.1562 1.47326 15.5095C1.64325 20.7697 0.20399 25.776 0 31C0.409328 30.9375 0.812571 30.7975 1.20127 30.5828C1.05479 30.3847 0.923538 30.1594 0.81029 29.9117C0.555302 29.1771 0.770627 28.6329 1.52992 28.6057C2.55536 28.4892 3.56591 28.1475 4.53311 27.5899C5.42444 27.069 6.40566 27.1046 7.28131 27.6897C7.54295 27.9059 7.83173 28.0247 8.12608 28.0373C8.42044 28.0499 8.71276 27.9558 8.98123 27.7622C9.69656 27.2805 10.4749 27.0874 11.2478 27.1999C11.4733 27.2348 11.7007 27.2134 11.9221 27.1364C13.69 26.2295 15.6052 26.5379 17.4751 26.5016C23.6402 26.3746 29.7769 25.8486 35.9306 25.5947C42.5489 25.2954 49.1786 25.25 55.8083 25.1865C59.5764 25.1865 63.3503 25.3316 67.1411 25.3589C68.2335 25.3601 69.3226 25.1654 70.3879 24.7784C70.0479 24.7331 69.7136 24.6424 69.3793 24.6514C68.4103 24.6514 67.4357 24.7965 66.4724 24.7693C66.0613 24.7475 65.6577 24.5868 65.2882 24.2977C64.9196 23.9019 64.4962 23.6562 64.0547 23.582C63.6133 23.5077 63.1672 23.6071 62.7553 23.8715C61.8115 24.3523 60.7978 24.3523 59.8541 23.8715C58.877 23.4878 57.8787 23.26 56.8736 23.1913C54.828 23.0099 52.7711 22.9645 50.7199 22.8466C50.0739 22.8466 49.3429 22.9464 48.833 22.3025C49.2069 21.459 50.0172 21.323 50.6972 21.459C52.8931 21.8129 55.1064 21.7856 57.2985 21.3774C57.9221 21.3606 58.5456 21.4243 59.1628 21.5678C59.4756 21.681 59.7943 21.7478 60.1147 21.7674C61.6944 21.4681 63.2883 21.4135 64.8745 21.6041C65.5998 21.6495 66.3308 21.7311 67.0617 21.7402C67.906 21.7402 68.7617 21.7402 69.5946 21.6676C71.1189 21.4953 72.6261 21.0962 74.1277 21.069C80.4118 20.9783 86.7014 21.069 92.9855 20.933C100.584 20.806 108.171 20.5612 115.736 19.8175C122.898 19.101 130.078 18.5931 137.268 18.0036C138.746 17.9637 140.211 17.5662 141.614 16.8246C139.524 16.9062 137.433 17.006 135.342 17.0694C134.548 17.0694 133.749 17.0694 132.951 17.0694C131.579 17.0694 130.208 16.9606 128.842 17.0059C125.652 17.1148 122.456 17.2599 119.272 17.4322C115.305 17.6499 111.339 17.3778 107.338 17.5592C102.199 17.7859 97.0539 17.795 91.9145 17.8947C87.8064 17.9764 83.6983 18.1396 79.5901 18.1124C71.8838 18.1124 64.1719 17.9129 56.4656 17.795C56.3069 17.795 56.1539 17.7496 55.6383 17.6589C78.9385 17.2236 101.899 17.4685 125.086 15.8451C123.901 15.2283 123.335 15.1739 121.119 15.2737C119.867 15.3281 118.609 15.319 117.351 15.3735C116.093 15.4279 114.733 15.5276 113.418 15.5639C112.104 15.6002 110.937 15.5639 109.69 15.4732C114.28 14.9109 118.955 15.0832 123.522 14.3395V13.877C122.995 13.877 122.468 13.8045 121.941 13.8317C118.118 13.9889 114.295 14.1551 110.472 14.3305C106.653 14.5209 102.834 14.8202 99.0145 14.9109C94.6117 15.0107 90.2089 14.9109 85.8062 14.9109C82.038 14.9109 78.2642 14.9744 74.4734 14.9109C67.8513 14.8384 61.2272 14.7356 54.6013 14.6026C53.2471 14.6026 51.9041 14.5028 50.5499 14.4484V14.0675C52.3291 14.004 54.1084 13.9042 55.8876 13.877C61.1498 13.7742 66.4063 13.6835 71.6572 13.6049ZM46.5947 22.6743C45.7458 22.7695 44.8938 22.7695 44.0449 22.6743C42.5093 22.4476 41.002 22.0848 39.1491 21.713C42.09 20.806 44.6228 21.4953 47.5184 21.976C47.0424 22.3659 46.8327 22.6743 46.5947 22.6743Z');
  @override
  void initState() {
    super.initState();
    x = position.dx;
    y = position.dy;
    imageCounter = random.nextInt(4);
  }

  // @override
  // void dispose() {
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
                // Stack(
                //   children: <Widget>[
                //     Container(
                //       padding: EdgeInsets.only(right: 5.0.w),
                //       child: new Image(
                //         image: AssetImage(
                //             'assets/images/playScreenImages/time.png'),
                //         height: 10.0.h,
                //         width: 20.0.w,
                //       ),
                //     ),
                //   ],
                // ),
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
                  child: Draggable(
                    child: SvgPicture.asset(
                        'assets/images/playScreenImages/worker_with_paint.svg'),
                    feedback: SvgPicture.asset(
                        'assets/images/playScreenImages/worker_with_paint.svg'),
                    childWhenDragging: Container(),
                    onDragUpdate: (dragDetails) {
                      CustomPaint(
                        painter: WorkerPainter(
                          color: Colors.white,
                          path: paintPath,
                        ),
                      );
                    },
                    onDragEnd: (dragDetails) {
                      if (dragDetails.offset.dy <= 0 ||
                          dragDetails.offset.dx <= 0) {
                        x = dragDetails.offset.dx;
                        y = dragDetails.offset.dx;
                      } else if (dragDetails.offset.dy >= h ||
                          dragDetails.offset.dx >= w) {
                        x = dragDetails.offset.dx;
                        y = dragDetails.offset.dx;
                      } else {
                        setState(() {
                          x = dragDetails.offset.dx;
                          y = dragDetails.offset.dy;
                        });
                        print(x);
                        print(y);
                      }
                    },
                  ),
                ),
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