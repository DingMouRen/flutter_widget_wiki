# AnimatedContainer
Flutter 1.26.0-1.0.pre ,Dart 2.12.0 (build 2.12.0-141.0.dev)<br>
简述:此处的AnimatedContainer与Container没有任何关系，它们的类关系是不同的，
AnimatedContainer->ImplicitlyAnimatedWidget->StatefulWidget->Widget,<br>
Container->StatelessWidget->Widget.<br>
AnimatedContainer继承自StatefulWidget，返回了一个Container部件。它们共享很多属性，AnimatedContainer在
属性变化时都会呈现渐变的效果。

|属性|释义|
|---|---|
|alignment → AlignmentGeometry?|在容器内对齐子部件。|
|child → Widget?|子部件|
|decoration → Decoration?|子部件后面的装饰|
|clipBehavior → Clip|在decoration不为空的情况下，才有效果，指定剪切的模式,|
|constraints → BoxConstraints?|用来约束大小，最小宽度、最大宽度、最小高度、最大高度，width和height即使设置更大的宽高也不会有效果|
|curve → Curve|动画运用的曲线|
|decoration → Decoration?|动画执行时长|
|foregroundDecoration → Decoration?|子部件前面的装饰|
|margin → EdgeInsetsGeometry?|部件的外边距|
|padding → EdgeInsetsGeometry?|部件的内边距|
|onEnd → VoidCallback?|动画执行完的回调|
|transform → Matrix4?|应用矩阵变换|
|transformAlignment → AlignmentGeometry?|transform不为空时起效果，指定矩阵的原点对齐方式|

#### 示例1 
在AnimatedContainer的child为null，并且不指定宽高的情况下，AnimatedContainer会铺满父控件。点击FloatingActionButton
会改变AnimatedContainer的圆角半径，AnimatedContainer会呈现出渐变动画，圆角半径逐渐变化。
```dart
 AnimatedContainer(
        duration: Duration(seconds: 1),
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular( selected?200:0,),
          color: Colors.purple,
        ),
      );
```
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedContainer/res/animated_container_1.gif)

#### 示例2
AnimatedContainer在不指定宽高，同时不设置alignment属性的情况下，设置child不为空，AnimatedContainer会包裹住
child部件，大小跟子部件一致。
```dart
 AnimatedContainer(
      duration: Duration(seconds: 1),
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular( selected?200:0,),
        color: Colors.purple,
      ),
      child:FlutterLogo(size: 100,)
    );
```
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedContainer/res/animated_container_2.png)

#### 示例3
AnimatedContainer在不指定宽高，child不为空，同时alignment不为空的情况下,AnimatedContainer会铺满父部件，子部件
会按照AnimatedContainer的alignment排列对齐。
```dart
 AnimatedContainer(
        alignment: Alignment.center,
        duration: Duration(seconds: 1),
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular( selected?200:0,),
          color: Colors.purple,
        ),
        child:FlutterLogo(size: 100,)
    );
```
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedContainer/res/animated_container_3.png)

#### 示例4 属性decoration
属性decoration会在子部件后面添加一些装饰，举个小例子，添加圆角半径，圆角等于正方形边长一半时就变成了圆。
注：AnimatedContainer的color属性与decoration属性不能同时存在，decoration中含有一个color属性。关于Decoration
会在后面再讲。
```dart
Center(
      child: AnimatedContainer(
          width: 200,
          height: 200,
          duration: Duration(seconds: 1),
          decoration: selected
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.deepOrange[400],
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.deepOrange[400],
                ),
          child: FlutterLogo(
            size: 100,
          )),
    );
```
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedContainer/res/animated_container_4.gif)

#### 示例5 属性clipBehavior
只有在decoration属性不为空的情况下，clipBehavior才有效果。clipBehavior指定的是剪切模式，例如上个例子就是对
AnimatedContainer的圆角进行剪切，不同的剪切模式消耗的时间和呈现的效果都会不一样。<br>
Clip模式：<br>
* Clip.none:不剪切。这是大多数小部件的默认选项:如果内容没有超出小部件边界，就不要为剪切支付任何性能成本。
* Clip.hardEdge:剪切，不应用抗锯齿。曲线和非轴向直线会呈现锯齿状。
* Clip.antiAlias:剪切，应用抗锯齿。该模式具有抗锯齿剪切边缘，以实现更平滑的外观。通常用来处理圆和圆弧。
* Clip.antiAliasWithSaveLayer:应用抗锯齿，并会分配一个屏幕外缓存区。在最后被剪切和合成回来之前，所有后续的油漆都在缓冲区上执行。
性能排序：Clip.none > Clip.hardEdge > Clip.antiAlias > Clip.antiAliasWithSaveLayer

#### 示例6 constraints
constraints用来约束部件的宽高，即使设置更大的宽高都不会有效果。
```dart
 Center(
      child: AnimatedContainer(
          width: 200,
          height: 200,
          constraints: BoxConstraints(maxWidth: 20,maxHeight: 50),
          duration: Duration(seconds: 1),
          decoration: selected
              ? BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.deepOrange[400],
          )
              : BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.deepOrange[400],
          ),
          child: FlutterLogo(
            size: 100,
          )),
    );
```
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedContainer/res/animated_container_5.gif)

#### 示例7 curve 动画曲线
[动画曲线查看](https://github.com/DingMouRen/flutter_widget_wiki/blob/master/lib/widget/animatedAlign/README.md)
```dart
 Center(
      child: AnimatedContainer(
          width: 200,
          height: 200,
          curve: Curves.bounceOut,
          duration: Duration(seconds: 1),
          decoration: selected
              ? BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.deepOrange[400],
          )
              : BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.deepOrange[400],
          ),
          child: FlutterLogo(
            size: 100,
          )),
    );
  }
```
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedContainer/res/animated_container_6.gif)

#### 示例8 foregroundDecoration
foregroundDecoration是绘制在子部件前面的装饰，下面的例子，decoration绘制了一个黑色的背景作为子部件后面
的装饰，然后在子部件前面绘制了一个红色带透明度的背景，前面的装饰会遮挡住子部件。
```dart
Center(
      child: AnimatedContainer(
          width: 200,
          height: 200,
          duration: Duration(seconds: 1),
          decoration:  BoxDecoration(
            color: Colors.black,
          ),
          foregroundDecoration: selected
              ? BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.red.withAlpha(200),
          )
              : BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.red.withAlpha(200),
          ),
          child: FlutterLogo(
            size: 100,
          )),
    );
  }
```
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedContainer/res/animated_container_7.gif)

#### 示例9 margin
Container作为父部件，AnimatedContainer作为子部件，一定要设置Container的alignment，否则AnimatedContainer会
铺满Container的，
```dart
 Center(
      child: Container(
        color: Colors.black,
        width: 300,
        height: 300,
        //如果不设置alignment,AnimatedContainer会铺满父部件Container
        alignment: Alignment.topLeft,
        child: AnimatedContainer(
            width: 200,
            height: 200,
            margin: selected?EdgeInsets.only(left: 0):EdgeInsets.only(left: 50),
            color: Colors.red,
            duration: Duration(seconds: 1),
            child: FlutterLogo(
              size: 100,
            )),
      ),
    );
  }
```
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedContainer/res/animated_container_8.gif)<br>
如果把margin: selected?EdgeInsets.only(left: 0):EdgeInsets.only(left: 50),改成margin: selected?EdgeInsets.only(left: 0):EdgeInsets.only(left: 300)<br>
会呈现一下效果:<br>
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedContainer/res/animated_container_9.gif)<br>

#### 示例10
Container作为父部件，AnimatedContainer作为子部件，一定要设置Container的alignment，否则AnimatedContainer会
铺满Container的，
```dart
Center(
      child: Container(
        color: Colors.black,
        width: 300,
        height: 300,
        //如果不设置alignment,AnimatedContainer会铺满父部件Container
        alignment: Alignment.topLeft,
        child: AnimatedContainer(
            width: 200,
            height: 200,
            padding: selected?EdgeInsets.only(left: 50):EdgeInsets.only(left: 0),
            decoration:  BoxDecoration(
              color: Colors.red,
            ),
            duration: Duration(seconds: 1),
            child: FlutterLogo(
              size: 100,
            )),
      ),
    );
  }
```
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedContainer/res/animated_container_10.gif)<br>
如果把padding: selected?EdgeInsets.only(left: 50):EdgeInsets.only(left: 0),修改成padding: selected?EdgeInsets.only(left: 300):EdgeInsets.only(left: 0),
<br>
会呈现以下效果:<br>
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedContainer/res/animated_container_11.gif)<br>

#### 示例11 transform
transform是用来矩阵变换的，矩阵变换后面详细讲。这里让AnimatedContainer绕Y轴旋转
```dart
Row(
      children: [
        Expanded(flex: 1, child: Container(color: Colors.greenAccent,)),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              width: 200,
              height: 200,
              color: Colors.yellowAccent,
              transform: Matrix4.rotationY(selected ? pi : 2 * pi),
              onEnd: () {
                selected = !selected;
                setState(() {});
              },
              duration: Duration(seconds: 1),
              child: FlutterLogo(
                size: 100,
              ),
            ),
          ),
        ),
      ],
    );
```
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedContainer/res/animated_container_12.gif)<br>

#### 示例12 transformAlignment
transformAlignment在transform不为空时起效果，指定矩阵原点的对齐方式。
```dart
Row(
      children: [
        Expanded(flex: 1, child: Container(color: Colors.greenAccent,)),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              width: 200,
              height: 200,
              color: Colors.yellowAccent,
              alignment: Alignment.topLeft,
              transform: Matrix4.rotationY(selected ? pi : 2 * pi),
              transformAlignment: Alignment.center,
              onEnd: () {
                selected = !selected;
                setState(() {});
              },
              duration: Duration(seconds: 1),
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),
        ),
      ],
    );
```
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedContainer/res/animated_container_13.gif)
