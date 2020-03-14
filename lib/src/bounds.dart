@JS()
library leaflet.bounds;

import 'package:js/js.dart';
import 'point.dart';

@JS('L.bounds')
class Bounds {
  /// Creates a Bounds object from two corners coordinate pairs.
  external Bounds(Point corner1, Point corner2);

  /// Extends the bounds to contain the given point.
  external Bounds extend(Point point);

  /// Returns the center point of the bounds.
  external Point getCenter([bool round]);

  /// Returns the bottom-left point of the bounds.
  external Point getBottomLeft();

  /// Returns the top-right point of the bounds.
  external Point getTopRight();

  /// Returns the top-left point of the bounds (i.e. this.min).
  external Point getTopLeft();

  /// Returns the bottom-right point of the bounds (i.e. this.max).
  external Point getBottomRight();

  ///Returns the size of the given bounds
  external Point getSize();

  ///Returns true if the rectangle contains the given one
  external bool contains(Bounds otherBounds);

  ///Returns true if the rectangle intersects the given bounds. Two bounds intersect if they have at least one point in common.
  external bool intersects(Bounds otherBounds);

  ///Returns true if the rectangle overlaps the given bounds. Two bounds overlap if their intersection is an area.
  external bool overlaps(Bounds otherBounds);

  /// The top left corner of the rectangle.
  external Point get min;
  external set min(Point value);

  /// The bottom right corner of the rectangle.
  external Point get max;
  external set max(Point value);
}

@JS()
@anonymous
class FitBoundOptions {
  external factory FitBoundOptions({
    Point paddingTopLeft,
    Point paddingBottomRight,
    Point padding,
    double maxZoom,
  });

  /// Sets the amount of padding in the top left corner of a map container that shouldn't be accounted for
  /// when setting the view to fit bounds. Useful if you have some control overlays on the map like a sidebar
  /// and you don't want them to obscure objects you're zooming to.
  external Point get paddingTopLeft;
  external set paddingTopLeft(Point value);

  /// The same for the bottom right corner of the map.
  external Point get paddingBottomRight;
  external set paddingBottomRight(Point value);

  /// Equivalent of setting both top left and bottom right padding to the same value.
  external Point get padding;
  external set padding(Point value);

  /// The maximum possible zoom to use.
  external double get maxZoom;
  external set maxZoom(double value);
}
