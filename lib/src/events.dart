@JS()
library leaflet.events;

import 'dart:html';
import 'package:js/js.dart';
import 'dart:js';
import 'latlng.dart';
import 'point.dart';
import 'layer.dart';
import 'tooltip.dart';
import 'popup.dart';
import 'latlng_bounds.dart';

class E {
  /// 	LayersControlEvent 	Fired when the base layer is changed through the layer control.
  static const baselayerchange = "baselayerchange";

  /// 	LayersControlEvent 	Fired when an overlay is selected through the layer control.
  static const overlayadd = "overlayadd";

  /// 	LayersControlEvent 	Fired when an overlay is deselected through the layer control.
  static const overlayremove = "overlayremove";

  /// 	LayerEvent 	Fired when a new layer is added to the map.
  static const layeradd = "layeradd";

  /// 	LayerEvent 	Fired when some layer is removed from the map
  static const layerremove = "layerremove";

  /// Map state change events
  /// 	Event 	Fired when the number of zoomlevels on the map is changed due to adding or removing a layer.
  static const zoomlevelschange = "zoomlevelschange";

  /// 	ResizeEvent 	Fired when the map is resized.
  static const resize = "resize";

  /// 	Event 	Fired when the map is destroyed with remove method.
  static const unload = "unload";

  /// 	Event 	Fired when the map needs to redraw its content (this usually happens on map zoom or load). Very useful for creating custom overlays.
  static const viewreset = "viewreset";

  /// 	Event 	Fired when the map is initialized (when its center and zoom are set for the first time).
  static const load = "load";

  /// 	Event 	Fired when the map zoom is about to change (e.g. before zoom animation).
  static const zoomstart = "zoomstart";

  /// 	Event 	Fired when the view of the map starts changing (e.g. user starts dragging the map).
  static const movestart = "movestart";

  /// 	Event 	Fired repeatedly during any change in zoom level, including zoom and fly animations.
  static const zoom = "zoom";

  /// 	Event 	Fired repeatedly during any movement of the map, including pan and fly animations.
  static const move = "move";

  /// 	Event 	Fired when the map has changed, after any animations.
  static const zoomend = "zoomend";

  /// 	Event 	Fired when the center of the map stops changing (e.g. user stopped dragging the map).
  static const moveend = "moveend";

  /// Popup events
  /// 	PopupEvent 	Fired when a popup is opened in the map
  static const popupopen = "popupopen";

  /// 	PopupEvent 	Fired when a popup in the map is closed
  static const popupclose = "popupclose";

  /// 	Event 	Fired when the map starts autopanning when opening a popup.
  static const autopanstart = "autopanstart";

  /// Tooltip events
  /// 	TooltipEvent 	Fired when a tooltip is opened in the map.
  static const tooltipopen = "tooltipopen";

  /// 	TooltipEvent 	Fired when a tooltip in the map is closed.
  static const tooltipclose = "tooltipclose";

  /// Location events
  /// 	ErrorEvent 	Fired when geolocation (using the locate method) failed.
  static const locationerror = "locationerror";

  /// 	LocationEvent 	Fired when geolocation (using the locate method) went successfully.
  static const locationfound = "locationfound";

  /// Interaction events
  /// 	MouseEvent 	Fired when the user clicks (or taps) the map.
  static const click = "click";

  /// 	MouseEvent 	Fired when the user double-clicks (or double-taps) the map.
  static const dblclick = "dblclick";

  /// 	MouseEvent 	Fired when the user pushes the mouse button on the map.
  static const mousedown = "mousedown";

  /// 	MouseEvent 	Fired when the user releases the mouse button on the map.
  static const mouseup = "mouseup";

  /// 	MouseEvent 	Fired when the mouse enters the map.
  static const mouseover = "mouseover";

  /// 	MouseEvent 	Fired when the mouse leaves the map.
  static const mouseout = "mouseout";

  /// 	MouseEvent 	Fired while the mouse moves over the map.
  static const mousemove = "mousemove";

  /// 	MouseEvent 	Fired when the user pushes the right mouse button on the map, prevents default browser context menu from showing if there are listeners on this event. Also fired on mobile when the user holds a single touch for a second (also called long press).
  static const contextmenu = "contextmenu";

  /// 	KeyboardEvent 	Fired when the user presses a key from the keyboard that produces a character value while the map is focused.
  static const keypress = "keypress";

  /// 	KeyboardEvent 	Fired when the user presses a key from the keyboard while the map is focused. Unlike the keypress event, the keydown event is fired for keys that produce a character value and for keys that do not produce a character value.
  static const keydown = "keydown";

  /// 	KeyboardEvent 	Fired when the user releases a key from the keyboard while the map is focused.
  static const keyup = "keyup";

  /// 	MouseEvent 	Fired before mouse click on the map (sometimes useful when you want something to happen on click before any existing click handlers start running).
  static const preclick = "preclick";

  ///Other Methods
  /// 	ZoomAnimEvent 	Fired at least once per zoom animation. For continuous zoom, like pinch zooming, fired once per frame during zoom.
  static const zoomanim = "zoomanim";
}

/// Event
/// The base event object. All other event objects contain these properties too.
@JS()
@anonymous
class LeafletEvent {
  ///  The event type (e.g. 'click').
  external String get type;

  /// The object that fired the event. For propagated events, the last object in the propagation chain that fired the event.
  external JsObject get target;

  ///  The object that originally fired the event. For non-propagated events, this will be the same as the  target.
  external JsObject get sourceTarget;

  /// For propagated events, the last object that propagated the event to its event parent.
  /// layer Object Deprecated. The same as propagatedFrom.
  external JsObject get propagatedFrom;
}

@JS()
@anonymous
class LeafletKeyboardEvent extends LeafletEvent {
  /// The original DOM KeyboardEvent  that triggered this Leaflet event.
  external Event get originalEvent;
}

@JS()
@anonymous
class LeafletMouseEvent extends LeafletEvent {
  /// The geographical point where the mouse event occured.
  external LatLng get latlng;

  /// Pixel coordinates of the point where the mouse event occured relative to the map layer.
  external Point get layerPoint;

  /// Pixel coordinates of the point where the mouse event occured relative to the map сontainer.
  external Point get containerPoint;

  /// The original DOM MouseEvent or DOM TouchEvent that triggered this Leaflet event.
  external Event get originalEvent;
}

@JS()
@anonymous
class LeafletLocationEvent extends LeafletEvent {
  /// Detected geographical location of the user.
  external LatLng get latlng;

  ///Geographical bounds of the area user is located in (with respect to the accuracy of location().
  external LatLngBounds get bounds;

  /// Accuracy of location in meters.
  external double get accuracy;

  /// Height of the position above the WGS84 ellipsoid in meters.
  external double get altitude;

  /// Accuracy of altitude in meters.
  external double get altitudeAccuracy;

  /// The direction of travel in degrees counting clockwise from true North.
  external double get heading;

  /// Current velocity in meters per second
  external double get speed;

  ///   The time when the position was acquired.
  external double get timestamp;
}

@JS()
@anonymous
class LeafletErrorEvent extends LeafletEvent {
  /// Error message.
  external String get message;

  /// Error code (if applicable).
  external double get code;
}

@JS()
@anonymous
class LeafletLayerEvent extends LeafletEvent {
  /// The layer that was added or removed.
  external Layer get layer;
}

@JS()
@anonymous
class LeafletLayersControlEvent extends LeafletEvent {
  ///  The layer that was added or removed.
  external Layer get layer;

  /// The name of the layer that was added or removed.
  external String get name;
}

@JS()
@anonymous
class LeafletTileEvent extends LeafletEvent {
  ///  The tile element (image). coords Point Point object with the tile's x, y, and z (zoom level) coordinates.
  external Element get tile;
}

@JS()
@anonymous
class LeafletTileErrorEvent extends LeafletEvent {
  /// The tile element (image).
  external Element get tile;

  /// object with the tile's x, y, and z (zoom level) coordinates.
  external Point get coords;

  /// Error passed to the tile's done() callback.
  external dynamic get error;
}

@JS()
@anonymous
class LeafletResizeEvent extends LeafletEvent {
  /// The old size before resize event.
  external Point get oldSize;

  ///  The new size after the resize event.
  external Point get newSize;
}


@JS()
@anonymous
class LeafletPopupEvent extends LeafletEvent {
  /// The popup that was opened or closed.
  external Popup get popup;
}

@JS()
@anonymous
class LeafletTooltipEvent extends LeafletEvent {
  ///  The tooltip that was opened or closed.
  external Tooltip get tooltip;
}

@JS()
@anonymous
class LeafletDragEndEvent {
  ///  The distance in pixels the draggable element was moved by.
  external double get distance;
}

@JS()
@anonymous
class LeafletZoomAnimEvent {
  /// The current center of the map
  external LatLng get center;

  ///  The current zoom level of the map
  external double get zoom;

  /// Whether layers should update their contents due to this event
  external bool get noUpdate;
}
