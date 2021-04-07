package com.dingmouren.flutter_widget_wiki;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import androidx.annotation.NonNull;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;

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
