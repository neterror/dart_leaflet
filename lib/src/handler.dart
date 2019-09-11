@JS()
library leaflet.handler;

import 'package:js/js.dart';

@JS("Handler")
class Handler {
  external Handler enable();
  external Handler disable();
  external bool enabled();
}