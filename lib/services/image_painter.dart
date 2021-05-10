import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

// import 'dart:ui' as ui;
// import 'package:flutter/services.dart';
// import 'package:markworker/services/image_painter.dart';
class WorkerPainter extends CustomPainter {
  WorkerPainter({@required this.path, @required this.color}) : super();
  final Path path;
  final Color color;
  @override
  bool shouldRepaint(WorkerPainter oldDelegate) =>
      oldDelegate.path != path || oldDelegate.color != color;
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(
        path,
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke);
  }
}
