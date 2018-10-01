package controller.registrar.scholarship;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
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
import configuration.Fullname;
import connection.DBConfiguration;

/**
 * Servlet implementation class Payment
 */
@WebServlet("/Registrar/Controller/Scholarship/Scholarship/GetStudentPayment")
public class GetStudentPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetStudentPayment() {
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
			object=jsonParser.parse(request.getParameter("student"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		

	
		
		
		studentlist=(JSONArray) object;
		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		PrintWriter out = response.getWriter();	
		Statement stmnt = null;
		try {
			stmnt = conn.createStatement();
		} catch (SQLException e) { 	
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		out.print(studentlist);
		String sql = "";
		
		
		try {
			
			JSONArray arr = new JSONArray();
			double totalamounttopay = 0;
			for (Object studnum : studentlist) {
				
		        sql = "SELECT * FROM t_student_account inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join  r_section on Student_Account_SectionID = Section_ID inner join t_payment on Payment_Student_Account_ID = Student_Account_ID WHERE  Student_Account_Student_Number = '"+studnum+"'";
		        //out.print(sql+"\n");
		        ResultSet rs = stmnt.executeQuery(sql);
				String studid = "";
				String yearlvl = "";
				String balance = "";
				String fname = "";	
				String mname = "";	
				String lname = "";	
				String fullname = "";
				String section = "";
				while(rs.next()){
					studid = rs.getString("Student_Account_ID");
					section = rs.getString("Section_Code");
					yearlvl = rs.getString("Student_Account_Year");
					fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
					mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
					lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
					Fullname fn = new Fullname();
					fullname = fn.fullname(fname, mname, lname);
					
				}
				
				String efee = "0.00";
				sql = "SELECT format(ifnull(sum(Breakdown_Fee_Amount),0),2) as efee FROM t_breakdown_fee WHERE  Breakdown_Fee_Student_Account_ID = '"+studid+"' and Breakdown_Fee_Semester_ID = (SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active') and Breakdown_Fee_AcademicYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present') and Breakdown_Fee_Type = 'Enrollment' ";
				//out.print(sql+"\n");				
				rs = stmnt.executeQuery(sql);
				while(rs.next()){
					efee = rs.getString("efee");
					
					
				}
				JSONObject obj = new JSONObject();
				obj.put("name", fullname);
				obj.put("section", section);
				obj.put("studnum", studnum);
				obj.put("amount", efee);
				arr.add(obj);
				
				

					
			}
			out.print(arr);

			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
