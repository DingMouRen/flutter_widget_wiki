import 'package:flutter/material.dart';

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