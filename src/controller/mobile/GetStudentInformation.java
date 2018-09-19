package controller.mobile;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import configuration.EncryptandDecrypt;
import configuration.Fullname;
import connection.DBConfiguration;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.json.simple.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class TimeIn
 */
@WebServlet("/Mobile/GetStudentInformation")
public class GetStudentInformation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetStudentInformation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		EncryptandDecrypt ec = new EncryptandDecrypt();

		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		
		String StudentNumber = request.getParameter("StudentNumber");
		//String StudentNumber = "2018-00001-CM-0";
		Statement stmnt = null;
		try {
			stmnt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String cn = "";
		String message = "";
		String apikey = "TR-STUDE770480_PNV9P";
		String type = "NORMAL";

		String fullname = "";	
		String fname = "";	
		String mname = "";	
		String lname = "";	
		
		
		String sql = "SELECT * FROM t_student_account inner join r_student_profile on Student_Profile_ID = Student_Account_Student_Profile_ID where Student_Account_Student_Number = '"+StudentNumber+"'";
		ResultSet rs;
		try {
			rs = stmnt.executeQuery(sql);
			while(rs.next()){
				fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
				mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
				lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
				Fullname fn = new Fullname();
				fullname = fn.fullname(fname, mname, lname);
				cn = rs.getString("Student_Profile_Guardian_Contact_Number");
			      
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		SimpleDateFormat getmonth = new SimpleDateFormat("dd/MM/yyyy");  
		SimpleDateFormat gethour = new SimpleDateFormat("hh:mm:ss");  
		SimpleDateFormat getgreet = new SimpleDateFormat("a");  
		SimpleDateFormat getchour = new SimpleDateFormat("hh");  

		Date date = new Date(); 
		String curtime =  getgreet.format(date);
		String curhour =  getchour.format(date);
		String greet = "";
		if(curtime.equals("PM") && Integer.parseInt(curhour) < 5)
			greet = "Afternoon";
		else if(curtime.equals("PM"))
			greet = "Evening";
		else
			greet = "Morning";
		message = "Good "+ greet +", Student Named " + fullname + " is safely arrived in school today at " + gethour.format(date)+ " " + getmonth.format(date)+". This is a computer generated message do not reply.";
		
		
		 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Mobile/TimeIn");
		 request.setAttribute("StudentNumber", message + cn);
		 dispatcher.include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EncryptandDecrypt ec = new EncryptandDecrypt();

		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		
		String StudentNumber = request.getParameter("StudentNumber");
		//String StudentNumber = "2018-00001-CM-0";
		Statement stmnt = null;
		try {
			stmnt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String cn = "23";
		String message = "";
		String apikey = "TR-STUDE770480_PNV9P";
		String type = "NORMAL";
		String url = "https://www.itexmo.com/php_api/api.php";
		//URL url = new URL("https://www.itexmo.com/php_api/api.php"); 
		String fullname = "";	
		String fname = "qweqwe";	
		String mname = "";	
		String lname = "";	
		
	    PrintWriter out = response.getWriter();	
		String sql = "SELECT *,ifnull(Student_Profile_Guardian_Contact_Number,0) as cn FROM t_student_account inner join r_student_profile on Student_Profile_ID = Student_Account_Student_Profile_ID where Student_Account_Student_Number = '"+StudentNumber+"'";
		//out.print(sql);
		ResultSet rs;
		try {
			rs = stmnt.executeQuery(sql);
			while(rs.next()){
				fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
				mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
				lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
				Fullname fn = new Fullname();
				fullname = fn.fullname(fname, mname, lname);
				cn = rs.getString("cn");
			      
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		SimpleDateFormat getmonth = new SimpleDateFormat("dd/MM/yyyy");  
		SimpleDateFormat gethour = new SimpleDateFormat("hh:mm:ss");  
		SimpleDateFormat getgreet = new SimpleDateFormat("a");  
		SimpleDateFormat getchour = new SimpleDateFormat("hh");  
		SimpleDateFormat getcday = new SimpleDateFormat("E");  

		Date date = new Date(); 
		String curtime =  getgreet.format(date);
		String curhour =  getchour.format(date);
		String getday =  getcday.format(date);
		String greet = "";
		if(curtime.equals("PM") && Integer.parseInt(curhour) < 5)
			greet = "Afternoon";
		else if(curtime.equals("PM"))
			greet = "Evening";
		else
			greet = "Morning";
		message = "Good "+ greet +", Student Named " + fullname + " is safely arrived in school today at " + gethour.format(date);
		
		/*
		CloseableHttpClient client = HttpClients.createDefault();
	    HttpPost httpPost = new HttpPost(url);
	 
	    List<NameValuePair> params = new ArrayList<NameValuePair>();
	    params.add(new BasicNameValuePair("1", cn));
	    params.add(new BasicNameValuePair("2", message));
	    params.add(new BasicNameValuePair("3", apikey));
	    params.add(new BasicNameValuePair("5", type));
	    httpPost.setEntity(new UrlEncodedFormEntity(params));
	   
	    CloseableHttpResponse response2 = client.execute(httpPost);
	    PrintWriter out = response.getWriter();	
	    out.print(EntityUtils.toString(((HttpResponse) response2).getEntity()));
	    client.close();
	    */
	    JSONObject obj = new JSONObject();
		obj.put("message", message);
		obj.put("cn", cn);
	    out.print(obj);
		
		
		
		
		

        /*
		HttpClient client = HttpClientBuilder.create().build();
        HttpPost post = new HttpPost(url);

        // Create some NameValuePair for HttpPost parameters
        List<NameValuePair> arguments = new ArrayList<>(3);
        arguments.add(new BasicNameValuePair("1", cn));
        arguments.add(new BasicNameValuePair("2", message));
        arguments.add(new BasicNameValuePair("3", apikey));
        arguments.add(new BasicNameValuePair("5", type));

        try {
            post.setEntity(new UrlEncodedFormEntity(arguments));
            response = (HttpServletResponse) client.execute(post);

            // Print out the response message
            System.out.println(EntityUtils.toString(((HttpResponse) response).getEntity()));
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        //*
		 RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		 request.setAttribute("1", cn);
		 request.setAttribute("2", message);
		 request.setAttribute("3", apikey);
		 request.setAttribute("5", type);
		 dispatcher.include(request, response);
		 */
	}

}
