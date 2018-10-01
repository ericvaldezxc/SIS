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

import configuration.EncryptandDecrypt;
import connection.DBConfiguration;

/**
 * Servlet implementation class RoomController
 */
@WebServlet("/Registrar/Controller/Registrar/Scholarship/Scholarship")
public class Scholarship extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Scholarship() {
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


		String code = request.getParameter("code");
		String desc = request.getParameter("desc");
		String discount = request.getParameter("discount");
		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		
		Statement stmnt = null;
		try {
			stmnt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PrintWriter out = response.getWriter();	
		String sql = "";
		try {
			sql = "INSERT INTO r_scholarship (Scholarship_Code,Scholarship_Description,Scholarship_Percentage) VALUES ('"+code+"','"+desc+"','"+discount+"')";
			out.print(sql);
			
			sql = "INSERT INTO t_scholar_account (Scholar_Account_ScholarshipID,Scholar_Account_Balance) VALUES ((SELECT max(Scholarship_ID) FROM `r_scholarship` ),'0')";
			out.print(sql);
			
			
			stmnt.execute(sql);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
