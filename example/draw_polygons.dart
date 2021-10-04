import 'dart:convert';
import 'dart:html';
import 'package:dartleaf/dartleaf.dart';
import 'package:js/js.dart';
import 'draw.dart';

/// Left click adds a point, right click removes point
class DrawPolygons implements Draw {
  final LeafletMap _map;
  CircleMarker? _firstMark;

  final _featureCollection = <String, dynamic>{
    'type': 'FeatureCollection',
    'features': <Map>[]
  };

  Polyline _polyline = Polyline([]);
  final Polyline _dashLine = Polyline([]);
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
  set active(bool? draw) {
    if (draw!) {
      _map.dragging.disable();
      _map.on(E.mousedown, allowInterop(_buttonDown));
      _map.on(E.mousemove, allowInterop(_mouseMove));

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

  void _buttonDown(LeafletMouseEvent e) {
    MouseEvent mouse = e.originalEvent as MouseEvent;
    if (mouse.button == 0) {
      //left mouse button
      _addPoint(e);
    } else {
      if (_points.isNotEmpty) _delPoint(e);
    }
  }

  void _addPoint(LeafletMouseEvent e) {
    if (_ready) {
      _finish();
    } else {
      var node = CircleMarker(e.latlng, _normalNode);
      _firstMark ??= node;
      _points.add(node);
      _polyline.addLatLng(e.latlng);
      node.addTo(_map);
    }
  }

  void _delPoint(LeafletMouseEvent e) {
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

  void _hideDashLine() {
    _dashLine.setLatLngs([]);
    _dashLine.redraw();
  }

  void _drawDashLine(LeafletMouseEvent e) {
    var last = _points.last.getLatLng();
    var line = [last, e.latlng];
    _dashLine.setLatLngs(line);
    _dashLine.redraw();
  }

  void _mouseMove(LeafletMouseEvent e) {
    if (_points.isEmpty) return;
    _drawDashLine(e);
    double distance = _firstMark!.getLatLng().distanceTo(e.latlng);
    _ready = (distance < 40);
    if (_ready) {
      _firstMark!.setStyle(_accentNode);
    } else {
      _firstMark!.setStyle(_normalNode);
    }
  }

  void _finish() {
    _polyline.addLatLng(_firstMark!.getLatLng());
    _firstMark!.setStyle(_normalNode);
    _hideDashLine();
    _points.clear();
    _polyline = Polyline([]);
    _polyline.addTo(_map);
    _firstMark = null;
    _ready = false;
  }

}
