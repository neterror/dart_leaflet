@JS()
library leaflet.path;

import 'package:js/js.dart';
import 'renderer.dart';
import 'layer.dart';
import 'latlng.dart';
import 'latlng_bounds.dart';
import 'point.dart';
import 'evented.dart';

@JS()
@anonymous
class Path extends Layer with Evented {
  /// Redraws the layer. Sometimes useful after you changed the coordinates that the path uses.
  external Path redraw();

  /// Changes the appearance of a Path based on the options in the Path options object.
  external Path setStyle(PathOptions stle);

  /// Brings the layer to the top of all path layers.
  external Path bringToFront();

  /// Brings the layer to the bottom of all path layers.
  external Path bringToBack();
}

@JS()
@anonymous
class PathOptions extends LayerOptions {
  external factory PathOptions(
      {bool stroke,
      String color,
      double weight,
      double opacity,
      String lineCap,
      String lineJoin,
      String dashArray,
      String dashOffset,
      bool fill,
      String fillColor,
      double fillOpacity,
      String fillRule,
      Renderer renderer,
      String className});

  /// Whether to draw stroke along the path. Set it to false to   disable borders on polygons or circles.
  external bool get stroke;
  external set stroke(bool value);

  /// Stroke color
  external String get color;
  external set color(String value);

  /// Stroke width in pixels
  external double get weight;
  external set weight(double value);

  /// Stroke opacity
  external double get opacity;
  external set opacity(double value);

  /// A string that defines shape to be used at the end of the  stroke.
  external String get lineCap;
  external set lineCap(String value);

  /// A string that defines shape to be used at the corners of the stroke.
  external String get lineJoin;
  external set lineJoin(String value);

  /// A string that defines the stroke dash pattern. Doesn't work on
  /// Canvas-powered layers in some old browsers.
  external String get dashArray;
  external set dashArray(String value);

  /// A string that defines the distance into the dash pattern to
  /// start the dash. Doesn't work on Canvas-powered layers in some  old browsers.
  external String get dashOffset;
  external set dashOffset(String value);

  /// Whether to fill the path with color. Set it to false to disable filling on polygons or circles.
  external bool get fill;
  external set fill(bool value);

  /// Fill color. Defaults to the value of the color option
  external String get fillColor;
  external set fillColor(String value);

  /// Fill opacity.
  external double get fillOpacity;
  external set fillOpacity(double value);

  /// A string that defines how the inside of a shape is determined. bubblingMouseEvents
  /// When true, a mouse event on this path will trigger the same event on the map
  /// (unless L.DomEvent.stopPropagation is used).
  external String get fillRule;
  external set fillRule(String value);

  /// Use this specific instance of Renderer for this path. Takes precedence over the map's default renderer.
  external Renderer get renderer;
  external set renderer(Renderer value);

  /// Custom class name set on an element. Only for SVG renderer.
  external String get className;
  external set className(String value);
}

@JS("L.polyline")
class Polyline extends Path {
  /// Instantiates a polyline object given an array of geographical points and optionally an options object.
  /// You can create a Polyline object with multiple separate lines (MultiPolyline) by passing an array of
  /// arrays of geographic points.
  external Polyline(List<LatLng> latlngs, [PolylineOptions options]);

  /// precision is the number of decimal places for coordinates The default value is 6 places.
  /// Returns a GeoJSON representation of the polyline (as a GeoJSON LineString or MultiLineString Feature).
  external dynamic toGeoJSON([double precision]);

  /// Returns an array of the points in the path, or nested arrays of points in case of multi-polyline.
  external List<LatLng> getLatLngs();

  /// Replaces all the points in the polyline with the given array of geographical points.
  external Polyline setLatLngs(List<LatLng> latlngs);

  /// Returns true if the Polyline has no LatLngs.
  external bool isEmpty();

  /// Returns the point closest to p on the Polyline.
  external Point closestLayerPoint(Point p);

  /// Returns the center (centroid) of the polyline.
  external LatLng getCenter();

  /// Returns the LatLngBounds of the path.
  external LatLngBounds getBounds();

  /// Adds a given point to the polyline. By default, adds to the  first ring of the polyline in case
  /// of a multi-polyline, can be overridden by passing a specific ring as a LatLng array (that you
  /// can earlier access with getLatLngs
  external Polyline addLatLng(LatLng latlng);
}

@JS()
@anonymous
class PolylineOptions extends PathOptions {
  external factory PolylineOptions();

  ///How much to simplify the polyline on each zoom level. More means better performance and smoother look,
  /// and less means more accurate representation.
  external double get smoothFactor;
  external set smoothFactor(double value);

  ///Disable polyline clipping.
  external bool get noClip;
  external set noClip(bool value);
}

@JS("L.polygon")
class Polygon extends Polyline {
  external factory Polygon(List<LatLng> latlngs, [PolylineOptions options]);
}

@JS("L.rectangle")
class Rectangle extends Polyline {
  external factory Rectangle(LatLngBounds latlngs, [PolylineOptions options]);
}

@JS("L.circleMarker")
class CircleMarker extends Path {
  /// Instantiates a circle marker object given a geographical point, and an optional options object.
  external factory CircleMarker(LatLng latlng, [CircleOptions options]);

  /// precision is the number of decimal places for coordinates. The default value is 6 places.
  /// Returns a GeoJSON representation of the circle marker (as a GeoJSON Point Feature).
  external dynamic toGeoJSON(double precision);

  /// Sets the position of a circle marker to a new location.
  external CircleMarker setLatLng(LatLng latlng);

  /// Returns the current geographical position of the circle marker
  external LatLng getLatLng();

  /// sets the radius of a circle marker. Units are in pixels.
  external CircleMarker setRadius(double radius);

  /// Returns the current radius of the circle
  external double getRadius();
}

@JS()
@anonymous
class CircleOptions extends PathOptions {
  external factory CircleOptions({
    double radius,
    
  });

  /// Radius of the circle marker, in pixels
  external double get radius;
  external set radius(double value);
}

@JS("L.circle")
class Circle extends CircleMarker {
  external factory Circle(LatLng latlng, [CircleOptions options]);
}
