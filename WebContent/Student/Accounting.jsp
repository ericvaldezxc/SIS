<%@page import="java.sql.*"%>
<%@page import="connection.DBConfiguration" %>
<%@page import="configuration.*" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/Student" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	DBConfiguration db = new DBConfiguration();
	Connection conn = db.getConnection();
	if(conn == null)
		out.print("failasded");
	String username = "";
	EncryptandDecrypt ec = new EncryptandDecrypt();
	Fullname fn = new Fullname();
	FinalGrade fg = new FinalGrade();
	Dropdowns drp = new Dropdowns();
	String campusDrp = drp.fillcampusDrp();
	String tablebody = "";
	String uname = "";
	if( session.getAttribute("username").toString() != null)
		 uname = session.getAttribute("username").toString(); 
	String body = "";
	Statement stmnt = conn.createStatement();
	Statement stmnt2 = conn.createStatement();
	ResultSet rs2 = null;
	String sql ="";
	
	
	ResultSet rs = stmnt.executeQuery("SELECT *,ifnull(Scholarship_Description,'') as scho,format(Payable_History_Amount,2) as amo,format(Payable_History_Balance,2) as bal,TIME_FORMAT(Payable_History_Date_Added, '%Y-%m-%d ') as gdate FROM `t_payable_history` inner join t_student_account on Student_Account_ID = Payable_History_Student_Account_ID inner join r_semester on Payable_History_Semester_ID = Semester_ID inner join r_academic_year on Payable_History_AcademicYearID = Academic_Year_ID  left join r_scholarship on Payable_History_ScholarshipID = Scholarship_ID where Student_Account_Student_Number = '"+uname+"' order by Payable_History_Date_Added asc" ) ;
	while(rs.next()){
		String assessment = "0.00";
		String payment = "0.00";
		if(rs.getString("Payable_History_Type").equals("Assessment"))
			assessment = rs.getString("amo");
		else
			payment = rs.getString("amo");
			
		String sem = ec.decrypt(ec.key, ec.initVector, rs.getString("Semester_Description"));
		String acadyear = ec.decrypt(ec.key, ec.initVector, rs.getString("Academic_Year_Description"));
		tablebody += "<tr><td>" + sem +"</td><td>" +rs.getString("Payable_History_Year_Level")  +"</td><td>" +rs.getString("Payable_History_Description")  +"</td><td>" +rs.getString("gdate")  +"</td><td>"+rs.getString("scho")+"</td><td>" +assessment  +"</td><td>" +payment  +"</td><td>" +rs.getString("bal")  +"</td></tr>"; 

	}
	pageContext.setAttribute("tablebody", tablebody);
	

%>    

<t:Student title="Accounting" from="Accounting" to="">

	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
				
			});
		</script>
    </jsp:attribute>
    
	<jsp:attribute name="customImportedScript">      
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>
    </jsp:attribute>    
    
    <jsp:body>
    	<script src="../Assets/Student/Schedule/Schedule.js"></script>
    
       <div class="row">
       	<div class="col-sm-12">
            	<section class="panel">
                        <div class="panel-body">
                            <div class="adv-table editable-table ">
                                <div class="space15"></div>
                                <table class="table table-hover" id="curTbl">
               			<thead>
	                    	<tr>
	                            <th style="width: %">Semester</th>
	                            <th style="width: %">Year Level</th>
	                            <th style="width: %">Description</th>
	                            <th style="width: %">Date</th>
	                            <th style="width: %">Scholarship</th>		                            
	                            <th style="width: %">Assessment</th>		                            
	                            <th style="width: %">Payment</th>
	                            <th style="width: %">Balance</th>
	                       	</tr>
                   		</thead>
                   		<tbody id="schedBody">   
                   			${tablebody}
                   		</tbody>
              			</table>
                            </div>
                        </div>
                    </section>
               </div>
         </div>
	    </jsp:body>


</t:Student>
