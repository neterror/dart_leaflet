@JS()
library leaflet.locate_options;

import 'package:js/js.dart';

@JS()
@anonymous
class LocateOptions {
  external factory LocateOptions({
    bool watch,
    bool setView,
    double maxZoom,
    double timeout,
    double maximumAge,
    bool enableHighAccuracy,
  });

  /// If true, starts continuous watching of location changes (instead of detecting it once)
  /// using W3C watchPosition method. You can later stop watching using map.stopLocate() method.
  external bool get watch;
  external set watch(bool value);

  /// If true, automatically sets the map view to the user location with respect to detection accuracy,
  /// or to world view if geolocation failed.
  external bool get setView;
  external set setView(bool value);

  /// The maximum zoom for automatic view setting when using setView option
  external double get maxZoom;
  external set maxZoom(double value);

  /// Number of milliseconds to wait for a response from geolocation before firing a locationerror event.
  external double get timeout;
  external set timeout(double value);

  /// Maximum age of detected location. If less than this amount of milliseconds passed since last
  /// geolocation response, locate will return a cached location.
  external double get maximumAge;
  external set maximumAge(double value);

  /// Enables high accuracy, see description in the W3C spec.
  external bool get enableHighAccuracy;
  external set enableHighAccuracy(bool value);
}
