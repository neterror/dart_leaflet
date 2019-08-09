@JS()
library leaflet.geojson;

import 'package:js/js.dart';
import 'layer.dart';
import 'latlng_bounds.dart';
import 'path.dart';
import 'evented.dart';

@JS()
@anonymous
class FeatureCollection {
  external String get type;
  external set type(String value);

  external List<Feature> get features;
  external set features(List<Feature> value);
}

class Type {
  static const feature = "Feature";

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

  external factory Geometry({String type, List<double> coordinates});

  external String get type;
  external set type(String value);

  external List<double> get coordinates;
  external set coordinates(List<double> value);
}


@JS()
@anonymous
class Feature {
  external factory Feature({String type = "Feature", Geometry geometry, Map<String, dynamic> properties});

  external String get type;
  external set type(String value);

  external Geometry get geometry;
  external set geometry(Geometry value);

  external Map<String, dynamic> get properties;
  external set properties(Map<String, dynamic> value);
}

@JS("L.layerGroup")
class FeatureGroup extends LayerGroup with Evented {
  /// Create a feature group, optionally given an initial set of layers.
  external FeatureGroup([List<Layer> layers]);

  /// Sets the given path options to each layer of the group that has a setStyle method
  external FeatureGroup setStyle(PathOptions style);

  /// Brings the layer group to the top of all other layers
  external FeatureGroup bringToFront();

  /// Brings the layer group to the back of all other layers
  external Feature bringToBack();

  /// Returns the LatLngBounds of the Feature Group (created from bounds and coordinates of its children).
  external LatLngBounds getBounds();
}

@JS('L.geoJSON')
class GeoJson extends FeatureGroup with Evented {
  //  external GeoJson([Feature feature, GeoJsonOptions options]);
  external GeoJson([Feature feature, GeoJsonOptions options]);
  external GeoJson.fromCollection(
      [FeatureCollection collection, GeoJsonOptions options]);

  /// Adds a GeoJSON object to the layer.
  external GeoJson addData(Feature data);

  /// Resets the given vector layer's style to the original GeoJSON style, useful for resetting style after hover events.
  external GeoJson resetStyle(Layer layer);

  /// Changes styles of GeoJSON vector layers with the given style function.
  external GeoJson setStyle(PathOptions style);
}

@JS()
@anonymous
class GeoJsonOptions extends LayerOptions {
  external factory GeoJsonOptions({
    Function pointToLayer,
    Function style,
    Function onEachFeature,
    Function filter
  });
  /// A Function defining how GeoJSON points spawn Leaflet layers. It is internally called when data is added,
  /// passing the GeoJSON point feature and its LatLng. The default is to spawn a default Marker:
  /// function(geoJsonPoint, latlng) {
  ///    return L.marker(latlng);
  ///}
  external Function get pointToLayer;
  external set pointToLayer(Function value);

  /// Function defining the Path options for styling GeoJSON lines and polygons, called internally
  /// when data is added. The default value is to not override any defaults:
  /// function (geoJsonFeature) {
  ///    return {}
  /// }
  external Function get style;
  external set style(Function style);

  /// A Function that will be called once for each created Feature, after it has been created and styled.
  /// Useful for attaching events and popups to features. The default is to do nothing with the newly created layers:
  /// function (feature, layer) {}
  external Function get onEachFeature;
  external set onEachFeature(Function value);

  /// A Function that will be used to decide whether to include a feature or not. The default is to include all features:
  /// function (geoJsonFeature) {
  ///    return true;
  /// }
  /// Note: dynamically changing the filter option will have effect only on newly added data. It will not re-evaluate already included features.
  /// coordsToLatLng 	Function 	* 	A Function that will be used for converting GeoJSON coordinates to LatLngs.
  /// The default is the coordsToLatLng static method.
  external Function get filter;
  external set filter(Function value);
}
