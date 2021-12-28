package com.example.new02_fragmentlistview;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.FragmentManager;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import com.example.new02_fragmentlistview.Fragments.Fragment1;
import com.example.new02_fragmentlistview.Fragments.Test01_Fragment;

public class MainActivity extends AppCompatActivity {
    Button btn1;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);



        FragmentManager manager = getSupportFragmentManager();

        Test01_Fragment fragment = new Test01_Fragment();

        manager.beginTransaction().replace(R.id.container, fragment).commit();

        btn1 =findViewById(R.id.btn1);

        btn1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Fragment1 fragment1 = new Fragment1();
                FragmentManager manager = getSupportFragmentManager();
                manager.beginTransaction().replace(R.id.container, fragment1).commit();
            }
        });


    }
}