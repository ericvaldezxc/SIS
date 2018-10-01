package com.example.eric.sis;

import android.app.AlertDialog;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.error.AuthFailureError;
import com.android.volley.error.VolleyError;
import com.android.volley.request.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class login extends AppCompatActivity implements View.OnClickListener{
    Button btnlogin;
    TextView btnsignup;
    EditText uname,pass;
    final String TAG = this.getClass().getSimpleName();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        btnlogin = (Button) findViewById(R.id.btnlogin);
        uname = (EditText) findViewById(R.id.txtusername);
        pass = (EditText) findViewById(R.id.txtpassword);
        btnlogin.setOnClickListener(this);
    }

    @Override
    public void onClick(View view)
    {

        if (view == btnlogin)
        {

//            Intent in = new Intent(login.this, Main.class);
//            startActivity(in);
            //"http://10.0.2.2/DIY/test.php";
            if(uname.getText().toString().trim().length()==0)
                showMessage("Error", "Please fill out your username");
            else if (pass.getText().toString().trim().length()==0)
                showMessage("Error", "Please fill out your password");
            else
            {

                final Configuration con = new Configuration();
                String url = "http://"+con.ip+":8080/SIS/Mobile/Login";
                final RequestQueue rq = Volley.newRequestQueue(this);
                StringRequest stringRequest = new StringRequest(Request.Method.POST ,url, new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        JSONObject obj = null;
                        String smessage = "";
                        String type = "";
                        try {
                            obj = new JSONObject(response);
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        try {
                            con.name  = obj.getString("name");
                            con.studnum = obj.getString("studentnumber");
                            con.course = obj.getString("course");
                            con.section = obj.getString("section");
                            smessage = obj.getString("message");
                            type = obj.getString("type");


                        } catch (JSONException e) {
                            e.printStackTrace();
                        }




                        if(smessage.equals("Account doesn't exist"))
                        {
                            Toast.makeText(getApplicationContext(),"Account Doesn't Exist", Toast.LENGTH_SHORT).show();
                        }
                        else if(smessage.equals("Incorrect Password"))
                            Toast.makeText(getApplicationContext(),"Incorrect password", Toast.LENGTH_SHORT).show();
                        else if(type.equals("Guard"))
                        {
                            Intent in = new Intent(login.this, TimeInScanner.class);
                            startActivity(in);

                        }
                        else if(type.equals("Student"))
                        {
                            Intent in = new Intent(login.this, Index.class);
                            startActivity(in);

                        }
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
                        params.put("username",uname.getText().toString());
                        params.put("password",pass.getText().toString());
                        return params;
                    }

                };
                rq.add(stringRequest);

            }

        }

    }

    private void showMessage(String title,String message) {
        AlertDialog.Builder builder=new AlertDialog.Builder(this);
        builder.setCancelable(true);
        builder.setTitle(title);
        builder.setMessage(message);
        builder.show();

    }
}
