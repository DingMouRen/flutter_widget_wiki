# AbsorbPointer
简述：一个吸收指针事件得小部件。

|  属性 |释义|
|---| --- |
|  absorbing |是否吸收指针事件，默认是true|
|ignoringSemantics|是否编译时可以忽略语义树|

#### 示例1
Stack相对布局中两个按钮，上面得按钮通过AbsorbPointer包裹，设置absorbing为true,表示吸收指针事件，点击上面按钮是没有点击事件发生得，
```
 Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        SizedBox(
          width: 200.0,
          height: 100.0,
          child: ElevatedButton(
            onPressed: () {
              showToast('点击了');
            },
            child: null,
          ),
        ),
        SizedBox(
          width: 100.0,
          height: 200.0,
          child: AbsorbPointer(
            absorbing: true,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue.shade200,
              ),
              onPressed: () {
                showToast('点击了');
              },
              child: null,
            ),
          ),
        ),
      ],
    );
```
![img1](https://github.com/DingMouRen/flutter_widget_wiki/blob/master/lib/widget/absorbPointer/res/absorbpointer_1.gif)

#### 示例2
我们也可以通过AbsorbPointer小部件来控制ListView得滑动,切换absorbing为true得时候，ListView就不能滑动了。
```
 Column(
      children: [
        Container(
          width: double.infinity,
          height: 400,
          child: AbsorbPointer(
            absorbing: _absorbing,
            child: ListView.builder(itemBuilder: (context, index) {
              return Container(
                color: Colors.deepOrange[400],
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Text(index.toString()),
              );
            }),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _absorbing = !_absorbing;
                showToast("当前absorbing：$_absorbing");
              });
            },
            child: Text("切换absorbing"),
          ),
        )
      ],
    );
```
![absortpointer_2](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/absorbPointer/res/absorbpointer_2.gif)


#### 示例3
AbsorbPointer可以统一控制多个小部件，不用为每一个小部件进行设置。
```
Center(
      child: Column(
       children: [
         AbsorbPointer(
           absorbing: _absorbing,
           child: Column(
             children: [
               ElevatedButton(onPressed: () => showToast('点击了'), child: Text("按钮",style: TextStyle(color: Colors.white))),
               ElevatedButton(onPressed: () => showToast('点击了'), child: Text("按钮",style: TextStyle(color: Colors.white))),
               ElevatedButton(onPressed: () => showToast('点击了'), child: Text("按钮",style: TextStyle(color: Colors.white))),
               ElevatedButton(onPressed: () => showToast('点击了'), child: Text("按钮",style: TextStyle(color: Colors.white))),
             ],
           ),
         ),
         ElevatedButton(
           onPressed: () {
             setState(() {
               _absorbing = !_absorbing;
               showToast("当前absorbing：$_absorbing");
             });
           },
           child: Text("切换absorbing"),
         ),
       ],
      ),
    );
```
![img3](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/absorbPointer/res/absorbpointer_3.gif)

#### 示例4 AbsorbPointer与IgnorePointer的区别

AbsorbPointer在absorbing为true时，自身有指针事件，而子部件没有指针事件;absorbing为false时,AbsorbPointer自身和子部件都有指针事件。
```
Center(
      child: Container(
        height: 200,
        width: 200,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Listener(
              onPointerDown: (v) {
                showToast('点击了红色',position: ToastPosition.top);
              },
              child: Container(
                color: Colors.red,
              ),
            ),
            Listener(
              onPointerDown: (v) {
                showToast('点击了AbsorbPointer自身',position: ToastPosition.center);
              },
              child: AbsorbPointer(
                absorbing: false,
                child: Listener(
                  onPointerDown: (v) {
                    showToast('点击了AbsorbPointer的子部件',position: ToastPosition.bottom);
                  },
                  child: Container(
                    color: Colors.blue,
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
```
AbsorbPointer在absorbing为true时，效果如下:<br>
![img4](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/absorbPointer/res/absorbpointer_4.gif)<br>
AbsorbPointer在absorbing为false时，效果如下:<br>
![img5](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/absorbPointer/res/absorbpointer_5.gif)

IgnorePointer在ignoring为true时，自身和子部件都没有指针事件，好像被直接穿透一样,指针事件向下面的部件传递;
在ignoring为false时,自身和子部件都有指针事件。
```
Center(
      child: Container(
        height: 200,
        width: 200,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Listener(
              onPointerDown: (v) {
                showToast('点击了红色',position: ToastPosition.top);
              },
              child: Container(
                color: Colors.red,
              ),
            ),
            Listener(
              onPointerDown: (v) {
                showToast('点击了IgnorePointer自身',position: ToastPosition.center);
              },
              child: IgnorePointer(
                ignoring: false,
                child: Listener(
                  onPointerDown: (v) {
                    showToast('点击了IgnorePointer的子部件',position: ToastPosition.bottom);
                  },
                  child: Container(
                    color: Colors.blue,
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
```
IgnorePointer在ignoring为true时,效果如下:<br>
![img6](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/absorbPointer/res/absorbpointer_6.gif)<br>
IgnorePointer在ignoring为false时,效果如下:<br>
![img7](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/absorbPointer/res/absorbpointer_7.gif)