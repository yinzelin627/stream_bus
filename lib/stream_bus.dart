import 'dart:async';


class StreamBus {
  StreamController _streamController;

  /// 事件总线流的控制器。
  StreamController get streamController => _streamController;


  StreamBus({bool sync = false})
      : _streamController = StreamController.broadcast(sync: sync);


  StreamBus.customController(StreamController controller)
      : _streamController = controller;

  ///
  Stream<T> on<T>() {
    if (T == dynamic) {
      return streamController.stream;
    } else {
      return streamController.stream.where((event) => event is T).cast<T>();
    }
  }

  /// 发送一个事件.
  ///
  void fire(event) {
    streamController.add(event);
  }

  /// 销毁事件 .
  ///
  void destroy() {
    _streamController.close();
  }
}
