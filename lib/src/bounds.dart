@JS()
library leaflet.bounds;

import 'package:js/js.dart';
import 'point.dart';

@JS()
@anonymous
class Bounds {}

@JS()
@anonymous
class FitBoundOptions {
  external factory FitBoundOptions({
      Point paddingTopLeft,
      Point paddingBottomRight,
      Point padding,
      double maxZoom
  });
  /// Sets the amount of padding in the top left corner of a map container that shouldn't be accounted for
  /// when setting the view to fit bounds. Useful if you have some control overlays on the map like a sidebar
  /// and you don't want them to obscure objects you're zooming to.
  external Point get paddingTopLeft;
  external set paddingTopLeft(Point value);

  /// The same for the bottom right corner of the map.
  external Point get paddingBottomRight;
  external set paddingBottomRight(Point value);

  /// Equivalent of setting both top left and bottom right padding to the same value.
  external Point get padding;
  external set padding(Point value);

  /// The maximum possible zoom to use
  external double get maxZoom;
  external set maxZoom(double value);
}

@JS()
@anonymous
class FitBounds {
  /// Sets the amount of padding in the top left corner of a map container that shouldn't be accounted for
  /// when setting the view to fit bounds. Useful if you have some control overlays on the map like a sidebar
  /// and you don't want them to obscure objects you're zooming to.
  external Point get paddingTopLeft;
  external set paddingTopLeft(Point value);

  /// The same for the bottom right corner of the map.
  external Point get paddingBottomRight;
  external set paddingBottomRight(Point value);

  /// Equivalent of setting both top left and bottom right padding to the same value.
  external Point get padding;
  external set padding(Point value);

  /// The maximum possible zoom to use.
  external double get maxZoom;
  external set maxZoom(double value);
}
