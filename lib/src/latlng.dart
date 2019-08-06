@JS()
library leaflet.latlng;

import 'package:js/js.dart';

@JS("L.latLng")
class LatLng {
  /// Creates an object representing a geographical point with the given latitude and
  /// longitude (and optionally altitude).
  external LatLng(double latitude, double longitude, [double altitude]);

  /// Expects an array of the form [Number, Number] or [Number, Number, Number] instead
  external LatLng.fromList(List<double> coordinates);

  /// Expects an plain object of the form {lat: Number, lng: Number} or {lat: Number, lng: Number, alt: Number} instead.
  external LatLng.fromObject(LatCoordinate object);
}

@JS()
@anonymous
class LatCoordinate {
  external double get lat;
  external set lat(double value);

  external double get lng;
  external set lng(double value);

  external double get alt;
  external set alt(double value);
  
  external factory LatCoordinate({double lat, double lng, double alt});
}
