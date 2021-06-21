import 'package:flutter/cupertino.dart';

class CanvasPathsState extends ChangeNotifier {
  List<List<Offset>> _points;

  CanvasPathsState() {
    _points = [];
  }

  List<List<Offset>> get points => _points;

  addPath(List<Offset> path) {
    _points.add(path);

    // Trigger a rebuild on the canvas
    notifyListeners();
  }
}

class CurrentPathState with ChangeNotifier {
  List<Offset> _points;

  CurrentPathState() {
    _points = [];
  }

  List<Offset> get points => _points;

  addPoint(Offset point) {
    _points.add(point);

    // Trigger a rebuild on the widget drawing the
    // current path
    notifyListeners();
  }

  resetPoints() {
    // Reset the state so it starts as an empty path
    // the next time the user draws
    _points = [];
    notifyListeners();
  }
}
