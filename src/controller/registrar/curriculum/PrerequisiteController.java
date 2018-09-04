package controller.registrar.curriculum;

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

import org.json.simple.JSONObject;

import configuration.EncryptandDecrypt;
import connection.DBConfiguration;

/**
 * Servlet implementation class PrerequisiteController
 */
@WebServlet("/Registrar/Controller/Registrar/Curriculum/PrerequisiteController")
public class PrerequisiteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrerequisiteController() {
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
		
		String sql = "";

		String main = request.getParameter("main");
		String prereq = request.getParameter("prereq");
		String count = request.getParameter("count");
		if(count.equals("0")) {
			sql = "Update r_prerequisite set Prerequisite_Display_Status = 'Inactive' where Prerequisite_Main_SubjectID = (SELECT Subject_ID FROM r_subject where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, main)+"')";
			
			
		}
		
		try {
			out.print(sql);
			stmnt.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.print(sql);
			e.printStackTrace();
		}
		

		sql = "Select Count(*) as cou from r_prerequisite where Prerequisite_Main_SubjectID = (SELECT Subject_ID FROM r_subject where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, main)+"') and Prerequisite_Prequisite_SubjectID = (SELECT Subject_ID FROM r_subject where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, prereq)+"') ";
		ResultSet rs;
		String cou ="";
		try {
			rs = stmnt.executeQuery(sql);
			while(rs.next()){
				cou = rs.getString("cou");
			      
			}

		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		

		try {
			if(cou.equals("0")) {
				sql = "Insert into r_prerequisite (Prerequisite_Main_SubjectID,Prerequisite_Prequisite_SubjectID) values ((SELECT Subject_ID FROM r_subject where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, main)+"'),(SELECT Subject_ID FROM r_subject where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, prereq)+"'))";
				stmnt.execute(sql);
			}
			else {
				sql = "Update r_prerequisite set Prerequisite_Display_Status = 'Active' where Prerequisite_Main_SubjectID = (SELECT Subject_ID FROM r_subject where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, main)+"') and Prerequisite_Prequisite_SubjectID = (SELECT Subject_ID FROM r_subject where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, prereq)+"')";
				stmnt.execute(sql);
			}

			out.print(sql+";"+cou);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

















