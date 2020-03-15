@JS()
library leaflet.geojson;

import 'package:dartleaf/dartleaf.dart';
import 'package:js/js.dart';

class Type {
  /// For type "Point", the "coordinates" member is a single position.
  static const point = 'Point';

  /// For type "MultiPoint", the "coordinates" member is an array of positions
  static const multiPoint = 'MultiPoint';

  /// For type "LineString", the "coordinates" member is an array of two or more positions.
  static const lineString = 'LineString';

  /// For type "MultiLineString", the "coordinates" member is an array of LineString coordinate arrays.
  static const multiLineString = 'MultiLineString';

  /// For type "Polygon", the "coordinates" member MUST be an array of linear ring coordinate arrays.
  static const polygon = 'Polygon';

  /// For type "MultiPolygon", the "coordinates" member is an array of Polygon coordinate arrays.
  static const multiPolygon = 'MultiPolygon';
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

@JS('L.geoJSON')
class GeoJson extends Layer with Evented {
  external GeoJson([
    dynamic geojson,
    GeoJsonOptions options,
  ]);

  /// Optional object in GeoJSON format to display on the map.
  external dynamic get geojson;
  external set geojson(dynamic value);

  /// GeoJson options.
  external GeoJsonOptions get options;
  external set options(GeoJsonOptions value);

  /// Methods
  /// -------

  /// Adds a GeoJSON object to the layer.
  external GeoJson addData(dynamic data);

  /// Resets the given vector layer's style to the original GeoJSON style,
  /// useful for resetting style after hover events.
  /// If [layer] is omitted, the style of all features in the current layer is reset.
  external GeoJson resetStyle([Layer layer]);

  /// Changes styles of GeoJSON vector layers with the given style function.
  external GeoJson setStyle(Function style);

  /// Static methods
  /// --------------

  /// Creates a Layer from a given GeoJSON feature.
  /// Can use a custom pointToLayer and/or coordsToLatLng functions if provided as options.
  external static Layer geometryToLayer(dynamic featureData, GeoJson options);

  /// Creates a LatLng object from an array of 2 numbers (longitude, latitude)
  /// or 3 numbers (longitude, latitude, altitude) used in GeoJSON for points.
  external static LatLng coordsToLatLng(List coords);

  /// Creates a multidimensional array of LatLngs from a GeoJSON coordinates array.
  ///
  /// [levelsDeep] specifies the nesting level
  /// (0 is for an array of points, 1 for an array of arrays of points, etc., 0 by default).
  ///
  /// Can use a custom [coordsToLatLng] function.
  external static List coordsToLatLngs(List coords,
      [int levelsDeep, Function coordsToLatLng]);

  /// Reverse of [coordsToLatLng]
  external static List latLngToCoords(LatLng latlng, num precision);

  /// Reverse of [coordsToLatLngs].
  ///
  /// [closed] determines whether the first point should be appended to the end
  /// of the array to close the feature, only used when levelsDeep is 0.
  /// False by default.
  external static List latLngsToCoords(List latlngs,
      [int levelsDeep, bool closed = false]);

  /// Normalize GeoJSON geometries/features into GeoJSON features.
  external static dynamic asFeature(dynamic geojson);
}

@JS()
@anonymous
class GeoJsonOptions extends LayerOptions {
  external factory GeoJsonOptions({
    String pane,
    String attribution,
    bool markersInheritOptions,
    Layer Function(dynamic geoJsonPoint, LatLng latlng) pointToLayer,
    PathOptions Function(dynamic geoJsonFeature) style,
    Function(dynamic feature, Layer layer) onEachFeature,
    bool Function(dynamic geoJsonFeature) filter,
    Function coordsToLatLng,
  });

  /// Whether default Markers for "Point" type Features inherit from group options.
  external bool get markersInheritOptions;
  external set markersInheritOptions(bool value);

  /// A Function defining how GeoJSON points spawn Leaflet layers.
  /// It is internally called when data is added, passing the GeoJSON point feature and its LatLng.
  /// The default is to spawn a default Marker.
  external Layer Function(dynamic geoJsonPoint, LatLng latlng) get pointToLayer;
  external set pointToLayer(
      Layer Function(dynamic geoJsonPoint, LatLng latlng) value);

  /// A Function defining the Path options for styling GeoJSON lines and polygons,
  /// called internally when data is added.
  /// The default value is to not override any defaults.
  external PathOptions Function(dynamic geoJsonFeature) get style;
  external set style(PathOptions Function(dynamic geoJsonFeature) value);

  /// A Function that will be called once for each created Feature, after it has been created and styled.
  /// Useful for attaching events and popups to features.
  /// The default is to do nothing with the newly created layers.
  external Function(dynamic feature, Layer layer) get onEachFeature;
  external set onEachFeature(Function(dynamic feature, Layer layer) value);

  /// A Function that will be used to decide whether to include a feature or not.
  /// The default is to include all features.
  ///
  /// Note:
  /// Dynamically changing the filter option will have effect only on newly added data.
  /// It will not re-evaluate already included features.
  external bool Function(dynamic geoJsonFeature) get filter;
  external set filter(bool Function(dynamic geoJsonFeature) value);

  /// A Function that will be used for converting GeoJSON coordinates to LatLngs.
  /// The default is the coordsToLatLng static method.
  external Function get coordsToLatLng;
  external set coordsToLatLng(Function value);
}
