package com.example.eric.sis;

import android.content.Intent;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
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

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Schedule extends AppCompatActivity {

    List<ScheduleModel> productList;

    //the recyclerview
    RecyclerView recyclerView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_schedule);

        recyclerView = (RecyclerView) findViewById(R.id.recyclerView);
        recyclerView.setHasFixedSize(true);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        Configuration con = new Configuration();
        productList = new ArrayList<>();
        String url = "http://"+con.ip+":8080/SIS/Mobile/StudentSchedule";
        final RequestQueue rq = Volley.newRequestQueue(this);
        StringRequest stringRequest = new StringRequest(Request.Method.POST ,url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                productList = new ArrayList<>();
                JSONArray jsonArray = null;
                try {
                    jsonArray = new JSONArray(response);
                } catch (JSONException e) {
                    e.printStackTrace();
                }
                String subjcode = "";
                String subjdesc = "";
                String subjsched = "";
                for (int i = 0; i < jsonArray.length(); i++) {
                    JSONObject obj = null;
                    try {
                        obj = jsonArray.getJSONObject(i);
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                    try {
                        subjcode = obj.getString("code");
                        subjdesc = obj.getString("desc");
                        subjsched = obj.getString("schedule");
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                    productList.add(
                            new ScheduleModel(
                                    subjcode,
                                    subjdesc,
                                    subjsched

                            ));



                }
                ScheduleAdapter adapter = new ScheduleAdapter(Schedule.this, productList);
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
                params.put("stnum","2018-00001-CM-0");
                return params;
            }

        };
        rq.add(stringRequest);



    }

}
