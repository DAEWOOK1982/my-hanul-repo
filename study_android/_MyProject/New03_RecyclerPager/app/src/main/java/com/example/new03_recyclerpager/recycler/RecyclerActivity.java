package com.example.new03_recyclerpager.recycler;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;
import android.view.LayoutInflater;

import com.example.new03_recyclerpager.R;

import java.util.ArrayList;

public class RecyclerActivity extends AppCompatActivity {

    RecyclerView recyclerView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_recycler);
        recyclerView = findViewById(R.id.recyclerview);

        ArrayList<RecyclerDTO> list  = new ArrayList<>();
        list.add(new RecyclerDTO(R.drawable.ic_launcher_foreground, "test1"));
        list.add(new RecyclerDTO(R.drawable.ic_launcher_foreground, "test2"));

        LayoutInflater inflater = (LayoutInflater) getSystemService(LAYOUT_INFLATER_SERVICE);
        LayoutInflater inflater1 = LayoutInflater.from(RecyclerActivity.this);
        //RecyclerAdapter adapter = new RecyclerAdapter(RecyclerActivity.this, list, inflater);
        RecyclerAdapter adapter1 = new RecyclerAdapter(RecyclerActivity.this, list);

        LinearLayoutManager layoutManager = new LinearLayoutManager(
                RecyclerActivity.this, recyclerView.VERTICAL, false
        );
        recyclerView.setLayoutManager(layoutManager);
        recyclerView.setAdapter(adapter1);


    }
}