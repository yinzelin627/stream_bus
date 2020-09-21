
第一步 接受
```
//创建event
class OrderEvent {
  String order;

  NewOrderEvent(this.order);
}
//也可以不传递泛型 OrderEvent 接受任意的evnet
 GlobalStreamBus().event.on<OrderEvent>((OrderEvent event) { });
```

第二步发送
```
GlobalStreamBus().event.post(OrderEvent('11111'));
```


第三部
```
subscription.dispose();关闭
```