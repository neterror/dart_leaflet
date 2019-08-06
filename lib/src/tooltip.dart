@JS()
library leaflet.tooltip;

import 'package:js/js.dart';
import 'layer.dart';
import 'point.dart';

@JS("L.tooltip")
class Tooltip {
  /// Instantiates a Tooltip object given an optional options object that describes its appearance and location
  /// and an optional source object that is used to tag the tooltip with a reference to the Layer to which it refers.
  external factory Tooltip([TooltipOptions options, Layer source]);
}

@JS()
@anonymous
class TooltipOptions extends DivOverlay {
  /// Map pane where the tooltip will be added.
  external String get pane;
  external set pane(String value);

  /// Optional offset of the tooltip position.
  external Point get offset;
  external set offset(Point value);

  /// Direction where to open the tooltip. Possible values are: right, left, top, bottom, center, auto.
  /// auto will dynamically switch between right and left according to the tooltip position on the map.
  external String get direction;
  external set direction(String value);

  /// Whether to open the tooltip permanently or only on mouseover.
  external bool get permanent;
  external set permanent(bool value);

  /// If true, the tooltip will follow the mouse instead of being fixed at the feature center.
  external bool get sticky;
  external set sticky(bool value);

  /// If true, the tooltip will listen to the feature events.
  external bool get interactive;
  external set interactive(bool value);

  /// Tooltip container opacity.
  external double get opacity;
  external set opacity(double value);
}
