import 'package:flutter/material.dart';
// import 'package:markworker/screens/menu.dart';
import 'package:sizer/sizer.dart';
import 'package:markworker/screens/results.dart';
import 'package:markworker/screens/settings.dart';
import 'package:markworker/screens/fail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SettingsScreen(),
          ),
        );
      },
    );
  }
}
