import 'package:dartleaf/dartleaf.dart';
import 'draw.dart';
import 'draw_circles.dart';
import 'draw_flowers.dart';

class OpenStreetMap {
  final LeafletMap _map;
  Draw _painter;

  OpenStreetMap(String element) : _map = LeafletMap(element) {
    var options = TileLayerOptions()
      ..attribution =
          'Map data &copy, <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>'
      ..maxZoom = 20;

    TileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', options)
        .addTo(_map);
  }

  set drawCircle(bool active) {
    _painter?.active = false;
     _painter = DrawCircles(_map);
    _painter.active = active;
  }

  set putLeaves(bool draw) {
    _painter?.active = false;
     _painter = DrawFlowers(_map);
    _painter.active = draw;
  }

  void setView({double lat, double lng, double zoom = 10}) =>
      _map.setView(LatLng(lat, lng), zoom);


}
