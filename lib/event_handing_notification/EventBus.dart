//定义 订阅者回调方法别名
typedef void EventCallback(arg);

//定义一个顶级变量，页面映入该文件后可以直接使用功能bus
var bus = EventBus();

class EventBus {
  //私有构造函数（私有命名构造函数）
  EventBus._internal();

  //保存单例
  static EventBus _singleton = EventBus._internal();

  //通过工厂构造函数返回单例
  factory EventBus() => _singleton;

  //定义一个map用于保存事件订阅者队列，key：事件名，value：对应事件的订阅者队列
  var _emap = Map<Object, List<EventCallback>>();

  //添加订阅者的方法
  void add(eventName, EventCallback callback) {
    if (eventName == null || callback == null) return;
    //??= 该操作符静静在变量为null时会赋值。未初始化和后来手动赋值为null的情况都会执行此操作赋值。
    _emap[eventName] ??= List<EventCallback>();
    _emap[eventName].add(callback);
  }

  //移除订阅者
  void remove(eventName, [EventCallback callback]) {
    var list = _emap[eventName];
    if (eventName == null || list == null) return;
    if (callback == null) {
      _emap[eventName] = null;
    } else {
      _emap[eventName].remove(callback);
    }
  }

  //触发事件，事件出发后该事件所有订阅者会被调用
  void emit(eventName, [arg]) {
    var list = _emap[eventName];
    if (list == null) return;
    var len = list.length - 1;
    //反向遍历，防止在订阅者在回调中移除自身带来的下标错位
    for (var i = len; i > -1; --i) {
      list[i](arg);
    }
  }
}
