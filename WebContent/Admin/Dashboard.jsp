<%@page import="java.sql.*"%>
<%@page import="connection.DBConfiguration" %>
<%@page import="configuration.EncryptandDecrypt" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/Admin" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	DBConfiguration db = new DBConfiguration();
	Connection conn = db.getConnection();
	if(conn == null)
		out.print("failasded");
	
	EncryptandDecrypt ec = new EncryptandDecrypt();
	
	String acadyear = "";
	String sem = "";

//	Statement stmnt = conn.createStatement();
//	ResultSet rs = stmnt.executeQuery("SELECT Academic_Year_Description,Academic_Year_Description FROM `r_active_academic_year` inner join r_academic_year on Academic_Year_ID = Active_Academic_Year_AcademicYearID where Active_Academic_Year_Flag = 'Active'");
//	while(rs.next()){
//		acadyear = ec.decrypt(ec.key, ec.initVector, rs.getString("Academic_Year_Description"));
		
//	}
//	rs = stmnt.executeQuery("SELECT Semester_Code,Semester_Description FROM `r_active_semester` inner join  r_semester on Semester_ID = Active_Semester_SemesterID where Active_Semester_Flag = 'Active'");
//	while(rs.next()){
//		sem = ec.decrypt(ec.key, ec.initVector, rs.getString("Semester_Code"));
		
//	}
		
		
	pageContext.setAttribute("acadyear", acadyear);
	pageContext.setAttribute("sem", sem);


%>    

<t:Admin title="Dashboard" from="Dashboard" to="">

    
	<jsp:attribute name="customImportedScript">      
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>
    </jsp:attribute>    
    
    <jsp:body>
			<div class="row">
			    <div class="col-md-6">
			        <div class="mini-stat clearfix">
			            <span class="mini-stat-icon orange"><i class="fa fa-gavel"></i></span>
			            <div class="mini-stat-info">
			                <span id="yearTxt">${acadyear }</span>
			                Active Academic Year
			            </div>
			        </div>
			    </div>
			    <div class="col-md-6">
			        <div class="mini-stat clearfix">
			            <span class="mini-stat-icon tar"><i class="fa fa-tag"></i></span>
			            <div class="mini-stat-info">
			                <span id="semesterTxt">${sem }</span>
			                Active Semester
			            </div>
			        </div>
			    </div>
			</div>
    </jsp:body>


</t:Admin>
