package com.example.eric.sis;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
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


/**
 * A simple {@link Fragment} subclass.
 * Activities that contain this fragment must implement the
 * {@link ScheduleFragment.OnFragmentInteractionListener} interface
 * to handle interaction events.
 * Use the {@link ScheduleFragment#newInstance} factory method to
 * create an instance of this fragment.
 */
public class ScheduleFragment extends Fragment {
    // TODO: Rename parameter arguments, choose names that match
    // the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";

    // TODO: Rename and change types of parameters
    private String mParam1;
    private String mParam2;

    List<ScheduleModel> productList;

    //the recyclerview
    RecyclerView recyclerView;
    private OnFragmentInteractionListener mListener;

    public ScheduleFragment() {
        // Required empty public constructor
    }

    /**
     * Use this factory method to create a new instance of
     * this fragment using the provided parameters.
     *
     * @param param1 Parameter 1.
     * @param param2 Parameter 2.
     * @return A new instance of fragment ScheduleFragment.
     */
    // TODO: Rename and change types and number of parameters
    public static ScheduleFragment newInstance(String param1, String param2) {
        ScheduleFragment fragment = new ScheduleFragment();
        Bundle args = new Bundle();
        args.putString(ARG_PARAM1, param1);
        args.putString(ARG_PARAM2, param2);
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            mParam1 = getArguments().getString(ARG_PARAM1);
            mParam2 = getArguments().getString(ARG_PARAM2);
        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragmentfinal
        final View myFragmentView = inflater.inflate(R.layout.fragment_schedule, container, false);
        recyclerView = (RecyclerView) myFragmentView.findViewById(R.id.recyclerView);
        recyclerView.setHasFixedSize(true);
        recyclerView.setLayoutManager(new LinearLayoutManager(getActivity()));

        final Configuration con = new Configuration();
        final Configuration conn = new Configuration();
        productList = new ArrayList<>();
        String url = "http://"+con.ip+":8080/SIS/Mobile/StudentSchedule";
        final RequestQueue rq = Volley.newRequestQueue(getActivity());
        StringRequest stringRequest = new StringRequest(Request.Method.POST ,url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                String ew = response;
                productList = new ArrayList<>();
                JSONArray jsonArray = null;
                try {
                    jsonArray = new JSONArray(ew);
                } catch (JSONException e) {
                    e.printStackTrace();
                }
                String subjcode = "";
                String subjdesc = "";
                String subjsched = "";
                String unit = "";
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
                        unit = obj.getString("cred");

                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                    productList.add(
                            new ScheduleModel(
                                    subjcode + " - " + subjdesc,
                                    unit + " Credited Units",
                                    subjsched

                            ));



                }
                ScheduleAdapter adapter = new ScheduleAdapter(getActivity(), productList);
//                recyclerView.setAdapter(adapter);
                ((RecyclerView) myFragmentView.findViewById(R.id.recyclerView)).setAdapter(adapter);


            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                if(error instanceof com.android.volley.error.TimeoutError)
                    Toast.makeText(getActivity(), "Time out error", Toast.LENGTH_SHORT).show();
                else if(error instanceof com.android.volley.error.NoConnectionError)
                    Toast.makeText(getActivity(), "No connection error", Toast.LENGTH_SHORT).show();
                else if(error instanceof com.android.volley.error.AuthFailureError)
                    Toast.makeText(getActivity(), "Authentication failure", Toast.LENGTH_SHORT).show();
                else if(error instanceof com.android.volley.error.NetworkError)
                    Toast.makeText(getActivity(), "Network error", Toast.LENGTH_SHORT).show();
                else if(error instanceof com.android.volley.error.ServerError)
                    Toast.makeText(getActivity(), "Server Error", Toast.LENGTH_SHORT).show();
                else if(error instanceof com.android.volley.error.ParseError)
                    Toast.makeText(getActivity(), "JSON Parse error", Toast.LENGTH_SHORT).show();

            }
        }){
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String, String> params = new HashMap<String, String>();
                params.put("stnum",con.studnum);
                return params;
            }

        };
        rq.add(stringRequest);


        return myFragmentView;
    }

    // TODO: Rename method, update argument and hook method into UI event
    public void onButtonPressed(Uri uri) {
        if (mListener != null) {
            mListener.onFragmentInteraction(uri);
        }
    }

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
        if (context instanceof OnFragmentInteractionListener) {
            mListener = (OnFragmentInteractionListener) context;
        } else {
            throw new RuntimeException(context.toString()
                    + " must implement OnFragmentInteractionListener");
        }
    }

    @Override
    public void onDetach() {
        super.onDetach();
        mListener = null;
    }

    /**
     * This interface must be implemented by activities that contain this
     * fragment to allow an interaction in this fragment to be communicated
     * to the activity and potentially other fragments contained in that
     * activity.
     * <p>
     * See the Android Training lesson <a href=
     * "http://developer.android.com/training/basics/fragments/communicating.html"
     * >Communicating with Other Fragments</a> for more information.
     */
    public interface OnFragmentInteractionListener {
        // TODO: Update argument type and name
        public void onFragmentInteraction(Uri uri);
    }
}
