package com.example.eric.sis;

import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.design.widget.BottomNavigationView;
import android.support.v4.app.Fragment;
import android.support.v7.app.AppCompatActivity;
import android.view.MenuItem;
import android.widget.TextView;


public class Index extends AppCompatActivity implements BottomNavigationView.OnNavigationItemSelectedListener,ScheduleFragment.OnFragmentInteractionListener,GradesFragment.OnFragmentInteractionListener,ProfileFragment.OnFragmentInteractionListener{

    private TextView mTextMessage;

    @Override
    public boolean onNavigationItemSelected(@NonNull MenuItem item) {
        Fragment fragment = null;

        switch (item.getItemId()) {
            case R.id.navigation_home:
                fragment = new GradesFragment();
                break;

            case R.id.navigation_dashboard:
                fragment = new ScheduleFragment();
                break;

            case R.id.navigation_notifications:
                fragment = new ProfileFragment();
                break;


        }

        return loadFragment(fragment);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_index);

        loadFragment(new GradesFragment());

        BottomNavigationView navigation = findViewById(R.id.navigation);
        navigation.setOnNavigationItemSelectedListener(this);
    }


    private boolean loadFragment(Fragment fragment) {
        //switching fragment
        if (fragment != null) {
            getSupportFragmentManager()
                    .beginTransaction()
                    .replace(R.id.fragment_container, fragment)
                    .commit();
            return true;
        }
        return false;
    }

    @Override
    public void onFragmentInteraction(Uri uri) {

    }
}
