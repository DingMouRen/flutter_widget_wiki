import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_wiki/widget/absorbPointer/absorb_pointer_page.dart';
import 'package:flutter_widget_wiki/widget/accumulator/accumulator_page.dart';
import 'package:flutter_widget_wiki/widget/actionListener/action_listener_page.dart';
import 'package:flutter_widget_wiki/widget/actions/actions_page.dart';
import 'package:flutter_widget_wiki/widget/align/align_page.dart';
import 'package:flutter_widget_wiki/widget/alignTransition/align_transition_page.dart';
import 'package:flutter_widget_wiki/widget/alignment/alignment_page.dart';
import 'package:flutter_widget_wiki/widget/alwaysScrollableScrollPhysics/AlwaysScrollableScrollPhysicsPage.dart';
import 'package:flutter_widget_wiki/widget/alwaysStoppedAnimation/always_stopped_animation_page.dart';
import 'package:flutter_widget_wiki/widget/androidView/android_view_page.dart';
import 'package:flutter_widget_wiki/widget/animatedAlign/animated_align_page.dart';
import 'package:flutter_widget_wiki/widget/animatedBuilder/animated_builder_page.dart';
import 'package:flutter_widget_wiki/widget/animatedContainer/animated_container_page.dart';
import 'package:flutter_widget_wiki/widget/animatedCrossFade/animated_cross_fade_page.dart';
import 'package:flutter_widget_wiki/widget/animatedDefaultTextStyle/animated_default_text_style_page.dart';
import 'package:flutter_widget_wiki/widget/animatedList/animated_list_example_1.dart';
import 'package:flutter_widget_wiki/widget/animatedList/animated_list_page.dart';
import 'package:flutter_widget_wiki/widget/drawerController/drawer_controller_page.dart';
import 'package:flutter_widget_wiki/widget/pageView/page_view_page.dart';

Map<String,CustomButton> map = {
  "AbsorbPointer":CustomButton("AbsorbPointer", AbsorbPointerPage()),
  "Accumulator":CustomButton("Accumulator", AccumulatorPage()),
  "ActionListener":CustomButton("ActionListener", ActionListenerPage()),
  "Actions":CustomButton("Actions", ActionsPage()),
  "Align":CustomButton("Align", AlignPage()),
  "Alignment":CustomButton("Alignment", AlignmentPage()),
  "AlignTransition":CustomButton("AlignTransition", AlignTransitionPage()),
  "AlwaysScrollableScrollPhysics":CustomButton("AlwaysScrollableScrollPhysics", AlwaysScrollableScrollPhysicsPage()),
  "AlwaysStoppedAnimation":CustomButton("AlwaysStoppedAnimation", AlwaysStoppedAnimationPage()),
  "AndroidView":CustomButton("AndroidView", AndroidViewPage()),
  "AnimatedAlign":CustomButton("AnimatedAlign", AnimatedAlignPage()),
  "AnimatedBuilder":CustomButton("AnimatedBuilder", AnimatedBuilderPage()),
  "AnimatedContainer":CustomButton("AnimatedContainer", AnimatedContainerPage()),
  "AnimatedCrossFade":CustomButton("AnimatedCrossFade", AnimatedCrossFadePage()),
  "AnimatedDefaultTextStyle":CustomButton("AnimatedDefaultTextStyle", AnimatedDefaultTextStylePage()),
  "AnimatedList ":CustomButton("AnimatedList ", AnimatedListPage()),
  "DrawController ":CustomButton("DrawController ", DrawerControllerPage()),
  "PageView ":CustomButton("PageView ", PageViewPage()),
};

List<Widget> listWidgets = [
  // CustomButton("AbsorbPointer", AbsorbPointerPage()),
  // CustomButton("Accumulator", AccumulatorPage()),
  // CustomButton("ActionListener", ActionListenerPage()),
  // CustomButton("Actions", ActionsPage()),
  // CustomButton("Align", AlignPage()),
  // CustomButton("Alignment", AlignmentPage()),
  // CustomButton("AlignTransition", AlignTransitionPage()),
  // CustomButton("AlwaysScrollableScrollPhysics", AlwaysScrollableScrollPhysicsPage()),
  // CustomButton("AlwaysStoppedAnimation", AlwaysStoppedAnimationPage()),
  // CustomButton("AndroidView", AndroidViewPage()),
  // CustomButton("AnimatedAlign", AnimatedAlignPage()),
  // CustomButton("AnimatedBuilder", AnimatedBuilderPage()),
  // CustomButton("AnimatedContainer", AnimatedContainerPage()),
  // CustomButton("AnimatedCrossFade", AnimatedCrossFadePage()),
  // CustomButton("AnimatedDefaultTextStyle ", AnimatedDefaultTextStylePage()),
  // CustomButton("AnimatedList ", AnimatedListPage()),
];


// ignore: must_be_immutable
class CustomButton extends StatelessWidget {

  late String widgetName;
  late Widget widget;


  CustomButton(this.widgetName, this.widget);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 20,right: 20,top: 15),
      height: 50,
      child: ElevatedButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
        },

        child: Text(
          widgetName,
          style: TextStyle(
              color: Colors.white
          ),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(_getColor),
            alignment: Alignment.centerLeft
        ),
      ),

    );
  }

  Color? _getColor(Set<MaterialState> states) {
    return Colors.deepOrange[400];
  }

}
