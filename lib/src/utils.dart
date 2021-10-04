@JS()
library leaflet.utils;

import 'package:js/js.dart';
import 'bounds.dart';
import 'point.dart';

@JS('L.LineUtil')
class LineUtil {
  /// Dramatically reduces the number of points in a polyline while retaining its
  /// shape and returns a new array of simplified points, using the Douglas-Peucker algorithm.
  ///
  /// Used for a huge performance boost when processing/displaying Leaflet polylines
  /// for each zoom level and also reducing visual noise. tolerance affects the amount
  /// of simplification (lesser value means higher quality but slower and with more points).
  external static List simplify(List points, List tolerance);

  /// Returns the distance between point [p] and segment [p1] to [p2].
  external static num pointToSegmentDistance(Point p, Point p1, Point p2);

  /// Returns the closest point from a point p on a segment p1 to p2.
  external static Point closestPointOnSegment(Point p, Point p1, Point p2);

  /// Clips the segment a to b by rectangular bounds with the Cohen-Sutherland
  /// algorithm (modifying the segment points directly!).
  ///
  /// Used by Leaflet to only show polyline points that are on the
  /// screen or near, increasing performance.
  external static dynamic clipSegment(
    Point a,
    Point b,
    Bounds bounds, [
    bool? useLastCode,
    bool? round,
  ]);

  /// Returns `true` if [latlngs] is a flat array, `false` is nested.
  external static bool isFlat(List latlngs);
}

@JS('L.PolyUtil')
class PolyUtil {
  /// Clips the polygon geometry defined by the given points by the given bounds
  /// (using the Sutherland-Hodgman algorithm).
  ///
  /// Used by Leaflet to only show polygon points that are on the screen or near,
  /// increasing performance. Note that polygon points needs different algorithm
  /// for clipping than polyline, so there's a separate method for it.
  external static List clipPolygon(List points, Bounds bounds, [bool? round]);
}
