# AlignTransition
简述：Align的动画版本，可以为子部件的对齐属性设置平移动画，

|  属性 |释义|
|---|---|
|  alignment → Animation<AlignmentGeometry> |控制子部件Alignment的动画|
|child → Widget|子部件|
|heightFactor → double?|与Align用法相同，在AlignTransition父部件高度不确定的情况下起效果，AlignTransition高度为AlignTransition子部件的高度乘以heightFactor|
|widthFactor → double?|与Align用法相同，在AlignTransition父部件高度不确定的情况下起效果，AlignTransition宽度为AlignTransition子部件的高度乘以widthFactor|

#### 示例1
AlignTransition的使用需要与动画控制器AnimationController、Animation联合使用，AlignTransition
会将子部件的对齐方式以过渡动画的方式展现。
```
//动画控制器
AnimationController _controller = AnimationController(duration:Duration(seconds: 1),vsync: this);
//动画，Tween会在begin的Alignment.center与end的Alignment.topRight产生均匀的值，呈现平移的过渡动画效果。
Animation<AlignmentGeometry> _animation  = Tween<AlignmentGeometry>(
      begin: Alignment.center,
      end: Alignment.topRight,
    ).animate(_controller);
   
 Center(
      child: Column(
        children: [
           Container(
             // width: 200,
             height: 200,
             color:  Colors.deepOrange[400],
             child: AlignTransition(
               widthFactor: 2,
                 alignment: _animation,
                 child: FlutterLogo(size: 40,)),
           ),

          SizedBox(height: 20,),
          ElevatedButton(
              onPressed: (){
                _controller.forward();
              },
              child: Text("执行动画"))
        ],
      ),
    );
```
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/alignTransition/res/alignTransition_1.gif)
#### 示例2
在AlignTransition的父部件的高度或者宽度不确定的情况下，widthFactor/heightFactor才会起效果
```
Center(
      child: Column(
        children: [
          Container(
            color:  Colors.deepOrange[400],
            height: 200,//仅指定高度，不指定宽度
            child: AlignTransition(
                alignment: _animation,
                widthFactor: 2,//宽度为子部件的2倍
                child: FlutterLogo(size: 40,)),
          ),

          SizedBox(height: 20,),
          ElevatedButton(
              onPressed: (){
                _controller.forward();
              },
              child: Text("执行动画"))
        ],
      ),
    );
```
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/alignTransition/res/alignTransition_2.gif)
