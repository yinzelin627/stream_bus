
import 'stream_bus.dart';

//全局event管理
class GlobalStreamBus{
  StreamBus event;
  factory GlobalStreamBus() => _getInstance();

  static GlobalStreamBus get instance => _getInstance();

  static GlobalStreamBus _instance;

  GlobalStreamBus._internal() {
    // 创建对象
    event = StreamBus();
  }

  static GlobalStreamBus _getInstance() {
    if (_instance == null) {
      _instance = GlobalStreamBus._internal();
    }
    return _instance;
  }
}