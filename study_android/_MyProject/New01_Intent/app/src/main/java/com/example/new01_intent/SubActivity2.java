package com.example.new01_intent;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

public class SubActivity2 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sub1);
        Intent intent = getIntent();//Main에서 보내준 Intent를 가져옴.
        if(intent != null){
            int param1 = intent.getIntExtra("param1" , 0);
            String param2 = intent.getStringExtra("param2");
            TestDTO dto = (TestDTO) intent.getSerializableExtra("dto");
            Toast.makeText(SubActivity2.this, param1 + param2 , Toast.LENGTH_SHORT).show();
            Toast.makeText(SubActivity2.this, dto.getId() + dto.getPw() , Toast.LENGTH_SHORT).show();
        }
    }
}