package controller.student.registration;

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

import configuration.EncryptandDecrypt;
import connection.DBConfiguration;

/**
 * Servlet implementation class FillMandatoryFee
 */
@WebServlet("/Student/Controller/Student/Registration/FillSubjectFee")
public class FillSubjectFee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FillSubjectFee() {
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

		String subj = request.getParameter("subj");
		
		Statement stmnt = null;
		try {
			stmnt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "";
		
		sql = "SELECT *,format(Subject_Fee_Items_Amount,2) as amo FROM `r_subject_fee_items` inner join r_subject_fee on Subject_Fee_Items_SubjectFeeID = Subject_Fee_ID inner join r_fee on Fee_ID = Subject_Fee_Items_FeeID inner join r_academic_year on Subject_Fee_AcademicYearID = Academic_Year_ID where Academic_Year_Active_Flag = 'Present' and Subject_Fee_Items_Display_Status = 'Active' and Subject_Fee_Display_Status = 'Active' and Subject_Fee_SubjectID = (SELECT Subject_ID FROM r_subject WHERE Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, subj)+"')  ";
		
		JSONArray arr = new JSONArray();
		PrintWriter out = response.getWriter();	
		//out.print(sql);
		
		try {
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				 JSONObject obj = new JSONObject();
				 obj.put("amount", rs.getString("amo"));
				 obj.put("fee", ec.decrypt(ec.key, ec.initVector, rs.getString("Fee_Description")));
				 arr.add(obj);
			      
			}
			out.print(arr);	//out.print(sql);

			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
