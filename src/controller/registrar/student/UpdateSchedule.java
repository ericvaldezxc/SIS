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
@WebServlet("/Registrar/Controller/Registrar/Student/UpdateSchedule")
public class UpdateSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSchedule() {
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

		String takenID = request.getParameter("takenID");
		String section = request.getParameter("section");

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
		
			sql = "UPDATE t_student_taken_curriculum_subject set Student_Taken_Curriculum_Subject_SectionID = (select Section_ID from r_section where Section_Code = '"+section+"') where Student_Taken_Curriculum_Subject_ID = '"+takenID+"'";
			out.print(sql);
			stmnt.execute(sql);

			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
