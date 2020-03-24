@JS()
library leaflet.control;

import 'dart:html';
import 'package:js/js.dart';
import 'layer.dart';
import 'leaflet_map.dart';

@JS('L.control')
class Control {
  external Control([ControlOptions options]);

  /// Returns the position of the control.
  external String getPosition();

  ///  Sets the position of the control.
  external Control setPosition(String position);

  /// Returns the HTMLElement that contains the control.
  external Element getContainer();

  /// Adds the control to the given map.
  external Control addTo(LeafletMap map);

  /// Removes the control from the map it is currently active on.
  external Control remove();
}

@JS()
@anonymous
class ControlOptions {
  external factory ControlOptions({String position});

  /// The position of the control (one of the map corners). Possible values are 'topleft', 'topright', 'bottomleft' or   'bottomright'
  external String get position;
  external set position(String value);
}

/// A basic zoom control with two buttons (zoom in and zoom out).
/// It is put on the map by default unless you set its [zoomControl] option to false.
@JS('L.control.zoom')
class ZoomControl extends Control {
  external ZoomControl([ZoomControlOptions options]);
}

@JS()
@anonymous
class ZoomControlOptions extends ControlOptions {
  external factory ZoomControlOptions({
    String position,
    String zoomInText,
    String zoomInTitle,
    String zoomOutText,
    String zoomOutTitle,
  });

  /// The text set on the 'zoom in' button ('+' by default).
  external String get zoomInText;
  external set zoomInText(String value);

  /// The title set on the 'zoom in' button ('Zoom in' by default).
  external String get zoomInTitle;
  external set zoomInTitle(String value);

  /// The text set on the 'zoom out' button ('&#x2212  ' by default).
  external String get zoomOutText;
  external set zoomOutText(String value);

  /// The title set on the 'zoom out' button ('Zoom out' by default).
  external String get zoomOutTitle;
  external set zoomOutTitle(String value);
}

/// The attribution control allows you to display attribution data in a small text box on a map.
/// It is put on the map by default unless you set its attributionControl option to false,
/// and it fetches attribution texts from layers with the getAttribution method automatically.
@JS('L.control.attribution')
class AttributionControl extends Control {
  external AttributionControl([AttributionControlOptions options]);
}

@JS()
@anonymous
class AttributionControlOptions extends ControlOptions {
  external factory AttributionControlOptions({
    String position,
    String prefix,
  });

  /// The HTML text shown before the attributions ('Leaflet' by default).
  /// Pass `null` to disable.
  external String get prefix;
  external set prefix(String value);
}

/// A simple scale control that shows the scale of the current center
/// of screen in metric (m/km) and imperial (mi/ft) systems.
@JS('L.control.scale')
class ScaleControl extends Control {
  external ScaleControl([ScaleControlOptions options]);
}

@JS()
@anonymous
class ScaleControlOptions extends ControlOptions {
  external factory ScaleControlOptions({
    String position,
    String prefix,
    num maxWidth,
    bool metric,
    bool imperial,
    bool updateWhenIdle,
  });

  /// Number  100 Maximum width of the control in pixels.
  /// The width is set dynamically to show round values (e.g. 100, 200, 500).
  external num get maxWidth;
  external set maxWidth(num value);

  /// Whether to show the metric scale line (m/km). Default to `true`.
  external bool get metric;
  external set metric(bool value);

  /// Whether to show the imperial scale line (mi/ft). Default to `true`.
  external bool get imperial;
  external set imperial(bool value);

  /// If `true`, the control is updated on `moveend`, otherwise it's always
  /// up-to-date (updated on move). Default to `false`.
  external bool get updateWhenIdle;
  external set updateWhenIdle(bool value);
}

/// The layers control gives users the ability to switch between different base
/// layers and switch overlays on/off.
@JS('L.control.layers')
class LayersControl extends Control {
  /// Creates a layers control with the given layers.
  ///
  /// The [baseLayers] and [overlays] parameters are object literals with layer names as keys and [Layer] objects as values.
  /// Note: Since dart2js interop doesn't transpile dart maps to native js map directly,
  /// you will have to create anonymous anotated classes for each different [baselayers] and [overlays] object
  /// (or just use the [addBaseLayer] and [addOverlay] instance methods).
  ///
  /// Base layers will be switched with radio buttons, while overlays will be switched with checkboxes.
  /// Note that all base layers should be passed in the base layers object,
  /// but only one should be added to the map during map instantiation.
  external LayersControl([
    dynamic baselayers,
    dynamic overlays,
    LayersControlOptions options,
  ]);

  /// Adds a base layer (radio button entry) with the given name to the control.
  external LayersControl addBaseLayer(Layer layer, String name);

  /// Adds an overlay (checkbox entry) with the given name to the control.
  external LayersControl addOverlay(Layer layer, String name);

  /// Remove the given layer from the control.
  external LayersControl removeLayer(Layer layer);

  /// Expand the control container if collapsed.
  external LayersControl expand();

  /// Collapse the control container if expanded.
  external LayersControl collapse();
}

@JS()
@anonymous
class LayersControlOptions extends ControlOptions {
  external factory LayersControlOptions({
    String position,
    bool collapsed,
    bool autoZIndex,
    bool hideSingleBase,
    bool sortLayers,
    LayersSortFunction sortFunction,
  });

  /// If `true`, the control will be collapsed into an icon and expanded on mouse hover or touch (`true` by default).
  external bool get collapsed;
  external set collapsed(bool value);

  /// If `true`, the control will assign zIndexes in increasing order to all of its
  /// layers so that the order is preserved when switching them on/off (`true` by default).
  external bool get autoZIndex;
  external set autoZIndex(bool value);

  /// If `true`, the base layers in the control will be hidden when there is only one (`false` by default).
  external bool get hideSingleBase;
  external set hideSingleBase(bool value);

  /// Whether to sort the layers. When `false`, layers will keep the order in which
  /// they were added to the control (`false` by default).
  external bool get sortLayers;
  external set sortLayers(bool value);

  /// A compare function that will be used for sorting the layers, when [sortLayers] is true.
  /// By default, it sorts layers alphabetically by their name.
  external LayersSortFunction get sortFunction;
  external set sortFunction(LayersSortFunction value);
}

typedef LayersSortFunction = Function(
  Layer layerA,
  Layer layerB,
  String nameA,
  String nameB,
);
