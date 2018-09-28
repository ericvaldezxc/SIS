<%@page import="java.sql.*"%>
<%@page import="connection.DBConfiguration" %>
<%@page import="configuration.EncryptandDecrypt" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/Student" %>
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

<t:Student title="Calendar" from="Calendar" to="">
	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
				window.addEventListener('load', function () {
					vanillaCalendar.init({
						disablePastDays: true
					});
				})
			});
		</script>
    </jsp:attribute>
    
	<jsp:attribute name="customImportedScript">      
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>
		<script src="../Assets/js/vanillaCalendar.js""></script>
		
    </jsp:attribute>    
    
    <jsp:body>
   		<link rel="stylesheet" href="../Assets/js/vanillaCalendar.css">
    	
    	<div class="col-md-6">
	        <div class="mini-stat clearfix">
	            <span class="mini-stat-icon orange"></span>	        
	            <div class="mini-stat-info">
	                <span id="academicyear">${acadyear}</span>
	                Active Academic Year
	            </div>
	        </div>
    	</div>
    	<div class="col-md-6">
	        <div class="mini-stat clearfix">
		        <span class="mini-stat-icon tar"></span>
	            <div class="mini-stat-info">
	                <span id="semester">${sem}</span>
	                Active Semester
	            </div>
	        </div>
    	</div>
    	
    	<div class="col-md-12">
	        <div id="v-cal">
			<div class="vcal-header">
				<button class="vcal-btn" data-calendar-toggle="previous">
					<svg height="24" version="1.1" viewbox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
						<path d="M20,11V13H8L13.5,18.5L12.08,19.92L4.16,12L12.08,4.08L13.5,5.5L8,11H20Z"></path>
					</svg>
				</button>

				<div class="vcal-header__label" data-calendar-label="month">
					March 2017
				</div>


				<button class="vcal-btn" data-calendar-toggle="next">
					<svg height="24" version="1.1" viewbox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
						<path d="M4,11V13H16L10.5,18.5L11.92,19.92L19.84,12L11.92,4.08L10.5,5.5L16,11H4Z"></path>
					</svg>
				</button>
			</div>
			<div class="vcal-week">
				<span>Mon</span>
				<span>Tue</span>
				<span>Wed</span>
				<span>Thu</span>
				<span>Fri</span>
				<span>Sat</span>
				<span>Sun</span>
			</div>
			<div class="vcal-body" data-calendar-area="month"></div>
		</div>
    	</div>
    	
    	 

    </jsp:body>


</t:Student>
