package com.example.eric.sis;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;

public class MainActivity extends AppCompatActivity {
    private ImageView iv;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        iv = (ImageView) findViewById(R.id.logo);
        Animation myanim = AnimationUtils.loadAnimation(this,R.anim.mytransition);
        iv.startAnimation(myanim);
        Thread mythread = new Thread()
        {
            public void run() {
                try {
                    sleep(1500);
                    Intent homeIntent = new Intent(MainActivity.this, login.class);
                    overridePendingTransition(R.anim.slide_in_left,R.transition.explode);
                    startActivity(homeIntent);
                    finish();
                } catch (InterruptedException e){
                    e.printStackTrace();
                }
            }
        };
        mythread.start();
    }
}
