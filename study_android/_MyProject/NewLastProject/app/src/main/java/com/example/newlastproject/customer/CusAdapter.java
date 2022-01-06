package com.example.newlastproject.customer;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.newlastproject.LoginActivity;
import com.example.newlastproject.R;

import java.util.ArrayList;

public class CusAdapter extends RecyclerView.Adapter<CusAdapter.Viewholder> {

    Context context;
    ArrayList<CustomerVO> list;
    LayoutInflater inflater;

    public CusAdapter(Context context, ArrayList<CustomerVO> list) {
        this.context = context;
        this.list = list;
        this.inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
    }

    @NonNull
    @Override
    public Viewholder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View itemView = inflater.inflate(R.layout.cus_rcy_item, parent, false);
        //Viewholder viewholder = new Viewholder(itemView);
        return new Viewholder(itemView);
    }

    @Override
    public void onBindViewHolder(@NonNull Viewholder holder, int position) {
        holder.bind(holder,position);
    }

    @Override
    public int getItemCount() {
        return list.size();
    }

    public class Viewholder extends RecyclerView.ViewHolder{
        ImageView imgv;
        TextView tv_no, tv_name, tv_phohe;
        public Viewholder(@NonNull View itemView) {
            super(itemView);
            imgv = itemView.findViewById(R.id.cus_imgv);
            tv_no = itemView.findViewById(R.id.cus_tv_no);
            tv_name = itemView.findViewById(R.id.cus_tv_name);
            tv_phohe = itemView.findViewById(R.id.cus_tv_phone);
        }
        public void bind(@NonNull Viewholder holder, int position){
            holder.tv_no.setText(list.get(position).getNo()+"");
            holder.tv_name.setText(list.get(position).getName()+"");
            holder.tv_phohe.setText(list.get(position).getPhone()+"");

            holder.tv_name.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Intent intent = new Intent(context, LoginActivity.class);
                    context.startActivity(intent);
                }
            });

        }
    }


}//CusAdapter


