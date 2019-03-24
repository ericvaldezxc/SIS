package controller.registrar.admission;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import configuration.EncryptandDecrypt;
import connection.DBConfiguration;

/**
 * Servlet implementation class AdmissionTakenSubjectController
 */
@WebServlet("/Registrar/Controller/Registrar/Admission/importApplicant")
public class importApplicant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public importApplicant() {
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
		response.setContentType("text/plain");
		EncryptandDecrypt ec = new EncryptandDecrypt();
		
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
		for (Object o : studentlist) {
			JSONObject student = (JSONObject) o;
			String fname = (String) student.get("firstName");
			String mname = (String) student.get("middleName");
			String lname = (String) student.get("lastName");
			String cn = (String) student.get("cn");
			String emailAdd = (String) student.get("emailAdd");
			String guardianName = (String) student.get("guardianName");
			String guardianContactNumber = (String) student.get("guardianContactNumber");
			String dob = (String) student.get("dob");
			String pob = (String) student.get("pob");
			String gender = (String) student.get("gender");
			String civilStatus = (String) student.get("civilStatus");
			String address = (String) student.get("address");
			
			fname = ec.encrypt(ec.key, ec.initVector, fname);
			mname = ec.encrypt(ec.key, ec.initVector, mname);
			lname = ec.encrypt(ec.key, ec.initVector, lname);
			cn = ec.encrypt(ec.key, ec.initVector, cn);
			emailAdd = ec.encrypt(ec.key, ec.initVector, emailAdd);
			pob = ec.encrypt(ec.key, ec.initVector, pob);
			address = ec.encrypt(ec.key, ec.initVector, address);

			PrintWriter out = response.getWriter();	
			try {
				sql = "insert into r_student_profile (Student_Profile_First_Name , Student_Profile_Middle_Name , Student_Profile_Last_Name , Student_Profile_Contact_Number , Student_Profile_Email_Address, Student_Profile_Guardian_Name ,  Student_Profile_Guardian_Contact_Number ,  Student_Profile_Date_Of_Birth ,Student_Profile_Place_Of_Birth ,Student_Profile_Gender , Student_Profile_Civil_Status , Student_Profile_Address) values ( '"+fname+"' , '"+mname+"' , '"+lname+"' , '"+cn+"' , '"+emailAdd+"' , '"+guardianName+"' , '"+guardianContactNumber+"' , '"+dob+"' , '"+pob+"' , '"+gender+"' , '"+civilStatus+"' , '"+address+"'  ) ";
				out.print(sql);
				stmnt.execute(sql);
				
				sql = "Insert into r_student_application (Student_Application_StudentProfileID,Student_Application_Application_Number) values ((SELECT MAX(Student_Profile_ID) FROM r_student_profile),(SELECT CONCAT(YEAR(CURRENT_DATE),'-',RIGHT(100000+count(*)+1,5)) FROM (SELECT * FROM r_student_application) AS T1 where LEFT(Student_Application_Application_Number,4) = YEAR(CURRENT_DATE)))";
				out.print(sql);
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
