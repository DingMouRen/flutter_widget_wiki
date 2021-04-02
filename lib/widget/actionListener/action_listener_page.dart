import 'package:flutter/material.dart';

class ActionListenerPage extends StatefulWidget {
  ActionListenerPage({Key? key}) : super(key: key);

  @override
  _ActionListenerPageState createState() {
    return _ActionListenerPageState();
  }
}

class _ActionListenerPageState extends State<ActionListenerPage> {
  bool _on = false;
  late final MyAction _myAction;

  @override
  void initState() {
    super.initState();
    _myAction = MyAction();
  }

  void _toggleState() {
    setState(() {
      _on = !_on;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ActionListener'),
      ),
      body: _test1(),
    );
  }

  _test1() {
    return Center(
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
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Action Listener Called'),
                    ));
                  }
                },
                action: _myAction,
                child: ElevatedButton(
                  onPressed: () => const ActionDispatcher()
                      .invokeAction(_myAction, const MyIntent()),
                  child: const Text('Call Action Listener'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

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
