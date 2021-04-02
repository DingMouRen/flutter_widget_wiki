# Actions

| 属性  |释义|
|---|---|
|actions → Map<Type, Action<Intent>>|Intent意图与Action的映射关系，定义了这个小部件所知道的操作|
|child → Widget|这里的widget只能是单个widget|
|dispatcher → ActionDispatcher|非必须参数，如果为空会自动创建|

| 静态函数  |释义|
|---|---|
|find<T extends Intent>(BuildContext context, {T? intent}) → Action<T>  |在给定的上下文中找到绑定到给定意图类型的action|
|handler<T extends Intent>(BuildContext context, T intent) → VoidCallback?|如果给定的意图intent绑定的action是启用状态，返回VoidCallback处理程序；如果未启用，返回Null|
|invoke<T extends Intent>(BuildContext context, T intent) → Object?|执行给定intent绑定的action操作|
|maybeFind<T extends Intent>(BuildContext context, {T? intent}) → Action<T>?|在给定的上下文中找到绑定到给定意图类型T的动作|
|maybeInvoke<T extends Intent>(BuildContext context, T intent) → Object?|执行给定intent绑定的action操作|
|of(BuildContext context) → ActionDispatcher|返回ActionDispatcher|

#### 示例1（官方）
Actions的属性actions是一个Map，存储的是Intent类型<T>与Action<T>的映射表，Actions中就可以执行不同意图的Action,
通过静态函数Actions.invoke(context, intent)来执行action.
通常Intent和Action是成对声明的，就像不同意图才会有不同的动作一样。Intent中可以携带数据，也可以不带任何数据，Action在invoke函数中
处理Intent携带的数据。例子中修改Model中的data值，通过调用Actions.invoke(context,ModifyIntent)来修改值，在Actions
小部件声明的时候，已经确定了ModifyIntent和ModifyAction的对应关系，Actions在执行invoke函数的时候，会通过ModifyIntent
在Map中寻找ModifyAction,通过ModifyAction来执行自己的invoke函数，也就是修改Model中data的值。Actions.invoke(context,intent)
函数，不同的Intent对应不用的操作Action.

![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/actions/res/actions.gif)

定义数据模型
```
//数据模型，在改变时通知监听器
class Model {
  ValueNotifier<bool> isDirty = ValueNotifier<bool>(false);
  ValueNotifier<int> data = ValueNotifier<int>(0);

  int save() {
    if (isDirty.value) {
      isDirty.value = false;
    }
    return data.value;
  }

  void setValue(int newValue) {
    isDirty.value = data.value != newValue;
    data.value = newValue;
  }
}
```
定义修改数据的Intent和Action
```
//修改的意图
class ModifyIntent extends Intent {
  const ModifyIntent(this.value);

  final int value;
}

//将ModifyIntent设置进来的值，通过invoke函数，修改数据模型的值。
class ModifyAction extends Action<ModifyIntent> {
  ModifyAction(this.model);

  final Model model;

  @override
  void invoke(covariant ModifyIntent intent) {
    model.setValue(intent.value);
  }
}
```

声明保存数据的Intent和Action
```
//保存数据的意图
class SaveIntent extends Intent {
  const SaveIntent();
}

// An Action that saves the data in the model it is created with.
class SaveAction extends Action<SaveIntent> {
  SaveAction(this.model);

  final Model model;

  @override
  int invoke(covariant SaveIntent intent) {
    print('SaveAction invoke() model.save');
   return model.save();
  }
}

```
Actions小部件
```
 Actions(
        actions: <Type, Action<Intent>>{
          ModifyIntent: ModifyAction(model),
          SaveIntent: SaveAction(model),
        },
        child: Builder(
          builder: (BuildContext context) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.exposure_plus_1),
                      onPressed: () {
                        Actions.invoke(context, ModifyIntent(++count));

                      },
                    ),
                    AnimatedBuilder(
                        animation: model.data,
                        builder: (BuildContext context, Widget? child) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('${model.data.value}',
                                style: Theme.of(context).textTheme.headline4),
                          );
                        }),
                    IconButton(
                      icon: const Icon(Icons.exposure_minus_1),
                      onPressed: () {
                        Actions.invoke(context, ModifyIntent(--count));
                      },
                    ),
                  ],
                ),
                SaveButton(model.isDirty),
                const Spacer(),
              ],
            );
          },
        ),
      ),
```

```

class SaveButton extends StatefulWidget {
  const SaveButton(this.valueNotifier, {Key? key}) : super(key: key);

  final ValueNotifier<bool> valueNotifier;

  @override
  _SaveButtonState createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  int savedValue = 0;

  @override
  Widget build(BuildContext context) {
    print('_SaveButtonState build');
    return AnimatedBuilder(
      animation: widget.valueNotifier,
      builder: (BuildContext context, Widget? child) {
        print('_SaveButtonState AnimatedBuilder ${widget.valueNotifier.value}');
        return TextButton.icon(
          icon: const Icon(Icons.save),
          label: Text('$savedValue'),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(
              widget.valueNotifier.value ? Colors.red : Colors.green,
            ),
          ),
          onPressed: () {
            setState(() {
              print('_SaveButtonState 保存数据');
              savedValue = Actions.invoke(context, const SaveIntent())! as int;

            });
          },
        );
      },
    );
  }
}


```