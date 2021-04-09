import 'package:flutter/material.dart';

class AnimatedCrossFadePage extends StatefulWidget {
  AnimatedCrossFadePage({Key? key}) : super(key: key);

  @override
  _AnimatedCrossFadePageState createState() {
    return _AnimatedCrossFadePageState();
  }
}

class _AnimatedCrossFadePageState extends State<AnimatedCrossFadePage> {
  bool _change = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedCrossFade'),
      ),
      // body: _test1(),
      // body: _test2(),
      body: _test3(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _change = !_change;
          });
        },
        child: Text('切换'),
      ),
    );
  }

  _test1() {
    return Center(
        child: AnimatedCrossFade(
      duration: Duration(seconds: 1),
      crossFadeState:
          _change ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: Container(
        height: 150,
        width: 150,
        alignment: Alignment.center,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
        child: Text(
          'first child',
          style: TextStyle(color: Colors.white),
        ),
      ),
      secondChild: Container(
        height: 150,
        width: 150,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.orange,
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          'second child',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ));
  }

  _test2() {
    return Center(
        child: AnimatedCrossFade(
          duration: Duration(seconds: 3),
          firstCurve: Curves.bounceOut,
          secondCurve: Curves.easeInOutQuad,
          crossFadeState:
          _change ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          firstChild: Container(
            height: 150,
            width: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
            child: Text(
              'first child',
              style: TextStyle(color: Colors.white),
            ),
          ),
          secondChild: Container(
            height: 150,
            width: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.red,
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              'second child',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
  }

  _test3() {
    return Center(
        child: AnimatedCrossFade(
          duration: Duration(seconds: 1),
          crossFadeState: _change ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          layoutBuilder: (Widget topChild, Key topChildKey, Widget bottomChild, Key bottomChildKey){
            return Stack(
              overflow: Overflow.visible,
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  key: bottomChildKey,
                  child: bottomChild,
                ),
                Positioned(
                  key: topChildKey,
                  child: topChild,
                ),
              ],
            );
          },
          firstChild: Container(
            height: 100,
            width: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
            child: Text(
              'first child',
              style: TextStyle(color: Colors.white),
            ),
          ),
          secondChild: Container(
            height: 200,
            width: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.red,
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              'second child',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
  }
}
