@JS()
library leaflet.latlng;

import 'package:js/js.dart';
import 'latlng_bounds.dart';

@JS('L.latLng')
class LatLng {
  /// Creates an object representing a geographical point with the given latitude and
  /// longitude (and optionally altitude).
  external LatLng(double? latitude, double? longitude, [double? altitude]);

  /// Expects an array of the form [Number, Number] or [Number, Number, Number] instead
  external LatLng.fromList(List coordinates);

  /// Expects an plain object of the form {lat: Number, lng: Number} or {lat: Number, lng: Number, alt: Number} instead.
  external LatLng.fromObject(LatCoordinate object);

  /// Returns true if the given LatLng point is at the same position (within a small margin of error). The margin of error can be overridden by setting maxMargin to a small number.
  external bool equals(LatLng otherLatLng, [double? maxMargin]);

  /// Returns a string representation of the point (for debugging purposes).
  external String toString();

  ///	Returns the distance (in meters) to the given LatLng calculated using the Spherical Law of Cosines.
  external double distanceTo(LatLng other);

  ///Returns a new LatLng object with the longitude wrapped so it's always between -180 and +180 degrees.
  external LatLng wrap();

  ///Returns a new LatLngBounds object in which each boundary is sizeInMeters/2 meters apart from the LatLng.
  external LatLngBounds toBounds(double number);

  external double get lat;
  external set lat(double value);

  external double get lng;
  external set lng(double value);

  external double get alt;
  external set alt(double value);
}

@JS()
@anonymous
class LatCoordinate {
  external factory LatCoordinate({double? lat, double? lng, double? alt});

  external double get lat;
  external set lat(double value);

  external double get lng;
  external set lng(double value);

  external double get alt;
  external set alt(double value);
}
