// import 'dart:async';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter/material.dart';
// import 'package:markworker/screens/menu.dart';
// // import 'package:sizer/sizer.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 3), () {
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => MenuScreen()));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Future.wait([
//       precachePicture(
//         ExactAssetPicture(
//             SvgPicture.svgStringDecoder, 'assets/images/shared/field.svg'),
//         null,
//       ),
//       precachePicture(
//         ExactAssetPicture(SvgPicture.svgStringDecoder,
//             'assets/images/shared/worker_with_paint.svg'),
//         null,
//       ),
//     ]);
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.lightGreenAccent,
//             ),
//           ),
//           // Positioned(
//           //   child: Container(
//           //     constraints: BoxConstraints.expand(),
//           //     child: new Image(
//           //       image: AssetImage('assets/images/shared/icon_bg.png'),
//           //       fit: BoxFit.cover,
//           //     ),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
