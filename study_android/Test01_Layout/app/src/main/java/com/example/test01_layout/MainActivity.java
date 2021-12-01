package com.example.test01_layout;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    Button btn1, btn2;
    ImageView imgv1, imgv2, imgv3, imgv4;
   // ArrayList<ImageView> listimg = new ArrayList<>();
   // ImageView[] arrimg = { findViewById(R.id.imgv1) };
    int[] index = {1 , 1};
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        btn1 = findViewById(R.id.btn1);
        btn2 = findViewById(R.id.btn2);
        imgv1 = findViewById(R.id.imgv1);
        imgv2 = findViewById(R.id.imgv2);
        imgv3 = findViewById(R.id.imgv3);
        imgv4 = findViewById(R.id.imgv4);

        btn1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                imgv1.setVisibility(View.GONE);
                imgv2.setVisibility(View.GONE);
                if(index[0] == 1){
                    imgv2.setVisibility(View.VISIBLE);
                    index[0] = 0;
                }else{
                    imgv1.setVisibility(View.VISIBLE);
                    index[0] =1;
                }
            }
        });

       btn2.setOnClickListener(new View.OnClickListener() {
           @Override
           public void onClick(View v) {
               imgv3.setVisibility(View.GONE);
               imgv4.setVisibility(View.GONE);
               if(index[1] == 1){
                   imgv3.setVisibility(View.VISIBLE);
                   index[1] = 0;
               }else{
                   imgv4.setVisibility(View.VISIBLE);
                   index[1] =1;
               }
           }
       });

    }
}