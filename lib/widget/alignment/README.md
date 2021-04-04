# Alignment
Alignment表示矩形内的一点。
Alignment(0.0, 0.0)代表矩形的中心。从-1.0到+1.0的距离是从矩形的一侧到矩形的另一侧的距离。因此，水平（或垂直）2.0
个单位等于矩形的宽度（或高度）。
Alignment(-1.0, -1.0) 代表矩形的左上角。
Alignment(1.0, 1.0) 代表矩形的右下角。
Alignment(0.0, 3.0) 表示一个点，该点相对于矩形水平居中，垂直于矩形底部低于矩形的高度。<br>

|属性|释义|
|---|---|
|x → double|水平方向上的距离分数|
|y → double|竖直方向上的距离分数|



|函数|释义|
|---|---|
|add(AlignmentGeometry other) → AlignmentGeometry|返回两个AlignmentGeometry对象的和|
|alongOffset(Offset other) → Offset|返回给定偏移量方向上的这个分数的偏移量|
|alongSize(Size other) → Offset|返回给定大小内的这个分数的偏移量。|
|inscribe(Size size, Rect rect) → Rect|返回一个给定大小的矩形，按照此对齐方式在给定矩形内对齐|
|resolve(TextDirection? direction) → Alignment|将此实例转换为对齐，对齐使用文字坐标(x坐标显式表示从左边到左边的距离)。|
|withinRect(Rect rect) → Offset|返回给定矩形中的分数点。|

#### 示例1
add(AlignmentGeometry other)：返回两个AlignmentGeometry对象的和
```
Alignment alienment1 = Alignment(1,1);
Alignment alienment2 = Alignment(1,1);
Alignment sum = alienment1.add(alienment2) as Alignment;
print('sum:${sum}');
结果日志:
flutter: sum:Alignment(2.0, 2.0)
```
Alignment(0,0)表示Offset(1,1)中心的位置，也就是Offset(0.5,0.5),从-1.0到1.0表示Offset的x或y从0到1的距离，但是以比例分数的
方式来表示。对应关系如下:<br>
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/alignment/res/alignment_1.png)<br>


#### 示例2
alongOffset(Offset other)：返回给定偏移量方向上的Alignment分数的偏移量
```
Alignment alignment = Alignment(1, 0);
Offset offset = Offset(1, 1);
Offset result = alignment.alongOffset(offset);
print('result:$result');
结果日志;
flutter: result:Offset(1.0, 0.5)
```

#### 示例3
alongSize(Size other)，与alongOffset(Offset other)类似，返回给定大小内的这个分数的偏移量。
```
Alignment alignment = Alignment(0, 0);
Size size = Size(10, 10);
Offset result = alignment.alongSize(size);
print('result:$result');
结果日志:
flutter: result:Offset(5.0, 5.0)
```

#### 示例4
inscribe(Size size, Rect rect) ，返回一个给定大小的矩形，按照此对齐方式在给定矩形内对齐
```
Alignment alignment = Alignment(1, 1);
Size size = Size(6,6);
Rect rect = Rect.fromLTRB(0, 0, 10, 10);
Rect result = alignment.inscribe(size, rect);
print('result:$result');
结果日志：
flutter: result:Rect.fromLTRB(4.0, 4.0, 10.0, 10.0)
```
示例5
withinRect(Rect rect)：返回给定矩形中的分数点。
```
Alignment alignment = Alignment(0, 0);
Rect rect = Rect.fromLTRB(0, 0, 10, 10);
Offset result = alignment.withinRect(rect);
print('result:$result');
结果日志:
flutter: result:Offset(5.0, 5.0)
```