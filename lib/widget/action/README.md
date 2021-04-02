# Intent Action ActionDispatcher ActionListener
#### **Intent**
**Intent**是意图,官方翻译是一个抽象类，表示Action的特定配置。

| 子类  |释义|
|---| ---|
|  ActivateIntent |用来激活当前有焦点的控制器的意图|
|  ButtonActivateIntent |用来激活当前有焦点的按钮的意图|
|  DirectionalFocusIntent |表示在给定的方向上移动到下一个有焦点的节点的意图|
|  DismissIntent |用来关闭当前有焦点的小部件的意图|
|  DoNothingAndStopPropagationIntent |既不执行行动，也会停止绑定在这个意图上的事件的传播的意图|
|  DoNothingIntent |不执行行动的意图|
|  NextFocusIntent |在焦点队列上，焦点移动到下一个有焦点的节点的意图|
|  PreviousFocusIntent |在焦点队列上，焦点移动到上一个有焦点的节点的意图|
|  PrioritizedIntents |将一系列的intent进行估算的意图，执行哪个intent,具体由action来计算并执行|
|  RequestFocusIntent |提供的FocusNode应该获取到焦点的意图|
|  ScrollIntent |在指定的ScrollIncrementType类型下，滚动指定的数量的意图|
|  SelectIntent |选择当前有焦点的控制器的意图|


#### **Action**
**Action**是Actions的基类,是一个抽象类。Action就是要执行的行动。Action通过泛型的方式，跟Intent建立映射关系，ActionDispatcher是行动
调度器，通过ActionDispatcher.invokeAction(action,intent)来执行操作，最终还是Action.invoke(intent)来执行操作。

ActionDispatcher是操作调度器，我们将意图Intent映射到一个操作Action上，通过ActionDispatcher.invokeAction(action,intent)来执行操作。
Intent是行动的意图

| 抽象函数 |释义|
|---| --- |
|  addActionListener(ActionListenerCallback listener) → void|注册一个回调以监听此操作状态的更改。|
|consumesKey(covariant T intent) → bool|指示当通过键事件调用该操作时，该操作是否应将映射到该操作的键事件视为“已处理”|
|invoke(covariant T intent) → Object?|当要执行动作时调用。|
|isEnabled(covariant T intent) → bool|如果操作已启用并准备好被调用，则返回true。|
|notifyActionListeners() → void|调用所有注册的监听器。|
|removeActionListener(ActionListenerCallback listener) → void|删除监听器|
<br>
<br>

|子类  |释义|
|---| ---|
|  ActivateAction |抽象类，执行激活当前有焦点的控制器|
|  CallbackAction |接收一个回调函数，这个函数被invoke指定，这样的话就不需要创建Action的子类了，直接接收一个执行动作的回调函数|
|  ContextAction |抽象类，除了Action的invoke(intent)函数,添加一个可选函数invoke(intent,context)|
|  DirectionalFocusAction |执行在给定的方向上移动到下一个有焦点的节点|
|  DismissAction |抽象类，执行关闭当前有焦点的小部件|
|  DoNothingAction |调用时不执行任何动作|
|  NextFocusAction |在焦点队列中，将焦点移动到下一个有焦点的节点上|
|  PreviousFocusAction |在焦点队列中，将焦点移动到上一个有焦点的节点上|
|  PrioritizedAction |遍历intent列表，执行第一个可启动的intent|
|  RequestFocusAction |执行对RequestFocusIntent中的节点请求焦点|
|  ScrollAction |滚动配置的数量|
|  SelectAction |选择当前有焦点的控制器|

#### **ActionListener**

**ActionListener**是一个helper小部件，用于确保正确删除操作上的监听器，继承StatefulWidget.

#### 示例1（官方）

![img7](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/action/res/action_listener_1.gif)

自定义Intent和Action
```

class MyAction extends Action<MyIntent> {
  @override
  void addActionListener(ActionListenerCallback listener) {
    super.addActionListener(listener);
    print('MyAction Listener was added ');
  }

  @override
  void removeActionListener(ActionListenerCallback listener) {
    super.removeActionListener(listener);
    print('MyAction Listener was removed');
  }

  @override
  void invoke(covariant MyIntent intent) {
    notifyActionListeners();
  }
}

class MyIntent extends Intent {
  const MyIntent();
}
```

一个按钮控制蓝色按钮的显示与隐藏，蓝色按钮调用ActionDispathcer.invokeAction函数，通过notifyActionListeners，ActionListener接收到
listener的回调，弹出SnackBar弹框。
```
 Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: _toggleState,
              child: Text(_on ? 'Disable' : 'Enable'),
            ),
          ),
          if (_on)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ActionListener(
                listener: (Action<Intent> action) {
                  print('${action.intentType.toString()}');
                  if (action.intentType == MyIntent) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Action Listener Called'),));
                  }
                },
                action: _myAction,
                child: ElevatedButton(
                  onPressed: () => const ActionDispatcher().invokeAction(_myAction, const MyIntent()),
                  child: const Text('Call Action Listener'),
                ),
              ),
            ),
        ],
      ),
    );
```
