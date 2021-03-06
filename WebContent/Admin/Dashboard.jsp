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

	Statement stmnt = conn.createStatement();
	ResultSet rs = stmnt.executeQuery("SELECT Academic_Year_Description FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'");
	while(rs.next()){
		acadyear = ec.decrypt(ec.key, ec.initVector, rs.getString("Academic_Year_Description"));
		
	}
	rs = stmnt.executeQuery("SELECT Semester_Description FROM `r_semester` where Semester_Active_Flag = 'Active'");
	while(rs.next()){
		sem = ec.decrypt(ec.key, ec.initVector, rs.getString("Semester_Description"));
		
	}
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
			            <span class="mini-stat-icon orange">
			            	<i class="fa fa-calendar"></i>
			            </span>	      
			            <div class="mini-stat-info">
			                <span id="yearTxt">${acadyear }</span>
			                Active Academic Year
			            </div>
			        </div>
			    </div>
			    <div class="col-md-6">
			        <div class="mini-stat clearfix">
			            <span class="mini-stat-icon tar"><i class="fa fa-asterisk"></i></span>
			            <div class="mini-stat-info">
			                <span id="semesterTxt">${sem }</span>
			                Active Semester
			            </div>
			        </div>
			    </div>
			</div>
    </jsp:body>


</t:Admin>
