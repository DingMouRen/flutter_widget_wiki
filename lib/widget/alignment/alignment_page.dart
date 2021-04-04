import 'package:flutter/material.dart';

class AlignmentPage extends StatefulWidget {
  AlignmentPage({Key? key}) : super(key: key);

  @override
  _AlignmentPageState createState() {
    return _AlignmentPageState();
  }
}

class _AlignmentPageState extends State<AlignmentPage> {
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
        title: Text('Alignment'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16,right: 16,top: 10),
              child: ElevatedButton(
                onPressed: () {
                  Alignment alienment1 = Alignment(1,1);
                  Alignment alienment2 = Alignment(1,1);
                  Alignment sum = alienment1.add(alienment2) as Alignment;
                  print('sum:${sum}');
                },
                child: Text('add'),

              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16,right: 16,top: 10),
              child: ElevatedButton(
                onPressed: () {
                  Alignment alignment = Alignment(1, 0);
                  Offset offset = Offset(1, 1);
                  Offset result = alignment.alongOffset(offset);
                  print('result:$result');
                },
                child: Text('alongOffset'),

              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16,right: 16,top: 10),
              child: ElevatedButton(
                onPressed: () {
                  Alignment alignment = Alignment(0, 0);
                  Size size = Size(10, 10);
                  Offset result = alignment.alongSize(size);
                  print('result:$result');
                },
                child: Text('alongSize'),

              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16,right: 16,top: 10),
              child: ElevatedButton(
                onPressed: () {
                  Alignment alignment = Alignment(1, 1);
                  Size size = Size(6,6);
                  Rect rect = Rect.fromLTRB(0, 0, 10, 10);
                  Rect result = alignment.inscribe(size, rect);
                  print('result:$result');
                },
                child: Text('inscribe'),

              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16,right: 16,top: 10),
              child: ElevatedButton(
                onPressed: () {
                  Alignment alignment = Alignment(0,1);
                  Alignment result = alignment.resolve(TextDirection.rtl);
                  print('result:$result');
                },
                child: Text('resolve'),

              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16,right: 16,top: 10),
              child: ElevatedButton(
                onPressed: () {
                  Alignment alignment = Alignment(0, 0);
                  Rect rect = Rect.fromLTRB(0, 0, 10, 10);
                  Offset result = alignment.withinRect(rect);
                  print('result:$result');
                },
                child: Text('withinRect'),

              ),
            ),
          ],
        ),
      ),
    );
  }
}