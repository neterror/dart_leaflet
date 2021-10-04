@JS()
library leaflet.layer;

import 'dart:html';
import 'package:js/js.dart';
import 'latlng_bounds.dart';
import 'leaflet_map.dart';
import 'popup.dart';
import 'latlng.dart';
import 'tooltip.dart';
import 'evented.dart';
import 'geojson.dart';
import 'point.dart';

@JS('L.layer')
class Layer extends Evented {
  /// Adds the layer to the given map or layer group.
  external Layer addTo(LeafletMap map);

  /// Removes the layer from the map it is currently active on.
  external Layer remove();

  /// Removes the layer from the given map
  external Layer removeFrom(LeafletMap map);

  /// Returns the HTMLElement representing the named pane on the map. If name is omitted, returns the pane for this layer
  external Element getPane([String? name]);

  /// Used by the attribution control, returns the attribution option.
  external String getAttribution();

  /// Should contain code that creates DOM elements for the layer, adds them to map panes where they should belong and puts
  /// listeners on relevant map events. Called on map.addLayer(layer).
  external Layer onAdd(LeafletMap map);

  /// Should contain all clean up code that removes the layer's elements from the DOM and removes listeners previously added
  /// in onAdd. Called on map.removeLayer(layer).
  external Layer onRemove(LeafletMap map);

  /// Optional method. Called on map.addLayer(layer), before the layer is added to the map, before events are initialized,
  /// without waiting until the map is in a usable state. Use for early initialization only.
  external Layer beforeAdd(LeafletMap map);

  /// Binds a popup to the layer with the passed content and sets up the necessary event listeners.
  /// If a Function is passed it will receive the layer as the first argument and should return a String or HTMLElement
  external Layer bindPopup(Popup content);

  /// Removes the popup previously bound with bindPopup.
  external Layer unbindPopup();

  /// Opens the bound popup at the specified latlng or at the default popup anchor if no latlng is passed.
  external Layer openPopup([LatLng? latlng]);

  /// Closes the popup bound to this layer if it is open.
  external Layer closePopup();

  /// Opens or closes the popup bound to this layer depending on its current state
  external Layer togglePopup();

  /// Returns true if the popup bound to this layer is currently open.
  external bool isPopupOpen();

  ///Sets the content of the popup bound to this layer.
  external Layer setPopupContent(Popup content);

  /// Returns the popup bound to this layer.
  external Popup getPopup();

  ///Binds a tooltip to the layer with the passed content and sets up the options>options?)    necessary event listeners.
  /// If a Function is passed it will receive the layer as the first argument and should return a String or HTMLElement.
  external Tooltip bindTooltip(String content, [TooltipOptions? options]);

  /// Removes the tooltip previously bound with bindTooltip.
  external Layer unbindTooltip();

  /// Opens the bound tooltip at the specified latlng or at the default tooltip anchor if no latlng is passed.
  external Layer openTooltip([LatLng? latlng]);

  /// Closes the tooltip bound to this layer if it is open.
  external Layer closeTooltip();

  /// Opens or closes the tooltip bound to this layer depending on its current state.
  external Layer toggleTooltip();

  /// Returns true if the tooltip bound to this layer is currently open.
  external bool isTooltipOpen();

  /// Sets the content of the tooltip bound to this layer.
  external Layer setTooltipContent(String content);

  /// Returns the tooltip bound to this layer.
  external Tooltip getTooltip();
}

@JS()
@anonymous
class LayerOptions {
  external factory LayerOptions({
    String? pane,
    String? attribution,
  });

  /// By default the layer will be added to the map's overlay pane.
  /// Overriding this option will cause the layer to be placed on another pane by default.
  external String get pane;
  external set pane(String value);

  /// String to be shown in the attribution control, e.g. "© OpenStreetMap contributors".
  /// It describes the layer data and is often a legal obligation towards copyright holders and tile providers.
  external String get attribution;
  external set attribution(String value);
}

@JS('L.gridLayer')
class GridLayer extends Layer {
  /// Creates a new instance of GridLayer with the supplied options
  external GridLayer([GridLayerOptions? options]);

  /// Brings the tile layer to the top of all tile layers.
  external GridLayer bringToFront();

  /// Brings the tile layer to the bottom of all tile layers.
  external GridLayer bringToBack();

  /// Returns the HTML element that contains the tiles for this layer.
  external Element getContainer();

  /// Changes the opacity of the grid layer.
  external GridLayer setOpacity(double value);

  /// Changes the zIndex of the grid layer.
  external GridLayer extesetZIndex(double zIndex);

  /// Returns true if any tile in the grid layer has not finished loading.
  external bool isLoading();

  /// Causes the layer to clear all the tiles and request them again.
  external GridLayer redraw();

  /// Normalizes the tileSize option into a point. Used by the createTile() method.
  external Point getTileSize();
}

@JS()
@anonymous
class InteractiveLayerOptions extends LayerOptions {
  external factory InteractiveLayerOptions({
    String? pane,
    String? attribution,
    bool? interactive,
    bool? bubblingMouseEvents,
  });

  /// If false, the layer will not emit mouse events and will act as a part of the underlying map.
  external bool get interactive;
  external set interactive(bool value);

  /// When true, a mouse event on this layer will trigger the same event on the map (unless L.DomEvent.stopPropagation is used).
  external bool get bubblingMouseEvents;
  external set bubblingMouseEvents(bool value);
}

@JS()
@anonymous
class GridLayerOptions extends LayerOptions {
  external factory GridLayerOptions({
    String? pane,
    String? attribution,
    Point? tileSize,
    double? opacity,
    bool? updateWhenIdle,
    bool? updateWhenZooming,
    double? updateInterval,
    double? zIndex,
    LatLngBounds? bounds,
    double? minZoom,
    double? maxZoom,
    double? maxNativeZoom,
    double? minNativeZoom,
    bool? noWrap,
    String? className,
    double? keepBuffer,
  });

  /// Width and height of tiles in the grid. Use a number if width and height are equal, or L.point(width, height) otherwise.
  external Point get tileSize;
  external set tileSize(Point value);

  ///  Opacity of the tiles. Can be used in the createTile() function.
  external double get opacity;
  external set opacity(double value);

  /// Load new tiles only when panning ends. true by default on mobile browsers, in order to avoid too many
  /// requests and keep smooth navigation. false otherwise in order to display new tiles during panning,
  /// since it is easy to pan outside the keepBuffer option in desktop browsers.
  external bool get updateWhenIdle;
  external set updateWhenIdle(bool value);

  /// By default, a smooth zoom animation (during a touch zoom or a flyTo()) will update grid layers every
  /// integer zoom level. Setting this option to false will update the grid layer only when the smooth animation ends.
  external bool get updateWhenZooming;
  external set updateWhenZooming(bool value);

  ///Tiles will not update more than once every updateInterval milliseconds when panning.
  external double get updateInterval;
  external set updateInterval(double value);

  /// The explicit zIndex of the tile layer.
  external double get zIndex;
  external set zIndex(double value);

  /// If set, tiles will only be loaded inside the set LatLngBounds.
  external LatLngBounds get bounds;
  external set bounds(LatLngBounds value);

  /// The minimum zoom level down to which this layer will be displayed (inclusive)
  external double get minZoom;
  external set minZoom(double value);

  /// The maximum zoom level up to which this layer will be displayed (inclusive).
  external double get maxZoom;
  external set maxZoom(double value);

  /// Maximum zoom number the tile source has available. If it is specified, the tiles on all zoom levels
  /// higher than maxNativeZoom will be loaded from maxNativeZoom level and auto-scaled.
  external double get maxNativeZoom;
  external set maxNativeZoom(double value);

  /// Minimum zoom number the tile source has available. If it is specified, the tiles on all zoom levels
  /// lower than minNativeZoom will be loaded from minNativeZoom level and auto-scaled.
  external double get minNativeZoom;
  external set minNativeZoom(double value);

  /// Whether the layer is wrapped around the antimeridian. If true, the GridLayer will only be displayed
  /// once at low zoom levels. Has no effect when the map CRS doesn't wrap around. Can be used in combination
  /// with bounds to prevent requesting tiles outside the CRS limits.
  external bool get noWrap;
  external set noWrap(bool value);

  /// Map pane where the grid layer will be added.
  external String get pane;
  external set pane(String value);

  /// A custom class name to assign to the tile layer. Empty by default.
  external String get className;
  external set className(String value);

  /// When panning the map, keep this many rows and columns of tiles before unloading them.
  external double get keepBuffer;
  external set keepBuffer(double value);
}

@JS('L.tileLayer')
class TileLayer extends GridLayer {
  /// Instantiates a tile layer object given a URL template and optionally an options object.
  external TileLayer(String urlTemplate, [TileLayerOptions? options]);

  /// Updates the layer's URL template and redraws it (unless noRedraw is set to true). If the URL
  /// does not change, the layer will not be redrawn unless the noRedraw parameter is set to  false.
  external TileLayer setUrl(String url, [bool? noRedraw]);
}

@JS()
@anonymous
class TileLayerOptions extends GridLayerOptions {
  external factory TileLayerOptions({
    String? attribution,
    Point? tileSize,
    double? opacity,
    bool? updateWhenIdle,
    bool? updateWhenZooming,
    double? updateInterval,
    double? zIndex,
    LatLngBounds? bounds,
    double? minZoom,
    double? maxZoom,
    double? maxNativeZoom,
    double? minNativeZoom,
    bool? noWrap,
    String? pane,
    String? className,
    double? keepBuffer,
    String? subdomains,
    String? errorTileUrl,
    double? zoomOffset,
    bool? tms,
    bool? zoomReverse,
    bool? detectRetina,
    String? crossOrigin,
  });

  /// Subdomains of the tile service. Can be passed in the form of one string (where each letter is a subdomain
  /// name) or an array of strings.
  external String get subdomains;
  external set subdomains(String value);

  /// URL to the tile image to show in place of the tile that failed to load.
  external String get errorTileUrl;
  external set errorTileUrl(String value);

  /// The zoom number used in tile URLs will be offset with this value.
  external double get zoomOffset;
  external set zoomOffset(double value);

  /// If true, inverses Y axis numbering for tiles (turn this on for TMS services).
  external bool get tms;
  external set tms(bool value);

  /// If set to true, the zoom number used in tile URLs will be reversed (maxZoom - zoom instead of zoom)
  external bool get zoomReverse;
  external set zoomReverse(bool value);

  /// If true and user is on a retina display, it will request four tiles of half the specified size and a bigger
  /// zoom level in place of one to utilize the high resolution.
  external bool get detectRetina;
  external set detectRetina(bool value);

  /// Whether the crossOrigin attribute will be added to the tiles. If a String is provided, all tiles will have
  /// their crossOrigin attribute set to the String provided. This is needed if you want to access tile pixel
  external String get crossOrigin;
  external set crossOrigin(String value);
}

@JS()
@anonymous
class DivOverlay extends Layer {}

@JS()
@anonymous
class DivOverlayOptions extends LayerOptions {
  external factory DivOverlayOptions({
    String? attribution,
    Point? offset,
    String? className,
    String? pane,
  });

  /// The offset of the popup position. Useful to control the anchor of the popup when opening it on some overlays.
  external Point get offset;
  external set offset(Point value);

  /// A custom CSS class name to assign to the popup.
  external String get className;
  external set className(String value);

  /// Map pane where the popup will be added.
  external String get pane;
  external set pane(String value);
}

@JS('L.layerGroup')
class LayerGroup extends Layer {
  external LayerGroup([List? layers, LayerOptions? options]);

  /// precision is the number of decimal places for coordinates. The default value is 6 places. Returns
  /// a GeoJSON representation of the layer group (as a GeoJSON FeatureCollection, GeometryCollection, or MultiPoint).
  external GeoJson toGeoJSON([double? precision]);

  /// Adds the given layer to the group.
  external LayerGroup addLayer(Layer layer);

  /// Removes the layer with the given internal ID from the group.
  external LayerGroup removeLayer(double id);

  /// Returns true if the given internal ID is currently added to the group.
  external bool hasLayer(double id);

  /// Removes all the layers from the group.
  external LayerGroup clearLayers();

  /// Calls methodName on every layer contained in this group, passing any additional parameters. Has no
  /// effect if the layers contained do not implement methodName.
  external LayerGroup invoke(String methodName);

  /// Iterates over the layers of the group, optionally specifying context of the iterator function.
  ///
  /// ```dart
  /// group.eachLayer(allowInterop((layer) {
  ///   layer.bindPopup('Hello');
  /// }));
  /// ```
  external LayerGroup eachLayer(Function fn);

  /// Returns the layer with the given internal ID.
  external Layer getLayer(double id);

  /// Returns an array of all the layers added to the group.
  external List<Layer> getLayers();

  /// Calls setZIndex on every layer contained in this group, passing the z-index.
  external LayerGroup setZIndex(double zIndex);

  /// Returns the internal ID for a layer
  external double getLayerId(List layer);
}

/// Extended [LayerGroup] that makes it easier to do the same thing to all its member layers
@JS('L.featureGroup')
class FeatureGroup extends LayerGroup {
  external FeatureGroup(List layers);
}
