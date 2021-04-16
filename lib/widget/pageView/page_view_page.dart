import 'package:flutter/material.dart';
import 'package:flutter_widget_wiki/widget/pageView/page_view_example_1.dart';
import 'package:flutter_widget_wiki/widget_list.dart';

class PageViewPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PageView'),),
      body: Center(
        child: Column(
          children: [
            CustomButton('示例1', PageViewExample1()),

          ],
        ),
      ),
    );
  }
}
