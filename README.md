#
第一步 创建
```
import 'package:event_bus/stream_bus.dart';
StreamBus streamBus = StreamBus();
```
第二步 发送
```
class OrderEvent {
  String order;

  NewOrderEvent(this.order);
}

OrderEvent  order = OrderEvent('haha');
streamBus.fire(order);
```

第三步接受指定类型。也可以不指定接受任意类型
```
streamBus.on<OrderEvent>().listen((event) {
  print(event.user);
});
```