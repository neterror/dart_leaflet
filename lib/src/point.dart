@JS()
library leaflet.point;

import 'package:js/js.dart';

@JS('L.point')
class Point {
  /// Creates a Point object with the given x and y coordinates. If optional round is set to true, rounds the x and y values.
  external Point(double x, double y, [bool? round]);

  /// Expects an array of the form [x, y] instead.
  external Point.fromCoords(List coords);

  /// Returns a copy of the current point.
  external Point clone();

  /// Returns the result of addition of the current and the given points.
  external Point add(Point otherPoint);

  /// Returns the result of subtraction of the given point from the current.
  external Point subtract(Point otherPoint);

  /// Returns the result of division of the current point by the given number.
  external Point divideBy(double num);

  /// Returns the result of multiplication of the current point by the given number.
  external Point multiplyBy(double num);

  /// Multiply each coordinate of the current point by each coordinate of scale. In linear algebra terms, multiply the point by the scaling matrix defined by scale.
  external Point scaleBy(Point scale);

  /// Inverse of scaleBy. Divide each coordinate of the current point by each coordinate of scale.
  external Point unscaleBy(Point scale);

  /// Returns a copy of the current point with rounded coordinates.
  external Point round();

  /// Returns a copy of the current point with floored coordinates (rounded down).
  external Point floor();

  /// Returns a copy of the current point with ceiled coordinates (rounded up).
  external Point ceil();

  /// Returns a copy of the current point with truncated coordinates (rounded towards zero).
  external Point trunc();

  /// Returns the cartesian distance between the current and the given points.
  external double distanceTo(Point? otherPoint);

  /// Returns true if the given point has the same coordinates.
  external bool equals(Point otherPoint);

  /// Returns true if both coordinates of the given point are less than the corresponding current point coordinates (in absolute values).
  external bool contains(Point otherPoint);

  /// Returns a string representation of the point for debugging purposes.
  external String toString();

  ///The x coordinate of the point
  external double get x;
  external set x(double value);

  /// The y coordinate of the point
  external double get y;
  external set y(double value);
}
