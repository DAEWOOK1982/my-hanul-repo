package com.example.new01_intent;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import androidx.appcompat.app.AppCompatActivity;

public class SubActivity3 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sub3);
        findViewById(R.id.btn_sub3).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //Intent로 데이터를 다시 MainActivity로 보내줄수가있음.
                //intent를 초기화시켜놓고 putExtra
                Intent intent = new Intent();
                intent.putExtra("data","data");
                setResult(RESULT_OK,intent);
                finish();
            }
        });
    }
}