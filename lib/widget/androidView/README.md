# AndroidView
Flutter 1.26.0-1.0.pre ,Dart 2.12.0 (build 2.12.0-141.0.dev)<br>

在Flutter小部件上嵌入一个Android的View,与UiKitView对应，UiKitView是在Flutter小部件上嵌入一个ios的View.
[源码](https://github.com/DingMouRen/flutter_widget_wiki)

|属性|释义|
|---|---|
|viewType → String|这个小部件要嵌入的Android视图类型的唯一标识符。|
|clipBehavior → Clip|内容被剪辑的方式，默认是Clip.hardEdge，在曲线或非轴向直线会呈现锯齿状，可以使用Clip.antiAlias|
|creationParams → dynamic|在PlatformViewFactory调用create时，作为参数传递|
|creationParamsCodec → MessageCodec?|对其进行编码的编解码器|
|gestureRecognizers → Set<Factory<OneSequenceGestureRecognizer>>?|哪些手势应该转发到Android视图。|
|hitTestBehavior → PlatformViewHitTestBehavior|这个小部件在冲击测试期间应该如何表现。|
|layoutDirection → TextDirection?|android端view的文字方向|
|onPlatformViewCreated → PlatformViewCreatedCallback?|当PlatformView创建时的回调|

#### 示例1 ：在Flutter页面的一个小部件嵌入一个原生的Android视图。
要实现在Flutter页面的一个小部件嵌入一个原生的Android视图，会分为Flutter端和Android端两端的工作。
我们这里实现在Flutter页面的一个小部件嵌入一个原生的Android视图，并可以两端进行通信。Flutter视图显示Android端
按钮被点击的次数，而Android视图显示Flutter端按钮被点击的次数，每一次点击都会立即更新视图。<br><br>
![img](https://github.com/DingMouRen/flutter_widget_wiki/raw/master/lib/widget/androidView/res/android_view.gif)

Flutter端需要做的：
* 1.在Flutter的一个小部件中声明一个AndroidView小部件，并指定AndroidView的viewType.
* 2.在Flutter中声明通道对象，并设置监听，当Android端调用通道约定的函数时，获取Android端传来的Android按钮点击次数，
并更新Flutter的视图。
* 3.点击Flutter按钮时，通过通道函数将Flutter按钮被点击次数传递给Android端。

Flutter端第一步：在Android端需要注册PlatformView的工程对象，与Flutter端产生映射关系，Map<String, PlatformViewFactory> viewFactories，
viewFactories来存储它们的关系。
```aidl
AndroidView(
            //与 Android 原生交互时唯一标识符,与Android端有对应关系
            viewType: 'plugins.flutter.io/android_view',
          ),
```
Flutter端第二步：
```aidl
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
```
Flutter端第三步：
```aidl
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

```

Adroid端需要做的：
* 1.声明一个类MyPlatformView实现PlatformView接口，必须实现getView()函数，这里定义了要显示的Android视图。
* 2.声明一个类MyPlatformViewFactory继承PlatformViewFactory类，重写create函数，这里返回上面我们声明的MyPlatformView。
* 3.声明一个类MyPlatformViewPlugin实现FlutterPlugin和MethodChannel.MethodCallHandler接口，FlutterPlugin会在
FlutterEngine绑定和解绑的时候产生回调，我们可以在这两个时机分别进行注册和注销的工作。在MyPlatformViewPlugin
中创建通道对象，并监听来自Flutter端的函数调用，并进行之后的刷新Android视图。
* 4.将MyPlatformViewPlugin注册到FlutterEngine

Android端第一步:
```aidl
public class MyPlatformView implements PlatformView {

    private View mNativeView;
    private TextView mTvCount;
    private Button mBtnAdd;
    private int mAndroidButtonClickedNumber = 0;
    private MethodChannel mChannel;

    public MyPlatformView(Context context, MethodChannel channel) {
        mChannel = channel;
        mNativeView = LayoutInflater.from(context).inflate(R.layout.view_my_flutter,null,false);
        mTvCount = mNativeView.findViewById(R.id.tv_count);
        mBtnAdd = mNativeView.findViewById(R.id.btn_add);

        mTvCount.setText("Flutter的按钮被点击数量：0");

        //点击安卓按钮并将安卓按钮点击数量通知Flutter端
        mBtnAdd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                mAndroidButtonClickedNumber = mAndroidButtonClickedNumber + 1;
                Map<String,String> map = new HashMap<>();
                map.put("AndroidButtonClickedNumber",mAndroidButtonClickedNumber+"");
                mChannel.invokeMethod("addAndroidButtonAndNoticeFlutter",map);
            }
        });
    }

    /**
     * 返回嵌入到Flutter页面中的安卓原生view
     * @return
     */
    @Override
    public View getView() {
        return mNativeView;
    }

    /**
     * Flutter的按钮被点击数量+1
     * 安卓原生会显示Flutter的按钮被点击的数量
     */
    public void showFlutterButtonClickedNumber(String number){
        mTvCount.setText("Flutter的按钮被点击数量："+number);
    }
    @Override
    public void onFlutterViewAttached(@NonNull View flutterView) { }
    @Override
    public void onFlutterViewDetached() { }
    @Override
    public void dispose() { }


}

```
Android端第二步：
```aidl

public class MyPlatformViewFactory extends PlatformViewFactory {

    private MethodChannel mChannel;
    public MyPlatformView mMyPlatformView;

    public MyPlatformViewFactory(MessageCodec<Object> createArgsCodec, MethodChannel channel) {
        super(createArgsCodec);
        mChannel = channel;
    }

    /**
     *
     * @param context
     * @param viewId 在Flutter端AndroidView的唯一识别id
     * @param args Flutter端AndroidView传递过来的参数
     * @return
     */
    @Override
    public PlatformView create(Context context, int viewId, Object args) {
        mMyPlatformView = new MyPlatformView(context,mChannel);
        return mMyPlatformView;
    }

}

```
Android端第三步:
```aidl

public class MyPlatformViewPlugin implements FlutterPlugin, MethodChannel.MethodCallHandler {

    private MethodChannel mChannel;
    private MyPlatformViewFactory mMyPlatformViewFactory;


    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        //创建通道对象，通道名称与Flutter端通道的名称一致
        mChannel = new  MethodChannel(binding.getBinaryMessenger(),"plugins.flutter.io/channel_name_1");
        //注册此通道的监听
        mChannel.setMethodCallHandler(this);
        //创建PlatformView的工厂对象
        mMyPlatformViewFactory = new MyPlatformViewFactory(StandardMessageCodec.INSTANCE,mChannel);
        //在Flutter引擎上注册PlatformView的工厂对象
        binding.getPlatformViewRegistry()
                .registerViewFactory("plugins.flutter.io/android_view",mMyPlatformViewFactory);
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        //注销通道的监听
        mChannel.setMethodCallHandler(null);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        //获取监听到的函数名称
        String methodName = call.method;
        if (methodName.equals("addFlutterButtonAndNoticeAndroid")){
            String flutterButtonClickedNumber = call.argument("FlutterButtonClickedNumber");
            mMyPlatformViewFactory.mMyPlatformView.showFlutterButtonClickedNumber(flutterButtonClickedNumber);
        }
    }
}

```
Android端第四步:
```aidl
public class MainActivity extends FlutterActivity {
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        //注册插件
        flutterEngine.getPlugins().add(new MyPlatformViewPlugin());
    }
}

```

注：
1.此例子是在纯Flutter项目中实现。<br>
2.需要flutter端和android端重新编译才能看到效果。
