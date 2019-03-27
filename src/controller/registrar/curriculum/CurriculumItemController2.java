package controller.registrar.curriculum;

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

import org.json.simple.JSONObject;

import configuration.EncryptandDecrypt;
import connection.DBConfiguration;

/**
 * Servlet implementation class CurriculumItemController
 */
@WebServlet("/Registrar/Controller/Registrar/Curriculum/CurriculumItemController2")
public class CurriculumItemController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CurriculumItemController2() {
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
		response.setContentType("plain/text");
		String code = request.getParameter("codeTxt");
		String prereq = request.getParameter("prereq");		
		EncryptandDecrypt ec = new EncryptandDecrypt();
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
//		  JsonObject json = new JsonObject();
//
//		    // put some value pairs into the JSON object .
//		    json.put("Mobile", 9999988888);
//		    json.put("Name", "ManojSarnaik");
//
//		    // finally output the json string       
//		    out.print(json.toString());		
		

//		    
//		    String json = new Gson().toJson(list);
//		    
//		PrintWriter out = response.getWriter();
//		String bindings = request.getParameter("bindings");
//		 response.getWriter().write(json);
		//		out.print(json);
//		else if(type.equals("View"))
//		{
//			sql = "SELECT Subject_Code,Subject_Description,Subject_Units FROM `r_curriculumitem` \r\n" + 
//					"	INNER JOIN r_subject ON CurriculumItem_SubjectID = Subject_ID \r\n" + 
//					"    WHERE Subject_Display_Stat = 'Active' and CurriculumItem_Display_Status = 'Active' ";
//			
//			JSONObject obj = new JSONObject();
////		    
////		      obj.put("name", "Anand");
////		      obj.put("age", new Integer(24));
////		      obj.put("place", "Bangalore");
//			
//			try {
//				ResultSet rs = stmnt.executeQuery(sql);
//				while(rs.next()){
//					 obj.put("code", ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code")));
//					 obj.put("desc", ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Description")));
//					 obj.put("unit", rs.getString("Subject_Units"));
//				      PrintWriter out = response.getWriter();	
//				      out.print(obj);
//				}
//
//				
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			
//			
//		 List<String> list = new ArrayList<String>();
//		    list.add("item1");
//		    list.add("item2");
//		    list.add("item3");		    
//		
//		    
//			
//		}
		      
		      
		      
//		      response.getWriter().write(obj);
//		      JSONObject jsonObject = JSONObject.fromObject( request.getQueryString() );  
//		      
//		      String username= jsonObject.get( "username" );  
//		      String password= jsonObject.get( "password" ); 
//		      String type= jsonObject.get( "type" );		      
		      
		      
		    
		try {
			
			if(type.equals("Insert")) {
				sql = "Insert into r_curriculumitem (CurriculumItem_CurriculumID,CurriculumItem_SubjectID,CurriculumItem_prereq) values ((SELECT MAX(IFNULL(Curriculum_ID,0)) FROM r_curriculum),(SELECT Subject_ID FROM `r_subject` WHERE Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, code) +"'),(SELECT Subject_ID FROM `r_subject` WHERE Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, prereq) +"'))";
				stmnt.execute(sql);
				
			}
			else if(type.equals("Update")){
				PrintWriter out = response.getWriter();	
				sql = "SELECT COUNT(*) as cou FROM r_curriculumitem INNER JOIN r_subject ON CurriculumItem_SubjectID =  Subject_ID INNER JOIN r_curriculum ON CurriculumItem_CurriculumID  = Curriculum_ID WHERE Curriculum_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"' AND Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, code)+"'";
				out.print(sql);
				stmnt.execute(sql);

				ResultSet rs = stmnt.executeQuery(sql);
				while(rs.next()){
					if(rs.getString("cou").equals("0")) {
						
						sql = "Insert into r_curriculumitem (CurriculumItem_CurriculumID,CurriculumItem_SubjectID,CurriculumItem_prereq) values ((SELECT Curriculum_ID FROM r_curriculum WHERE Curriculum_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode) +"' ),(SELECT Subject_ID FROM `r_subject` WHERE Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, code) +"'),(SELECT Subject_ID FROM `r_subject` WHERE Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, prereq) +"'))";
						
						out.print(sql);
						stmnt.execute(sql);
						
					}
					else {
//						sql = "UPDATE `r_curriculumitem` SET CurriculumItem_Display_Status = 'Active', CurriculumItem_prereq = (SELECT Subject_ID FROM `r_subject` WHERE Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, prereq) +"') WHERE CurriculumItem_ID = (SELECT CurriculumItem_ID FROM (SELECT * FROM r_curriculumitem) AS A INNER JOIN r_curriculum ON Curriculum_ID = A.CurriculumItem_CurriculumID INNER JOIN r_subject ON Subject_ID = A.CurriculumItem_SubjectID  WHERE Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, code) +"' AND Curriculum_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode) +"' LIMIT 1 )";
						sql = "UPDATE `r_curriculumitem` SET CurriculumItem_Display_Status = 'Active', CurriculumItem_prereq = (SELECT Subject_ID FROM `r_subject` WHERE Subject_Code ='"+ec.encrypt(ec.key, ec.initVector, prereq) +"') WHERE CurriculumItem_ID = (SELECT CurriculumItem_ID FROM (SELECT * FROM r_curriculumitem) AS A INNER JOIN r_curriculum ON Curriculum_ID = A.CurriculumItem_CurriculumID INNER JOIN r_subject ON Subject_ID = A.CurriculumItem_SubjectID  WHERE Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, code) +"' AND Curriculum_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode) +"' and Curriculum_CurriculumYearID = (SELECT CurriculumYear_ID FROM `r_curriculumyear` WHERE `CurriculumYear_Ative_Flag` = 'Active ') )";
						
//UPDATE `r_curriculumitem` SET CurriculumItem_Display_Status = 'Active', CurriculumItem_prereq = (SELECT Subject_ID FROM `r_subject` WHERE Subject_Code = 'MbXaI51r3be7gO7HPJEtSg==') WHERE CurriculumItem_ID = (SELECT CurriculumItem_ID FROM (select * from r_curriculumitem) AS A INNER JOIN r_curriculum ON Curriculum_ID = A.CurriculumItem_CurriculumID INNER JOIN r_subject ON Subject_ID = A.CurriculumItem_SubjectID WHERE Subject_Code = 'NvDCAmXFodYARJbCxelTmw==' AND Curriculum_Code = 'LtIAyXvIorDCteOIFZ2gUw=='  )
						out.print(sql);
						stmnt.execute(sql);
					
					}
				}

			}
			else if(type.equals("Delete")) {
				sql = "Update r_curriculumitem set Subject_Display_Stat = 'Inactive'  where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"'";
				stmnt.execute(sql);

			}
			else if(type.equals("Retrieve")) {
				sql = "Update r_curriculumitem set Subject_Display_Stat = 'Active'  where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"'";
				stmnt.execute(sql);

			}

			
		
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
