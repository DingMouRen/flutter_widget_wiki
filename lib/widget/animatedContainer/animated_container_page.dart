import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  AnimatedContainerPage({Key? key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() {
    return _AnimatedContainerPageState();
  }
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage>
    with TickerProviderStateMixin {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedContainer'),
      ),
      // body: _test1(),
      // body: _test2(),
      // body: _test3(),
      // body: _test4(),
      // body: _test5(),
      // body: _test6(),
      // body: _test7(),
      // body: _test8(),
      body: _test9(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Text('动画'),
      ),
    );
  }

  _test1() {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          selected ? 200 : 0,
        ),
        color: Colors.purple,
      ),
    );
  }

  _test2() {
    return AnimatedContainer(
        duration: Duration(seconds: 1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            selected ? 200 : 0,
          ),
          color: Colors.purple,
        ),
        child: FlutterLogo(
          size: 100,
        ));
  }

  _test3() {
    return AnimatedContainer(
        alignment: Alignment.topCenter,
        duration: Duration(seconds: 1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            selected ? 200 : 0,
          ),
          color: Colors.purple,
        ),
        child: FlutterLogo(
          size: 100,
        ));
  }

  _test4() {
    return Center(
      child: AnimatedContainer(
          width: 200,
          height: 200,
          duration: Duration(seconds: 1),
          decoration: selected
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.deepOrange[400],
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.deepOrange[400],
                ),
          child: FlutterLogo(
            size: 100,
          )),
    );
  }

  _test5() {
    return Center(
      child: AnimatedContainer(
          width: 200,
          height: 200,
          constraints: BoxConstraints(maxWidth: 20, maxHeight: 50),
          duration: Duration(seconds: 1),
          decoration: selected
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.deepOrange[400],
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.deepOrange[400],
                ),
          child: FlutterLogo(
            size: 100,
          )),
    );
  }

  _test6() {
    return Center(
      child: AnimatedContainer(
          width: 200,
          height: 200,
          curve: Curves.bounceOut,
          duration: Duration(seconds: 1),
          decoration: selected
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.deepOrange[400],
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.deepOrange[400],
                ),
          child: FlutterLogo(
            size: 100,
          )),
    );
  }

  _test7() {
    return Center(
      child: AnimatedContainer(
          width: 200,
          height: 200,
          duration: Duration(seconds: 1),
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          foregroundDecoration: selected
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.red.withAlpha(200),
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.red.withAlpha(200),
                ),
          child: FlutterLogo(
            size: 100,
          )),
    );
  }

  _test8() {
    return Center(
      child: Container(
        color: Colors.black,
        width: 300,
        height: 300,
        //如果不设置alignment,AnimatedContainer会铺满父部件Container
        alignment: Alignment.topLeft,
        child: AnimatedContainer(
            width: 200,
            height: 200,
            // margin: selected?EdgeInsets.only(left: 0):EdgeInsets.only(left: 300),
            padding: selected
                ? EdgeInsets.only(left: 300)
                : EdgeInsets.only(left: 0),
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            duration: Duration(seconds: 1),
            child: FlutterLogo(
              size: 100,
            )),
      ),
    );
  }

  _test9() {
    return Row(
      children: [
        Expanded(flex: 1, child: Container(color: Colors.greenAccent,)),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              width: 200,
              height: 200,
              color: Colors.yellowAccent,
              alignment: Alignment.topLeft,
              transform: Matrix4.rotationY(selected ? pi : 2 * pi),
              transformAlignment: Alignment.center,
              onEnd: () {
                selected = !selected;
                setState(() {});
              },
              duration: Duration(seconds: 1),
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
