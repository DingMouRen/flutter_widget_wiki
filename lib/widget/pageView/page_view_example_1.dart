import 'package:flutter/material.dart';

class PageViewExample1 extends StatefulWidget {

  @override
  _PageViewExample1State createState() {
    return _PageViewExample1State();
  }
}

class _PageViewExample1State extends State<PageViewExample1> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PageView示例1'),),
      body: PageView(
         scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Container(color: Colors.red,child: Center(child: Text('第一页',style: TextStyle(fontSize: 40),)),),
          Container(color: Colors.purple,child: Center(child: Text('第二页',style: TextStyle(fontSize: 40),)),),
          Container(color: Colors.blue,child: Center(child: Text('第三页',style: TextStyle(fontSize: 40),)),),
        ],
      ),
    );
  }
}