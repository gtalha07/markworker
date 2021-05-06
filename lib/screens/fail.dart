import 'package:flutter/material.dart';
import 'package:markworker/screens/menu.dart';
import 'package:markworker/screens/play.dart';
import 'package:sizer/sizer.dart';

class LoseScreen extends StatefulWidget {
  @override
  _LoseScreenState createState() => _LoseScreenState();
}

class _LoseScreenState extends State<LoseScreen> {
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
              SizedBox(height: 35.0.h),
              Container(
                child: Text(
                  'YOUR SCORE: 123', //value subjected to change
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
                      'assets/images/loseScreenImages/restart.png',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.0.h),
              Container(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MenuScreen()));
                  },
                  child: new Image(
                    image: AssetImage('assets/images/loseScreenImages/mm.png'),
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
