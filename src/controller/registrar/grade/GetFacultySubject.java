package controller.registrar.grade;

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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import configuration.EncryptandDecrypt;
import connection.DBConfiguration;

/**
 * Servlet implementation class GetSection
 */
@WebServlet("/Registrar/Controller/Registrar/Grade/GetFacultySubject")
public class GetFacultySubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetFacultySubject() {
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

		String uname = request.getParameter("faculty");

		

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
		
		JSONArray arr = new JSONArray();
		PrintWriter out = response.getWriter();	
		
		
		try {
			ResultSet rs = stmnt.executeQuery("SELECT * FROM `r_faculty_subject` inner join r_subject on Faculty_Subject_SubjectID = Subject_ID where Faculty_Subject_ProfessorID = (SELECT Professor_ID FROM `r_professor` WHERE `Professor_Code` = '"+uname+"' ) and Subject_Type = 'Academic' ");
			String Drp = "";
			int  i = 0 ;
			
			while(rs.next()){
				if(i == 0){
					Drp += "<optgroup label='Academic'>";				
					
				}
				Drp += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code"))+"' data-cred-unit='"+rs.getString("Subject_Credited_Units")+"'  >"+ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code"))+"-"+ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Description"))+"</option>";

				i++;
				
			}
			if(i != 0){
				Drp += "</optgroup>";				
				
			}
			i = 0;
			rs = stmnt.executeQuery("SELECT * FROM `r_faculty_subject` inner join r_subject on Faculty_Subject_SubjectID = Subject_ID where Faculty_Subject_ProfessorID = (SELECT Professor_ID FROM `r_professor` WHERE `Professor_Code` = '"+uname+"' ) and Subject_Type = 'Non-Academic'");
			while(rs.next()){
				if(i == 0){
					Drp += "<optgroup label='Non-Academic'>";				
					
				}
				Drp += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code"))+"' data-cred-unit='"+rs.getString("Subject_Credited_Units")+"'  >"+ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code"))+"-"+ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Description"))+"</option>";

				i++;
				
			}
			if(i != 0){
				Drp += "</optgroup>";				
				
			}

			
			
			
			
			out.print(Drp);	

			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
