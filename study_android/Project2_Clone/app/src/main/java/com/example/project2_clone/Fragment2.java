package com.example.project2_clone;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import java.util.concurrent.ExecutionException;

public class Fragment2 extends Fragment {
    //Fragment 수명주기 LifeCycle을 가진다.
    //onCreateView <= Fragment

    Button btn1 ;
    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        //ViewGroup <-
        //setContetView (Activity == rootView)
        ViewGroup rootView  = (ViewGroup)
                inflater.inflate(R.layout.fragment2 , container , false);
        //↑ 디자인과 붙일 컨테이너(layout) xml <->java 연결
        // Button Onclick 만들기.
        btn1 = rootView.findViewById(R.id.btn1_frag2);
        btn1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //Common클래스에 접근하는게 x
                //어씽크테스크 <= 접근 O
                StringServlet ss = new StringServlet();
                try {
                    ss.execute().get();
                } catch (ExecutionException e) {
                    e.printStackTrace();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                //excute뒤에 get을 안붙이면 바로 결과를 받을수가없음.
                //background에서 비동기로 계속해서 작업을함.
            }
        });
        return rootView;
    }
}