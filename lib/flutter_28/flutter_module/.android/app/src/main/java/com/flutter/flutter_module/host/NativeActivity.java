package com.flutter.flutter_module.host;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.design.widget.CoordinatorLayout;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.NavigationView;
import android.support.design.widget.Snackbar;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;

public class NativeActivity extends Activity {
    @BindView(R.id.toolBar)
    Toolbar toolBar;
    @BindView(R.id.btn)
    Button btn;
    @BindView(R.id.btn_event_channel)
    Button btn_event_channel;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_native);
        ButterKnife.bind(this);
        initView();
    }

    private void initView() {
        toolBar.setTitle("title");
        toolBar.setNavigationIcon(R.mipmap.ic_launcher_round);
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent
                        = new Intent(NativeActivity.this, NativeFlutterActivity.class);
                startActivity(intent);
            }
        });

        btn_event_channel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent
                        = new Intent(NativeActivity.this, EventChannelActivity.class);
                startActivity(intent);
            }
        });
    }
}
