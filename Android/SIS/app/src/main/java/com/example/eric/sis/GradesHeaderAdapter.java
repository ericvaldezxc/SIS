package com.example.eric.sis;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by eric on 29/09/2018.
 */

public class GradesHeaderAdapter extends RecyclerView.Adapter<GradesHeaderAdapter.ScheduleViewHolder> {
    //this context we will use to inflate the layout
    private Context mCtx;
    List<GradesBodyModel> productList;
    //we are storing all the products in a list
    private List<GradesHeaderModel> schedulelist;
    RecyclerView recyclerView;

    //getting the context and product list with constructor
    public GradesHeaderAdapter(Context mCtx, List<GradesHeaderModel> schedulelist) {
        this.mCtx = mCtx;
        this.schedulelist = schedulelist;
        /*
        productList = new ArrayList<>();
        JSONArray jsonArray = null;
        Configuration con = new Configuration();
        jsonArray = con.gradesbody;
        String subjdesc = "";
        String grade = "";
        String subjcode = "";
        String subcredunit = "";
        String section = "";
        String fullname = "";
        String finalgrade = "";
        for (int i = 0; i < jsonArray.length(); i++) {
            JSONObject obj = null;
            try {
                obj = jsonArray.getJSONObject(i);
            } catch (JSONException e) {
                e.printStackTrace();
            }
            try {
                subjdesc = obj.getString("subjdesc");
                grade = obj.getString("grade");
                subjcode = obj.getString("subjcode");
                subcredunit = obj.getString("subcredunit");
                section = obj.getString("section");
                fullname = obj.getString("fullname");
                finalgrade = obj.getString("finalgrade");

                //Toast.makeText(getApplicationContext(), coursecode + " - " + coursedesc, Toast.LENGTH_SHORT).show();


            } catch (JSONException e) {
                e.printStackTrace();
            }

            productList.add(
                    new GradesBodyModel(
                            subjdesc,
                            grade,
                            subjcode,
                            subcredunit,
                            section,
                            fullname,
                            finalgrade

                    ));



        }

        GradesBodyAdapter adapter = new GradesBodyAdapter(this.mCtx, productList);
        recyclerView.setAdapter(adapter);
        */
    }

    @Override
    public ScheduleViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        //inflating and returning our view holder
        LayoutInflater inflater = LayoutInflater.from(mCtx);
        View view = inflater.inflate(R.layout.grades_header_layout, null);
        return new GradesHeaderAdapter.ScheduleViewHolder(view);


    }

    @Override
    public void onBindViewHolder(ScheduleViewHolder holder, int position) {
        //getting the product of the specified position
        GradesHeaderModel product = schedulelist.get(position);

        //binding the data with the viewholder views
        holder.acadyear.setText(product.getAcadyear() + " - " + product.getSem());
        holder.course.setText(product.getCourse());


    }


    @Override
    public int getItemCount() {
        return schedulelist.size();
    }


    class ScheduleViewHolder extends RecyclerView.ViewHolder {

        TextView acadyear, course;

        public ScheduleViewHolder(View itemView) {
            super(itemView);

            acadyear = itemView.findViewById(R.id.acadyear);
            course = itemView.findViewById(R.id.course);

        }
    }

}
