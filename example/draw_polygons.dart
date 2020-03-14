import 'dart:convert';
import 'dart:html';
import 'package:dartleaf/dartleaf.dart';
import 'draw.dart';

/// Left click adds a point, right click removes point
class DrawPolygons implements Draw {
  final LeafletMap _map;
  CircleMarker _firstMark;

  final _featureCollection = <String, dynamic>{
    'type': 'FeatureCollection',
    'features': <Map>[]
  };

  Polyline _polyline = Polyline([]);
  Polyline _dashLine = Polyline([]);
  // when JS method returns an object, defined in the dart sources, its type is not the Dart type
  // but is NativeJavaScriptObject instead. For example  CircleMaker::getLatLng() returns LatLng, but
  // in our code it is NativeJavaScriptObject and if you pass the value to some other method that
  // expects LatLng, it will get error

  //List of CircleMarkers. Work as dynamic list instead of CircleMarker due to the JS interop problem above
  final _points = [];
  bool _ready = false;

  DrawPolygons(this._map);

  final _normalNode = CircleOptions()
    ..radius = 5
    ..fillColor = '#ff7800'
    ..color = '#000'
    ..weight = 1
    ..opacity = 1
    ..fillOpacity = 0.8;

  final _accentNode = CircleOptions()
    ..radius = 10
    ..fillColor = '#aa7880'
    ..color = '#000'
    ..weight = 2
    ..opacity = 1
    ..fillOpacity = 0.9;

  @override
  String get geoJson => jsonEncode(_featureCollection);

  @override
  set active(bool draw) {
    if (draw) {
      _map.dragging.disable();
      _map.on(E.mousedown, _buttonDown);
      _map.on(E.mousemove, _mouseMove);

      _polyline.addTo(_map);
      _dashLine.addTo(_map);
      _dashLine.setStyle(PolylineOptions()..dashArray = '4');
    } else {
      _map.dragging.enable();
      _map.off(E.mousedown);
      _map.off(E.mousemove);

      _polyline.remove();
      _dashLine.remove();
    }
  }

  _buttonDown(LeafletMouseEvent e) {
    MouseEvent mouse = e.originalEvent;
    if (mouse.button == 0) {
      //left mouse button
      _addPoint(e);
    } else {
      if (_points.isNotEmpty) _delPoint(e);
    }
  }

  _addPoint(LeafletMouseEvent e) {
    if (_ready) {
      _finish();
    } else {
      var node = CircleMarker(e.latlng, _normalNode);
      if (_firstMark == null) _firstMark = node;
      _points.add(node);
      _polyline.addLatLng(e.latlng);
      node.addTo(_map);
    }
  }

  _delPoint(LeafletMouseEvent e) {
    var last = _points.removeLast();
    last.remove(); //remove the marker from the layer

    if (_points.isEmpty) {
      _hideDashLine();
      _polyline.setLatLngs([]);
    } else {
      //build a list with the remaining points
      var remaining = _points.map((c) => c.getLatLng()).toList();
      _polyline.setLatLngs(remaining);
      _drawDashLine(e);
    }
  }

  _hideDashLine() {
    _dashLine.setLatLngs([]);
    _dashLine.redraw();
  }

  _drawDashLine(LeafletMouseEvent e) {
    var last = _points.last.getLatLng();
    var line = [last, e.latlng];
    _dashLine.setLatLngs(line);
    _dashLine.redraw();
  }

  _mouseMove(LeafletMouseEvent e) {
    if (_points.isEmpty) return;
    _drawDashLine(e);
    double distance = _firstMark.getLatLng().distanceTo(e.latlng);
    _ready = (distance < 20);
    if (_ready) {
      _firstMark.setStyle(_accentNode);
    } else {
      _firstMark.setStyle(_normalNode);
    }
  }

  _finish() {
    _polyline.addLatLng(_firstMark.getLatLng());
    _firstMark.setStyle(_normalNode);
    _hideDashLine();

    _addFeature();

    _points.clear();
    _polyline = Polyline([]);
    _polyline.addTo(_map);

    _firstMark = null;
    _ready = false;
  }

  void _addFeature() {
    var geojson = _polyline.toGeoJSON();
    var json = {
      'type': 'feature',
      'geometry': {
        'type': geojson.geometry.type,
        'coordinates': geojson.geometry.coordinates
      }
    };
    _featureCollection['features'].add(json);
  }
}
