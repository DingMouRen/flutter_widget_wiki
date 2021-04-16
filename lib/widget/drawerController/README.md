# DrawerController
简述:为Drawer提供交互行为

|属性|释义|
|---|---|
|alignment → DrawerAlignment|抽屉视图打开的位置，有两种：DrawerAlignment.start左边侧滑打开，DrawerAlignment.end右边侧滑打开|
|child → Widget|抽屉视图小部件，不局限与Drawer,任何widget都可以|
|dragStartBehavior → DragStartBehavior|确定启动行为开始的方式，有两种：DragStartBehavior.start在检测到拖动手势时将开始滚动拖动行为，DragStartBehavior.down将在首次检测到向下事件时开始，这里还有一个edgeDragWidth的范围问题|
|drawerCallback → DrawerCallback?|当抽屉视图打开或关闭时调用，会连续回调，在这里的操作要注意哦|
|edgeDragWidth → double?|可以打开抽屉视图的滑动宽度范围|
|isDrawerOpen → bool|抽屉视图是否打开，可以用作初始化的状态，打开/关闭|
|scrimColor → Color?|用来模糊下面内容的颜色|

#### 示例1
Scaffold可以设置Drawer小部件，DrawerController为Drawer提供交互行为，如果在Scaffold的drawer属性设置
DrawerController会出现以下情况。<br>
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/drawerController/res/drawer_controller_1.gif)<br>
```dart
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DrawerController'),),
      drawer:DrawerController(
        alignment: DrawerAlignment.start,
        child: Drawer(
          child: Container(color: Colors.red,),
        ),
      )

    );
  }
```
我们在打开Drawer小部件的时候，会先出现一个灰色的着色，然后才是我们设置的Drawer。为什么会出现这么个情况呢？
这是因为在Scaffold中，drawer属性接收的Widget被设置给Scaffold自身的DrawerController,这么写的话，就是写了
两层的DrawerController,所以会出现以上的情况，以上的写法是不可取的。

#### 示例2 scrimColor
scrimColor是用来模糊下面内容的颜色。<br>
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/drawerController/res/drawer_controller_2.gif)<br>

#### 示例3 
DrawerController可以侧滑打开，也可以通过点击调用函数来打开。DrawerController本身是一个StatefulWidget,它的State类含有很多操作函数，
我们可以获取到DrawerControllerState来进行操作。<br>
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/drawerController/res/drawer_controller_3.gif)<br>

```dart

class _DrawerControllerPageState extends State<DrawerControllerPage> {

  GlobalKey<DrawerControllerState> _drawerControllerKey = GlobalKey<DrawerControllerState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DrawerController'),),
      body: Stack(
        children: [
          Container(color: Colors.white,),
          DrawerController(
            key: _drawerControllerKey,
            alignment: DrawerAlignment.start,
            isDrawerOpen: true,
            child: Drawer(
              child: Container(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => _drawerControllerKey.currentState!.open(),
            child: Text('打开'),
          ),
          SizedBox(
            width: 60,
          ),
          FloatingActionButton(
            onPressed: () => _drawerControllerKey.currentState!.close(),
            child: Text('关闭'),
          ),
        ],
      ),
    );
  }

```

#### 示例4 控制抽屉视图的宽度
DrawerController的子部件可以是任何子部件，Drawer部件会有一个固定的宽度比例，如果想抽屉视图占据屏幕宽度的一半，怎么办呢？
我们只要设置DrawerController的子部件的宽度是屏幕的宽度一半就好了。同理我们就可以控制抽屉视图显示的比例了<br>
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/drawerController/res/drawer_controller_4.gif)<br>
```dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DrawerController'),),
      body:  Stack(
        children: [
          Container(color: Colors.white,),
          DrawerController(
            alignment: DrawerAlignment.start,
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              color: Colors.blue,
            )
          ),
        ],
      ),

    );
  }
```
#### 示例5 左滑右滑都是新的视图
发挥想象力，我们需要这样的视图，右滑拉出左边视图，左滑拉出右边视图，我们可以完成这样的布局。<br>
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/drawerController/res/drawer_controller_5.gif)<br>
```dart

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('DrawerController'),),
      body:  Stack(
        children: [
          Container(color: Colors.white,child: Center(child: Text('中间',style: TextStyle(fontSize: 40),)),),
          DrawerController(
            alignment: DrawerAlignment.start,
            isDrawerOpen: false,
            child:  Container(color: Colors.red,child: Center(child: Text('左边',style: TextStyle(fontSize: 40),)),),
          ),
          DrawerController(
            alignment: DrawerAlignment.end,
            isDrawerOpen: false,
            child:  Container(color: Colors.blue,child: Center(child: Text('右边',style: TextStyle(fontSize: 40),)),),
          ),
        ],
      ),
    );
  }
```
