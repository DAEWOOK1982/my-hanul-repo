package com.example.new03_recyclerpager.pager;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.appcompat.view.menu.MenuView;
import androidx.recyclerview.widget.RecyclerView;

import com.example.new03_recyclerpager.R;
import com.example.new03_recyclerpager.recycler.RecyclerAdapter;

public class Pager2Adapter extends RecyclerView.Adapter<Pager2Adapter.ViewHolder> {

    Context context;
    LayoutInflater inflater;

    public Pager2Adapter(Context context) {
        this.context = context;
        this.inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View itemView = inflater.inflate(R.layout.recycleritem, parent, false);

        return new ViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {

    }

    @Override
    public int getItemCount() {
        return 10;
    }

    public class ViewHolder extends RecyclerView.ViewHolder {
        ImageView imgv1;
        TextView tv1;

        public ViewHolder(@NonNull View itemView) {
            super(itemView);
            imgv1 = itemView.findViewById(R.id.imgv1);
            tv1 = itemView.findViewById(R.id.tv1);
        }
    }
}
