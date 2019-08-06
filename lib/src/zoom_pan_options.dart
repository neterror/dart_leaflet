@JS()
library leaflet.zoom_pan_options;

import 'package:js/js.dart';

@JS()
@anonymous
mixin ZoomOptions {
  /// If not specified, zoom animation will happen if the zoom origin is inside the current view.
  /// If true, the map will attempt animating zoom disregarding where zoom origin is.
  /// Setting false will make it always reset the view completely without animation.
  external bool get animate;
  external set animate(bool value);
}


@JS()
@anonymous
mixin PanOptions {
  /// If true, panning will always be animated if possible.
  /// If false, it will not animate panning, either resetting the map view
  /// if panning more than a screen away, or just setting a new offset for
  /// the map pane (except for panBy which always does the latter).
  external bool get animate;
  external set animate(bool value);

  /// Duration of animated panning, in seconds.
  external double get duration;
  external set duration(double value);

  /// The curvature factor of panning animation easing (third parameter of the Cubic Bezier curve).
  /// 1.0 means linear animation, and the smaller this number, the more bowed the curve.
  external double get easeLinearity;
  external set easeLinearity(double value);

  /// If true, panning won't fire movestart event on start (used internally for panning inertia).
  external bool get noMoveStart;
  external set noMoveStart(bool value);
}


@JS()
@anonymous
class ZoomPanOptions with ZoomOptions, PanOptions {
}
