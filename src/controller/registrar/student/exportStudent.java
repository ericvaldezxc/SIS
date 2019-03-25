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
@WebServlet("/Registrar/Controller/Registrar/Student/exportStudent")
public class exportStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public exportStudent() {
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
		String contactnum = "";
		String guardiannum = "";
		String dob = "";
		String pob = "";
		String gender = "";
		String emailaddress = "";
		String civil = "";
		String address = "";
		JSONArray students = new JSONArray();
		PrintWriter out = response.getWriter();	

		for (Object o : studentlist) {
			sql = "SELECT *,ifnull(Student_Profile_Guardian_Contact_Number,'') as gcn from t_student_account inner join r_student_profile on Student_Account_Student_Profile_ID  =  Student_Profile_ID  where Student_Account_Student_Number= '"+o+"'";
//			out.print(sql);
			try {
				ResultSet rs = stmnt.executeQuery(sql);
				JSONObject obj = new JSONObject();
				JSONArray student = new JSONArray();
				
				while(rs.next()){
					guardiannum = rs.getString("gcn");
					dob = rs.getString("Student_Profile_Date_Of_Birth");
					gender = rs.getString("Student_Profile_Gender");
					civil = rs.getString("Student_Profile_Civil_Status");
					address = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Address"));
					emailaddress = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Email_Address"));
					contactnum = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Contact_Number"));
					pob = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Place_Of_Birth"));
					obj.put("fname", ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name") ));
					obj.put("mname", ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name") ));
					obj.put("lname", ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name")) );
					obj.put("guardiannum", guardiannum);
					obj.put("dob", dob);
					obj.put("pob", pob);
					obj.put("gender", gender);
					obj.put("civil", civil);
					obj.put("address", address);
					obj.put("contactnum", contactnum);
					obj.put("emailaddress", emailaddress);
					obj.put("guardianname", rs.getString("Student_Profile_Guardian_Name"));
					obj.put("studentNumber", o);
					//student.add(obj);
					students.add(obj);
					
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			


			
			
			

		}
		
		out.print(students);

		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
