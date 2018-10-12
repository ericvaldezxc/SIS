<%@page import="java.sql.*"%>
<%@page import="connection.DBConfiguration" %>
<%@page import="configuration.EncryptandDecrypt" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/Registrar" %>
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

<t:Registrar title="Dashboard" from="Dashboard" to="">
	<jsp:attribute name="myscript"> 
		<script>
			$(document).ready(function(){
				$.ajax({
					type:'POST',
					data:{},
					url: 'Controller/Registrar/Dashboard/Student',
					dataType: 'json',
					success: function(data){
						var head = []
						var firstseries = []
						var firstseriesbody = []
						var firstseriesfinalbody = []
						
						$.each(data, function(key, val) {
							head.push({ name : val.year, y : parseFloat(val.total) , drilldown : val.year })
							
							$.each(val.body, function(key2, val2) {
								firstseriesbody.push(val2.course,parseFloat(val2.cou));
								
							})
							firstseriesfinalbody.push(firstseriesbody)
							firstseries.push({ name : val.year, id : val.year, data : firstseriesfinalbody })
							
						})
						console.log(JSON.stringify(head))
						console.log(JSON.stringify(firstseries))
						
						
						Highcharts.chart('student', {
						    chart: {
						        type: 'column'
						    },
						    title: {
						        text: 'Student'
						    },
						    subtitle: {
						        text: 'Per academic year'
						    },
						    xAxis: {
						        type: 'category'
						    },
						    yAxis: {
						        title: {
						            text: 'Number of Student'
						        }

						    },
						    legend: {
						        enabled: false
						    },
						    plotOptions: {
						        series: {
						            borderWidth: 0,
						            dataLabels: {
						                enabled: true,
						                format: '{point.y:0f}'
						            }
						        }
						    },

						    tooltip: {
						        headerFormat: '<span style="font-size:11px">{point.name} {series.name}s</span><br>',
						        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:0f} Student</b> of total<br/>'
						    },

						    "series": [
						        {
						            "name": "Student",
						            "colorByPoint": true,
						            "data":head
						        }
						    ],
						    "drilldown": {
						        "series": firstseries
						    }
						});
						
	                	

	                     
					},
	                error: function (response) {
	                    swal("Error encountered while accessing the data", "Please try again", "error");
	                }

				});
				
				$.ajax({
					type:'POST',
					data:{},
					url: 'Controller/Registrar/Dashboard/GetEnrolledPerCur',
					dataType: 'json',
					success: function(data){
						var head = []
						var firstseries = []
						var firstseriesbody = []
						var firstseriesfinalbody = []
						
						$.each(data, function(key, val) {
							head.push({ name : val.year, y : parseFloat(val.total) , drilldown : val.year })
							
							$.each(val.body, function(key2, val2) {
								firstseriesbody.push(val2.course,parseFloat(val2.cou));
								
							})
							firstseriesfinalbody.push(firstseriesbody)
							firstseries.push({ name : val.year, id : val.year, data : firstseriesfinalbody })
							
						})
						console.log(JSON.stringify(head))
						console.log(JSON.stringify(firstseries))
						
						
						Highcharts.chart('curyear', {
						    chart: {
						        type: 'column'
						    },
						    title: {
						        text: 'Student'
						    },
						    subtitle: {
						        text: 'Per curriculum year'
						    },
						    xAxis: {
						        type: 'category'
						    },
						    yAxis: {
						        title: {
						            text: 'Number of Student'
						        }

						    },
						    legend: {
						        enabled: false
						    },
						    plotOptions: {
						        series: {
						            borderWidth: 0,
						            dataLabels: {
						                enabled: true,
						                format: '{point.y:0f}'
						            }
						        }
						    },

						    tooltip: {
						        headerFormat: '<span style="font-size:11px">{point.name} {series.name}s</span><br>',
						        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:0f} Student</b> of total<br/>'
						    },

						    "series": [
						        {
						            "name": "Student",
						            "colorByPoint": true,
						            "data":head
						        }
						    ],
						    "drilldown": {
						        "series": firstseries
						    }
						});
						
	                	

	                     
					},
	                error: function (response) {
	                    swal("Error encountered while accessing the data", "Please try again", "error");
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
            <section class="panel">
                <div class="panel-body">
                    <div id="student" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
                </div>
            </section>
        </div> 
    	<div class="col-md-12">
            <section class="panel">
                <div class="panel-body">
                    <div id="curyear" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
                </div>
            </section>
        </div> 

    </jsp:body>


</t:Registrar>
