# ScrollPhysics
简述：用来指定可滚动部件的滚动特性<br>
[神奇的ScrollPhysics与Simulation](https://zhuanlan.zhihu.com/p/84716922?from_voters_page=true)<br>

| ScrollPhysics  |释义|
|---|---|
| BouncingScrollPhysics   |允许滚动出边界，超过边界时会有回弹效果，会响应滚动事件|
|  ClampingScrollPhysics  |不允许滚动出边界，会响应滚动事件|
| AlwaysScrollableScrollPhysics   |一直响应滚动事件|
|  NeverScrollableScrollPhysics  |禁止滚动，不响应滚动事件|
|  FixedExtentScrollPhysics  |ListWheelScrollView滚轮使用时，item都会停止在中间位置，不会停在分割线|
|  PageScrollPhysics  |PageView滚轮使用时，item都会停止在一页，不会停止在分割线位置|
|  RangeMaintainingScrollPhysics  |当内容突然改变尺寸时，试图将滚动位置保持在范围内的滚动物理|

```
 Scaffold(
      appBar: AppBar(
        title: Text('AlwaysScrollableScrollPhysicsPage'),
      ),
      body: NotificationListener(
        child: Scaffold(
          body: ListView.builder(
            controller: scrollController,
            // physics: const AlwaysScrollableScrollPhysics(),
            physics: const BouncingScrollPhysics (),
            // physics: const ClampingScrollPhysics (),
            // physics: const NeverScrollableScrollPhysics (),
            itemCount: 50,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 16,right: 16),
                child: Container(
                  color: Colors.deepOrange[400],
                  height: 50,
                  alignment: Alignment.center,
                  child: Text('$index',style: TextStyle(color: Colors.white),),
                ),
              );
            },
          ),
        ),
        onNotification: (scrollNotification) {
          print('$scrollNotification');
          if (scrollNotification is ScrollStartNotification) {
            showToast("小部件已开始滚动 ");
          }
          return true;
        },
      ),
    );
```
#### BouncingScrollPhysics
只有在滚动控件的高度超过屏幕高度时，才会有效果。<br>
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/alwaysScrollableScrollPhysics/res/scroPhysics_1.gif)
```
日志：
Performing hot reload...
Syncing files to device Android SDK built for x86...
I/flutter ( 7619): ScrollStartNotification(depth: 0 (local), FixedScrollMetrics(0.0..[511.0]..2389.0), DragStartDetails(Offset(157.0, 393.5)))
I/flutter ( 7619): UserScrollNotification(depth: 0 (local), FixedScrollMetrics(0.0..[511.0]..2389.0), direction: ScrollDirection.reverse)
I/flutter ( 7619): ScrollUpdateNotification(depth: 0 (local), FixedScrollMetrics(1.2..[511.0]..2387.8), scrollDelta: 1.1666666666666667, DragUpdateDetails(Offset(0.0, -4.0)))
I/flutter ( 7619): ScrollUpdateNotification(depth: 0 (local), FixedScrollMetrics(4.7..[511.0]..2384.3), scrollDelta: 3.49609375, DragUpdateDetails(Offset(0.0, -3.5)))
I/flutter ( 7619): ScrollUpdateNotification(depth: 0 (local), FixedScrollMetrics(10.7..[511.0]..2378.3), scrollDelta: 5.996093750000001, DragUpdateDetails(Offset(0.0, -6.0)))
```

#### ClampingScrollPhysics
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/alwaysScrollableScrollPhysics/res/scroPhysics_2.gif)
```
Performing hot reload...
Syncing files to device Android SDK built for x86...
I/flutter ( 7619): ScrollStartNotification(depth: 0 (local), FixedScrollMetrics(0.0..[511.0]..2389.0), DragStartDetails(Offset(204.5, 141.5)))
I/flutter ( 7619): UserScrollNotification(depth: 0 (local), FixedScrollMetrics(0.0..[511.0]..2389.0), direction: ScrollDirection.forward)
I/flutter ( 7619): OverscrollIndicatorNotification(depth: 0 (local), side: leading edge)
I/flutter ( 7619): OverscrollNotification(depth: 0 (local), FixedScrollMetrics(0.0..[511.0]..2389.0), overscroll: -1.0, velocity: 0.0, DragUpdateDetails(Offset(0.0, 1.0)))
I/flutter ( 7619): OverscrollNotification(depth: 0 (local), FixedScrollMetrics(0.0..[511.0]..2389.0), overscroll: -6.0, velocity: 0.0, DragUpdateDetails(Offset(0.0, 6.0)))
```
#### AlwaysScrollableScrollPhysics
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/alwaysScrollableScrollPhysics/res/scroPhysics_2.gif)

```
Performing hot reload...
Syncing files to device Android SDK built for x86...
Reloaded 0 libraries in 154ms.
I/flutter ( 7619): ScrollStartNotification(depth: 0 (local), FixedScrollMetrics(0.0..[511.0]..2389.0), DragStartDetails(Offset(192.5, 169.0)))
I/flutter ( 7619): UserScrollNotification(depth: 0 (local), FixedScrollMetrics(0.0..[511.0]..2389.0), direction: ScrollDirection.forward)
I/flutter ( 7619): OverscrollIndicatorNotification(depth: 0 (local), side: leading edge)
I/flutter ( 7619): OverscrollNotification(depth: 0 (local), FixedScrollMetrics(0.0..[511.0]..2389.0), overscroll: -3.5, velocity: 0.0, DragUpdateDetails(Offset(0.0, 3.5)))
I/flutter ( 7619): OverscrollNotification(depth: 0 (local), FixedScrollMetrics(0.0..[511.0]..2389.0), overscroll: -1.0, velocity: 0.0, DragUpdateDetails(Offset(0.0, 1.0)))
```
#### NeverScrollableScrollPhysics
不会有滚动日志<br>
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/alwaysScrollableScrollPhysics/res/scroPhysics_3.gif)
```
Performing hot reload...
Syncing files to device Android SDK built for x86...
Reloaded 2 of 565 libraries in 750ms.

```

#### FixedExtentScrollPhysics
ListWheelScrollView使用时，每次滚动，都会停留在item处于正中央的位置，不会停留在分割线上。
```aidl
Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          //ListWheelScrollView中间的分割线
          Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: 2,color: Colors.black),
                    bottom: BorderSide(width: 2,color: Colors.black)
                )
            ),
          ),
          //滚轮view
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            height: 200,
            child: ListWheelScrollView(
              controller: _fixedExtentScrollController,
              physics: FixedExtentScrollPhysics(),
              children: List.generate(20, (index) {
                return Container(
                  width: double.infinity,
                  color: Colors.deepOrange[400],
                  alignment: Alignment.center,
                  child:  Text(
                        "$index",
                        style: TextStyle(fontSize: 18.0,color: Colors.white),
                      ),
                );
              }),
              itemExtent: 60.0,
            ),
          ),


        ],
      ),
    );
```
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/alwaysScrollableScrollPhysics/res/scroPhysics_4.gif)

#### PageScrollPhysics
PageView的pageSnapping属性默认是true,类似吸附效果一样，一页页滚动，每次只滚动一页，不会停止在分割线位置。<br>
如果pageSnapping设置成false,效果会如下<br>
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/alwaysScrollableScrollPhysics/res/scroPhysics_5.gif)<br>
PageScrollPhysics也可以做到pageSnapping为true的效果:<br>
```aidl
 PageView(
      //能达到跟页面捕捉一样的效果
      physics: PageScrollPhysics(),
      //关闭页面捕捉
      pageSnapping: false,
      scrollDirection:Axis.horizontal, //设置滚动方向，默认是水平方向
      children: [
        Container(
          color: Colors.orange,
          child: Center(
            child: Text('PageView-1'),
          ),
        ),

        Container(
          color: Colors.yellow,
          child: Center(
            child: Text('PageView-2'),
          ),
        ),

        Container(
          color: Colors.pinkAccent,
          child: Center(
            child: Text('PageView-3'),
          ),
        ),
      ],
    );
```
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/alwaysScrollableScrollPhysics/res/scroPhysics_6.gif)<br>

