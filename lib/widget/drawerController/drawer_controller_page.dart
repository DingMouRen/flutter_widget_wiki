import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DrawerControllerPage extends StatefulWidget {

  @override
  _DrawerControllerPageState createState() {
    return _DrawerControllerPageState();
  }
}

class _DrawerControllerPageState extends State<DrawerControllerPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('DrawerController'),),
      body:  Stack(
        children: [
          Container(color: Colors.white,child: Center(child: Text('中间',style: TextStyle(fontSize: 40),)),),
          DrawerController(
            alignment: DrawerAlignment.start,
            isDrawerOpen: false,
            child:  Container(color: Colors.red,child: Center(child: Text('左边',style: TextStyle(fontSize: 40),)),),
          ),
          DrawerController(
            alignment: DrawerAlignment.end,
            isDrawerOpen: false,
            child:  Container(color: Colors.blue,child: Center(child: Text('右边',style: TextStyle(fontSize: 40),)),),
          ),
        ],
      ),
    );
  }


  _test1(){
    return Stack(
      children: [
        Container(color: Colors.white,),
        DrawerController(
          alignment: DrawerAlignment.start,
          isDrawerOpen: true,
          child: Drawer(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.red,

            ),
          ),
        ),
      ],
    );
  }

  _test2(){
    return Stack(
      children: [
        Container(color: Colors.white,),
        DrawerController(
            alignment: DrawerAlignment.start,
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              color: Colors.blue,
            )
        ),
      ],
    );
  }

  _test3(){
    return Stack(
      children: [
        Container(color: Colors.white,child: Center(child: Text('中间',style: TextStyle(fontSize: 40),)),),
        DrawerController(
          alignment: DrawerAlignment.start,
          isDrawerOpen: false,
          child:  Container(color: Colors.red,child: Center(child: Text('左边',style: TextStyle(fontSize: 40),)),),
        ),
        DrawerController(
          alignment: DrawerAlignment.end,
          isDrawerOpen: false,
          child:  Container(color: Colors.blue,child: Center(child: Text('右边',style: TextStyle(fontSize: 40),)),),
        ),
      ],
    );
  }

}