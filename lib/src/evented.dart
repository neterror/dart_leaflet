@JS()
library leaflet.evented;

import 'package:js/js.dart';

@JS()
@anonymous
mixin Evented {
  /// Adds a listener function (fn) to a particular event type of the
  /// object. You can optionally specify the context of the listener
  /// (object the this keyword will point to). You can also pass several
  /// space-separated types (e.g. 'click dblclick').
  external Evented on(String type, Function fn, [dynamic context]);

  ///  Removes a previously added listener function. If no function is
  /// specified, it will remove all the listeners of that particular event
  /// from the object. Note that if you passed a custom context to on, you
  /// must pass the same context to off in order to remove the listener.
  external Evented off(String type, [Function fn, dynamic context]);

  /// Fires an event of the specified type. You can optionally provide an
  /// data object — the first argument of the listener function will
  /// contain its properties. The event can optionally be propagated to
  /// event parents.
  external Evented fire(String type, [dynamic data, bool propagate]);

  /// Returns true if a particular event type has any listeners attached to it.
  external bool listens(String type);

  /// Behaves as on(…), except the listener will only get fired once and then removed.
  external Evented once(String type, Function fn, [dynamic context]);

  /// Adds an event parent - an Evented that will receive propagated events
  external Evented addEventParent(Evented obj);

  /// Removes an event parent, so it will stop receiving propagated events
  external Evented removeEventParent(Evented obj);
}
