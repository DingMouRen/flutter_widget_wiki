# AnimatedCrossFade
简述：一个小部件在两个给定的子对象之间交叉淡出，并在它们的大小之间动画。
动画是通过crossFadeState参数控制的。firstCurve和secondCurve分别表示两个子节点的不透明度曲线。
firstCurve是反向的，即当提供像Curves.linear这样的增长曲线时，它会逐渐消失。sizeCurve是用于在淡出子节
点的大小和淡入子节点的大小之间进行动画的曲线。<br>
这个小部件用于淡入一对具有相同宽度的小部件。在两个子元素高度不同的情况下，动画在动画中通过对齐子元素的上边缘
来溢出子元素，这意味着底部将被剪切。<br>

|属性|释义|
|---|---|
|firstChild → Widget|第一个子部件|
|secondChild → Widget|第二个子部件|
|crossFadeState → CrossFadeState|动画完成后要显示的子部件，是一个枚举，CrossFadeState.showFirst、CrossFadeState.showSecond|
|duration → Duration|第一个子部件切换成第二个子部件动画过渡的时长|
|reverseDuration → Duration?|第二个子部件切换成第一个子部件动画过渡的时长|
|firstCurve → Curve|第一个子部件的渐隐曲线动画,默认是Curves.linear|
|secondCurve → Curve|第二个子部件的渐隐曲线动画,默认是Curves.linear|
|sizeCurve → Curve|两个子部件大小转变的动画曲线,默认是Curves.linear|
|layoutBuilder → AnimatedCrossFadeBuilder||

#### 示例1 基本使用
两个子部件大小一致的情况下，演示过渡动画
```
 Center(
        child: AnimatedCrossFade(
      duration: Duration(seconds: 1),
      crossFadeState:
          _change ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: Container(
        height: 150,
        width: 150,
        alignment: Alignment.center,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
        child: Text(
          'first child',
          style: TextStyle(color: Colors.white),
        ),
      ),
      secondChild: Container(
        height: 150,
        width: 150,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.orange,
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          'second child',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ));
```
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedCrossFade/res/animated_cross_fade_1.gif)

#### 示例2 firstCurve secondCurve
firstCurve是第一个子部件的渐隐曲线，secondCurve是第二个子部件的渐隐曲线
```dart
 Center(
        child: AnimatedCrossFade(
          duration: Duration(seconds: 3),
          firstCurve: Curves.bounceOut,
          secondCurve: Curves.easeInOutQuad,
          crossFadeState:
          _change ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          firstChild: Container(
            height: 150,
            width: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
            child: Text(
              'first child',
              style: TextStyle(color: Colors.white),
            ),
          ),
          secondChild: Container(
            height: 150,
            width: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.red,
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              'second child',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
```
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedCrossFade/res/animated_cross_fade_2.gif)

#### 示例3 layoutBuilder
当两个子部件大小不一致时，切换的时候会出现抖动的情况，如下:
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedCrossFade/res/animated_cross_fade_3.gif)<br>
这种抖动的情况，可以通过layoutBuilder来处理
```dart
Center(
        child: AnimatedCrossFade(
          duration: Duration(seconds: 1),
          crossFadeState: _change ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          layoutBuilder: (Widget topChild, Key topChildKey, Widget bottomChild, Key bottomChildKey){
            return Stack(
              overflow: Overflow.visible,
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  key: bottomChildKey,
                  child: bottomChild,
                ),
                Positioned(
                  key: topChildKey,
                  child: topChild,
                ),
              ],
            );
          },
          firstChild: Container(
            height: 100,
            width: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
            child: Text(
              'first child',
              style: TextStyle(color: Colors.white),
            ),
          ),
          secondChild: Container(
            height: 200,
            width: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.red,
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              'second child',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
```
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedCrossFade/res/animated_cross_fade_3.gif)<br>

