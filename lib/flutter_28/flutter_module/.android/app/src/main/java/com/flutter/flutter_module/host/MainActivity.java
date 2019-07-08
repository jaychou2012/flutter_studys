package com.flutter.flutter_module.host;

import android.Manifest;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import org.w3c.dom.Text;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "samples.flutter.io/battery";
    public static final String STREAM = "com.flutter.eventchannel/stream";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // Flutter插件注册
        GeneratedPluginRegistrant.registerWith(this);

        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                        switch (call.method) {
                            case "getBatteryLevel":
                                int batteryLevel = getBatteryLevel();
                                if (batteryLevel != -1) {
                                    result.success(batteryLevel);
                                } else {
                                    result.error("UNAVAILABLE", "Battery level not available.", null);
                                }
                                break;
                            case "requestPermission":
                                final String permissionName = call.argument("permissionName");
                                final int permissionId = call.argument("permissionId");
                                boolean hasPermission = requestPermission();
                                System.out.println(permissionName + "   " + permissionId);
                                result.success(hasPermission);
                                break;
                            case "addNativeLayout":
                                // 添加布局到现有的Flutter布局中
                                FrameLayout v = (FrameLayout) findViewById(android.R.id.content);
                                View linearLayout = new LinearLayout(MainActivity.this);
                                linearLayout.setBackgroundColor(0xff00BFFF);
                                ViewGroup.MarginLayoutParams marginLayoutParams = new ViewGroup.MarginLayoutParams(600, 600);
                                ((LinearLayout) linearLayout).setGravity(Gravity.CENTER);
                                marginLayoutParams.setMargins(200, 230, 0, 0);
                                linearLayout.setLayoutParams(marginLayoutParams);
                                v.addView(linearLayout);
                                TextView textView = new TextView(MainActivity.this);
                                textView.setText("我是原生布局/控件");
                                textView.setTextColor(Color.parseColor("#FFFFFF"));
                                textView.setGravity(Gravity.CENTER);
                                ((LinearLayout) linearLayout).addView(textView);
                                break;
                            case "toNativeActivity":
                                Intent intent = new Intent(MainActivity.this, NativeActivity.class);
                                startActivity(intent);
                                break;
                            default:
                                result.notImplemented();
                        }
                    }
                });

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

    private int getBatteryLevel() {
        int batteryLevel = -1;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        } else {
            Intent intent = new ContextWrapper(getApplicationContext()).
                    registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        }
        return batteryLevel;
    }

    private boolean requestPermission() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if (checkSelfPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE) == PackageManager.PERMISSION_DENIED) {
                requestPermissions(
                        new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE},
                        0);
                return false;
            } else {
                return true;
            }
        }
        return true;
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (requestCode == 0) {
            if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                Toast.makeText(this, "权限已申请", Toast.LENGTH_SHORT).show();
            } else {
                Toast.makeText(this, "权限已拒绝", Toast.LENGTH_SHORT).show();
            }
        }
    }
}
