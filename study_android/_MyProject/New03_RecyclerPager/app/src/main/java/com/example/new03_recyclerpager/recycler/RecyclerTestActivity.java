package com.example.new03_recyclerpager.recycler;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;

import com.example.new03_recyclerpager.R;

public class RecyclerTestActivity extends AppCompatActivity {

    RecyclerView rec1, rec2;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_recycler_test);

        rec1 = findViewById(R.id.recyclertestview1);
        rec2 = findViewById(R.id.recyclertestview2);

    }
}