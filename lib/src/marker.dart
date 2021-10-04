@JS()
library leaflet.marker;

import 'package:js/js.dart';
import 'layer.dart';
import 'icon.dart';
import 'point.dart';
import 'latlng.dart';
import 'evented.dart';
import 'geojson.dart';

@JS('L.marker')
class Marker extends Layer {
  external Marker(LatLng latlng, [MarkerOptions? options]);

  /// precision is the number of decimal places for coordinates. The default value is 6 places.
  /// Returns a GeoJSON representation of the marker (as a GeoJSON Point Feature).
  external GeoJson toGeoJSON([double? precision]);

  /// Returns the current geographical position of the marker.
  external LatLng getLatLng();

  /// Changes the marker position to the given point.
  external Marker setLatLng(LatLng latlng);

  /// Changes the zIndex offset of the marker.
  external Marker setZIndexOffset(double offset);

  /// Returns the current icon used by the marker
  external Icon getIcon();

  /// Changes the marker icon.
  external Marker setIcon(Icon icon);

  /// Changes the opacity of the marker.
  external Marker setOpacity(double value);
}

@JS()
@anonymous
class MarkerOptions extends InteractiveLayerOptions {
  external factory MarkerOptions({
    String? attribution,
    bool? interactive,
    Icon? icon,
    bool? keyboard,
    String? title,
    String? alt,
    double? zIndexOffset,
    double? opacity,
    bool? riseOnHover,
    double? riseOffset,
    String? pane,
    bool? bubblingMouseEvents,
    bool? draggable,
    bool? autoPan,
    Point? autoPanPadding,
    double? autoPanSpeed,
  });

  /// Icon instance to use for rendering the marker. See Icon documentation
  /// for details on how to customize the marker icon. If not specified, a
  /// common instance of L.Icon.Default is used.
  external Icon get icon;
  external set icon(Icon icon);

  /// Whether the marker can be tabbed to with a keyboard and clicked by pressing enter.
  external bool get keyboard;
  external set keyboard(bool value);

  /// Text for the browser tooltip that appear on marker hover (no tooltip by default).
  external String get title;

  /// Text for the alt attribute of the icon image (useful for accessibility).
  external String get alt;
  external set alt(String value);

  /// By default, marker images zIndex is set automatically based on its latitude.
  /// Use this option if you want to put the marker on top of all others (or below),
  /// specifying a high value like 1000 (or high negative value, respectively).
  external double get zIndexOffset;
  external set zIndexOffset(double value);

  /// The opacity of the marker.
  external double get opacity;
  external set opacity(double value);

  /// If true, the marker will get on top of others when you hover the mouse over it.
  external bool get riseOnHover;
  external set riseOnHover(bool value);

  /// The z-index offset used for the riseOnHover feature
  external double get riseOffset;
  external set riseOffset(double value);

  /// Map pane where the markers icon will be added. Map pane where the markers shadow will be added.
  external String get pane;
  external set pane(String value);

  /// When true, a mouse event on this marker will trigger the same event
  /// on the map (unless L.DomEvent.stopPropagation is used).
  external bool get bubblingMouseEvents;
  external set bubblingMouseEvents(bool value);

  /// Whether the marker is draggable with mouse/touch or not.
  external bool get draggable;
  external set draggable(bool value);

  /// Whether to pan the map when dragging this marker near its edge or not.
  external bool get autoPan;
  external set autoPan(bool value);

  /// Distance (in pixels to the left/right and to the top/bottom) of   the map edge to start panning the map.
  external Point get autoPanPadding;
  external set autoPanPadding(Point value);

  /// Number of pixels the map should pan by
  external double get autoPanSpeed;
  external set autoPanSpeed(double value);
}
