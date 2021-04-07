import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AndroidViewPage extends StatefulWidget {
  AndroidViewPage({Key? key}) : super(key: key);

  @override
  _AndroidViewPageState createState() {
    return _AndroidViewPageState();
  }
}

class _AndroidViewPageState extends State<AndroidViewPage> {
  //创建通道对象，与android端创建的通道对象名称一致
  MethodChannel _channel = MethodChannel("plugins.flutter.io/channel_name_1");
  //安卓端的按钮被点击的次数
  String _androidButtonClickedNumber = '0';
  //当前Flutter端按钮被点击的次数
  int _flutterButtonClickedNumber = 0;

  @override
  void initState() {
    super.initState();
    //设置此通道上的监听
    _channel.setMethodCallHandler(_handlerMethodCall);
  }

  Future<dynamic> _handlerMethodCall(MethodCall call) async{
    //获取通道监听中调用的函数名称
    String method = call.method;
    if(method == 'addAndroidButtonAndNoticeFlutter'){
       String androidButtonClickedNumber = call.arguments['AndroidButtonClickedNumber'];
       _androidButtonClickedNumber = androidButtonClickedNumber;
       setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    //注销通道的监听
    _channel.setMethodCallHandler(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AndroidView'),
      ),
      body: _test1(),
    );
  }

  _test1() {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Text("Flutter", style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              _flutterButtonClickedNumber = _flutterButtonClickedNumber + 1;
                              setState(() {});
                              Map<String,String> map = {'FlutterButtonClickedNumber':_flutterButtonClickedNumber.toString()};
                              //在Flutter端调用执行函数，将Flutter端按钮的点击次数传递到安卓端
                              _channel.invokeMethod("addFlutterButtonAndNoticeAndroid",map);
                            },
                            child: Text("+1", style:
                            TextStyle(fontSize: 18, color: Colors.white),
                            ),
                        ),
                        Text('Android的按钮被点击数量：$_androidButtonClickedNumber', style: TextStyle(fontSize: 18, color: Colors.white))
                      ],
                    ),
                  ),
                ],
              ),
            )),
        Expanded(
          flex: 1,
          child: AndroidView(
            //与 Android 原生交互时唯一标识符,与Android端有对应关系
            viewType: 'plugins.flutter.io/android_view',
          ),
        ),
      ],
    );
  }
}
