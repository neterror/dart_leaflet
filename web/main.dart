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

  var g = Geometry(type: Type.point, coordinates: [27.93570, 43.21247]);
  var f = Feature(type: Type.feature, geometry: g, properties: {
    'show_on_map': false,
    "name": "MyTest",
    "amenity": "The Amenity",
    "popupContent": "baaa"
  });
  var op = GeoJsonOptions(onEachFeature: (Feature feature, Layer layer) {
    if (feature.properties != null &&
        feature.properties.containsKey("popupContent")) {
      var popup = Popup()..setContent(feature.properties["popupContent"]);
      layer.bindPopup(popup);
    }
  });

  GeoJson(f, op).addTo(map);

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
