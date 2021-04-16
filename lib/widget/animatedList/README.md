# AnimatedList
简述:一个滚动容器，可以为item被插入或移除时添加动画效果。列表数据的插入和删除有进出场动画需要调用AnimatedListState
指定的方法，只删除原数据并调用setState方法是没有动画效果的。nimatedListState.insertItem或者AnimatedListState.removeItem并不会更新实际数据，需要手动处理。<br>
获取AnimatedListState的两种方法:<br>
* 通过AnimatedList.of(context)方法
```dart
AnimatedList.of(context).insertItem(index);
AnimatedList.of(context).removeItem(index, (context,animation)=>{});
```
* 通过设置key
```dart
final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
AnimatedList(
        key: _listKey,
        initialItemCount: _list.length,
        itemBuilder: (BuildContext context, int index, Animation animation) {
          return _buildItem(_list[index].toString(), animation);
        },
      )

```

|属性|释义|
|---|---|
|controller → ScrollController?|控制滚动到的位置|
|initialItemCount → int|列表视图初始化的条目数量|
|itemBuilder → AnimatedListItemBuilder|必须的，用于构建视图小部件|
|padding → EdgeInsetsGeometry?|滚动视图的内边距|
|physics → ScrollPhysics?|滚动到边界时的滚动特性|
|primary → bool?|这是否是与父控件PrimaryScrollController相关联的主滚动视图。|
|reverse → bool|滚动视图是否向阅读方向滚动。|
|scrollDirection → Axis|滚动视图的滚动轴。|
|shrinkWrap → bool|滚动视图在滚动方向上的范围是否应该由所查看的内容决定。|


|静态函数|释义|
|---|---|
|maybeOf(BuildContext context) → AnimatedListState?|包含给定上下文的这个类的最近实例的状态。|
|of(BuildContext context) → AnimatedListState|包含给定上下文的这个类的最近实例的状态。|

#### 示例1
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedList/res/animated_list_1.gif)<br>

实现一个添加item时呈现回弹效果动画，删除item时呈现移动效果的例子。<br>
```dart
 class AnimatedListExample1 extends StatefulWidget {
   AnimatedListExample1({Key? key}) : super(key: key);
 
   @override
   _AnimatedListExample1State createState() {
     return _AnimatedListExample1State();
   }
 }
 
 class _AnimatedListExample1State extends State<AnimatedListExample1> {
   //声明列表数据
   List<String> _list = ['Email','Email'];
   //用来执行添加/移除的动画，但是不会改变_list的数据
   final GlobalKey<AnimatedListState> _listStateKey = GlobalKey<AnimatedListState>();
 
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('AnimatedList示例1'),
       ),
       body: AnimatedList(
         key: _listStateKey,
         initialItemCount: _list.length,
         itemBuilder: (BuildContext context, int index, Animation<double> animation) {
           return _buildItem(index, animation,true);
         },
       ),
       floatingActionButton: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: <Widget>[
           FloatingActionButton(
             onPressed: () => _addItem(),
             child: Icon(Icons.add),
           ),
           SizedBox(
             width: 60,
           ),
           FloatingActionButton(
             onPressed: () => _removeItem(),
             child: Icon(Icons.remove),
           ),
         ],
       ),
     );
   }
 
   //添加一条数据
   void _addItem(){
     _listStateKey.currentState!.insertItem(0,duration: Duration(seconds: 1));
     _list.insert(0, 'Email');
   }
 
   //删除一条数据
   void _removeItem(){
     _listStateKey.currentState!.removeItem(0, (context, animation) => _buildItem(0, animation,false),duration: Duration(seconds: 1));
     _list.removeAt(0);
   }
 
   //返回列表ui
   _buildItem(int index,Animation animation,bool slideIn){
     return SlideTransition(
       position: animation.drive(CurveTween(curve:slideIn? Curves.bounceOut:Curves.easeOutQuint)).drive(Tween<Offset>(begin: Offset(1,1),end: Offset(0,1))),
       child: Container(
         color: Colors.deepOrange[400],
         margin: EdgeInsets.only(left: 16,right: 16,top: 5),
         child: ListTile(
           title: Text('${_list[index]}',style: TextStyle(color: Colors.white),),
           trailing: IconButton(
             onPressed: (){
 
             },
             icon: Icon(Icons.mail_outline,color: Colors.white,),
           ),
         ),
       ),
     );
   }
 
 
 }

```

#### 示例2 
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedList/res/animated_list_2.gif)<br>
```dart
class AnimatedListExample2 extends StatefulWidget {
  AnimatedListExample2({Key? key}) : super(key: key);

  @override
  _AnimatedListExample2State createState() {
    return _AnimatedListExample2State();
  }
}

class _AnimatedListExample2State extends State<AnimatedListExample2> {
  //列表
  final _list = [];
  //列表的key
  final GlobalKey<AnimatedListState> _animatedListKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedList示例2'),
      ),
      body: AnimatedList(
        key: _animatedListKey,
          initialItemCount: 0,
          padding: EdgeInsets.all(10),
          itemBuilder: (context,index,animation){
            return _buildItem(index,animation);
          }
      ),
      floatingActionButton: FloatingActionButton(onPressed: _addItem,child: Icon(Icons.add,color: Colors.white,),),
    );
  }

  Widget _buildItem(int index, Animation<double> animation) {
    return SizeTransition(
        sizeFactor: animation,
      child: Card(
        margin: EdgeInsets.all(10),
        color: Colors.deepOrange[400],
        elevation: 10,
        child: ListTile(
          contentPadding: EdgeInsets.all(15),
          title: Text(_list[index], style: TextStyle(fontSize: 24,color: Colors.white)),
          trailing: IconButton(
            onPressed: (){
              _removeItem(index);
            },
            icon: Icon(Icons.delete,color: Colors.white,),
          ),
        ),
      ),
    );
  }

  //添加新的item到列表
  void _addItem(){
    _list.insert(0, "Item ${_list.length + 1}");
    _animatedListKey.currentState!.insertItem(0, duration: Duration(seconds: 1));
  }

  //删除一条数据
  void _removeItem(int index){
    var temp = _list[index];
    _animatedListKey.currentState!.removeItem(index,
            (context, animation) {
              return SizeTransition(
                  sizeFactor: animation,
                  child: Card(
                    margin: EdgeInsets.all(10),
                    color: Colors.deepOrange[400],
                    elevation: 10,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(15),
                      title: Text(temp, style: TextStyle(fontSize: 24,color: Colors.white)),
                      trailing: IconButton(
                        onPressed: (){

                        },
                        icon: Icon(Icons.delete,color: Colors.white,),
                      ),
                    ),
                  ),
              );
            },
      duration: Duration(seconds: 1)
    );
    _list.removeAt(index);
  }
}
```

#### 示例3
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/animatedList/res/animated_list_3.gif)<br>
```dart
class AnimatedListExample3 extends StatefulWidget {
  AnimatedListExample3({Key? key}) : super(key: key);

  @override
  _AnimatedListExample3State createState() {
    return _AnimatedListExample3State();
  }
}

class _AnimatedListExample3State extends State<AnimatedListExample3> {

  final _items = ['Item 0'];
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  void _addItem() {
    _items.insert(0, "Item ${_items.length + 1}");
    _key.currentState!.insertItem(0, duration: Duration(seconds: 1));
  }

  void _removeItem(int index, BuildContext context) {
    var temp = _items[index];
    AnimatedList.of(context).removeItem(index, (_, animation) {
      return FadeTransition(
        opacity: animation,
        child: SizeTransition(
          sizeFactor: animation,
          child: SizedBox(
            height: 150,
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 20),
              elevation: 10,
              color: Colors.deepOrange[400],
              child: Center(
                child: Text(temp, style: TextStyle(fontSize: 28,color: Colors.white)),
              ),
            ),
          ),
        ),
      );
    }, duration: Duration(seconds: 1));

    _items.removeAt(index);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedList示例3'),
      ),
      body: AnimatedList(
        key: _key,
        initialItemCount: _items.length,
        padding: EdgeInsets.all(10),
        itemBuilder: (context,index,animation){
          return _buildItem(context,index,animation);
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: _addItem,child: Icon(Icons.add,color: Colors.white,),),
    );
  }

  Widget _buildItem(BuildContext context, int index, Animation<double> animation) {
    print('animation:${animation.value}');
    return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1, -0.5),
          end: Offset(0,0)
        ).animate(animation),
        child: RotationTransition(
          turns: animation,
          child: SizeTransition(
            axis: Axis.vertical,
            sizeFactor: animation,
            child: SizedBox(
              height: 150,
              child: InkWell(
                onTap: ()=>_removeItem(index, context),
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  elevation: 10,
                  color: Colors.deepOrange[400],
                  child: Center(child: Text(_items[index],style: TextStyle(fontSize: 28,color: Colors.white)),),
                ) ,
              ),
            ),
          ),
        ),
    );
  }
}
```
