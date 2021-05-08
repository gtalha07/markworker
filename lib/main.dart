import 'package:flutter/material.dart';
import 'package:markworker/screens/menu.dart';
// import 'package:markworker/screens/splashScreen.dart';
import 'package:markworker/services/timer.dart';
import 'package:sizer/sizer.dart';
import 'package:markworker/screens/fail.dart';
// import 'package:markworker/services/audio.dart';
// import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          home: WillPopScope(
            onWillPop: () => Future.value(false),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: MenuScreen(),
            ),
          ),
        );
      },
    );
  }
}
