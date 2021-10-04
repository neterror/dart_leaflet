@JS()
library leaflet.popup;

import 'dart:html';
import 'package:js/js.dart';
import 'layer.dart';
import 'point.dart';
import 'latlng.dart';
import 'leaflet_map.dart';
import 'evented.dart';

@JS('L.popup')
class Popup extends DivOverlay {
  external Popup([PopupOptions? options, Layer? source]);

  /// Returns the geographical point of popup.
  external LatLng getLatLng();

  /// Sets the geographical point where the popup will open.
  external Popup setLatLng(LatLng latlng);

  /// Returns the content of the popup.
  external String getContent();

  /// Sets the HTML content of the popup. If a function is passed the source layer will be passed to the function. The function should
  // return a String or HTMLElement to be used in the popup.
  external String setContent(String content);

  /// Alias for getContent()
  external Element getElement();

  /// Updates the popup content, layout and position. Useful for updating
  /// the popup after something inside changed, e.g. image loaded.
  external void update();

  /// Returns true when the popup is visible on the map.
  external bool isOpen();

  /// Brings this popup in front of other popups (in the same map pane).
  external Popup bringToFront();

  /// Brings this popup to the back of other popups (in the same map pane).
  external Popup bringToBack();

  // Adds the popup to the map and closes the previous one. The same as map.openPopup(popup)
  external Popup openOn(LeafletMap map);
}

@JS()
@anonymous
class PopupOptions extends DivOverlayOptions {
  external factory PopupOptions({
    Point? offset,
    String? pane,
    String? attribution,
    double? maxWidth,
    double? minWidth,
    double? maxHeight,
    double? autoPan,
    Point? autoPanPaddingTopLeft,
    Point? autoPanPaddingBottomRight,
    Point? autoPanPadding,
    bool? closeButton,
    bool? autoClose,
    bool? closeOnEscapeKey,
    bool? closeOnClick,
    String? className,
  });

  /// Max width of the popup, in pixels.
  external double get maxWidth;
  external set maxWidth(double value);

  /// Min width of the popup, in pixels.
  external double get minWidth;
  external set minWidth(double value);

  /// If set, creates a scrollable container of the given height inside a popup if its content exceeds it
  external double get maxHeight;
  external set maxHeight(double value);

  /// Set it to false if you don't want the map to do panning animation to fit the opened popup.
  external bool get autoPan;
  external set autoPan(bool value);

  /// The margin between the popup and the top left corner of the map view after autopanning was performed
  external Point get autoPanPaddingTopLeft;
  external set autoPanPaddingTopLeft(Point value);

  /// The margin between the popup and the bottom right corner of the map view after autopanning was perormed
  external Point get autoPanPaddingBottomRight;
  external set autoPanPaddingBottomRight(Point value);

  /// Equivalent of setting both top left and bottom right autopan padding to the same value.
  /// Set it to true if you want to prevent users from panning the popup off of the screen while it is open
  external Point get autoPanPadding;
  external set autoPanPadding(Point value);

  /// Controls the presence of a close button in the popup.
  external bool get closeButton;
  external set closeButton(bool value);

  ///  Set it to false if you want to override the default behavior of the popup closing when another popup is opened.
  external bool get autoClose;
  external set autoClose(bool value);

  /// Set it to false if you want to override the default behavior of the ESC key for closing of the popup.
  external bool get closeOnEscapeKey;
  external set closeOnEscapeKey(bool value);

  /// Set it if you want to override the default behavior of the popup closing when user clicks on the
  /// map. Defaults to the map's closePopupOnClick option.
  external bool get closeOnClick;
  external set closeOnClick(bool value);

  /// A custom CSS class name to assign to the popup.
  external String get className;
  external set className(String value);
}
