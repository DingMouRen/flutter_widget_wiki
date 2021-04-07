import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class AlwaysScrollableScrollPhysicsPage extends StatefulWidget {
  AlwaysScrollableScrollPhysicsPage({Key? key}) : super(key: key);

  @override
  _AlwaysScrollableScrollPhysicsPageState createState() {
    return _AlwaysScrollableScrollPhysicsPageState();
  }
}

class _AlwaysScrollableScrollPhysicsPageState
    extends State<AlwaysScrollableScrollPhysicsPage>
    with TickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();

  final FixedExtentScrollController _fixedExtentScrollController =
      new FixedExtentScrollController();

  int _itemCount = 50;

  late PageController pageController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    pageController = PageController(
      initialPage: 0,
    );
    _tabController = new TabController(length: 4, vsync: this);
    pageController.addListener(() {
      _tabController.animateTo(pageController.page!.toInt());
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlwaysScrollableScrollPhysicsPage'),
      ),
      body: NotificationListener(
        // child: _test1(),
        // child: _test2(),
        // child: _test3(),
        child: _test4(),

        onNotification: (scrollNotification) {
          print('$scrollNotification');
          if (scrollNotification is ScrollStartNotification) {
            showToast("小部件已开始滚动 ");
          }
          return true;
        },
      ),
    );
  }

  _test1() {
    return ListView.builder(
      controller: scrollController,
      // physics: const AlwaysScrollableScrollPhysics(),
      physics: const BouncingScrollPhysics(),
      // physics: const ClampingScrollPhysics (),
      // physics: const NeverScrollableScrollPhysics (),
      // physics: const PageScrollPhysics (),
      // physics: const RangeMaintainingScrollPhysics(),
      itemCount: _itemCount,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 16, right: 16),
          child: Container(
            color: Colors.deepOrange[400],
            height: 50,
            alignment: Alignment.center,
            child: Text(
              '$index',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  _test2() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          //ListWheelScrollView中间的分割线
          Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: 2, color: Colors.black),
                    bottom: BorderSide(width: 2, color: Colors.black))),
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
                  child: Text(
                    "$index",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                );
              }),
              itemExtent: 60.0,
            ),
          ),
        ],
      ),
    );
  }

  _test3() {
    return PageView(
      //能达到跟页面捕捉一样的效果
      physics: PageScrollPhysics(),
      //关闭页面捕捉
      pageSnapping: true,
      scrollDirection: Axis.horizontal, //设置滚动方向，默认是水平方向
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
  }

  _test4() {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          child: TabBar(
            onTap: (val) {
              pageController.animateToPage(val,
                  duration: Duration(milliseconds: 100),
                  curve: Curves.elasticInOut);
            },
            unselectedLabelColor: Colors.grey.shade700,
            indicatorColor: Colors.red,
            indicatorWeight: 2.0,
            labelColor: Colors.red,
            controller: _tabController,
            tabs: [
              new Tab(
                child: Text(
                  "Green",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              new Tab(
                child: Text(
                  "Blue",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              new Tab(
                child: Text(
                  "Orange",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              new Tab(
                child: Text(
                  "Yellow",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
            ],
            indicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
        Expanded(
          child: PageView(
            scrollDirection: Axis.vertical,
            allowImplicitScrolling: false,
            pageSnapping: false,
            physics: RangeMaintainingScrollPhysics(),
            controller: pageController,
            // key: sliverListtKey,
            children: [
              Container(
                color: Colors.green,
                height: 100,
              ),
              Container(
                color: Colors.blue,
                height: 700,
              ),
              Container(
                color: Colors.orange,
                height: 500,
              ),
              Container(
                color: Colors.yellow,
                height: 900,
              )
            ],
          ),
        )
      ],
    );
  }
}
