### Accumulator
简述：Flutter内置的累加器，默认初始值为0

| 属性/函数  |释义|
|---| --- |
|   value|获取此时的值|
|increment(int addend)|累加的函数|

#### 示例
```
 @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Accumulator"),
      ),
      body: Center(
        child: Text('${_accumulator.value}',style: TextStyle(fontSize: 20),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

          setState(() {
            _accumulator.increment(1);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
```