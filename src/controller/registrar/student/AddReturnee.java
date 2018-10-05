package controller.registrar.student;

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

import configuration.EncryptandDecrypt;
import connection.DBConfiguration;

/**
 * Servlet implementation class Application
 */
@WebServlet("/Registrar/Controller/Registrar/Student/AddReturnee")
public class AddReturnee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddReturnee() {
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

		String studnum = request.getParameter("studnum");

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
//			sql = "insert into r_student_profile (Student_Profile_First_Name,Student_Profile_Middle_Name,Student_Profile_Last_Name,Student_Profile_Date_Of_Birth,Student_Profile_Place_Of_Birth,Student_Profile_Gender,Student_Profile_Civil_Status,Student_Profile_Address,Student_Profile_Contact_Number,Student_Profile_Email_Address) values ('"+ec.encrypt(ec.key, ec.initVector, firstNameTxt)+"','"+ec.encrypt(ec.key, ec.initVector, middleNameTxt)+"','"+ec.encrypt(ec.key, ec.initVector, lastNameTxt)+"','"+dobTxt+"','"+ec.encrypt(ec.key, ec.initVector, pobTxt)+"','"+genderDrp+"','"+civilDrp+"','"+ec.encrypt(ec.key, ec.initVector, addressTxt)+"','"+ec.encrypt(ec.key, ec.initVector, conTxt)+"','"+ec.encrypt(ec.key, ec.initVector, emailTxt)+"')";
		
		
		try {

			PrintWriter out = response.getWriter();	
			sql = "Insert into t_returnee (Returnee_StudentAccountID,Returnee_AcademicYearID,Returnee_SemesterID) values ((SELECT Student_Account_ID FROM `t_student_account` where Student_Account_Student_Number = '"+studnum+"'),(SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'),(SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active' )) ";
			out.print(sql);
			stmnt.execute(sql);

			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
