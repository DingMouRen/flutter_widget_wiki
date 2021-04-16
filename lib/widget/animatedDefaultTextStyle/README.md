# AnimatedDefaultTextStyle
简述：DefaultTextStyle的动画版本，在给定的时间内，当给定的样式发生变化时，呈现渐变动画。

|属性|释义|
|---|---|
|child → Widget|子部件|
|style → TextStyle|文本的样式，样式属性变化时会呈现渐变动画，不能为空|
|textAlign → TextAlign?|文本在水平方向上如何对齐，属性变化时立即生效，没有动画效果|
|softWrap → bool|当文本长度大于父部件宽度时，是否换行，默认是true换行,属性变化时立即生效，没有动画效果|
|overflow → TextOverflow|如何处理视觉溢出。TextOverflow.clip：裁剪掉溢出的文本；TextOverflow.fade:将溢出的文本淡入透明;TextOverflow.ellipsis:使用省略号表示溢出的文本;TextOverflow.visible:在容器外呈现溢出文本。属性变化时立即生效，没有动画效果|
|maxLines → int?|最大文本行数,属性变化时立即生效，没有动画效果|
|textWidthBasis → TextWidthBasis|计算文本宽度时使用的策略。属性变化时立即生效，没有动画效果|
|textHeightBehavior → TextHeightBehavior?|定义段落如何将文本高度应用于第一行的上行和最后一行的下行。属性变化时立即生效，没有动画效果|
|curve → Curve|当这个容器的参数动画化时应用的动画曲线。|
|duration → Duration|容器的参数动画化的持续时间。|
|onEnd → VoidCallback?|动画结束时的回调|



#### 示例1 softWrap
softWrap是当文本长度大于父部件宽度时，是否换行，默认是true，表示换行。属性变化时立即生效，没有动画效果。
```dart
Center(
      child: Container(
        color: Colors.blue,
        width: 300,
        height: 200,
        child: AnimatedDefaultTextStyle(
          child: Text('Flutter Flutter Flutter Flutter Flutter Flutter Flutter Flutter'),
          style:  TextStyle(color:Colors.red,fontSize: 30),
          softWrap: _change?true:false,
          duration: Duration(seconds: 1),
        ),
      ),
    );
```
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedDefaultTextStyle/res/animated_text_style_1.gif)

#### 示例2 textWidthBasis
textWidthBasis是计算文本宽度时使用的策略。类型是TextWidthBasis。<br>
TextWidthBasis类型:<br>
* TextWidthBasis.parent:多行文本将占用父类给出的全部宽度。对于单行文本，只使用包含文本所需的最小宽度。一个常见的用例是标准的段落系列。
* TextWidthBasis.longestLine:宽度将完全足够包含最长的行而不再包含。一个常见的用例是聊天气泡。