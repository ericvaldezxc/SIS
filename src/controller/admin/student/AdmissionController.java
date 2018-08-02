package controller.admin.student;

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

import configuration.EncryptandDecrypt;
import connection.DBConfiguration;

/**
 * Servlet implementation class CourseController
 */
@WebServlet("/Admin/Controller/Admin/Student/AdmissionController2")
public class AdmissionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmissionController() {
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

		String firstNameTxt = request.getParameter("firstNameTxt");
		String middleNameTxt = request.getParameter("middleNameTxt");
		String lastNameTxt = request.getParameter("lastNameTxt");
		String dobTxt = request.getParameter("dobTxt");
		String pobTxt = request.getParameter("pobTxt");
		String genderDrp = request.getParameter("genderDrp");
		String civilDrp = request.getParameter("civilDrp");
		String addressTxt = request.getParameter("addressTxt");
		String emailTxt = request.getParameter("emailTxt");
		String conTxt = request.getParameter("conTxt");

		
		
		String latcode = request.getParameter("latcode");
		String type = request.getParameter("type");

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
		if(type.equals("Insert"))
			sql = "insert into r_student_profile (Student_Profile_First_Name,Student_Profile_Middle_Name,Student_Profile_Last_Name,Student_Profile_Date_Of_Birth,Student_Profile_Place_Of_Birth,Student_Profile_Gender,Student_Profile_Civil_Status,Student_Profile_Address,Student_Profile_Contact_Number,Student_Profile_Email_Address) values ('"+ec.encrypt(ec.key, ec.initVector, firstNameTxt)+"','"+ec.encrypt(ec.key, ec.initVector, middleNameTxt)+"','"+ec.encrypt(ec.key, ec.initVector, lastNameTxt)+"','"+dobTxt+"','"+ec.encrypt(ec.key, ec.initVector, pobTxt)+"','"+genderDrp+"','"+civilDrp+"','"+ec.encrypt(ec.key, ec.initVector, addressTxt)+"','"+ec.encrypt(ec.key, ec.initVector, conTxt)+"','"+ec.encrypt(ec.key, ec.initVector, emailTxt)+"')";

		
//		else if(type.equals("Update"))
//			sql = "Update r_subject set Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, code)+"',Subject_Description = '"+ec.encrypt(ec.key, ec.initVector, desc)+"' where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"'";
//		else if(type.equals("Delete"))
//			sql = "Update r_subject set Subject_Display_Stat = 'Inactive'  where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"'";
//		else if(type.equals("Retrieve"))
//			sql = "Update r_subject set Subject_Display_Stat = 'Active'  where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"'";
		PrintWriter out = response.getWriter();	
		out.print(sql);
		try {
			stmnt.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
