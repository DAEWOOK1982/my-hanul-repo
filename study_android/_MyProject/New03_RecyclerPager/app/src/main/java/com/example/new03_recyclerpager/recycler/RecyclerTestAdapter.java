package com.example.new03_recyclerpager.recycler;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.new03_recyclerpager.R;

import java.util.ArrayList;

public class RecyclerTestAdapter extends RecyclerView.Adapter<RecyclerTestAdapter.ViewHolder> {

    Context context;
    ArrayList<RecyclerTestDTO> list;
    LayoutInflater inflater;

    public RecyclerTestAdapter(Context context, ArrayList<RecyclerTestDTO> list) {
        this.context = context;
        this.list = list;
        this.inflater = (LayoutInflater) this.context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
    }

    public RecyclerTestAdapter(Context context, ArrayList<RecyclerTestDTO> list, LayoutInflater inflater) {
        this.context = context;
        this.list = list;
        this.inflater = inflater;
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {

        return null;
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {

    }

    @Override
    public int getItemCount() {
        return 0;
    }


    public class ViewHolder extends RecyclerView.ViewHolder {
        ImageView tiv1;
        TextView ttv1;

        public ViewHolder(@NonNull View itemView) {
            super(itemView);
            tiv1 = itemView.findViewById(R.id.ttv1);
            ttv1 = itemView.findViewById(R.id.ttv1);

        }
    }


}
