package com.example.new02_fragmentlistview.List;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.FragmentManager;

import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;

import com.example.new02_fragmentlistview.R;

import java.util.ArrayList;


public class ListActivity extends AppCompatActivity {

    ListView listView;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_list);
        listView = findViewById(R.id.listview);
        ArrayList<String> list = new ArrayList<>();
        for(int i = 0; i < 50; i++){
            list.add("테스트"+i);
        }
        ArrayAdapter<String> adapter = new ArrayAdapter<>(
                getApplicationContext(), android.R.layout.simple_list_item_1, list
        );
        listView.setAdapter(adapter);

    }
}