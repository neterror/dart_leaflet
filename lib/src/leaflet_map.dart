@JS()
library leaflet.map;

import 'dart:html';
import 'package:js/js.dart';
import 'layer.dart';
import 'latlng_bounds.dart';
import 'latlng.dart';
import 'renderer.dart';
import 'crs.dart';
import 'zoom_pan_options.dart';
import 'bounds.dart';
import 'popup.dart';
import 'path.dart';
import 'control.dart';
import 'locate_options.dart';
import 'tooltip.dart';
import 'evented.dart';
import 'handler.dart';
import 'point.dart';

@JS('L.map')
class LeafletMap with Evented {
  /// Instantiates a map object given the DOM ID of a <div> element and optionally an object literal with LeafletMap options
  external LeafletMap(String id, [MapOptions options]);

  /// Instantiates a map object given an instance of a <div> HTML element and optionally an object literal
  /// with LeafletMap options.
  external LeafletMap.fromElement(Element e, [MapOptions options]);

  /// Methods
  /// Returns the instance of Renderer that should be used to render the given Path. It will ensure that the renderer
  /// options of the map and paths are respected, and that the renderers do exist on the map.
  external Renderer getRenderer(Path layer);

  /// Adds the given control to the map
  external LeafletMap addControl(Control control);

  /// Removes the given control from the map
  external LeafletMap removeControl(Control control);

  /// Adds the given layer to the map
  external LeafletMap addLayer(Layer layer);

  /// Removes the given layer from the map.
  external LeafletMap removeLayer(Layer layer);

  /// Returns true if the given layer is currently added to the map
  external bool hasLayer(Layer layer);

  /// Iterates over the layers of the map, optionally specifying context of the
  /// iterator function
  external LeafletMap eachLayer(Function fn);

  /// Opens the specified popup while closing the previously opened (to make sure only one is opened at one time for usability).
  external LeafletMap openPopup(Popup popup);

  /// Creates a popup with the specified content and options and opens it in the given point on a map.
// external LeafletMap openPopup(String content, LatLng latlng, [PopupOptions options]);

  /// Closes the popup previously opened with openPopup (or the given one).
  external LeafletMap closePopup([Popup popup]);

  /// Opens the specified tooltip.
  external LeafletMap openTooltip(Tooltip tooltip);

  /// Creates a tooltip with the specified content and options and open it.
// external LeafletMap openTooltip(String content, LatLng latlng, [Tooltip options] );

  /// Closes the tooltip given as parameter.
  external LeafletMap closeTooltip([Tooltip tooltip]);

  /// Sets the view of the map (geographical center and zoom) with the given animation options.
  external LeafletMap setView(LatLng center, double zoom,
      [ZoomPanOptions options]);

  /// Sets the zoom of the map.
  external LeafletMap setZoom(double zoom, [ZoomOptions options]);

  /// Increases the zoom of the map by delta (zoomDelta by default())
  external LeafletMap zoomIn([double delta, ZoomOptions options]);

  /// Decreases the zoom of the map by delta (zoomDelta by default).
  external LeafletMap zoomOut([double delta, ZoomOptions options]);

  /// Zooms the map while keeping a specified geographical point on the map
  /// stationary (e.g. used internally for scroll zoom and double-click zoom).
  external LeafletMap setZoomAround(
      LatLng latlng, double zoom, ZoomOptions options);

  /// Zooms the map while keeping a specified pixel on the map (relative to the top-left corner) stationary.
// external LeafletMap setZoomAround(Point offset, double zoom, ZoomOptions);

  /// Sets a map view that contains the given geographical bounds with the maximum zoom level possible.
  external LeafletMap fitBounds(LatLngBounds bounds, [FitBoundOptions options]);

  /// Sets a map view that mostly contains the whole world with the maximum zoom level possible.
  external LeafletMap fitWorld([FitBoundOptions options]);

  /// Pans the map to a given center.
  external LeafletMap panTo(LatLng latlng, [PanOptions options]);

  /// Pans the map by a given number of pixels (animated).
  external LeafletMap panBy(Point offset, [PanOptions options]);

  /// Sets the view of the map (geographical center and zoom) performing a smooth pan-zoom animation.
  external LeafletMap flyTo(LatLng latlng,
      [double zoom, ZoomPanOptions options]);

  /// Sets the view of the map with a smooth animation like flyTo, but takes a bounds parameter like fitBounds.
  external LeafletMap flyToBounds(LatLngBounds bounds,
      [FitBoundOptions options]);

  ///  Restricts the map view to the given bounds (see the maxBounds option).
  external LeafletMap setMaxBounds([Bounds bounds]);

  /// Sets the lower limit for the available zoom levels (see the minZoom  option).
  external LeafletMap setMinZoom(double zoom);

  /// Sets the upper limit for the available zoom levels (see the maxZoom option).
  external LeafletMap setMaxZoom(double zoom);

  /// Pans the map to the closest view that would lie inside the given
  /// bounds (if it's not already), controlling the animation using the
  /// options specific, if any.
  external LeafletMap panInsideBounds(LatLngBounds bounds,
      [PanOptions options]);

  /// Pans the map the minimum amount to make the latlng visible. Use
  /// padding, paddingTopLeft and paddingTopRight options to fit the display
  /// to more restricted bounds, like fitBounds. If latlng is already within
  /// the (optionally padded) display bounds, the map will not be panned.
  external LeafletMap panInside(LatLng latlng, [PanOptions options]);

  /// Checks if the map container size changed and updates the map if so —
  /// call it after you've changed the map size dynamically, also animating
  /// pan by default. If options.pan is false, panning will not occur. If
  /// options.debounceMoveend is true, it will delay moveend event so that
  /// it doesn't happen often even if the method is called many times in a row
  external LeafletMap invalidateSize([ZoomPanOptions options]);

  /// Checks if the map container size changed and updates the map if so —
  /// call it after you've changed the map size dynamically, also animating
  /// pan by default.
// external LeafletMap invalidateSize(bool animate);

  /// Stops the currently running panTo or flyTo animation, if any.
  external LeafletMap stop();

  /// Tries to locate the user using the Geolocation API, firing a locationfound event with location data on
  /// success or a locationerror event on failure, and optionally sets the map view to the user's location with
  /// respect to detection accuracy (or to the world view if geolocation failed). Note that, if your page doesn't
  /// use HTTPS, this method will fail in modern browsers (Chrome 50 and newer) See Locate options for more
  /// details.
  external LeafletMap locate([LocateOptions options]);

  /// Stops watching location previously initiated by map.locate({watch: true}) and aborts resetting the map view
  /// if map.locate was called with {setView: true}.
  external LeafletMap stopLocate();

  /// Adds a new Handler to the map, given its name and constructor function.
  external LeafletMap addHandler(String name, Function HandlerClass);

  /// Destroys the map and clears all related event listeners.
  external LeafletMap remove();

  /// Creates a new map pane with the given name if it doesn't exist already, then returns
  /// it. The pane is created as a child of container, or as a child of the main map pane if not set.
  external Element createPane(String name, [Element container]);

  ///  Returns a map pane, given its name or its HTML element (its identity).
  external Element getPane(String pane);

  ///  Returns the HTML element that contains the map.
  external Element getContainer();

  /// Runs the given function fn when the map gets initialized with a view (center and zoom)
  /// and at least one layer, or immediately if it's already initialized, optionally passing a function context.
  external LeafletMap whenReady(Function fn);

  /// Returns the geographical center of the map view
  external LatLng getCenter();

  /// Returns the current zoom level of the map view
  external double getZoom();

  /// Returns the geographical bounds visible in the current map view
  external LatLngBounds getBounds();

  /// Returns the minimum zoom level of the map (if set in the minZoom option of  the map or of any layers), or 0 by default.
  external double getMinZoom();

  /// Returns the maximum zoom level of the map (if set in the maxZoom option of the map or of any layers).
  external double getMaxZoom();

  /// Returns the maximum zoom level on which the given bounds fit to the map view in its entirety. If inside (optional) is set to true, the method
  /// instead returns the minimum zoom level on which the map view fits into the given bounds in its entirety.
  external double getBoundsZoom(LatLngBounds bounds,
      [bool inside, Point padding]);

  /// Returns the current size of the map container (in pixels).
  external Point getSize();

  /// Returns the bounds of the current map view in projected pixel coordinates (sometimes useful in layer and overlay implementations).
  external Bounds getPixelBounds();

  /// Returns the projected pixel coordinates of the top left point of the map  layer (useful in custom layer and overlay implementations).
  external Point getPixelOrigin();

  /// Returns the world's bounds in pixel coordinates for zoom level zoom. If zoom is omitted, the map's current zoom level is used.
  external Bounds getPixelWorldBounds([double zoom]);

  /// Returns the scale factor to be applied to a map transition from zoom level fromZoom to toZoom. Used internally to help with zoom animations.
  external double getZoomScale(double toZoom, double fromZoom);

  /// Returns the zoom level that the map would end up at, if it is at fromZoom level and
  /// everything is scaled by a factor of scale. Inverse of getZoomScale.
  external double getScaleZoom(double scale, double fromZoom);

  /// Projects a geographical coordinate LatLng according to the projection of the map's CRS,
  /// then scales it according to zoom and the CRS's Transformation. The result is pixel
  /// coordinate relative to the CRS origin.
  external Point project(LatLng latlng, double zoom);

  /// Inverse of project.
  external LatLng unproject(Point point, double zoom);

  /// Given a pixel coordinate relative to the origin pixel, returns the corresponding geographical coordinate (for the current zoom level).
  external LatLng layerPointToLatLng(Point point);

  /// Given a geographical coordinate, returns the corresponding pixel coordinate relative to the origin pixel.
  external Point latLngToLayerPoint(LatLng latlng);

  /// Returns a LatLng where lat and lng has been wrapped according to the map's CRS's wrapLat
  /// and wrapLng properties, if they are outside the CRS's bounds. By default this means
  /// longitude is wrapped around the dateline so its value is between -180 and +180 degrees.
  external LatLng wrapLatLng(LatLng latlng);

  /// Returns a LatLngBounds with the same size as the given one, ensuring that its center is
  /// within the CRS's bounds. By default this means the center longitude is wrapped around
  /// the dateline so its value is between -180 and +180 degrees, and the majority of the bounds overlaps the CRS's bounds.
  external LatLngBounds wrapLatLngBounds(LatLngBounds bounds);

  /// Returns the distance between two geographical coordinates according to the map's CRS. By default this measures distance in meters.
  external double distance(LatLng latlng1, LatLng latlng2);

  /// Given a pixel coordinate relative to the map container, returns the corresponding pixel coordinate relative to the origin pixel.
  external Point containerPointToLayerPoint(Point point);

  /// Given a pixel coordinate relative to the origin pixel, returns the corresponding pixel coordinate relative to the map container.
  external Point layerPointToContainerPoint(Point point);

  /// Given a pixel coordinate relative to the map container, returns the corresponding geographical coordinate (for the current zoom level).
  external LatLng containerPointToLatLng(Point point);

  /// Given a geographical coordinate, returns the corresponding pixel coordinate relative to the map container.
  external Point latLngToContainerPoint(LatLng latlng);

  /// Given a MouseEvent object, returns the pixel coordinate relative to the map container where the event took place.
  external Point mouseEventToContainerPoint(MouseEvent ev);

  /// Given a MouseEvent object, returns the pixel coordinate relative to the origin pixel where the event took place.
  external Point mouseEventToLayerPoint(MouseEvent ev);

  /// Given a MouseEvent object, returns geographical coordinate where the event took place.
  external LatLng mouseEventToLatLng(MouseEvent ev);

  /// Adds a listener function (fn) to a particular event type of the object. You can optionally specify the context of the listener
  /// (object the this keyword will point to). You can also pass several space-separated types (e.g. 'click dblclick').
  external LeafletMap on(String type, Function fn, [dynamic context]);

  ///Handlers
  /////////
  ///
  /// Box (shift-drag with mouse) zoom handler.
  external Handler get boxZoom;
  external set boxZoom(Handler value);

  /// Double click zoom handler.
  external Handler get doubleClickZoom;
  external set doubleClickZoom(Handler value);

  /// Map dragging handler (by both mouse and touch).
  external Handler get dragging;
  external set dragging(Handler value);

  ///Keyboard navigation handler.
  external Handler get keyboard;
  external set keyboard(Handler value);

  ///Scroll wheel zoom handler.
  external Handler get scrollWheelZoom;
  external set scrollWheelZoom(Handler value);

  ///Mobile touch hacks (quick tap and touch hold) handler.
  external Handler get tap;
  external set tap(Handler value);

  ///Touch zoom handler.
  external Handler get touchZoom;
  external set touchZoom(Handler value);
}

@JS()
@anonymous
class MapOptions {
  external factory MapOptions({
    bool preferCanvas,
    bool attributionControl,
    bool zoomControl,
    bool closePopupOnClick,
    double zoomSnap,
    double zoomDelta,
    bool trackResize,
    bool boxZoom,
    bool doubleClickZoom,
    bool dragging,
    CRS crs,
    LatLng center,
    double zoom,
    double minZoom,
    double maxZoom,
    List layers,
    LatLngBounds maxBounds,
    Renderer renderer,
    bool zoomAnimation,
    double zoomAnimationThreshold,
    bool fadeAnimation,
    bool markerZoomAnimation,
    double transform3DLimit,
    bool inertia,
    double inertiaDeceleration,
    double inertiaMaxSpeed,
    double easeLinearity,
    bool worldCopyJump,
    double maxBoundsViscosity,
    bool keyboard,
    bool keyboardPanDelta,
    bool scrollWheelZoom,
    double wheelDebounceTime,
    double wheelPxPerZoomLevel,
    bool tap,
    double tapTolerance,
    bool touchZoom,
    bool bounceAtZoomLimits,
  });

  /// Whether Paths should be rendered on a Canvas renderer. By default, all Paths are rendered in a SVG renderer.
  external bool get preferCanvas;
  external set preferCanvas(bool value);

  /// Control options
  /// /// /// /// /// /// /// /// /// /// /

  /// Whether a attribution control is added to the map by default.
  external bool get attributionControl;
  external set attributionControl(bool value);

  /// Whether a zoom control is added to the map by default.
  external bool get zoomControl;
  external set zoomControl(bool value);

  /// Interaction Options

  /// Set it to false if you don't want popups to close when user clicks the map.
  external bool get closePopupOnClick;
  external set closePopupOnClick(bool value);

  /// Forces the map's zoom level to always be a multiple of this, particularly right after a fitBounds() or a
  /// pinch-zoom. By default, the zoom level snaps to the nearest integer; lower values (e.g. 0.5 or 0.1)
  /// allow for greater granularity. A value of 0 means the zoom level will not be snapped after fitBounds or
  /// a pinch-zoom.
  external double get zoomSnap;
  external set zoomSnap(double value);

  /// Controls how much the map's zoom level will change after a zoomIn(), zoomOut(), pressing + or - on the
  /// keyboard, or using the zoom controls. Values smaller than 1 (e.g. 0.5) allow for greater granularity.
  external double get zoomDelta;
  external set zoomDelta(double value);

  /// Whether the map automatically handles browser window resize to update itself.
  external bool get trackResize;
  external set trackResize(bool value);

  /// Whether the map can be zoomed to a rectangular area specified by dragging the mouse while pressing the shift key
  external bool get boxZoom;
  external set boxZoom(bool value);

  /// Whether the map can be zoomed in by double clicking on it and zoomed out by double clicking while
  /// holding shift. If passed 'center', double-click zoom will zoom to the center of the view regardless of
  /// where the mouse was.
  external bool get doubleClickZoom;
  external set doubleClickZoom(bool value);

  /// Whether the map be draggable with mouse/touch or not
  external bool get dragging;
  external set dragging(bool value);

  /// The Coordinate Reference System to use. Don't change this if you're not sure what it means.
  external CRS get crs;
  external set crs(CRS value);

  /// Initial geographic center of the map
  external LatLng get center;
  external set center(LatLng value);

  /// Initial map zoom level
  external double get zoom;
  external set zoom(double value);

  /// Minimum zoom level of the map. If not specified and at least one GridLayer or TileLayer is in the map, the
  /// lowest of their minZoom options will be used instead.
  external double get minZoom;
  external set minZoom(double value);

  /// Maximum zoom level of the map. If not specified and at least one GridLayer or TileLayer is in the map, the
  /// highest of their maxZoom options will be used instead.
  external double get maxZoom;
  external set maxZoom(double value);

  /// Array of layers that will be added to the map initially
  external List<Layer> get layers;
  external set layers(List value);

  /// When this option is set, the map restricts the view to the given geographical bounds, bouncing the user
  /// back if the user tries to pan outside the view. To set the restriction dynamically, use setMaxBounds
  /// method.
  external LatLngBounds get maxBounds;
  external set maxBounds(LatLngBounds value);

  /// The default method for drawing vector layers on the map. L.SVG or L.Canvas by default depending on browser
  /// support.
  external Renderer get renderer;
  external set renderer(Renderer value);

  /// Whether the map zoom animation is enabled. By default it's enabled in all browsers that support CSS3
  /// Transitions except Android.
  external bool get zoomAnimation;
  external set zoomAnimation(bool value);

  /// Won't animate zoom if the zoom difference exceeds this value.
  external double get zoomAnimationThreshold;
  external set zoomAnimationThreshold(double value);

  /// Whether the tile fade animation is enabled. By default it's enabled in all browsers that support CSS3
  /// Transitions except Android.
  external bool get fadeAnimation;
  external set fadeAnimatio(bool value);

  /// Whether markers animate their zoom with the zoom animation, if disabled they will disappear for the length
  /// of the animation. By default it's enabled in all browsers that support CSS3 Transitions except Android.
  external bool get markerZoomAnimation;
  external set markerZoomAnimation(bool value);

  //Defines the maximum size of a CSS translation transform. The default value should not be changed unless a
  //web browser positions layers in the wrong place after doing a large panBy.
  external double get transform3DLimit;
  external set transform3DLimit(double value);

  /// If enabled, panning of the map will have an inertia effect where the map builds momentum while dragging and
  /// continues moving in the same direction for some time. Feels especially nice on touch devices. Enabled by
  /// default unless running on old Android devices.
  external bool get inertia;
  external set inertia(bool value);

  /// The rate with which the inertial movement slows down, in pixels/second².
  external double get inertiaDeceleration;
  external set inertiaDeceleration(double value);

  /// Infinity Max speed of the inertial movement, in pixels/second.
  external double get inertiaMaxSpeed;
  external set inertiaMaxSpeed(double value);

  external double get easeLinearity;
  external set easeLinearity(double value);

  /// With this option enabled, the map tracks when you pan to another "copy" of the world and seamlessly jumps to
  /// the original one so that all overlays like markers and vector layers are still visible.
  external bool get worldCopyJump;
  external set worldCopyJump(bool value);

  /// If maxBounds is set, this option will control how solid the bounds are when dragging the map around. The
  /// default value of 0.0 allows the user to drag outside the bounds at normal speed, higher values will slow
  /// down map dragging outside bounds, and 1.0 makes the bounds fully solid, preventing the user from dragging
  /// outside the bounds.
  external double get maxBoundsViscosity;
  external set maxBoundsViscosity(double value);

  /// Makes the map focusable and allows users to navigate the map with keyboard arrows and +/- keys.
  external bool get keyboard;
  external set keyboard(bool value);

  /// Amount of pixels to pan when pressing an arrow key.
  external bool get keyboardPanDelta;
  external set keyboardPanDelta(bool value);

  /// Whether the map can be zoomed by using the mouse wheel. If passed 'center', it will zoom to the center
  /// of the view regardless of where the mouse was.
  external bool get scrollWheelZoom;
  external set scrollWheelZoom(bool value);

  /// Limits the rate at which a wheel can fire (in milliseconds). By default user can't zoom via wheel more
  /// often than once per 40 ms.
  external double get wheelDebounceTime;
  external set wheelDebounceTime(double value);

  /// How many scroll pixels (as reported by L.DomEvent.getWheelDelta) mean a change of one full zoom level.
  /// Smaller values will make wheel-zooming faster (and vice versa).
  external double get wheelPxPerZoomLevel;
  external set wheelPxPerZoomLevel(double value);

  /// Enables mobile hacks for supporting instant taps (fixing 200ms click delay on iOS/Android) and touch
  /// holds (fired as contextmenu events).
  external bool get tap;
  external set tap(bool value);

  /// The max number of pixels a user can shift his finger during touch for it to be considered a valid tap.
  external double get tapTolerance;
  external set tapTolerance(double value);

  /// Whether the map can be zoomed by touch-dragging with two fingers. If passed 'center', it will zoom to
  /// the center of the view regardless of where the touch events (fingers) were. Enabled for touch-capable
  /// web browsers except for old Androids.
  external bool get touchZoom;
  external set touchZoom(bool value);

  /// Set it to false if you don't want the map to zoom beyond min/max zoom and then bounce back when
  /// pinch-zooming.
  external bool get bounceAtZoomLimits;
  external set bounceAtZoomLimits(bool value);
}
