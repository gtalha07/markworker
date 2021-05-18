import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:markworker/shared/utils.dart';
import 'package:path_drawing/path_drawing.dart';
import 'imageClipper.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'canvasPathState.dart';
import 'currentPathPaint.dart';

class DrawzoCanvas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CanvasPathsState>(
        builder: (_, model, child) => Stack(fit: StackFit.expand, children: [
              Align(
                alignment: Alignment.center,
                child: ClipPath(
                  clipBehavior: Clip.antiAlias,
                  clipper: ImageClipper(),
                  child: RepaintBoundary(
                    child: CustomPaint(
                      isComplex: true,
                      painter: DrawzoCanvasPainter(model.points),
                      child: Container(
                          child:
                              SvgPicture.asset(unfilledImages[imageCounter])),
                    ),
                  ),
                ),
              ),
              child,
            ]),
        child: ChangeNotifierProvider(
            create: (_) => CurrentPathState(), // We just made this,
            child: const CurrentPathPaint() // We need to make this
            ));
  }
}

class DrawzoCanvasPainter extends CustomPainter {
  List<List<Offset>> points;

  DrawzoCanvasPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 40.0
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    for (final pointsSet in points) {
      canvas.drawPoints(PointMode.polygon, pointsSet, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
