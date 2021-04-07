# AlwaysStoppedAnimation
简述：总是在给定值处停止的动画。状态总是AnimationStatus.forward。

|属性|释义|
|---|---|
|status → AnimationStatus|动画当前的状态|
|value → T|动画当前的值|



|函数|释义|
|---|---|
|addListener(VoidCallback listener) → void|添加对动画的值发生变化的监听|
|addStatusListener(AnimationStatusListener listener) → void|添加对动画状态改变时的监听|
|removeListener(VoidCallback listener) → void|移除对动画值得监听|
|removeStatusListener(AnimationStatusListener listener) → void|移除对动画状态得监听|
|toStringDetails() → String|提供描述此对象状态的字符串，但不包括关于对象本身的信息。例如：MaterialColor(primary value: Color(0xfff44336)); paused|

### 示例1
进度条部件LinearProgressIndicator得valueColor，valueColor得类型是Animation<Color>,需要接收一个动画类型，
* value：value表示当前的进度，取值范围为[0,1]；如果value为null时则指示器会执行一个循环动画（模糊进度）；当
value不为null时，指示器为一个具体进度的进度条。
* backgroundColor：指示器的背景色。
*valueColor: 指示器的进度条颜色；值得注意的是，该值类型是Animation<Color>，这允许我们对进度条的颜色也可以
指定动画。如果我们不需要对进度条颜色执行动画，换言之，我们想对进度条应用一种固定的颜色，此时我们可以通过
AlwaysStoppedAnimation来指定。

```aidl
Center(
      child: Container(
        child: LinearProgressIndicator(
          //value为null时，会执行循环动画
          value: 0.5,
          //进度条的背景颜色
          backgroundColor: Colors.grey,
          //valueColor类型是Animation<Color>,允许我们
          //对进度条的颜色指定动画，如果我们不需要对进度条颜色执行动画，对进度条应用
          //一种固定颜色，可以使用AlwaysStoppedAnimation来指定
          valueColor: AlwaysStoppedAnimation(Colors.red),
        ),
      ),
    );
```

![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/alwaysStoppedAnimation/res/alwaysStoppedAnimation.png)
