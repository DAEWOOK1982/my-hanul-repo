package com.example.new01_intent;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity
        implements View.OnClickListener{
    public int reqCode = 1001;//100번 이상으로 코드를 만들기.
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Button btn1 = findViewById(R.id.button1);

        btn1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(MainActivity.this, "버튼1", Toast.LENGTH_SHORT).show();
                Intent intent = new Intent(MainActivity.this , SubActivity1.class);
                startActivity(intent);
            }
        });
        Button btn2 = findViewById(R.id.button2);
        btn2.setOnClickListener(this);

        //↓ 오류날 확률 조금 높고 , 위젯이 가지고있는 기본적인 메소드 들만 제공함.
        findViewById(R.id.button3).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //Activity를 Intent로 다른 Activity에 요청을 하고 그결과를
                //받아와야 하는 상황 ( 일반적으로는 Activity요청해놓고 결과를 받아오는
                //경우는 드물다.
                //묵시적(암시적) Intent : Url , Camera , 전화번호부 등 여러가지
                //안드로이드 OS에서 제공하고 내가 소스로 가지고있지 않은부분을 요청하고나서는
                //그결과를 받아와야하기때문에 사용. (ex.Camera사진찍고,갤러리 )
                //※보내는쪽에서 코드를 주고 다시 그결과를 코드로 받는것
                //1-> 다시 1->받는것 성공 1-> 다시 다른값 받음 실패
                Intent intent = new Intent(MainActivity.this , SubActivity3.class);
                startActivityForResult(intent, reqCode);
                Toast.makeText(MainActivity.this, "버튼3", Toast.LENGTH_SHORT).show();
            }
        });
    }

    @Override
    public void onClick(View v) {
       // if(v.getId() == R.id.button2){
        // method1();
      //  }
        //Button2 눌렀을때 DTO객체 => SubActivity2

        TestDTO dto = new TestDTO("id","pw");
        Intent intent = new Intent(MainActivity.this , SubActivity2.class);
        intent.putExtra("param1" , 100);//int형태의 데이터를 다른 클래스로 이동시킬때 사용
        intent.putExtra("param2","str value");
        intent.putExtra("dto" ,dto );
        //dto객체는 반드시 직렬화 (Serializable ) 을 해줘야함.
        startActivity(intent);
        Toast.makeText(MainActivity.this, "버튼2", Toast.LENGTH_SHORT).show();
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        //우리가 보냈던 코드를 다시 받아왔는지. 비교를 해줌.
        //보냈던 코드가 그대로 나왔다는것은 ↑ intent에 데이터가 있다고 보면됨.
        if(requestCode == reqCode){
            Toast.makeText(MainActivity.this, "받음", Toast.LENGTH_SHORT).show();
        }
    }
}