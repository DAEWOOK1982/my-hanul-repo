package com.example.newlastproject.customer;

import android.content.Context;
import android.os.Bundle;

import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.example.newlastproject.R;

import java.util.ArrayList;

public class CusFragment extends Fragment {
    RecyclerView cus_rc_view;
    Context context;
    SwipeRefreshLayout swipe;



    public CusFragment(Context context) {
        this.context = context;
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rooView = inflater.inflate(R.layout.fragment_cus, container, false);
        cus_rc_view = rooView.findViewById(R.id.cus_rcview);
        swipe = rooView.findViewById(R.id.cus_swipe);
        dataSelect();

        swipe.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() {
            @Override
            public void onRefresh() {
                dataSelect();
                swipe.setRefreshing(false);
            }
        });
        return rooView;
    }
    public void dataSelect(){
        CustomerDAO dao = new CustomerDAO();
        ArrayList<CustomerVO> list = dao.list();
        LinearLayoutManager manager = new LinearLayoutManager(
                context, RecyclerView.VERTICAL, false);
        CusAdapter adapter = new CusAdapter(context, list   );
        cus_rc_view.setLayoutManager(manager);
        cus_rc_view.setAdapter(adapter);
    }
}