package com.example.new03_recyclerpager.pager;

import androidx.appcompat.app.AppCompatActivity;
import androidx.viewpager2.widget.ViewPager2;

import android.os.Bundle;

import com.example.new03_recyclerpager.R;
import com.tbuonomo.viewpagerdotsindicator.DotsIndicator;

public class PagerActivity extends AppCompatActivity {
    ViewPager2 pager2;
    DotsIndicator indicator;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pager);
        pager2 = findViewById(R.id.pager2);
        Pager2Adapter adapter = new Pager2Adapter(PagerActivity.this);
        indicator = findViewById(R.id.dots_indicator);
        pager2.setAdapter(adapter);
        indicator.setViewPager2(pager2);


    }
}