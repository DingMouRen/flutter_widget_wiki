# AnimatedBuilder
Flutter 1.26.0-1.0.pre ,Dart 2.12.0 (build 2.12.0-141.0.dev)<br>
简述:用于创建动画的通用小部件。AnimatedBuilder继承AnimatedWidget.

|属性|释义|
|---|---|
|animation → Listenable |这个小部件正在监听的Listenable,Listenable有非常多的子类，AnimationController就是其一|
|child → Widget?|直接子部件|
|builder → TransitionBuilder|animation的值改变时调用。typedef TransitionBuilder = Widget Function(BuildContext context, Widget? child);|

#### 示例1 让一个小部件一直旋转

```dart
    //创建需要的animation
  late final AnimationController _controller_1 = AnimationController(duration:Duration(seconds: 2),vsync: this);
   //重复动画
  _controller_1.repeat();
  AnimatedBuilder(
        animation: _controller_1,
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            alignment: Alignment.center,
            color: Colors.yellowAccent,
            child: Center(child: Text('Whee!'),),
          ),
        ),
        builder: (BuildContext context,Widget? child){
          //旋转动画
          return Transform.rotate(angle: _controller_1.value * 2 * pi,child: child,);
        }
    );
```
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedBuilder/res/animated_builder_1.gif)

