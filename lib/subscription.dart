import 'dart:async';

/// The function/method signature for the event handler
typedef void Responder<T>(T event);

/// The class manages the subscription to event bus
class Subscription {
  final Stream _stream;

  final List<StreamSubscription> subscriptions = List();


  Subscription(this._stream);


  Stream<T> _cast<T>() {
    if (T == dynamic) {
      return _stream;
    } else {
      return _stream.where((event) => event is T).cast<T>();
    }
  }

  Subscription respond<T>(Responder<T> responder) {
    subscriptions.add(_cast<T>().listen(responder));

    return this;
  }



  void dispose() {
    if (subscriptions.isEmpty) return;

    subscriptions.forEach((s) => s.cancel());
    subscriptions.clear();
  }
}

