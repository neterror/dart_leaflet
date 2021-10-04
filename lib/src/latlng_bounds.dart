@JS()
library leaflet.latlng_bounds;

import 'package:js/js.dart';
import 'latlng.dart';
import 'bounds.dart';

@JS('L.latLngBounds')

/// Represents a rectangular geographical area on a map.
class LatLngBounds {
  /// Creates a LatLngBounds object by defining two diagonally opposite corners of the rectangle.
  external LatLngBounds(LatLng corner1, LatLng corner2);

  /// Creates a LatLngBounds object defined by the geographical points it contains. Very useful for zooming
  /// the map to fit a particular set of locations with fitBounds.
  external LatLngBounds.fromArray(List latlngs);

  /// Extend the bounds to contain the given point or bounds.
  external LatLngBounds extend(dynamic latlngOrBounds);

  /// Returns bounds created by extending or retracting the current bounds by a given ratio in each direction.
  /// For example, a ratio of 0.5 extends the bounds by 50% in each direction.
  /// Negative values will retract the bounds.
  external LatLngBounds pad(double bufferRatio);

  /// Returns the center point of the bounds.
  external LatLng getCenter();

  /// Returns the south-west point of the bounds.
  external LatLng getSouthWest();

  /// Returns the north-east point of the bounds.
  external LatLng getNorthEast();

  /// Returns the north-west point of the bounds.
  external LatLng getNorthWest();

  /// Returns the south-east point of the bounds.
  external LatLng getSouthEast();

  /// Returns the west longitude of the bounds
  external double getWest();

  /// Returns the south latitude of the bounds
  external double getSouth();

  /// Returns the east longitude of the bounds
  external double getEast();

  /// Returns the east longitude of the bounds
  external double getNorth();

  /// Returns true if the rectangle contains the given point or another bounds.
  external bool contains(dynamic /* LatLng|LatLngBounds */ latlngOrBounds);

  /// Returns true if the rectangle intersects the given bounds. Two bounds intersect if they have at least one point in common.
  external bool intersects(LatLngBounds otherBounds);

  /// Returns true if the rectangle overlaps the given bounds. Two bounds overlap if their intersection is an area.
  external bool overlaps(Bounds otherBounds);

  /// Returns a string with bounding box coordinates in a 'southwest_lng,southwest_lat,northeast_lng,northeast_lat' format.
  /// Useful for sending requests to web services that return geo data.
  external String toBBoxString();

  /// Returns true if the rectangle is equivalent (within a small margin of error) to the given bounds. The margin of
  /// error can be overridden by setting max Margin to a small number.
  external bool equals(LatLngBounds otherBounds, [double? maxMargin]);

  /// Returns true if the bounds are properly initialized.
  external bool isValid();
}
