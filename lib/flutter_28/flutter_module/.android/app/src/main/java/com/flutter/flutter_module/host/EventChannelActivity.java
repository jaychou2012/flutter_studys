package com.flutter.flutter_module.host;

import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.util.Log;

import butterknife.BindView;
import butterknife.ButterKnife;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.EventChannel;

public class EventChannelActivity extends FlutterActivity {
    public static final String STREAM = "com.flutter.eventchannel/stream";
    @BindView(R.id.toolBar)
    Toolbar toolBar;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_event_channel);
        ButterKnife.bind(this);
        toolBar.setTitle("EventChannel");
        new EventChannel(getFlutterView(), STREAM).setStreamHandler(
                new EventChannel.StreamHandler() {
                    @Override
                    public void onListen(Object args, final EventChannel.EventSink events) {
                        Log.i("info", "adding listener");
                        events.success("从原生发送过来的指令信息");
                    }

                    @Override
                    public void onCancel(Object args) {
                        Log.i("info", "cancelling listener");
                    }
                }
        );
    }
}
