package controller.registrar.student;

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
 * Servlet implementation class StudentProfile
 */
@WebServlet("/Registrar/Controller/Registrar/Student/StudentProfile")
public class StudentProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentProfile() {
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


		String firstNameTxt = request.getParameter("fname");
		String middleNameTxt = request.getParameter("mname");
		String lastNameTxt = request.getParameter("lname");
		String dobTxt = request.getParameter("dob");
		String pobTxt = request.getParameter("pob");
		String genderDrp = request.getParameter("gen");
		String civilDrp = request.getParameter("civil");
		String addressTxt = request.getParameter("add");
		String emailTxt = request.getParameter("email");
		String conTxt = request.getParameter("con");
		String guardname = request.getParameter("gname");
		String guardnum = request.getParameter("gcon");

		
		
		String latcode = request.getParameter("latcode");

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
		sql = "update r_student_profile set Student_Profile_First_Name = '"+ec.encrypt(ec.key, ec.initVector, firstNameTxt)+"' ,Student_Profile_Middle_Name = '"+ec.encrypt(ec.key, ec.initVector, middleNameTxt)+"' ,Student_Profile_Last_Name = '"+ec.encrypt(ec.key, ec.initVector, lastNameTxt)+"' ,Student_Profile_Date_Of_Birth = '"+dobTxt+"' ,Student_Profile_Place_Of_Birth = '"+ec.encrypt(ec.key, ec.initVector, pobTxt)+"' ,Student_Profile_Gender = '"+genderDrp+"' ,Student_Profile_Civil_Status = '"+civilDrp+"' ,Student_Profile_Address = '"+ec.encrypt(ec.key, ec.initVector, addressTxt)+"' ,Student_Profile_Contact_Number = '"+ec.encrypt(ec.key, ec.initVector, conTxt)+"' ,Student_Profile_Email_Address = '"+ec.encrypt(ec.key, ec.initVector, emailTxt)+"',Student_Profile_Guardian_Contact_Number = '"+guardnum+"' , Student_Profile_Guardian_Name = '"+guardname+"' where Student_Profile_ID = (SELECT Student_Account_Student_Profile_ID FROM `t_student_account` where Student_Account_Student_Number = '"+latcode+"') ";
		
		PrintWriter out = response.getWriter();	
		out.print(sql);
		try {
			stmnt.execute(sql);
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
