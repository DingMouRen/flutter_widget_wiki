package com.dingmouren.flutter_widget_wiki;

import android.content.Context;

import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

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
