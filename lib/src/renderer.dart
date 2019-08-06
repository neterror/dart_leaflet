@JS()
library leaflet.renderer;

import 'package:js/js.dart';
import 'layer.dart';

@JS("Renderer")
class Renderer extends Layer {
  /// How much to extend the clip area around the map view (relative to its size)
  /// e.g. 0.1 would be 10% of map view in each direction
  external double get padding;
  external set padding(double value);

   /// How much to extend click tolerance round a path/object on the map
  external double get tolerance;
  external set tolerance(double value);
}
