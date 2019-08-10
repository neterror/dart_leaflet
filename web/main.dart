import 'dart:html';
import 'package:dartleaf/dartleaf.dart';

void main() {
  var output = querySelector('#output');

  var map = LeafletMap.fromElement(output);
  map.setView(LatLng(43.21047, 27.93470), 17);
  var options = TileLayerOptions()
    ..attribution =
        'Map data &copy, <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>'
    ..maxZoom = 20;

  TileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', options)
      .addTo(map);

  var pop1 = Popup()..setContent('<p>and HE was here</p>');

  var icon = Icon(IconOptions(
      iconUrl: 'imgs/icons/marker.png',
      iconSize: Point(25, 41),
      iconAnchor: Point(13, 41),
      popupAnchor: Point(0, 0)));

  Marker(LatLng(43.21047, 27.93470))
    ..bindPopup(pop1)
    ..bindTooltip("Click to learn more")
    ..setIcon(icon)
    ..addTo(map)
    ..on('click', (_) => print("you did it!!"));

  var circleOp = CircleOptions()
  ..radius = 8
  ..fillColor = "#ff7800"
  ..color = "#000"
  ..weight = 1
  ..opacity = 1
  ..fillOpacity = 0.8;


  var g = Geometry(type: Type.point, coordinates: [27.93570, 43.21247]);
  var f = feature(geometry: g, properties: {
    'show_on_map': false,
    "name": "MyTest",
    "amenity": "The Amenity",
    "popupContent": "baaa"
  });
  var op = GeoJsonOptions(
    pointToLayer: (var feature, LatLng latlng) => CircleMarker(latlng, circleOp),
    onEachFeature: (var feature, Layer layer) {
    if (feature.properties != null &&
        feature.properties.containsKey("popupContent")) {
      var popup = Popup()..setContent(feature.properties["popupContent"]);
      layer.bindPopup(popup);
    }
  });

  GeoJson(f, op).addTo(map);

  var f2 = feature(
      geometry: Geometry(type: Type.polygon, coordinates: [
        [
          [
            27.93570,
            43.21247,
          ],
          [
            27.94570,
            43.21447,
          ],
          [
            27.92570,
            43.20447,
          ],
          [
            27.93570,
            43.21247,
          ],
        ]
      ]));
//  GeoJson(f2).addTo(map);

  var lightRailStop = featureCollection(features: [
    feature(
        properties: {"popupContent": "18th & California Light Rail Stop"},
        geometry: Geometry(type: Type.point, coordinates: [27.94570, 43.21447])),
    feature(
        properties: {"popupContent": "20th & Welton Light Rail Stop"},
        geometry: Geometry(type: Type.point, coordinates: [27.94970, 43.11447]))
  ]);



  GeoJson.fromCollection(lightRailStop).addTo(map);


  Popup()
    ..setLatLng(LatLng(43.21047, 27.93470))
    ..setContent('<p>The lion was here</p>')
    ..openOn(map);

  var co = CircleOptions()
    ..color = 'red'
    ..fillColor = '#f03'
    ..fillOpacity = 0.5
    ..radius = 25;

  Circle(LatLng(43.21047, 27.93470), co).addTo(map);
}
