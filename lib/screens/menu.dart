import 'package:flutter/material.dart';
import 'package:markworker/screens/play.dart';
import 'package:sizer/sizer.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
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
            )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 25.0.h),
              Container(
                child: Text(
                  'BEST SCORE: 123', //value subjected to change
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0.sp,
                  ),
                ),
              ),
              SizedBox(height: 10.0.h),
              Container(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PlayScreen()));
                  },
                  child: new Image(
                    image: AssetImage(
                      'assets/images/menuScreenImages/start.png',
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
                        'assets/images/menuScreenImages/restart.png'),
                  ),
                ),
              ),
              SizedBox(height: 3.0.h),
              Container(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {},
                  child: new Image(
                    image: AssetImage('assets/images/menuScreenImages/mm.png'),
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
