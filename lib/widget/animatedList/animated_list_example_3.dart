import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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