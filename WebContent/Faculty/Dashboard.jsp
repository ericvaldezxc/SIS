<%@page import="java.sql.*"%>
<%@page import="connection.DBConfiguration" %>
<%@page import="configuration.EncryptandDecrypt" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/Faculty" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	DBConfiguration db = new DBConfiguration();
	Connection conn = db.getConnection();
	if(conn == null)
		out.print("failasded");
	
	EncryptandDecrypt ec = new EncryptandDecrypt();
	String username = "";
	username = session.getAttribute("username").toString();	
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
	String tablebody = "<tr><td>a</td><td>0</td></tr>";
	rs = stmnt.executeQuery("SELECT count(*) as cou,t1.Subject_Code,t1.Subject_Description FROM `t_student_taken_curriculum_subject` inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_academic_year on Academic_Year_ID = Student_Taken_Curriculum_Subject_AcademicIYearID inner join r_subject as t1  on Student_Taken_Curriculum_Subject_SubjectID =  t1.Subject_ID inner join r_semester on Student_Taken_Curriculum_Subject_SemesterID = Semester_ID inner join r_curriculumitem on CurriculumItem_SubjectID = Student_Taken_Curriculum_Subject_SubjectID inner join t_schedule on Schedule_CurriculumItemID = CurriculumItem_ID  left join r_professor on Schedule_ProfessorID = Professor_ID  left join r_subject as t2 on t1.Subject_Group = t2.Subject_ID inner join r_section on Student_Account_SectionID = Section_ID   where Semester_Active_Flag = 'Active' and Academic_Year_Active_Flag = 'Present' and Schedule_ProfessorID = Professor_ID and Schedule_AcademicYearID = Academic_Year_ID and Professor_Code = '"+username+"' group by t1.Subject_Code ");
	while(rs.next()){

		tablebody += "<tr><td>"+ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code"))+"</td><td>"+rs.getString("cou")+"</td></tr>"; 
		
	}
		
	pageContext.setAttribute("acadyear", acadyear);
	pageContext.setAttribute("sem", sem);
	pageContext.setAttribute("tablebody", tablebody);
%>    

<t:Faculty title="Dashboard" from="Dashboard" to="">
	<jsp:attribute name="myscript"> 
		<script>
			$(document).ready(function(){
				
				/* Highcharts.chart('tableBody', {
				    data: {
				        table: 'datatable'
				    },
				    chart: {
				        type: 'column'
				    },
				    title: {
				        text: 'Student per Subject'
				    },
				    legend: {
				        enabled: false
				    },
				    yAxis: {
				        allowDecimals: false,
				        title: {
				            text: 'Number of Students'
				        }
				    },
				    tooltip: {
				        formatter: function () {
				            return this.point.y + ' Students in subject of ' + this.point.name;
				        }
				    }
				});
				
				 */
				$.ajax({
					type:'POST',
					data:{},
					url: 'Controller/Faculty/Dashboard/GetEnrolledSubjects',
					dataType: 'json',
					success: function(data){
						var head = []
						var firstseries = []
						var firstseriesbody = []
						var firstseriesfinalbody = []
						
						$.each(data, function(key, val) {
							head.push({ name : val.year, y : parseFloat(val.total) , drilldown : val.year })
							firstseriesfinalbody = []
							$.each(val.body, function(key2, val2) {
								firstseriesbody = []
								firstseriesbody.push(val2.subject,parseFloat(val2.cou));
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
    	<div class="col-md-12">
            <section class="panel">
                <div class="panel-body">
                    <div id="student" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
                </div>
            </section>
        </div> 
    	<!-- 
    	<div class="col-md-12">
            <section class="panel">
                <div class="panel-body" id="tableBody">
                   <table id="datatable">
					    <thead>
					        <tr>
					            <th></th>
					            <th>ekpv</th>
					        </tr>
					    </thead>
					    <tbody>
					        ${tablebody}
					    </tbody>
					</table>

                </div>
            </section>
        </div> 
        </div> 
         -->
    </jsp:body>


</t:Faculty>
