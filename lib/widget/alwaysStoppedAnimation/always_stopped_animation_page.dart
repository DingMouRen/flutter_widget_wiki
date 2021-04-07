import 'package:flutter/material.dart';

class AlwaysStoppedAnimationPage extends StatefulWidget {
  AlwaysStoppedAnimationPage({Key? key}) : super(key: key);

  @override
  _AlwaysStoppedAnimationPageState createState() {
    return _AlwaysStoppedAnimationPageState();
  }
}

class _AlwaysStoppedAnimationPageState
    extends State<AlwaysStoppedAnimationPage> {
  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var always = AlwaysStoppedAnimation(Colors.red);
    debugPrint('${always.toStringDetails()}');
    return Scaffold(
      appBar: AppBar(
        title: Text('AlwaysStoppedAnimation'),
      ),
      body: _test1(),
    );
  }

  _test1() {
    return Center(
      child: Container(
        child: LinearProgressIndicator(
          //value为null时，会执行循环动画
          value: 0.5,
          //进度条的背景颜色
          backgroundColor: Colors.grey,
          //valueColor类型是Animation<Color>,允许我们
          //对进度条的颜色指定动画，如果我们不需要对进度条颜色执行动画，对进度条应用
          //一种固定颜色，可以使用AlwaysStoppedAnimation来指定
          valueColor: AlwaysStoppedAnimation(Colors.red),
        ),
      ),
    );
  }
}
