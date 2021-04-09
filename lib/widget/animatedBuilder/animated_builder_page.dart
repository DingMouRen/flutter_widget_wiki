import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedBuilderPage extends StatefulWidget {
  AnimatedBuilderPage({Key? key}) : super(key: key);

  @override
  _AnimatedBuilderPageState createState() {
    return _AnimatedBuilderPageState();
  }
}

class _AnimatedBuilderPageState extends State<AnimatedBuilderPage> with TickerProviderStateMixin{

  late final AnimationController _controller_1 = AnimationController(duration:Duration(seconds: 2),vsync: this);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller_1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedBuilder'),),
      body: _test1(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _controller_1.repeat();
        },
        child: Text('动画'),
      ),
    );
  }

  _test1() {
    return AnimatedBuilder(
        animation: _controller_1,
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            alignment: Alignment.center,
            color: Colors.yellowAccent,
            child: Center(child: Text('Whee!'),),
          ),
        ),
        builder: (BuildContext context,Widget? child){
          //旋转动画
          return Transform.rotate(angle: _controller_1.value * 2 * pi,child: child,);
        }
    );
  }
}