@JS()
library leaflet.geojson;

import 'package:js/js.dart';
import 'layer.dart';
import 'latlng_bounds.dart';
import 'path.dart';
import 'evented.dart';

class Type {
  /// For type "Point", the "coordinates" member is a single position.
  static const point = "Point";

  /// For type "MultiPoint", the "coordinates" member is an array of positions
  static const multiPoint = "MultiPoint";

  /// For type "LineString", the "coordinates" member is an array of two or more positions.
  static const lineString = "LineString";

  /// For type "MultiLineString", the "coordinates" member is an array of LineString coordinate arrays.
  static const multiLineString = "MultiLineString";

  /// For type "Polygon", the "coordinates" member MUST be an array of linear ring coordinate arrays.
  static const polygon = "Polygon";

  ///  For type "MultiPolygon", the "coordinates" member is an array of Polygon coordinate arrays.
  static const multiPolygon = "MultiPolygon";
}

@JS()
@anonymous
class Geometry {
  external factory Geometry({String type, List coordinates});

  external String get type;
  external set type(String value);

  external List get coordinates;
  external set coordinates(List value);
}

@JS()
@anonymous
class GeoJson {
  external factory GeoJson(
      {String type, Geometry geometry, Map<String, dynamic> properties});

  external String get type;
  external set type(String value);

  external Geometry get geometry;
  external set geometry(Geometry value);

  external Map<String, dynamic> get properties;
  external set properties(Map<String, dynamic> value);
}


