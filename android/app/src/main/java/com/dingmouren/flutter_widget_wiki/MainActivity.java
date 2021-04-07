package com.dingmouren.flutter_widget_wiki;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;

public class MainActivity extends FlutterActivity {
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        //注册插件
        flutterEngine.getPlugins().add(new MyPlatformViewPlugin());
    }
}
