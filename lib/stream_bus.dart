import 'dart:async';

import 'Subscription.dart';


class StreamBus {
 // 定义定义一个总线流的控制器  StreamController
  StreamController _streamController;

  /// 获取StreamController。
  StreamController get streamController => _streamController;
  ///获取 Stream 用于监听
  Stream  get _dataStream => _streamController.stream;

///广播Stream
  StreamBus({bool sync = false})
      : _streamController = StreamController.broadcast(sync: sync);


  //返回Responder
  Subscription on<T>(Responder<T> responder) =>
      Subscription(_dataStream).respond<T>(responder);


  /// 发送一个事件.
  ///
  void post(event) {
    _streamController.add(event);
  }

  /// 销毁事件 .
  ///
  void destroy() {
    _streamController.close();
  }
}
