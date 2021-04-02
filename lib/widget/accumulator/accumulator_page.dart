import 'package:flutter/material.dart';

class AccumulatorPage extends StatefulWidget {
  AccumulatorPage({Key? key}) : super(key: key);

  @override
  _AccumulatorPageState createState() {
    return _AccumulatorPageState();
  }
}

class _AccumulatorPageState extends State<AccumulatorPage> {
  Accumulator _accumulator = Accumulator();
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
      appBar: AppBar(
        title: Text("Accumulator"),
      ),
      body: Center(
        child: Text('${_accumulator.value}',style: TextStyle(fontSize: 20),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

          setState(() {
            _accumulator.increment(1);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}