package controller.student.registration;

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
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import configuration.EncryptandDecrypt;
import connection.DBConfiguration;

/**
 * Servlet implementation class GetSection
 */
@WebServlet("/Student/Controller/Student/Registration/Fee")
public class Fee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fee() {
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

		JSONParser jsonParser=new JSONParser();
		Object subj=null;
		try {
			subj=jsonParser.parse(request.getParameter("subj"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		JSONArray subjlist = new JSONArray();
		subjlist=(JSONArray) subj;
		
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
			
			
			
			for (Object subjcode : subjlist) {
//				out.print(subjcode);
				sql = "SELECT *,format(Subject_Fee_Items_Amount,2)  as amou FROM `r_subject_fee` inner join r_subject_fee_items on  Subject_Fee_ID = Subject_Fee_Items_SubjectFeeID inner join r_fee on Subject_Fee_Items_FeeID = Fee_ID  where Subject_Fee_SubjectID = (SELECT Subject_ID FROM r_subject WHERE Subject_Code = '"+ec.encrypt(ec.key, ec.initVector,  subjcode.toString()) +"')";
				ResultSet rs = stmnt.executeQuery(sql);
				while(rs.next()){
					 JSONObject obj = new JSONObject();
					 obj.put("fee",ec.decrypt(ec.key, ec.initVector,  rs.getString("Fee_Description")));
					 obj.put("amount", rs.getString("amou"));
					 arr.add(obj);				      
				}
			}		
			
			out.print(arr);	

			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
