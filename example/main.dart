import 'dart:html';

import 'open_street_map.dart';

void main() {
  var map = OpenStreetMap('output');
  map.setView(lat: 43.21047, lng: 27.93470, zoom: 15);

  querySelectorAll('input[name=drawOption]').onClick.listen((MouseEvent e) {
    var btn = e.target as RadioButtonInputElement;
    map.draw(btn.id, btn.checked);
  });

  querySelector('#btnGetGeoJson').onClick.listen((_) {
    var json = map.geoJson;
    print(json);
  });
}
