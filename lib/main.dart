import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_wiki/widget_list.dart';

import 'package:oktoast/oktoast.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent,));

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      backgroundColor:Colors.grey,
      duration: Duration(milliseconds: 1000),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Widget',
        theme: ThemeData(
          primaryColor: Colors.deepOrange[400],
          accentColor: Colors.deepOrange[400],
          buttonColor: Colors.deepOrange[400],

        ),
        home: MyHomePage(title: 'Flutter Widget'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  final String? title;
  MyHomePage({Key? key, this.title}) : super(key: key);
  

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  ScrollController? _scrollController;
  
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: listWidgets,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _scrollController!.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.linear),
        child: Icon(Icons.arrow_upward_rounded),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}


