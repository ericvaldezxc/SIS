package com.example.eric.sis;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.List;

/**
 * Created by eric on 27/09/2018.
 */

public class ScheduleAdapter extends RecyclerView.Adapter<ScheduleAdapter.ScheduleViewHolder> {
    //this context we will use to inflate the layout
    private Context mCtx;

    //we are storing all the products in a list
    private List<ScheduleModel> schedulelist;

    //getting the context and product list with constructor
    public ScheduleAdapter(Context mCtx, List<ScheduleModel> schedulelist) {
        this.mCtx = mCtx;
        this.schedulelist = schedulelist;
    }

    @Override
    public ScheduleViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        //inflating and returning our view holder
        LayoutInflater inflater = LayoutInflater.from(mCtx);
        View view = inflater.inflate(R.layout.schedule_layout, null);
        return new ScheduleViewHolder(view);
    }

    @Override
    public void onBindViewHolder(ScheduleViewHolder holder, int position) {
        //getting the product of the specified position
        ScheduleModel product = schedulelist.get(position);

        //binding the data with the viewholder views
        holder.subjcode.setText(product.getSubjcode());
        holder.subdesc.setText(product.getSubjdesc());
        holder.subjched.setText(String.valueOf(product.getSubjsched()));


    }


    @Override
    public int getItemCount() {
        return schedulelist.size();
    }


    class ScheduleViewHolder extends RecyclerView.ViewHolder {

        TextView subjcode, subdesc, subjched;

        public ScheduleViewHolder(View itemView) {
            super(itemView);

            subjcode = itemView.findViewById(R.id.subjcode);
            subdesc = itemView.findViewById(R.id.subdesc);
            subjched = itemView.findViewById(R.id.subjched);
        }
    }
}
