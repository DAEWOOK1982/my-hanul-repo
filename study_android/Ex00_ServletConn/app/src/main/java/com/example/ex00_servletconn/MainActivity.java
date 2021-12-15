package com.example.ex00_servletconn;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;

public class MainActivity extends AppCompatActivity {
//1.Manifest 권한이 아파치 톰캣 http등 설정을 먼저확인.
//2.Gradle Script중에 두번쨰 build.gradle에 lib들이 추가되었는지 원본소스랑 비교.
//3.실행했을때 오류없음 => 진행.
//4.Controller에 가기위해서는 AsynckTask가 필요함.
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
}