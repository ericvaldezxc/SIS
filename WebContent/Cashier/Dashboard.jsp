<%@page import="java.sql.*"%>
<%@page import="connection.DBConfiguration" %>
<%@page import="configuration.EncryptandDecrypt" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/Cashier" %>
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
	Statement stmnt2 = conn.createStatement();
	ResultSet rs = stmnt.executeQuery("SELECT Academic_Year_Description FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'");
	while(rs.next()){
		acadyear = ec.decrypt(ec.key, ec.initVector, rs.getString("Academic_Year_Description"));
		
	}
	rs = stmnt.executeQuery("SELECT Semester_Description FROM `r_semester` where Semester_Active_Flag = 'Active'");
	while(rs.next()){
		sem = ec.decrypt(ec.key, ec.initVector, rs.getString("Semester_Description"));
		
	}
	String scholars = "";
	String scholarsbalance = "";
	rs = stmnt.executeQuery("SELECT Scholarship_ID,Scholarship_Code,Scholarship_Description FROM `r_scholarship` where Scholarship_Display_Status = 'Active'");
	while(rs.next()){
		scholars += "<th>"+  rs.getString("Scholarship_Code") +"</th>";
		ResultSet rs2 = stmnt2.executeQuery("SELECT *,Scholar_Account_Balance as amo FROM `t_scholar_account` where Scholar_Account_ScholarshipID = '"+rs.getString("Scholarship_ID")+"'");
		while(rs2.next()){
			scholarsbalance += "<td>"+ rs2.getString("amo") +"</td>";
						
		}
				
	}
	pageContext.setAttribute("acadyear", acadyear);
	pageContext.setAttribute("scholars", scholars);
	pageContext.setAttribute("scholarsbalance", scholarsbalance);
	pageContext.setAttribute("sem", sem);

%>    

<t:Cashier title="Dashboard" from="Dashboard" to="">
	<jsp:attribute name="myscript"> 
		<script>
			$(document).ready(function(){
	            Highcharts.chart('sanctions', {
	                data: {
	                    table: 'tblSanction'
	                },
	                chart: {
	                    type: 'column'
	                },
	                title: {
	                    text: 'Scholars Bar Graph'
	                },
	                yAxis: {
	                    allowDecimals: false,
	                    title: {
	                        text: 'Balance'
	                    }
	                },
	                tooltip: {
	                    formatter: function() {
	                        return '<b>' + this.series.name + '</b><br/>' +
	                            this.point.y + ' Php' ;
	                    }
	                }
	            });

				

			})
		</script>
	</jsp:attribute>

    
	<jsp:attribute name="customImportedScript">      
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>
	    <script src="../Assets/js/highcharts.js"></script>
	    <script src="../Assets/js/data.js"></script>
	    <script src="../Assets/js/drilldown.js"></script>
	    <script src="../Assets/js/exporting.js"></script>

    </jsp:attribute>    
    
	<jsp:body>
			<div class="row">
			    <div class="col-md-6">
			        <div class="mini-stat clearfix">
			            <span class="mini-stat-icon orange"></span>
			            <div class="mini-stat-info">
			                <span id="yearTxt">${acadyear }</span>
			                Active Academic Year
			            </div>
			        </div>
			    </div>
			    <div class="col-md-6">
			        <div class="mini-stat clearfix">
			            <span class="mini-stat-icon tar"></span>
			            <div class="mini-stat-info">
			                <span id="semesterTxt">${sem }</span>
			                Active Semester
			            </div>
			        </div>                           
			    </div>
	        	<div class="col-md-12">
		            <section class="panel">
		                <div class="panel-body">
		                    <div id="sanctions" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
		                    <table id="tblSanction" class="hidden">
                                <thead>
                                    <tr>
                                        <th></th>
                                       	${scholars}
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th>Balance</th>
                                        ${scholarsbalance}
                                    </tr>
                                </tbody>
                            </table>
		                </div>
		            </section>
		        </div> 
			</div>
    </jsp:body>



</t:Cashier>
