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

  // @override
  // bool hitTest(Offset position) {
  //   Path path = parseSvgPathData(
  //       'M155 0H65.0313C63.7158 0.000839361 62.4168 0.39635 61.2283 1.15795C60.0398 1.91955 58.9916 3.02822 58.1593 4.40374C57.3271 5.77926 56.7317 7.38724 56.4161 9.11149C56.1006 10.8357 56.0728 12.6331 56.3347 14.3737C56.4225 14.9492 56.5117 15.5242 56.6023 16.0987L20.04 7.12607C17.0765 6.39606 14.0225 6.7429 11.191 8.13105C8.35955 9.51921 5.85239 11.8988 3.92638 15.0259C2.00037 18.153 0.724787 21.9152 0.230383 25.927C-0.26402 29.9389 0.0405659 34.056 1.11283 37.8566C6.07861 55.3191 15.5812 79.6263 32.6234 96.2464C52.9589 116.082 80.9525 119.986 97.2491 120.407C110.017 134.363 125.138 142.954 140.805 146.181V196.019H120.955C114.2 196.019 107.721 199.641 102.943 206.088C98.1653 212.535 95.4794 221.28 95.4759 230.4V261.288H214.525V230.4C214.525 225.884 213.865 221.411 212.585 217.239C211.304 213.066 209.427 209.276 207.061 206.083C204.695 202.89 201.886 200.358 198.795 198.631C195.704 196.904 192.391 196.017 189.046 196.019H169.209V146.195C184.901 142.979 200.051 134.381 212.84 120.403C229.111 119.963 257.077 115.981 277.39 96.2457C294.432 79.6256 303.921 55.3185 308.887 37.8559C309.959 34.0553 310.264 29.9382 309.77 25.9264C309.275 21.9146 308 18.1524 306.074 15.0253C304.148 11.8982 301.64 9.51854 298.809 8.13039C295.977 6.74223 292.923 6.3954 289.96 7.1254L253.494 16.0745C253.583 15.508 253.671 14.9411 253.757 14.3737C254.021 12.6342 253.995 10.8372 253.681 9.11288C253.368 7.38854 252.774 5.78006 251.942 4.40406C251.111 3.02807 250.063 1.91903 248.875 1.15731C247.687 0.395579 246.389 0.000255269 245.073 0H155ZM270.058 82.539C257.225 95.0543 240.192 100.23 226.22 102.266C230.219 95.5523 233.796 88.0932 236.858 79.8889C242.352 65.1959 246.806 49.852 250.168 34.0621L292.196 23.7456C292.983 23.5378 293.798 23.6241 294.551 23.9953C295.305 24.3664 295.969 25.0081 296.473 25.8515C296.985 26.6584 297.325 27.6389 297.456 28.6873C297.586 29.7356 297.503 30.8122 297.214 31.8011C292.846 47.1225 284.604 68.3583 270.058 82.539ZM83.8854 102.295C79.8804 95.5733 76.2986 88.1047 73.234 79.8889C67.7468 65.2011 63.2955 49.8653 59.9325 34.0849L17.804 23.7462C17.0168 23.5462 16.2041 23.6361 15.4515 24.0067C14.699 24.3773 14.0343 25.0148 13.5273 25.8522C13.0193 26.6627 12.6834 27.6438 12.5552 28.6913C12.4271 29.7389 12.5114 30.8137 12.7993 31.8017C17.1541 47.1231 25.3957 68.359 39.9421 82.5396C52.8118 95.085 69.8965 100.264 83.8854 102.295Z');
  //   return path.contains(position);
  // }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
