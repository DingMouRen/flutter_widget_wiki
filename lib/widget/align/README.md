### **Align**
**Align**是一个小部件，它在自己内部对齐它的子部件，并可以根据子部件的大小选择自己的大小。

| 属性  |释义|
|---|---|
|alignment → AlignmentGeometry  |如何对其child,Alignment是AlignmentGeometry的子类|
|heightFactor → double?|值必须>=0,当父部件没有设置宽高时有效果，Align的高度为子部件高度乘以heightFactor|
|widthFactor → double?|值必须>=0,当父部件没有设置宽高时有效果，Align的宽度为子部件宽度乘以widthFactor|

#### 示例1
父部件有固定宽高的情况下，alignment来指定child在自身父部件的位置。中心是父部件的中心，

```
 Center(
      child: Container(
        color: Colors.deepOrange[400],
        width: 200,
        height: 200,
        child: Align(
          alignment: Alignment.center,
          widthFactor: 1,
          heightFactor: 1,
          child: FlutterLogo(size: 60,),
        ),
      ),
    );
```
Alignment的9个位置。
```
  static const Alignment topLeft = Alignment(-1.0, -1.0);
  static const Alignment topCenter = Alignment(0.0, -1.0);
  static const Alignment topRight = Alignment(1.0, -1.0);
  static const Alignment centerLeft = Alignment(-1.0, 0.0);
  static const Alignment center = Alignment(0.0, 0.0);
  static const Alignment centerRight = Alignment(1.0, 0.0);
  static const Alignment bottomLeft = Alignment(-1.0, 1.0);
  static const Alignment bottomCenter = Alignment(0.0, 1.0);
  static const Alignment bottomRight = Alignment(1.0, 1.0);
```
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/align/res/align_1.png)<br>

#### 示例2
父部件有固定宽高的情况下，Alignment的坐标系是以父部件的中心作为中心(0,0),向右为x轴的正方向，向下为y轴的正方向，如下<br>
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/align/res/align_2.png)<br>

Alignment(x,y),x为在水平方向上的分数，y为在竖直方向的分数，x范围[-1,1],y范围[-1,1],子部件可以显示在范围内的任何位置。
```
Center(
      child: Container(
        color: Colors.deepOrange[400],
        width: 200,
        height: 200,
        child: Align(
          alignment: Alignment(-0.5,-1),
          child: FlutterLogo(size: 60,),
        ),
      ),
    );
```
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/align/res/align_3.png)<br>

#### 示例3
父部件有固定宽高的情况下，如果Alignment的x或y值不在[-1,1]之间的话，不会将child显示在自身父部件上。
```
Center(
      child: Container(
        color: Colors.deepOrange[400],
        width: 200,
        height: 200,
        child: Align(
          alignment: Alignment(-2,0),
          child: FlutterLogo(size: 60,),
        ),
      ),
    );
```
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/align/res/align_4.png)<br>

#### 示例4
在Align的父部件的宽高不确定的情况下，Align的widwidthFactor或heightFactor才有效果
```
Center(
      child: Container(
        color: Colors.deepOrange[400],
        child: Align(
            alignment: Alignment(-1,-1),
            widthFactor: 2,
            heightFactor: 2,
            child: FlutterLogo(size: 60,),
          ),
        ),
    );
```
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/align/res/align_5.png)<br><br>

```
Center(
      child: Container(
        color: Colors.deepOrange[400],
        child: Align(
            alignment: Alignment(-1,-1),
            widthFactor: 0.5,
            heightFactor: 0.5,
            child: FlutterLogo(size: 60,),
          ),
        ),
    );
```
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/align/res/align_6.png)<br><br>







