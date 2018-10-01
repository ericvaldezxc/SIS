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


/**
 * A simple {@link Fragment} subclass.
 * Activities that contain this fragment must implement the
 * {@link GradesFragment.OnFragmentInteractionListener} interface
 * to handle interaction events.
 * Use the {@link GradesFragment#newInstance} factory method to
 * create an instance of this fragment.
 */
public class GradesFragment extends Fragment {
    // TODO: Rename parameter arguments, choose names that match
    // the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";

    // TODO: Rename and change types of parameters
    private String mParam1;
    private String mParam2;

    List<GradesBodyModel> productList;

    //the recyclerview
    RecyclerView recyclerView;


    private OnFragmentInteractionListener mListener;

    public GradesFragment() {
        // Required empty public constructor
    }

    /**
     * Use this factory method to create a new instance of
     * this fragment using the provided parameters.
     *
     * @param param1 Parameter 1.
     * @param param2 Parameter 2.
     * @return A new instance of fragment GradesFragment.
     */
    // TODO: Rename and change types and number of parameters
    public static GradesFragment newInstance(String param1, String param2) {
        GradesFragment fragment = new GradesFragment();
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
        // Inflate the layout for this fragment
        final View myFragmentView = inflater.inflate(R.layout.fragment_grades, container, false);
        recyclerView = (RecyclerView) myFragmentView.findViewById(R.id.recyclerView);
        recyclerView.setHasFixedSize(true);
        recyclerView.setLayoutManager(new LinearLayoutManager(getActivity()));

        final Configuration con = new Configuration();
        final Configuration conn = new Configuration();
        productList = new ArrayList<>();
        String url = "http://"+con.ip+":8080/SIS/Mobile/StudentGrade";
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


                    } catch (JSONException e) {
                        e.printStackTrace();
                    }

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
                GradesBodyAdapter adapter = new GradesBodyAdapter(getActivity(), productList);
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
        void onFragmentInteraction(Uri uri);
    }

    public class GradesBodyAdapter extends RecyclerView.Adapter<GradesBodyAdapter.ScheduleViewHolder> {
        private Context mCtx;

        //we are storing all the products in a list
        private List<GradesBodyModel> schedulelist;

        public GradesBodyAdapter(Context mCtx, List<GradesBodyModel> schedulelist) {
            this.mCtx = mCtx;
            this.schedulelist = schedulelist;
        }

        @Override
        public GradesBodyAdapter.ScheduleViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            //inflating and returning our view holder
            LayoutInflater inflater = LayoutInflater.from(parent.getContext());
            View view = inflater.inflate(R.layout.grades_body_layout, null);
            return new GradesBodyAdapter.ScheduleViewHolder(view);
            //return new GradesBodyAdapter.ScheduleViewHolder(view);
        }

        @Override
        public void onBindViewHolder(GradesBodyAdapter.ScheduleViewHolder holder, int position) {
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
