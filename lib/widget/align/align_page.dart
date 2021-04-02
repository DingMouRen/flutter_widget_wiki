import 'package:flutter/material.dart';

class AlignPage extends StatefulWidget {
  AlignPage({Key? key}) : super(key: key);

  @override
  _AlignPageState createState() {
    return _AlignPageState();
  }
}

class _AlignPageState extends State<AlignPage> {
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
      appBar: AppBar(title: Text('Align'),),
      body: _test1(),
    );
  }

  _test1() {
    return Center(
      child: Container(
        color: Colors.deepOrange[400],
        width: 200,
        height: 200,
        child: Align(
          alignment: Alignment.center,
          widthFactor: 1,
          heightFactor: 1,
          child: FlutterLogo(size: 60,),
        ),
      ),
    );
  }
}