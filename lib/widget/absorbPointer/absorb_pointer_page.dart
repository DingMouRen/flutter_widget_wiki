import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class AbsorbPointerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AbsorbPointerPageState();
  }
}

class _AbsorbPointerPageState extends State<AbsorbPointerPage> {
  bool _absorbing = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AbsorbPointer'),
        centerTitle: true,
      ),
      // body: _test1(),
      // body: _test2(),
      // body: _test3(),
      // body: _test4(),
      body: _test5(),
    );
  }

  _test1() {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          SizedBox(
            width: 200.0,
            height: 100.0,
            child: ElevatedButton(
              onPressed: () {
                showToast('点击了');
              },
              child: null,
            ),
          ),
          SizedBox(
            width: 100.0,
            height: 200.0,
            child: AbsorbPointer(
              absorbing: true,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue.shade200,
                ),
                onPressed: () {
                  showToast('点击了');
                },
                child: null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _test2() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 400,
          child: AbsorbPointer(
            absorbing: _absorbing,
            child: ListView.builder(itemBuilder: (context, index) {
              return Container(
                color: Colors.deepOrange[400],
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Text(index.toString()),
              );
            }),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _absorbing = !_absorbing;
                showToast("当前absorbing：$_absorbing");
              });
            },
            child: Text("切换absorbing"),
          ),
        )
      ],
    );
  }

  _test3() {
    return Center(
      child: Column(
        children: [
          AbsorbPointer(
            absorbing: _absorbing,
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () => showToast('点击了'),
                    child: Text("按钮", style: TextStyle(color: Colors.white))),
                ElevatedButton(
                    onPressed: () => showToast('点击了'),
                    child: Text("按钮", style: TextStyle(color: Colors.white))),
                ElevatedButton(
                    onPressed: () => showToast('点击了'),
                    child: Text("按钮", style: TextStyle(color: Colors.white))),
                ElevatedButton(
                    onPressed: () => showToast('点击了'),
                    child: Text("按钮", style: TextStyle(color: Colors.white))),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _absorbing = !_absorbing;
                showToast("当前absorbing：$_absorbing");
              });
            },
            child: Text("切换absorbing"),
          ),
        ],
      ),
    );
  }

  _test4() {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Listener(
              onPointerDown: (v) {
                showToast('点击了红色',position: ToastPosition.top);
              },
              child: Container(
                color: Colors.red,
              ),
            ),
            Listener(
              onPointerDown: (v) {
                showToast('点击了AbsorbPointer自身',position: ToastPosition.center);
              },
              child: AbsorbPointer(
                absorbing: false,
                child: Listener(
                  onPointerDown: (v) {
                    showToast('点击了AbsorbPointer的子部件',position: ToastPosition.bottom);
                  },
                  child: Container(
                    color: Colors.blue,
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  _test5() {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Listener(
              onPointerDown: (v) {
                showToast('点击了红色',position: ToastPosition.top);
              },
              child: Container(
                color: Colors.red,
              ),
            ),
            Listener(
              onPointerDown: (v) {
                showToast('点击了IgnorePointer自身',position: ToastPosition.center);
              },
              child: IgnorePointer(
                ignoring: false,
                child: Listener(
                  onPointerDown: (v) {
                    showToast('点击了IgnorePointer的子部件',position: ToastPosition.bottom);
                  },
                  child: Container(
                    color: Colors.blue,
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
