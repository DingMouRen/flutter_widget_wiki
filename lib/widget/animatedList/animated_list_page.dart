import 'package:flutter/material.dart';
import 'package:flutter_widget_wiki/widget/animatedList/animated_list_example_1.dart';
import 'package:flutter_widget_wiki/widget/animatedList/animated_list_example_2.dart';
import 'package:flutter_widget_wiki/widget/animatedList/animated_list_example_3.dart';
import 'package:flutter_widget_wiki/widget_list.dart';

class AnimatedListPage extends StatefulWidget {
  AnimatedListPage({Key? key}) : super(key: key);

  @override
  _AnimatedListPageState createState() {
    return _AnimatedListPageState();
  }
}

class _AnimatedListPageState extends State<AnimatedListPage> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedList'),
      ),
      body: Center(
        child: Column(
          children: [
            CustomButton('示例1', AnimatedListExample1()),
            CustomButton('示例2', AnimatedListExample2()),
            CustomButton('示例3', AnimatedListExample3()),
          ],
        ),
      ),
    );
  }
}