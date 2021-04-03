### **Align**
**Align**是一个小部件，它在自己内部对齐它的子部件，并可以根据子部件的大小选择自己的大小。

| 属性  |释义|
|---|---|
|alignment → AlignmentGeometry  |如何对其child,Alignment是AlignmentGeometry的子类|
|heightFactor → double?|值必须>=0,当父部件没有设置宽高时有效果，Align的高度为子部件高度乘以heightFactor|
|widthFactor → double?|值必须>=0,当父部件没有设置宽高时有效果，Align的宽度为子部件宽度乘以widthFactor|

#### 示例1
父部件有固定宽高的情况下，alignment来指定子部件的位置。中心是父部件的中心，

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
Alignment的坐标系是以父部件的中心作为中心(0,0),如下
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/align/res/align_2.png)<br>
