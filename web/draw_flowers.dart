import 'package:dartleaf/src/leaflet_map.dart';
import 'package:dartleaf/dartleaf.dart';
import 'draw.dart';

class DrawFlowers implements Draw {
  final LeafletMap _map;

  DrawFlowers(this._map);

  @override
  set active(bool draw) {
    if (draw) {
      _map.on(E.click, _putLeaf);
    } else {
      _map.off(E.click);
    }
  }

  void _putLeaf(MouseEvent e) {
    var options = IconOptions(
        shadowUrl: 'imgs/leaf-shadow.png',
        iconUrl: 'imgs/leaf-green.png',
        iconSize: Point(38, 95), // size of the icon
        shadowSize: Point(50, 64), // size of the shadow
        // point of the icon which will correspond to marker's location
        iconAnchor: Point(22, 94),
        shadowAnchor: Point(4, 62), // the same for the shadow
// point from which the popup should open relative to the iconAnchor
        popupAnchor: Point(-3, -76));

    var pop = Popup()..setContent('<p>Hello</p>');
    Marker(e.latlng, MarkerOptions(icon: Icon(options)))
      ..bindPopup(pop)
      ..bindTooltip("Click to learn more")
      ..addTo(_map);
  }
}
