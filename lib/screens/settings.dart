import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    // double h = MediaQuery.of(context).size.height; //screen height
    // double w = MediaQuery.of(context).size.width; //screen width
    return Container(
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
                image: AssetImage('assets/images/shared/worker_with_paint.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 5.0.w,
            top: 7.0.h,
            child: Container(
              child: GestureDetector(
                onTap: () {},
                child: new Image(
                  image: AssetImage('assets/images/shared/bttn.png'),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 25.0.h),
              Container(
                child: Text(
                  'SETTINGS', //value subjected to change
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 10.0.h),
              Container(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {},
                  child: new Image(
                    image: AssetImage(
                      'assets/images/settingScreenImages/s.png',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.0.h),
              Container(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {},
                  child: new Image(
                    image: AssetImage(
                        'assets/images/settingScreenImages/music_bttn.png'),
                  ),
                ),
              ),
              SizedBox(height: 3.0.h),
              Container(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {},
                  child: new Image(
                    image: AssetImage(
                        'assets/images/settingScreenImages/en_bttn.png'),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
