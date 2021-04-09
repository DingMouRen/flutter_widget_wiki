# AnimatedAlign
Flutter 1.26.0-1.0.pre ,Dart 2.12.0 (build 2.12.0-141.0.dev)<br>
简述：Align的动画版本，在给定的时间内，当alignment发生变化时，自动转换子部件的位置。

|属性|释义|
|---|---|
|alignment → AlignmentGeometry|对齐方式|
|child → Widget?|子部件|
|curve → Curve|动画曲线，默认是Curves.linear|
|duration → Duration|动画执行时间|
|heightFactor → double?|与Align用法相同，在AnimatedAlign父部件高度不指定的情况下起效果，AnimatedAlign高度为AnimatedAlign子部件的高度乘以heightFactor|
|widthFactor → double?|与Align用法相同，在AnimatedAlign父部件高度不指定的情况下起效果，AnimatedAlign宽度为AnimatedAlign子部件的高度乘以widthFactor|
|onEnd → VoidCallback?|动画结束时的回调|

#### 示例1 基本使用

```dart
Center(
      child: Container(
        color: Colors.red,
        width: 200,
        height: 200,
        child: AnimatedAlign(
          alignment: _selected ? Alignment.topRight:Alignment.bottomLeft,
          duration: Duration(seconds: 1),
          child: FlutterLogo(size: 50,),
          onEnd: (){
            showToast('动画结束');
          },
        ),
      ),
    );
  
```

![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/animate_align_1.gif)


#### 示例2 动画曲线动画
```dart
Center(
      child: Container(
        color: Colors.red,
        width: 200,
        height: 200,
        child: AnimatedAlign(
          alignment: _selected ? Alignment.topRight:Alignment.bottomLeft,
          duration: Duration(seconds: 1),
          curve: Curves.bounceOut,
          child: FlutterLogo(size: 50,),
          onEnd: (){
            showToast('动画结束');
          },
        ),
      ),
    );
```

![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/animate_align_2.gif)<br>

Curves动画曲线有很多种，

||||
|---|---|---|
| ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.bounceIn.flipped.gif) | ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.bounceIn.gif) | ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.bounceInOut.gif) |
| ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.bounceOut.gif) | ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.decelerate.gif) | ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.ease.gif) |
| ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.easeIn.gif) | ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.easeInBack.gif) | ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.easeInCirc.gif) |
| ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.easeInCubic.gif) | ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.easeInExpo.gif) | ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.easeInOut.gif) |
| ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.easeInOutBack.gif) | ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.easeInOutCirc.gif) | ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.easeInOutCubic.gif) |
| ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.easeInOutExpo.gif) | ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.easeInOutQuad.gif) | ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.easeInOutQuart.gif) |
| ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.easeInOutQuint.gif) | ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.easeInOutSine.gif) | ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.easeInQuad.gif) |
| ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.easeInQuart.gif) | ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.easeInQuint.gif) | ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.easeInSine.gif) |
| ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.easeOut.gif) | ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.easeOutBack.gif) | ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.easeOutCirc.gif) |
| ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.easeOutCubic.gif) | ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.easeOutExpo.gif) | ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.easeOutQuad.gif) |
| ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.easeOutQuart.gif) | ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.easeOutQuint.gif) | ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.easeOutSine.gif) |
| ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.elasticIn.gif) | ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.elasticInOut.gif) | ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.elasticOut.gif) |
| ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.fastOutSlowIn.gif) | ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.linear.gif) | ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Curves.slowMiddle.gif) |
| ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Interval(0.25,0.75).gif) | ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/SawTooth(3).gif) | ![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedAlign/res/Threshold(0.75).gif) |

