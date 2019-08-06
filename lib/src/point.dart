@JS()
library leaflet.point;

import 'package:js/js.dart';

@JS("L.point")
class Point {
  /// Creates a Point object with the given x and y coordinates. If optional round is set to true, rounds the x and y values.
  external Point(double x, double y, [bool round]);

  /// Expects an array of the form [x, y] instead.
  external Point.fromCoords(List<double> coords);
}
