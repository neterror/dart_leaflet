@JS()
library leaflet.icon;

import 'dart:html';
import 'package:js/js.dart';
import 'point.dart';

@JS("L.icon")
class Icon {
  external Icon(IconOptions options);

  /// Called internally when the icon has to be shown.
  /// returns a <img> HTML element styled according to the options
  external Element createIcon([Element oldIcon]);

  ///As createIcon, but for the shadow beneath it.
  external Element createShadow([Element oldIcon]);
}

@JS()
@anonymous
class IconOptions {
  external factory IconOptions(
      {String iconUrl,
      String iconRetinaUrl,
      Point iconSize,
      Point iconAnchor,
      Point popupAnchor,
      Point tooltipAnchor,
      String shadowUrl,
      String shadowRetinaUrl,
      Point shadowSize,
      Point shadowAnchor,
      String className});

  /// (required) The URL to the icon image (absolute or relative to your script path).
  external String get iconUrl;
  external set iconUrl(String value);

  /// The URL to a retina sized version of the icon image (absolute or  relative to your script path). Used for Retina screen devices.
  external String get iconRetinaUrl;
  external set iconRetinaUrl(String value);

  /// Size of the icon image in pixels.
  external Point get iconSize;
  external set iconSize(Point value);

  /// The coordinates of the "tip" of the icon (relative to its top left
  /// corner). The icon will be aligned so that this point is at the
  /// marker's geographical location. Centered by default if size is
  /// specified, also can be set in CSS with negative margins.
  external Point get iconAnchor;
  external set iconAnchor(Point value);

  /// The coordinates of the point from which popups will "open", relative to the icon anchor.
  external Point get popupAnchor;
  external set popupAnchor(Point value);

  /// The coordinates of the point from which tooltips will "open", relative to the icon anchor.
  external Point get tooltipAnchor;
  external set tooltipAnchor(Point value);

  //// The URL to the icon shadow image. If not specified, no shadow image will be created.
  external String get shadowUrl;
  external set shadowUrl(String value);

  external String get shadowRetinaUrl;
  external set shadowRetinaUrl(String value);

  /// Size of the shadow image in pixels.
  external Point get shadowSize;
  external set shadowSize(Point value);

  /// The coordinates of the "tip" of the shadow (relative to its top left  corner) (the same as iconAnchor if not specified).
  external Point get shadowAnchor;
  external set shadowAnchor(Point value);

  /// A custom class name to assign to both icon and shadow images. Empty by default.
  external String get className;
  external set className(String value);
}
