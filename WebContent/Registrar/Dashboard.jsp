<%@page import="java.sql.*"%>
<%@page import="connection.DBConfiguration" %>
<%@page import="configuration.EncryptandDecrypt" %>
<%@page import="org.json.simple.JSONArray" %>
<%@page import="org.json.simple.JSONObject" %>
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
	String countPerType = "";
	String perType = "";
	JSONObject accountList = new JSONObject();
	
	rs = stmnt.executeQuery("SELECT count(*),User_Account_Type FROM `r_user_account` where User_Account_Display_Status = 'Active' group by User_Account_Type  ");
	while(rs.next()){
		String cou =  rs.getString("count(*)");
		String type = rs.getString("User_Account_Type");
		accountList.put(type,cou);
		countPerType += "<td>"+  cou +"</td>";
		perType += "<th>"+ type +"</th>";

		
	}
	
	pageContext.setAttribute("acadyear", acadyear);
	pageContext.setAttribute("sem", sem);
	pageContext.setAttribute("perType", perType);
	pageContext.setAttribute("countPerType", countPerType);
	pageContext.setAttribute("studentAccount", accountList.get("Student"));
	pageContext.setAttribute("facultyAccount", accountList.get("Faculty"));
	pageContext.setAttribute("cashierAccount", accountList.get("Cashier"));
	pageContext.setAttribute("adminAccount", accountList.get("Admin"));
	
	


%>    

<t:Registrar title="Dashboard" from="Dashboard" to="">
	<jsp:attribute name="myscript"> 
		<script>
			$(document).ready(function(){
				/*()
				$.ajax({
					type:'POST',
					data:{},
					url: 'Controller/Registrar/Dashboard/Student',
					dataType: 'json',
					success: function(data2){
						$.ajax({
							type:'GET',
							xhrFields: {withCredentials: false},
							url: 'http://localhost:2400/echo?msg='+JSON.stringify(data2),
							success: function(data){		
								data = JSON.parse(data)

								
								var head = []
								var firstseries = []
								var firstseriesbody = []
								var firstseriesfinalbody = []
								
								$.each(data, function(key, val) {
									head.push({ name : val.year, y : parseFloat(val.total) , drilldown : val.year })
									//console.log("asdsd"+JSON.stringify(head)+"zxcx")
									firstseriesfinalbody = []
									$.each(val.body, function(key2, val2) {
										firstseriesbody = []
										firstseriesbody.push(val2.course,parseFloat(val2.cou));
										firstseriesfinalbody.push(firstseriesbody)
										
									})
									firstseries.push({ name : val.year, id : val.year, data : firstseriesfinalbody })
									
								})
								
								
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
			                error: function (response2) {
			                    swal("Error encountered while accessing the data", "Please try again", "error");
			                }
	
						});
						             
					},
	                error: function (response) {
	                    swal("Error encountered while accessing the data", "Please try again", "error");
	                }

				});
				*/
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
							//console.log("asdsd"+JSON.stringify(head)+"zxcx")
							firstseriesfinalbody = []
							$.each(val.body, function(key2, val2) {
								firstseriesbody = []
								firstseriesbody.push(val2.course,parseFloat(val2.cou));
								firstseriesfinalbody.push(firstseriesbody)
								
							})
							firstseries.push({ name : val.year, id : val.year, data : firstseriesfinalbody })
							
						})
						
						
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
				
				
				/*
				$.ajax({
					type:'POST',
					url: 'Controller/Registrar/Dashboard/GetEnrolledPerCur',
					dataType: 'json',
					success: function(data2){
						$.ajax({
							type:'GET',
							xhrFields: {withCredentials: false},
							url: 'http://localhost:2400/echo?msg='+JSON.stringify(data2),
							success: function(data){		
								data = JSON.parse(data)
								
								var head = []
								var firstseries = []
								
								var firstseriesfinalbody = []
								
								$.each(data, function(key, val) {
									head.push({ name : val.year, y : parseFloat(val.total) , drilldown : val.year })
									var firstseriesbody = []
									$.each(val.body, function(key2, val2) {
										firstseriesbody = []
										firstseriesbody.push(val2.course,parseFloat(val2.cou));
										firstseriesfinalbody.push(firstseriesbody)
										
									})
									firstseries.push({ name : val.year, id : val.year, data : firstseriesfinalbody })
									
								})
								
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
			                error: function (response2) {
			                    swal("Error encountered while accessing the data", "Please try again", "error");
			                }
	
						});
					},
	                error: function (response) {
	                	swal("Error encountered while accessing the data", "We cant access youre R API", "error");
	                	$.ajax({
							type:'POST',
							dataType:'json',
							url: 'Controller/Registrar/Dashboard/GetEnrolledPerCur',
							success: function(data){	
								
								var head = []
								var firstseries = []
								
								var firstseriesfinalbody = []
								
								$.each(data, function(key, val) {
									head.push({ name : val.year, y : parseFloat(val.total) , drilldown : val.year })
									var firstseriesbody = []
									$.each(val.body, function(key2, val2) {
										firstseriesbody = []
										firstseriesbody.push(val2.course,parseFloat(val2.cou));
										firstseriesfinalbody.push(firstseriesbody)
										
									})
									firstseries.push({ name : val.year, id : val.year, data : firstseriesfinalbody })
									
								})
								
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
			                error: function (response2) {
			                    swal("Error encountered while accessing the data", "Please try again", "error");
			                }
	                	
	                	
	                   
	                	})
	                }

				});
				
				*/
				
				
				$.ajax({
					type:'POST',
					dataType:'json',
					url: 'Controller/Registrar/Dashboard/GetEnrolledPerCur',
					success: function(data){	
						
						var head = []
						var firstseries = []
						
						var firstseriesfinalbody = []
						
						$.each(data, function(key, val) {
							head.push({ name : val.year, y : parseFloat(val.total) , drilldown : val.year })
							var firstseriesbody = []
							$.each(val.body, function(key2, val2) {
								firstseriesbody = []
								firstseriesbody.push(val2.course,parseFloat(val2.cou));
								firstseriesfinalbody.push(firstseriesbody)
								
							})
							firstseries.push({ name : val.year, id : val.year, data : firstseriesfinalbody })
							
						})
						
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
	                error: function (response2) {
	                    swal("Error encountered while accessing the data", "Please try again", "error");
	                }
            	
            	
               
            	})
				
				
				Highcharts.chart('usersDashboard', {
	                data: {
	                    table: 'usersTbl'
	                },
	                chart: {
	                    type: 'column'
	                },
	                title: {
	                    text: 'Users Bar Graph'
	                },
	                yAxis: {
	                    allowDecimals: false,
	                    title: {
	                        text: 'Number'
	                    }
	                },
	                tooltip: {
	                    formatter: function() {
	                        return '<b>' + this.series.name + '</b><br/>' +
	                            this.point.y + ' ' + this.series.name ;
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
    
    	<div class="col-md-6">
	        <div class="mini-stat">
	            <span class="mini-stat-icon orange">
	            	<i class="fa fa-calendar"></i>
	            </span>	        
 	            <div class="mini-stat-info">
	                <span id="academicyear">${acadyear}</span>
	                Active Academic Year
	            </div>
	        </div>
    	</div>
    	<div class="col-md-6">
	        <div class="mini-stat clearfix">
		        <span class="mini-stat-icon tar"><i class="fa fa-asterisk"></i></span>
	            <div class="mini-stat-info">
	                <span id="semester">${sem}</span>
	                Active Semester
	            </div>
	        </div>
    	</div>
    	<div class="col-md-3">
	        <div class="mini-stat">
	            <span class="mini-stat-icon wistful">
	            	<i class="fa fa-users"></i>
	            </span>	        
 	            <div class="mini-stat-info">
	                <span id="studentAccountsLbl">${studentAccount}</span>
	                Student Accounts
	            </div>
	        </div>
    	</div>
    	<div class="col-md-3">
	        <div class="mini-stat clearfix">
		        <span class="mini-stat-icon wax-flower"><i class="fa fa-users"></i></span>
	            <div class="mini-stat-info">
	                <span id="facultyAccountsLbl">${facultyAccount}</span>
	                Faculty Accounts
	            </div>
	        </div>
    	</div>
		<div class="col-md-3">
	        <div class="mini-stat">
	            <span class="mini-stat-icon gossip">
	            	<i class="fa fa-users"></i>
	            </span>	        
 	            <div class="mini-stat-info">
	                <span id="adminAccountsLbl">${adminAccount}</span>
	                Admin Accounts
	            </div>
	        </div>
    	</div>
    	<div class="col-md-3">
	        <div class="mini-stat clearfix">
		        <span class="mini-stat-icon urie"><i class="fa fa-users"></i></span>
	            <div class="mini-stat-info">
	                <span id="cashierAccountsLbl">${cashierAccount}</span>
	                Cashier Accounts
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
        <div class="col-md-12">
            <section class="panel">
                <div class="panel-body">
                    <div id=usersDashboard style="min-width: 310px; height: 400px; margin: 0 auto"></div>
                    <table id="usersTbl" class="hidden">
                    	<thead>
	                        <tr>
	                            <th></th>
	                           	${perType}
	                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th>Number</th>
                                ${countPerType}
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
        </div> 

    </jsp:body>


</t:Registrar>
