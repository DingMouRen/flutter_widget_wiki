# PageView 
简述:一个可滚动的列表，一页页的滚动。页面视图的每个子视图都必须跟视图窗口大小一致。

|属性|释义|
|---|---|
|allowImplicitScrolling → bool|控制小部件的页面是否会响应RenderObject.showOnScreen，这将允许隐式可访问性滚动。将此标志设置为false，当可访问性焦点到达当前页面的末尾，并且用户试图将其移动到下一个元素时，焦点将遍历到页面视图之外的下一个小部件。将此标志设置为true，当可访问性焦点到达当前页面的末尾，并且用户试图将其移动到下一个元素时，焦点将在页面视图中遍历到下一页。|
|childrenDelegate → SliverChildDelegate|为PageView提供子页面的委托|
|clipBehavior → Clip|裁剪的处理方式，默认是Clip.hardEdge|
|controller → PageController|用于控制此页面视图滚动到的位置|
|dragStartBehavior → DragStartBehavior|确定启动行为开始的方式，有两种：DragStartBehavior.start在检测到拖动手势时将开始滚动拖动行为，DragStartBehavior.down将在首次检测到向下事件时开始，这里还有一个edgeDragWidth的范围问题|
|onPageChanged → ValueChanged<int>?|页面滑动的回调|
|pageSnapping → bool|是否是一页页的滚动|
|physics → ScrollPhysics?|滚动到边界时的特性|
|restorationId → String?|保存和恢复可滚动对象的滚动偏移量的恢复ID。|
|reverse → bool|是否倒序|
|scrollDirection → Axis|滑动方向，横向或竖向|

# PageController
简述：PageView的控制器。页面控制器允许您操作在PageView中可见的页面。除了能够控制页面视图内内容的像素偏移量之外，
PageController还允许您根据页面控制偏移量，即视口大小的增量。<br>

|属性|释义|
|---|---|
|hasListeners → bool|当前是否注册了侦听器|
|initialPage → int|PageView第一次创建时显示第几页|
|initialScrollOffset → double|用于偏移量的初始值|
|keepPage → bool|使用PageStorage保存当前页面，如果重新创建了该控制器的可滚动页面，则恢复该页面。|
|keepScrollOffset → bool|每次滚动完成时，使用PageStorage保存当前滚动偏移量，并在重新创建该控制器的可滚动对象时恢复它|
|offset → double|可滚动小部件的当前滚动偏移量。|
|page → double?|当前显示的页|
|position → ScrollPosition|返回附加的ScrollPosition，从中可以获得ScrollView的实际滚动偏移量。|
|viewportFraction → double|每个页面应该占据的视口部分。默认为1.0，这意味着每个页面都在滚动方向填充viewport。|


|函数|释义|
|---|---|
|addListener(VoidCallback listener) → void|添加监听器|
|animateTo(double offset, {required Duration duration, required Curve curve}) → Future<void>|从当前值变成给定的值，呈现曲线动画|
|animateToPage(int page, {required Duration duration, required Curve curve}) → Future<void>|从当前页跳往指定页，呈现曲线动画|
|attach(ScrollPosition position) → void|用这个控制器注册给定的位置。|
|createScrollPosition(ScrollPhysics physics, ScrollContext context, ScrollPosition? oldPosition) → ScrollPosition|为可滚动小部件创建ScrollPosition。|
|jumpTo(double value) → void|将滚动位置从当前值跳转到给定值，没有动画，也不检查新值是否在范围内。|
|jumpToPage(int page) → void|跳往指定页，可以跨页|
|nextPage({required Duration duration, required Curve curve}) → Future<void>|跳往下一页，呈现曲线动画|
|previousPage({required Duration duration, required Curve curve}) → Future<void>|跳往上一页，呈现曲线动画|
|removeListener(VoidCallback listener) → void|移除监听器|
