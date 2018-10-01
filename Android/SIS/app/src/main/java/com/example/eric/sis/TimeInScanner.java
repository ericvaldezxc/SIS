package com.example.eric.sis;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.error.AuthFailureError;
import com.android.volley.error.VolleyError;
import com.android.volley.misc.AsyncTask;
import com.android.volley.request.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.zxing.integration.android.IntentIntegrator;
import com.google.zxing.integration.android.IntentResult;
import com.loopj.android.http.HttpGet;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;

import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.client.ClientProtocolException;
import cz.msebera.android.httpclient.client.utils.URIBuilder;
import cz.msebera.android.httpclient.impl.client.DefaultHttpClient;
import cz.msebera.android.httpclient.util.EntityUtils;

import org.json.JSONException;
import org.json.JSONObject;

public class TimeInScanner extends AppCompatActivity {
    private Button buttonScan;
    private TextView textViewName, textViewAddress;
    private IntentIntegrator qrScan;
    Configuration con = new Configuration();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_time_in_scanner);
        buttonScan = (Button) findViewById(R.id.buttonScan);

        //attaching onclick listener
        qrScan = new IntentIntegrator(this);
        //attaching onclick listener
        buttonScan.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                qrScan.initiateScan();
            }
        });
    }
    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        IntentResult result = IntentIntegrator.parseActivityResult(requestCode, resultCode, data);
        if (result != null) {
            //if qrcode has nothing in it
            if (result.getContents() == null) {
                Toast.makeText(this, "Result Not Found", Toast.LENGTH_LONG).show();
            } else {
                final String studnum = result.getContents();


                final String apiurl = "https://www.itexmo.com/php_api/api.php";

                String url = "http://"+con.ip+":8080/SIS/Mobile/GetStudentInformation";
                final RequestQueue rq = Volley.newRequestQueue(this);

                StringRequest stringRequest = new StringRequest(Request.Method.POST ,url, new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        final String item = response.toString();


                        StringRequest stringRequest2 = new StringRequest(Request.Method.POST ,apiurl, new Response.Listener<String>() {
                            @Override
                            public void onResponse(String response) {
                                if(response.toString().equals("1"))
                                    Toast.makeText(getApplicationContext(), "Invalid Number.", Toast.LENGTH_SHORT).show();
                                else if(response.toString().equals("2"))
                                    Toast.makeText(getApplicationContext(), "Number not Supported..", Toast.LENGTH_SHORT).show();
                                else if(response.toString().equals("3"))
                                    Toast.makeText(getApplicationContext(), "Invalid ApiCode.", Toast.LENGTH_SHORT).show();
                                else if(response.toString().equals("4"))
                                    Toast.makeText(getApplicationContext(), "Maximum Message per day reached. This will be reset every 12MN.", Toast.LENGTH_SHORT).show();
                                else if(response.toString().equals("5"))
                                    Toast.makeText(getApplicationContext(), "Maximum allowed characters for message reached.", Toast.LENGTH_SHORT).show();
                                else if(response.toString().equals("6"))
                                    Toast.makeText(getApplicationContext(), "System OFFLINE.", Toast.LENGTH_SHORT).show();
                                else if(response.toString().equals("7"))
                                    Toast.makeText(getApplicationContext(), "Expired ApiCode.", Toast.LENGTH_SHORT).show();
                                else if(response.toString().equals("8"))
                                    Toast.makeText(getApplicationContext(), "iTexMo Error. Please try again later.", Toast.LENGTH_SHORT).show();
                                else if(response.toString().equals("9"))
//                                    Toast.makeText(getApplicationContext(), "Invalid Function Parameters.", Toast.LENGTH_SHORT).show();
                                    Toast.makeText(getApplicationContext(), "The student's guardian dont have registered contact number", Toast.LENGTH_SHORT).show();
                                else if(response.toString().equals("10"))
                                    Toast.makeText(getApplicationContext(), "Recipient's number is blocked due to FLOODING, message was ignored", Toast.LENGTH_SHORT).show();
                                else if(response.toString().equals("11"))
                                    Toast.makeText(getApplicationContext(), "Recipient's number is blocked temporarily due to HARD sending (after 3 retries of sending and message still failed to send) and the message was ignored. Try again after an hour.", Toast.LENGTH_SHORT).show();
                                else if(response.toString().equals("12"))
                                    Toast.makeText(getApplicationContext(), "Invalid request. You can't set message priorities on non corporate apicodes", Toast.LENGTH_SHORT).show();
                                else if(response.toString().equals("0"))
                                    Toast.makeText(getApplicationContext(), "Message is successfully send to his guardian", Toast.LENGTH_SHORT).show();


                            }
                        }, new Response.ErrorListener() {
                            @Override
                            public void onErrorResponse(VolleyError error) {
                                if(error instanceof com.android.volley.error.TimeoutError)
                                    Toast.makeText(getApplicationContext(), "Time out error", Toast.LENGTH_SHORT).show();
                                else if(error instanceof com.android.volley.error.NoConnectionError)
                                    Toast.makeText(getApplicationContext(), "No connection error", Toast.LENGTH_SHORT).show();
                                else if(error instanceof AuthFailureError)
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

                                JSONObject obj = null;
                                String fmessage = "";
                                String fcn = "";
                                try {
                                    obj = new JSONObject(item);
                                } catch (JSONException e) {
                                    e.printStackTrace();
                                }
                                //setting values to textviews
                                try {
                                    final String message = obj.getString("message");
//                                    textViewName.setText(message);
                                    fmessage = message;
                                } catch (JSONException e) {
                                    e.printStackTrace();
                                }

                                try {
                                    final String cn = obj.getString("cn");
  //                                  textViewAddress.setText(obj.getString("cn"));
                                    fcn = cn;
                                } catch (JSONException e) {
                                    e.printStackTrace();
                                }

                                if(!fcn.equals("0")){
                                    Map<String, String> params = new HashMap<String, String>();
                                    params.put("1",fcn);
                                    params.put("2",fmessage);
                                    params.put("3","TR-ERICT137023_KI4VT");
                                    params.put("5","NORMAL");
                                    return params;
                                }
                                else{
                                    Map<String, String> params = new HashMap<String, String>();
                                    return params;
                                }

                            }

                        };






                        rq.add(stringRequest2);








                    }
                }, new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        if(error instanceof com.android.volley.error.TimeoutError)
                            Toast.makeText(getApplicationContext(), "Time out error", Toast.LENGTH_SHORT).show();
                        else if(error instanceof com.android.volley.error.NoConnectionError)
                            Toast.makeText(getApplicationContext(), "No connection error", Toast.LENGTH_SHORT).show();
                        else if(error instanceof AuthFailureError)
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
                        params.put("StudentNumber",studnum);
                        return params;
                    }

                };

                rq.add(stringRequest);

            }
        } else {
            super.onActivityResult(requestCode, resultCode, data);
        }
    }

}
