import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class ActionsPage extends StatefulWidget {
  ActionsPage({Key? key}) : super(key: key);

  @override
  _ActionsPageState createState() {
    return _ActionsPageState();
  }
}

class _ActionsPageState extends State<ActionsPage> {
  Model model = Model();
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actions'),
      ),
      body: Actions(
        actions: <Type, Action<Intent>>{
          ModifyIntent: ModifyAction(model),
          SaveIntent: SaveAction(model),
        },
        child: Builder(
          builder: (BuildContext context) {
            print('Actions child build');
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
                        print('+1');
                        Actions.invoke(context, ModifyIntent(++count));

                      },
                    ),
                    AnimatedBuilder(
                        animation: model.data,
                        builder: (BuildContext context, Widget? child) {
                          print('Actions AnimatedBuilder model.data:${model.data.value}');
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
                        print('-1');
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
    );
  }
}


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


//数据模型，在改变时通知监听器
class Model {
  ValueNotifier<bool> isDirty = ValueNotifier<bool>(false);
  ValueNotifier<int> data = ValueNotifier<int>(0);

  int save() {
    print('Model save() ${isDirty.value}');
    if (isDirty.value) {
      // showToast('Saved Data: ${data.value}');
      isDirty.value = false;
    }
    return data.value;
  }

  void setValue(int newValue) {
    print('Model setValue()');
    isDirty.value = data.value != newValue;
    data.value = newValue;
  }
}

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
    print('ModifyAction invoke() model.setValue');
    model.setValue(intent.value);
  }
}

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
