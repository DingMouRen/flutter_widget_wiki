import 'package:flutter/material.dart';

class AlignTransitionPage extends StatefulWidget {
  AlignTransitionPage({Key? key}) : super(key: key);

  @override
  _AlignTransitionPageState createState() {
    return _AlignTransitionPageState();
  }
}

class _AlignTransitionPageState extends State<AlignTransitionPage> with TickerProviderStateMixin {

  late AnimationController _controller ;
  late Animation<AlignmentGeometry> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration:Duration(seconds: 1),vsync: this);
    _animation = Tween<AlignmentGeometry>(
      begin: Alignment.center,
      end: Alignment.topRight,
    ).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('AlignTransition'),
      ),
      // body: _test1(),
      body: _test2(),
    );
  }

  _test1() {
    return Center(
      child: Column(
        children: [
           Container(
             width: 200,
             height: 200,
             color:  Colors.deepOrange[400],
             child: AlignTransition(
                 alignment: _animation,
                 child: FlutterLogo(size: 40,)),
           ),

          SizedBox(height: 20,),
          ElevatedButton(
              onPressed: (){
                _controller.forward();
              },
              child: Text("执行动画"))
        ],
      ),
    );
  }

  _test2() {
    return Center(
      child: Column(
        children: [
          Container(
            color:  Colors.deepOrange[400],
            height: 200,
            child: AlignTransition(
                alignment: _animation,
                widthFactor: 2,
                child: FlutterLogo(size: 40,)),
          ),

          SizedBox(height: 20,),
          ElevatedButton(
              onPressed: (){
                _controller.forward();
              },
              child: Text("执行动画"))
        ],
      ),
    );
  }
}