package com.example.new02_fragmentlistview.List;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.widget.ListView;

import com.example.new02_fragmentlistview.R;

import java.util.ArrayList;

public class TestListCusActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_test_list_cus);
        ArrayList<String> list = new ArrayList<>();







        LayoutInflater inflater = (LayoutInflater) getSystemService(LAYOUT_INFLATER_SERVICE);

        CustomAdapter adapter = new CustomAdapter(list, inflater);

        ListView listView = findViewById(R.id.testlistview);
        listView.setAdapter(adapter);
    }
}