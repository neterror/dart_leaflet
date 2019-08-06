@JS()
library leaflet.crs;

import 'package:js/js.dart';
import 'layer.dart';
import 'latlng.dart';
import 'point.dart';
import 'bounds.dart';

@JS("CRS")
class CRS extends Layer {
  /// Projects geographical coordinates into pixel coordinates for a given zoom.
  external Point latLngToPoint(LatLnglatlng, double zoom);

  /// The inverse of latLngToPoint. Projects pixel coordinates on a given zoom into geographical coordinates.
  external LatLng pointToLatLng(Point point, double zoom);

  /// Projects geographical coordinates into coordinates in units accepted for this CRS
  /// (e.g. meters for EPSG:3857, for passing it to WMS services).
  external Point project(LatLng latlng);

  /// Given a projected coordinate returns the corresponding LatLng. The inverse of project.
  external LatLng unproject(Point point);

  /// Returns the scale used when transforming projected coordinates into pixel coordinates
  /// for a particular zoom. For example, it returns 256 * 2^zoom for Mercator-based CRS.
  external double scale(double zoom);

  /// Inverse of scale(), returns the zoom level  corresponding to a scale factor of scale.
  external double zoom(double scale);

  /// Returns the projection's bounds scaled and transformed for the provided zoom.
  external Bounds getProjectedBounds(double zoom);

  /// Returns the distance between two geographical coordinates.
  external double distance(LatLng latlng1, LatLng latlng2);

  /// Returns a LatLng where lat and lng has been wrapped according
  /// to the CRS's wrapLat and wrapLng properties, if they are outside the CRS's bounds.
  external LatLng wrapLatLng(LatLng latlng);

  /// Returns a LatLngBounds with the same size as the given one, ensuring that its center is
  /// within the CRS's bounds. Only accepts actual  L.LatLngBounds instances, not arrays.
  external LatLngBounds wrapLatLngBounds(LatLngBounds bounds);

  /// Methods
  /// Standard code name of the CRS passed into WMS services (e.g. 'EPSG:3857')
  external String get code;
  external set code(String value);

  /// An array of two numbers defining whether the longitude (horizontal) coordinate axis wraps around
  /// a given range and how. Defaults to [-180, 180] in most geographical CRSs. If undefined, the
  /// longitude axis does not wrap around.
  external List<double> get wrapLng;
  external wrapLng set(List<double> value);

  /// Like wrapLng, but for the latitude (vertical) axis.
  external List<double> get wrapLat;
  external wrapLng set(List<double> value);

  /// If true, the coordinate space will be unbounded (infinite in both axes)
  external bool get infinite;
  external set infinite(bool value);
}
