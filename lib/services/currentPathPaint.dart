import 'dart:ui';

import 'package:flutter_svg/svg.dart';
import 'package:markworker/services/canvasPathState.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:markworker/services/imageClipper.dart';
import 'package:markworker/shared/utils.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

class OnlyOnePointerRecognizer extends OneSequenceGestureRecognizer {
  int _p = 0;
  @override
  void addPointer(PointerDownEvent event) {
    startTrackingPointer(event.pointer);
    if (_p == 0) {
      resolve(GestureDisposition.rejected);
      _p = event.pointer;
    } else {
      resolve(GestureDisposition.accepted);
    }
  }

  @override
  String get debugDescription => 'only one pointer recognizer';

  @override
  void didStopTrackingLastPointer(int pointer) {}

  @override
  void handleEvent(PointerEvent event) {
    if (!event.down && event.pointer == _p) {
      _p = 0;
    }
  }
}

class CurrentPathPaint extends StatelessWidget {
  const CurrentPathPaint();

  @override
  Widget build(BuildContext context) {
    double _getHeight() {
      if (imageCounter == 0) {
        return MediaQuery.of(context).size.height / 2.8;
      } else if (imageCounter == 1) {
        return MediaQuery.of(context).size.height / 3.2;
      } else if (imageCounter == 2) {
        return MediaQuery.of(context).size.height / 2.8;
      } else if (imageCounter == 3) {
        return MediaQuery.of(context).size.height / 2.2;
      } else {
        return MediaQuery.of(context).size.height / 2.4;
      }
    }

    double _getWidth() {
      if (imageCounter == 0) {
        return MediaQuery.of(context).size.width / 1.5;
      } else if (imageCounter == 1) {
        return MediaQuery.of(context).size.width / 1.3;
      } else if (imageCounter == 2) {
        return MediaQuery.of(context).size.width / 1.3;
      } else if (imageCounter == 3) {
        return MediaQuery.of(context).size.width / 1.8;
      } else {
        return MediaQuery.of(context).size.width / 1.5;
      }
    }

    CurrentPathState currentPointsState =
        Provider.of<CurrentPathState>(context, listen: false);
    CanvasPathsState mainPointsState =
        Provider.of<CanvasPathsState>(context, listen: false);
    return Consumer<CurrentPathState>(
      builder: (_, model, child) => Stack(
        fit: StackFit.expand,
        children: [
          RepaintBoundary(
              child: CustomPaint(
            isComplex: true,
            painter: CurrentPathPainter(model.points),
            child: Container(),
          )),
          child
        ],
      ),
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: _getHeight(),
          width: _getWidth(),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanStart: (details) {
              currentPointsState.addPoint(details.localPosition);

              // Added it twice so that if the user draws just a single dot, it can register

              currentPointsState.addPoint(details.localPosition);
            },
            onPanUpdate: (details) {
              currentPointsState.addPoint(details.localPosition);
              // mainPointsState.addPath(currentPointsState.points);
            },
            onPanEnd: (details) {
              mainPointsState.addPath(currentPointsState.points);
              currentPointsState.resetPoints();
            },
          ),
        ),
      ),
    );
  }
}

class CurrentPathPainter extends CustomPainter {
  List<Offset> points;

  CurrentPathPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 8.0
      ..color = Colors.transparent
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPoints(PointMode.polygon, points, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
