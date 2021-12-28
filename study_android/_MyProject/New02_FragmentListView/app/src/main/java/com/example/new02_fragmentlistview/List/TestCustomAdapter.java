package com.example.new02_fragmentlistview.List;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import com.example.new02_fragmentlistview.R;

import java.util.ArrayList;

public class TestCustomAdapter extends BaseAdapter {
    ArrayList<String> list;
    LayoutInflater inflater;

    public TestCustomAdapter(ArrayList<String> list, LayoutInflater inflater) {
        this.list = list;
        this.inflater = inflater;
    }

    @Override
    public int getCount() {
        return list.size();
    }

    @Override
    public Object getItem(int position) {
        return list.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        ListItemHolder holder = new ListItemHolder();
        if(convertView == null){
            convertView = inflater.inflate(R.layout.listitem, parent, false);
            holder.list1_tv = convertView.findViewById(R.id.list_tv);
            convertView.setTag(holder);
        }else{
            holder = (ListItemHolder) convertView.getTag();
        }
        holder.list1_tv.setText(list.get(position));
        return convertView;
    }

    public class ListItemHolder {
        public  TextView list1_tv;
    }
}
