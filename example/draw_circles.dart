import 'package:dartleaf/dartleaf.dart' as m;
import 'package:dartleaf/src/tooltip.dart';
import 'draw.dart';

class DrawCircles implements Draw {
  final m.LeafletMap _map;
  m.LatLng _centerCoord;
  m.Point _centerPoint;
  m.CircleMarker _circleMarker;

  DrawCircles(this._map);

  @override
  String get geoJson => "Not implemented";

  @override
  set active(bool draw) {
    if (draw) {
      _map.dragging.disable();
      _map.on(
          m.E.mousedown,
          (e) =>
              _circleMarker != null ? _drawCircleEnd(e) : _drawCircleStart(e));
      _map.on(m.E.mousemove, _drawCircle);
    } else {
      _map.off(m.E.mousedown);
      _map.off(m.E.mousemove);
      _map.dragging.enable();
    }
  }

  void _drawCircleStart(m.LeafletMouseEvent e) {
    _centerCoord = e.latlng;
    _centerPoint = e.layerPoint;
    var options = m.CircleOptions()
      ..stroke = true
      ..color = 'red'
      ..fillColor = '#f03'
      ..fillOpacity = 0.5
      ..radius = 1;

    _circleMarker = m.CircleMarker(_centerCoord, options);

    _circleMarker.bindTooltip(
        "My Label",
        TooltipOptions()
          ..opacity = 0.8
          ..direction = 'center'
          ..permanent = true
          ..interactive = true
          ..className = "my-label");

    _circleMarker.addTo(_map);
  }

  void _drawCircleEnd(m.LeafletMouseEvent e) {
    print("draw circle end");
    _centerCoord = null;
    _centerPoint = null;
    _circleMarker = null;
  }

  void _drawCircle(m.LeafletMouseEvent e) {
    if (_centerPoint == null) return;
    print("drawing circle");
    var p = e.layerPoint;
    _circleMarker.setRadius(p.distanceTo(_centerPoint));
  }
}
