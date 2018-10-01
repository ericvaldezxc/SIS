package com.example.eric.sis;

import android.content.Context;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.error.AuthFailureError;
import com.android.volley.error.VolleyError;
import com.android.volley.request.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class grades extends AppCompatActivity {
    List<GradesBodyModel> productList;

    //the recyclerview
    RecyclerView recyclerView;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_grades);

        recyclerView = (RecyclerView) findViewById(R.id.recyclerView);
        recyclerView.setHasFixedSize(true);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        Configuration con = new Configuration();
        final Configuration conn = new Configuration();
        productList = new ArrayList<>();
        String url = "http://"+con.ip+":8080/SIS/Mobile/StudentGrade";
        final RequestQueue rq = Volley.newRequestQueue(this);
        StringRequest stringRequest = new StringRequest(Request.Method.POST ,url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                String ew = "[\n" +
                        "      {\n" +
                        "        \"subjdesc\": \"Keyboarding with Laboratory\",\n" +
                        "        \"grade\": \"1.00\",\n" +
                        "        \"subjcode\": \"OFAD 3003\",\n" +
                        "        \"subcredunit\": \"3\",\n" +
                        "        \"section\": \"BSIT-CM 1-1\",\n" +
                        "        \"fullname\": \"Labayen, Raven Joyce Hinlo\",\n" +
                        "        \"finalgrade\": \"P\"\n" +
                        "      },\n" +
                        "      {\n" +
                        "        \"subjdesc\": \"Komunikasyon sa Akademikong Filipino\",\n" +
                        "        \"grade\": \"I\",\n" +
                        "        \"subjcode\": \"FILI 1013\",\n" +
                        "        \"subcredunit\": \"3\",\n" +
                        "        \"section\": \"BSIT-CM 1-1\",\n" +
                        "        \"fullname\": \"Santos, John Enrile\",\n" +
                        "        \"finalgrade\": \"INC\"\n" +
                        "      },\n" +
                        "      {\n" +
                        "        \"subjdesc\": \"Fundamentals of Problem Solving and Programming 1\",\n" +
                        "        \"grade\": \"\",\n" +
                        "        \"subjcode\": \"COMP 2013\",\n" +
                        "        \"subcredunit\": \"3\",\n" +
                        "        \"section\": \"BSIT-CM 1-1\",\n" +
                        "        \"fullname\": \"Monzon, Demelyn  Espejo\",\n" +
                        "        \"finalgrade\": \"\"\n" +
                        "      },\n" +
                        "      {\n" +
                        "        \"subjdesc\": \"Information Technology Fundamentals\",\n" +
                        "        \"grade\": \"Not S\",\n" +
                        "        \"subjcode\": \"COMP 2023\",\n" +
                        "        \"subcredunit\": \"3\",\n" +
                        "        \"section\": \"BSIT-CM 1-1\",\n" +
                        "        \"fullname\": \"Monzon, Alyana Espejo\",\n" +
                        "        \"finalgrade\": \"Not S\"\n" +
                        "      },\n" +
                        "      {\n" +
                        "        \"subjdesc\": \"College Algebra\",\n" +
                        "        \"grade\": \"\",\n" +
                        "        \"subjcode\": \"MATH 1013\",\n" +
                        "        \"subcredunit\": \"3\",\n" +
                        "        \"section\": \"BSIT-CM 1-1\",\n" +
                        "        \"fullname\": \"Delos Santos, Rodrigo Ponce\",\n" +
                        "        \"finalgrade\": \"\"\n" +
                        "      },\n" +
                        "      {\n" +
                        "        \"subjdesc\": \"Study and Thinking Skills in English\",\n" +
                        "        \"grade\": \"\",\n" +
                        "        \"subjcode\": \"ENGL 1013\",\n" +
                        "        \"subcredunit\": \"3\",\n" +
                        "        \"section\": \"BSIT-CM 1-1\",\n" +
                        "        \"fullname\": \"Gutierrez, John Carlo Villar\",\n" +
                        "        \"finalgrade\": \"\"\n" +
                        "      },\n" +
                        "      {\n" +
                        "        \"subjdesc\": \"Accounting Principles\",\n" +
                        "        \"grade\": \"\",\n" +
                        "        \"subjcode\": \"ACCO 2143\",\n" +
                        "        \"subcredunit\": \"3\",\n" +
                        "        \"section\": \"BSIT-CM 1-1\",\n" +
                        "        \"fullname\": \"Labayen, Raven Joyce Hinlo\",\n" +
                        "        \"finalgrade\": \"\"\n" +
                        "      },\n" +
                        "      {\n" +
                        "        \"subjdesc\": \"Reserved Officer Training Corps 1\",\n" +
                        "        \"grade\": \"\",\n" +
                        "        \"subjcode\": \"ROTC 1013\",\n" +
                        "        \"subcredunit\": \"3\",\n" +
                        "        \"section\": \"BSIT-CM 1-1\",\n" +
                        "        \"fullname\": \"Cagulang, Anne Nicole Asinero\",\n" +
                        "        \"finalgrade\": \"\"\n" +
                        "      },\n" +
                        "      {\n" +
                        "        \"subjdesc\": \"Physical Fitness and Self-Testing Activities - Physical Fitness\",\n" +
                        "        \"grade\": \"\",\n" +
                        "        \"subjcode\": \"PHED 1012_\",\n" +
                        "        \"subcredunit\": \"2\",\n" +
                        "        \"section\": \"BSIT-CM 1-1\",\n" +
                        "        \"fullname\": \"Cagulang, Anne Nicole Asinero\",\n" +
                        "        \"finalgrade\": \"\"\n" +
                        "      }\n" +
                        "    ]";
                productList = new ArrayList<>();
                JSONArray jsonArray = null;
                try {
                    jsonArray = new JSONArray(ew);
                } catch (JSONException e) {
                    e.printStackTrace();
                }
                String acadyear = "";
                String sem = "";
                String coursedesc = "";
                String coursecode = "";
                //------------
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
                        /*
                        acadyear = obj.getString("acadyear");
                        sem = obj.getString("sem");
                        coursedesc = obj.getString("course");
                        coursecode = obj.getString("coursecode");
                        conn.gradesbody = obj.getJSONArray("grades");
                        */
                        //Toast.makeText(getApplicationContext(), coursecode + " - " + coursedesc, Toast.LENGTH_SHORT).show();

                        //---------

                        subjdesc = obj.getString("subjdesc");
                        grade = obj.getString("grade");
                        subjcode = obj.getString("subjcode");
                        subcredunit = obj.getString("subcredunit");
                        section = obj.getString("section");
                        fullname = obj.getString("fullname");
                        finalgrade = obj.getString("finalgrade");


                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                    /*
                    productList.add(
                            new GradesHeaderModel(
                                    acadyear,
                                    coursecode + " - " + coursedesc,
                                    sem

                            ));
                    */
                    productList.add(
                            new GradesBodyModel(
                                    subjdesc,
                                    subjcode,
                                    grade,
                                    finalgrade,
                                    subcredunit,
                                    section,
                                    fullname

                            ));



                }
                GradesBodyAdapter adapter = new GradesBodyAdapter(grades.this, productList);
                recyclerView.setAdapter(adapter);

            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                if(error instanceof com.android.volley.error.TimeoutError)
                    Toast.makeText(getApplicationContext(), "Time out error", Toast.LENGTH_SHORT).show();
                else if(error instanceof com.android.volley.error.NoConnectionError)
                    Toast.makeText(getApplicationContext(), "No connection error", Toast.LENGTH_SHORT).show();
                else if(error instanceof com.android.volley.error.AuthFailureError)
                    Toast.makeText(getApplicationContext(), "Authentication failure", Toast.LENGTH_SHORT).show();
                else if(error instanceof com.android.volley.error.NetworkError)
                    Toast.makeText(getApplicationContext(), "Network error", Toast.LENGTH_SHORT).show();
                else if(error instanceof com.android.volley.error.ServerError)
                    Toast.makeText(getApplicationContext(), "Server Error", Toast.LENGTH_SHORT).show();
                else if(error instanceof com.android.volley.error.ParseError)
                    Toast.makeText(getApplicationContext(), "JSON Parse error", Toast.LENGTH_SHORT).show();

            }
        }){
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String, String> params = new HashMap<String, String>();
                params.put("stnum","2018-00002-CM-0");
                return params;
            }

        };
        rq.add(stringRequest);

    }

    public class GradesBodyAdapter extends RecyclerView.Adapter<grades.GradesBodyAdapter.ScheduleViewHolder> {
        private Context mCtx;

        //we are storing all the products in a list
        private List<GradesBodyModel> schedulelist;

        public GradesBodyAdapter(Context mCtx, List<GradesBodyModel> schedulelist) {
            this.mCtx = mCtx;
            this.schedulelist = schedulelist;
        }

        @Override
        public grades.GradesBodyAdapter.ScheduleViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            //inflating and returning our view holder
            LayoutInflater inflater = LayoutInflater.from(getApplicationContext());
            View view = inflater.inflate(R.layout.grades_body_layout, null);
            return new grades.GradesBodyAdapter.ScheduleViewHolder(view);
            //return new GradesBodyAdapter.ScheduleViewHolder(view);
        }

        @Override
        public void onBindViewHolder(grades.GradesBodyAdapter.ScheduleViewHolder holder, int position) {
            //getting the product of the specified position
            GradesBodyModel product = schedulelist.get(position);

            //binding the data with the viewholder views
            holder.subject.setText(product.getSubjcode() + " - " + product.getSubjdesc());
            holder.desc.setText(product.getSection() + " - " + product.getSubcredunit() +" Credited Units" );
            holder.faculty.setText(product.getFullname());
            holder.grade.setText("Grade: "+product.getGrade() + " - " + product.getFinalgrade());


        }


        @Override
        public int getItemCount() {
            return schedulelist.size();
        }


        class ScheduleViewHolder extends RecyclerView.ViewHolder {

            TextView subject, desc,faculty, grade;

            public ScheduleViewHolder(View itemView) {
                super(itemView);

                subject = itemView.findViewById(R.id.subject);
                desc = itemView.findViewById(R.id.desc);
                faculty = itemView.findViewById(R.id.faculty);
                grade = itemView.findViewById(R.id.grade);

            }
        }

    }
}
