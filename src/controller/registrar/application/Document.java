package controller.registrar.application;

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
import connection.DBConfiguration;

/**
 * Servlet implementation class GetDocument
 */
@WebServlet("/Registrar/Controller/Registrar/Application/Document")
public class Document extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Document() {
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

		JSONArray document = new JSONArray();
		Object object=null;
		JSONParser jsonParser=new JSONParser();
		
		try {
			object=jsonParser.parse(request.getParameter("docu"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String latcode = request.getParameter("latcode");
		document=(JSONArray) object;

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
		
		
		PrintWriter out = response.getWriter();	
		
		try {
			sql = "update r_student_document set Student_Document_Display_Status = 'Inactive' where  Student_Document_StudentApplicationID = (select Student_Application_ID from r_student_application where Student_Application_Application_Number = '"+latcode+"')";
			stmnt.execute(sql);
			for (Object o : document) {
				out.print(o+"\n");				
				sql = "SELECT count(*) as cou FROM `r_student_document` WHERE Student_Document_StudentApplicationID = (select Student_Application_ID from r_student_application where Student_Application_Application_Number = '"+latcode+"') and Student_Document_DocumentID = '"+o+"' ";
				out.print(sql+"\n");
				ResultSet rs = stmnt.executeQuery(sql);
				String sql2 ="";
				while(rs.next()){
					if(rs.getString("cou").equals("0")) {
						sql2 = "INSERT INTO r_student_document (Student_Document_StudentApplicationID,Student_Document_DocumentID) VALUES ((select Student_Application_ID from r_student_application where Student_Application_Application_Number = '"+latcode+"'),'"+o+"')";
						
					}
					else {
						sql2 = "update r_student_document set Student_Document_Display_Status = 'Active' where  Student_Document_StudentApplicationID = (select Student_Application_ID from r_student_application where Student_Application_Application_Number = '"+latcode+"') and Student_Document_DocumentID = '"+o+"'";

					}
					out.print(sql2+"\n");
					
				}
				stmnt.execute(sql2);
				
			}
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
