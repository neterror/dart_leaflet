@JS()
library leaflet.control;

import 'dart:html';
import 'package:js/js.dart';
import 'leaflet_map.dart';

@JS("L.control")
class Control {
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
  external factory ControlOptions({
      String position
  });

  /// The position of the control (one of the map corners). Possible values are 'topleft', 'topright', 'bottomleft' or   'bottomright'
  external String get position;
  external set position(String value);
}
