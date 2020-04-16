@JS()
library leaflet.dom;

import 'dart:html';
import 'package:js/js.dart';
import 'point.dart';

@JS('L.DomEvent')
class DomEvent {
  /// Adds a listener function ([fn]) to a particular DOM event type of the element [el].
  /// You can optionally specify the context of the listener (object the `this` keyword will point to).
  /// You can also pass several space-separated types (e.g. 'click dblclick').
  external static void on(
    Element el,
    String types,
    Function fn, [
    dynamic context,
  ]);

  /// Removes a previously added listener function.
  /// Note that if you passed a custom context to [on], you must pass the same
  /// context to [off] in order to remove the listener.
  external static void off(
    Element el,
    String types,
    Function fn, [
    dynamic context,
  ]);

  /// Stop the given event from propagation to parent elements.
  ///
  /// Used inside the listener functions:
  /// ```dart
  /// DomEvent.on(div, 'click', allowInterop((e) {
  ///     DomEvent.stopPropagation(e);
  /// }));
  /// ```
  external static void stopPropagation(Event e);

  /// Adds [stopPropagation] to the element's 'mousewheel' events (plus browser variants).
  external static void disableScrollPropagation(Element el);

  /// Adds [stopPropagation] to the element's 'click', 'doubleclick',
  /// 'mousedown' and 'touchstart' events (plus browser variants).
  external static void disableClickPropagation(Element el);

  /// Prevents the default action of the DOM Event [e] from happening
  /// (such as following a link in the href of the a element, or doing a POST
  /// request with page reload when a `<form>` is submitted).
  /// Use it inside listener functions.
  external static void preventDefault(Event e);

  /// Does [stopPropagation] and [preventDefault] at the same time.
  external static void stop(Event e);

  /// Gets normalized mouse position from a DOM event relative to the container
  /// (border excluded) or to the whole page if not specified.
  external static Point getMousePosition(Event e, [Element container]);

  /// Gets normalized wheel delta from a mousewheel DOM event, in vertical pixels
  /// scrolled (negative if scrolling down). Events from pointing devices without
  /// precise scrolling are mapped to a best guess of 60 pixels.
  external static num getWheelDelta(Event e);
}

@JS('L.DomUtil')
class DomUtil {
  /// String  Vendor-prefixed transform style name (e.g. 'webkitTransform' for WebKit).
  external static String get TRANSFORM;

  /// Vendor-prefixed transition style name.
  external static String get TRANSITION;

  // Vendor-prefixed transitionend event name.
  external static String get TRANSITION_END;

  /// Returns an element given its DOM id, or returns the element itself if it was passed directly.
  external static Element get(dynamic /* String|Element */ id);

  /// Returns the value for a certain style attribute on an element,
  /// including computed values or values set through CSS.
  external static String getStyle(Element el, String styleAttrib);

  /// Creates an HTML element with [tagName], sets its class to [className],
  /// and optionally appends it to [container] element.
  external static Element create(
    String tagName, [
    String className,
    Element container,
  ]);

  /// Removes [el] from its parent element.
  external static void remove(Element el);

  /// Removes all of [el]'s children elements from [el].
  external static void empty(Element el);

  /// Makes [el] the last child of its parent, so it renders in front of the other children.
  external static void toFront(Element el);

  /// Makes [el] the first child of its parent, so it renders behind the other children.
  external static void toBack(Element el);

  /// Returns `true` if the [el]'s class attribute contains [name].
  external static bool hasClass(Element el, String name);

  /// Adds [name] to the [el]'s class attribute.
  external static void addClass(Element el, String name);

  /// Removes [name] from the [el]'s class attribute.
  external static void removeClass(Element el, String name);

  /// Sets the [el]'s class.
  external static void setClass(Element el, String name);

  /// Returns the [el]'s class.
  external static String getClass(Element el);

  /// Set the [opacity] of an element (including old IE support).
  /// [opacity] must be a number from 0 to 1.
  external static void setOpacity(Element el, num opacity);

  /// Goes through the array of style names and returns the first name that is a
  /// valid style name for an element. If no such name is found, it returns `false`.
  /// Useful for vendor-prefixed styles like transform.
  external static dynamic /* String|false */ testProp(List props);

  /// Resets the 3D CSS transform of [el] so it is translated by [offset] pixels and optionally scaled by [scale].
  /// Does not have an effect if the browser doesn't support 3D CSS transforms.
  external static void setTransform(Element el, Point offset, [num scale]);

  /// Sets the position of [el] to coordinates specified by [position],
  /// using CSS translate or top/left positioning depending on the browser
  /// (used by Leaflet internally to position its layers).
  external static void setPosition(Element el, Point position);

  /// Returns the coordinates of an element previously positioned with [setPosition].
  external static Point getPosition(Element el);

  /// Prevents the user from generating selectstart DOM events,
  /// usually generated when the user drags the mouse through a page with text.
  /// Used internally by Leaflet to override the behaviour of any click-and-drag
  /// interaction on the map. Affects drag interactions on the whole document.
  external static void disableTextSelection();

  /// Cancels the effects of a previous [disableTextSelection].
  external static void enableTextSelection();

  /// As [disableTextSelection], but for dragstart DOM events,
  /// usually generated when the user drags an image.
  external static void disableImageDrag();

  /// Cancels the effects of a previous [disableImageDrag].
  external static void enableImageDrag();

  /// Makes the outline of the element [el] invisible.
  /// Used internally by Leaflet to prevent focusable elements from displaying
  ///an outline when the user performs a drag interaction on them.
  external static void preventOutline(Element el);

  /// Cancels the effects of a previous [preventOutline].
  external static void restoreOutline();

  /// Finds the closest parent node which size (width and height) is not null.
  external static Element getSizedParentNode(Element el);

  /// Computes the CSS scale currently applied on the element.
  /// Returns an object with [x] and [y] members as horizontal and vertical scales respectively,
  /// and [boundingClientRect] as the result of `getBoundingClientRect()`.
  external static ComputedScale getScale(Element el);
}

@JS()
@anonymous
class ComputedScale {
  /// Horizontal scale.
  external num get x;
  external set x(num v);

  /// Vertical scale.
  external num get y;
  external set y(num v);

  /// The result of `getBoundingClientRect()` (may differ on different browsers).
  external dynamic get boundingClientRect;
  external set boundingClientRect(dynamic v);
}
