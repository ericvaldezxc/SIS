package controller.registrar.student;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import configuration.*;
import connection.DBConfiguration;

/**
 * Servlet implementation class AdmissionCurriculumItemViewController
 */
@WebServlet("/Registrar/Controller/Registrar/Student/importStudent")
public class importStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public importStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("plain/text");
		EncryptandDecrypt ec = new EncryptandDecrypt();
		Fullname fn = new Fullname();
		
		JSONArray studentlist = new JSONArray();
		Object object=null;
		JSONParser jsonParser=new JSONParser();
		
		try {
			object=jsonParser.parse(request.getParameter("studentList"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		studentlist=(JSONArray) object;
		
		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		
		Statement stmnt = null;

		
		try {
			stmnt = conn.createStatement();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "";
		JSONArray students = new JSONArray();
		PrintWriter out = response.getWriter();	

		for (Object o : studentlist) {
			JSONObject jsonLineItem = (JSONObject) o;
	        String firstName = (String) jsonLineItem.get("firstName");
	        String middleName = (String) jsonLineItem.get("middleName");
	        String lastName = (String) jsonLineItem.get("lastName");
	        String cn = (String) jsonLineItem.get("cn");
	        String emailAdd = (String) jsonLineItem.get("emailAdd");
	        String guardianName = (String) jsonLineItem.get("guardianName");
	        String guardianContactNumber = (String) jsonLineItem.get("guardianContactNumber");
	        String dob = (String) jsonLineItem.get("dob");
	        String pob = (String) jsonLineItem.get("pob");
	        String gender = (String) jsonLineItem.get("gender");
	        String civilStatus = (String) jsonLineItem.get("civilStatus");
	        String address = (String) jsonLineItem.get("address");
	        String studNumber = (String) jsonLineItem.get("studNumber");

	        
	        
	        firstName = ec.encrypt(ec.key, ec.initVector, firstName);
	        middleName = ec.encrypt(ec.key, ec.initVector, middleName);
	        lastName = ec.encrypt(ec.key, ec.initVector, lastName);
			cn = ec.encrypt(ec.key, ec.initVector, cn);
			emailAdd = ec.encrypt(ec.key, ec.initVector, emailAdd);
			pob = ec.encrypt(ec.key, ec.initVector, pob);
			address = ec.encrypt(ec.key, ec.initVector, address);
	        
			sql = "update r_student_profile set Student_Profile_First_Name = '"+firstName+"',Student_Profile_Middle_Name = '"+middleName+"',Student_Profile_Last_Name = '"+lastName+"',Student_Profile_Guardian_Contact_Number = '"+guardianContactNumber+"',Student_Profile_Guardian_Name = '"+guardianName+"',Student_Profile_Place_Of_Birth = '"+pob+"',Student_Profile_Gender = '"+gender+"',Student_Profile_Civil_Status = '"+civilStatus+"',Student_Profile_Address = '"+address+"',Student_Profile_Contact_Number = '"+cn+"',Student_Profile_Email_Address = '"+emailAdd+"'  where Student_Profile_ID = (SELECT Student_Account_Student_Profile_ID FROM `t_student_account` where Student_Account_Student_Number = '"+studNumber+"' ) ";

			try {
				stmnt.execute(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			

		}
		
		

		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
