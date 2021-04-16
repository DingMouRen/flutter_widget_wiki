import 'package:flutter/material.dart';

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
