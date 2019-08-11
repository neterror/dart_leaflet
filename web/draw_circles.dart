import 'dart:js';
import 'package:dartleaf/dartleaf.dart';
import 'draw.dart';

class DrawCircles implements Draw {
  final LeafletMap _map;
  LatLng _centerCoord;
  Point _centerPoint;
  CircleMarker _circleMarker;

  DrawCircles(this._map);

  @override
  set active(bool draw) {
    if (draw) {
      _map.on(
          E.mousedown,
          (e) =>
              _circleMarker != null ? _drawCircleEnd(e) : _drawCircleStart(e));
      _map.on(E.mousemove, _drawCircle);
    } else {
      _map.off(E.mousedown);
      _map.off(E.mousemove);
    }
  }

  void _drawCircleStart(LeafletMouseEvent e) {
    _centerCoord = e.latlng;
    _centerPoint = e.layerPoint;
    var options = CircleOptions()
      ..color = 'red'
      ..fillColor = '#f03'
      ..fillOpacity = 0.5
      ..radius = 1;

    _circleMarker = CircleMarker(_centerCoord, options);
    _circleMarker.addTo(_map);
  }

  void _drawCircleEnd(LeafletMouseEvent e) {
    print("draw circle end");
    var json = _circleMarker.toGeoJSON();
    _centerCoord = null;
    _centerPoint = null;
    _circleMarker = null;
  }

  void _drawCircle(LeafletMouseEvent e) {
    if (_centerPoint == null) return;
    print("drawing circle");
    var p = e.layerPoint;
    _circleMarker.setRadius(p.distanceTo(_centerPoint));
  }
}
