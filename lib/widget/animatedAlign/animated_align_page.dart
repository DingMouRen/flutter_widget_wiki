import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class AnimatedAlignPage extends StatefulWidget {
  AnimatedAlignPage({Key? key}) : super(key: key);

  @override
  _AnimatedAlignPageState createState() {
    return _AnimatedAlignPageState();
  }
}

class _AnimatedAlignPageState extends State<AnimatedAlignPage> {

  bool _selected = false;

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
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedAlign'),),
      body: _test1(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _selected = !_selected;
          });
        },
        child: Text('动画'),
      ),
    );
  }

  _test1() {
    return Center(
      child: Container(
        color: Colors.red,
        width: 200,
        height: 200,
        child: AnimatedAlign(
          alignment: _selected ? Alignment.topRight:Alignment.bottomLeft,
          duration: Duration(seconds: 1),
          curve: Curves.bounceOut,
          child: FlutterLogo(size: 50,),
          onEnd: (){
            showToast('动画结束');
          },
        ),
      ),
    );
  }
}