import 'dart:html';
import 'package:dartleaf/dartleaf.dart';
import 'draw.dart';
import 'draw_circles.dart';
import 'draw_flowers.dart';
import 'draw_polygons.dart';

class OpenStreetMap {
  final LeafletMap _map;
  final _painters = <String, Draw>{};

  OpenStreetMap(String elementId) : _map = LeafletMap(elementId) {
    var options = TileLayerOptions()
      ..attribution =
          'Map data &copy, <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>'
      ..maxZoom = 20;

    TileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', options)
        .addTo(_map);

    // disable the default right click - use it as cancel last poitn
    var map = querySelector("#$elementId");
    map.addEventListener('contextmenu', (Event e) {
      e.preventDefault();
      return false;
    });

    _painters["marker"] = DrawFlowers(_map);
    _painters["circle"] = DrawCircles(_map);
    _painters["polygon"] = DrawPolygons(_map);
  }

  void draw(String item, bool enabled) {
    _painters.forEach((_, painter) => painter.active = false);
    if (_painters.containsKey(item)) {
      _painters[item].active = enabled;
    }
  }

  String get geoJson => _painters["polygon"].geoJson;

  void setView({double lat, double lng, double zoom = 10}) =>
      _map.setView(LatLng(lat, lng), zoom);
}
