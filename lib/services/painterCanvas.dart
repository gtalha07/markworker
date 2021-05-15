import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:markworker/shared/utils.dart';
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
                      // painter: DrawzoCanvasPainter(model.points),
                      painter: DrawzoCanvasPainter(model.points),
                      child: Container(
                          child:
                              SvgPicture.asset(unfilledImages[imageCounter])),
                    ),
                  ),
                ),
              ),
              child
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
      ..strokeWidth = 20.0
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    // canvas.translate(200, 200);
    for (final pointsSet in points) {
      canvas.drawPoints(PointMode.polygon, pointsSet, paint);
    }
  }

  // @override
  // bool hitTest(Offset position) {
  //   Path path = parseSvgPathData(
  //       'M101.092 0H152.81V29.2542H143.646V47.2005C154.579 48.6509 165.3 51.5229 175.533 55.7616C185.037 59.6983 194.005 64.7663 202.25 70.8402L218.272 52.4293L245.747 78.7031L226.815 94.6663C233.938 103.742 239.805 113.764 244.238 124.467C250.618 139.869 253.902 156.378 253.902 173.049C253.902 198.157 246.457 222.702 232.507 243.579C218.557 264.456 198.73 280.728 175.533 290.336C152.336 299.945 126.81 302.459 102.184 297.561C77.558 292.662 54.9376 280.571 37.1832 262.817C19.4288 245.062 7.33785 222.442 2.43941 197.816C-2.45902 173.19 0.0549204 147.664 9.66354 124.467C14.1116 113.728 19.9876 103.712 27.0874 94.6665L8.15491 78.7031L35.6297 52.4293L51.6519 70.8403C53.2132 69.69 54.8032 68.5739 56.4208 67.4931C72.6375 56.6574 91.0673 49.7461 110.255 47.2005V29.2542H101.092V0ZM71.9567 255.349C88.232 266.236 107.37 272.054 126.951 272.065C139.959 272.073 152.841 269.518 164.861 264.545C176.881 259.573 187.804 252.28 197.004 243.085C206.205 233.89 213.504 222.972 218.484 210.955C223.464 198.937 226.027 186.057 226.027 173.049C226.027 153.468 220.221 134.326 209.344 118.045C198.466 101.763 183.005 89.0715 164.916 81.5754C146.826 74.0794 126.921 72.115 107.715 75.9308C88.5093 79.7465 70.8662 89.1711 57.0161 103.013C43.166 116.855 33.731 134.492 29.9037 153.695C26.0764 172.899 28.0288 192.806 35.514 210.9C42.9993 228.994 55.6813 244.462 71.9567 255.349ZM189.953 106.713C206.955 122.859 217.108 144.918 218.317 168.334C169.921 170.261 126.951 173.049 126.951 173.049V81.5648C150.399 81.564 172.951 90.5662 189.953 106.713Z');
  //   return path.contains(position);
  // }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
