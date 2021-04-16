import 'package:flutter/material.dart';

class AnimatedDefaultTextStylePage extends StatefulWidget {
  AnimatedDefaultTextStylePage({Key? key}) : super(key: key);

  @override
  _AnimatedDefaultTextStylePageState createState() {
    return _AnimatedDefaultTextStylePageState();
  }
}

class _AnimatedDefaultTextStylePageState extends State<AnimatedDefaultTextStylePage> {
  bool _change = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedDefaultTextStyle'),
      ),
      // body: _test1(),
      // body: _test2(),
      // body: _test3(),
      body: _test4(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _change = !_change;
          });
        },
        child: Text('动画'),
      ),
    );
  }

  _test1() {
    return Center(
      child: AnimatedDefaultTextStyle(
          child: Text('Hello Flutter'),
          style:  TextStyle(color:_change? Colors.black:Colors.red,fontSize: 40),
          duration: Duration(seconds: 1),
      ),
    );
  }

  _test2() {
    return Center(
      child: Container(
        color: Colors.blue,
        width: 300,
        height: 200,
        child: AnimatedDefaultTextStyle(
          child: Text('Hello Flutter'),
          style:  TextStyle(color:Colors.red,fontSize: 40),
          textAlign: TextAlign.end,
          duration: Duration(seconds: 1),
        ),
      ),
    );
  }
  _test3() {
    return Center(
      child: Container(
        color: Colors.blue,
        width: 300,
        height: 200,
        child: AnimatedDefaultTextStyle(
          child: Text('Flutter Flutter Flutter Flutter Flutter Flutter Flutter Flutter'),
          style:  TextStyle(color:Colors.red,fontSize: 30),
          softWrap: _change?true:false,
          duration: Duration(seconds: 1),
        ),
      ),
    );
  }

  _test4() {
    return Center(
      child: Container(
        color: Colors.blue,
        width: 300,
        height: 200,
        child: AnimatedDefaultTextStyle(
          child: Text('FlutterFlutterFlutterFlutterFlutterFlutterFlutterFlutter'),
          style:  TextStyle(color:Colors.red,fontSize: 30),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          duration: Duration(seconds: 1),
        ),
      ),
    );
  }



}