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

	String tablebody = "";

	stmnt = conn.createStatement();
	rs = stmnt.executeQuery("Select *,DATE_FORMAT(announcement_date_updated, '%W %D %M %Y') asOf from t_announcement where announcement_active_status = 'Active'");
	while(rs.next()){
		tablebody += "<tr><td style='font-weight:bold'>"+ rs.getString("asOf")+"</td><td><h4>" + rs.getString("announcement_name")+ "<h4><p style='font-size:13px'>"+rs.getString("announcement_description")+"</p></td><td>"; 
	}
	if(tablebody.equals(""))
	{
		tablebody = "<tr><td colspan='2'>No data avaialble</td></tr>";
	}
	pageContext.setAttribute("tablebody", tablebody);

%>    

<t:Student title="Profile" from="Profile" to="">

    <jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
			    $.ajax({
   					type:'POST',
   					url:'Controller/Student/Profile/GetProfile',
   					success: function(result){
   						var item = $.parseJSON(result)
   						$('#nameLbl').html(item.fullname)
   						$('#accNumLbl').html(item.studentnumber + ' - ' + item.status)
   						$('#courseLbl').html(item.course)
   						$('#sectionLbl').html(item.section)
   					},
                    error: function (response) {
                    	swal("Error encountered while adding data"+response, "Please try again", "error");
                   }
   				});
			    
			    $('#courseLbl').on('click',function(){
			    	$('#curriculum').modal('show');
			    	
			    })
			    
			    $.ajax({
   					type:'POST',
   					url:'Controller/Student/Profile/Curriculum',
   					success: function(result){
   						var item = $.parseJSON(result)
   						var body = ''
   						$.each(item,function(key,val){
   							body += "<section class='panel'>"+
   							"<header class='panel-heading' style='background-color:#68a0b0;margin-top:10px;color:white'>"+
   									"<label>"+val.yearlvl + " - " + val.semester +"</label><br/>"+
   									"<span class='tools pull-right'>"+
   					        "<a href='javascript:;' class='fa fa-chevron-down' style='color:white'></a>"+
   					        "</span>"+
   					        "</header>"+
   					        "<div class='panel-body' style='background-color:;'>";
   					        
   					        var tbody = '';
   					 		$.each(val.subject,function(key2,val2){
   					 			if(val2.group  == ''){
   					 				var prereq = ''
   					 				var i = 0
   					 				$.each(val2.prerequisite,function(key3,val3){
   					 					if(i != 0)
   					 						prereq  += ', '
   					 					prereq += val3
   					 				
   					 					i++
   					 				})
   					 				
   						   			tbody +="<tr>"+
						   						"<td>"+val2.code+"</td>"+
						   						"<td>"+val2.desc+"</td>"+
						   						"<td style='font-weight:bold;'>"+prereq+"</td>"+
						   						"<td>"+val2.units+"</td>"+
						   						"<td>"+val2.status+"</td>"+
						   					"</tr>"	
   					 				
   					 			}
   					 			else{
   					 				
	   					 			tbody +="<tr>"+
						   						"<td colspan='5' style='font-weight:bold;text-align:lelft;color:#68a0b0'>"+val2.code+"</td>"+
						   					"</tr>"	
						   			$.each(val2.group,function(key3,val3){
	   					 				var prereq = ''
   	   					 				var i = 0
   	   					 				$.each(val3.prerequisite,function(key4,val4){
   	   					 					if(i != 0)
   	   					 						prereq  += ', '
   	   					 					prereq += val4
   	   					 				
   	   					 					i++
   	   					 				})

						   			
		   					 			tbody +="<tr style='font-style:italic'>"+
							   						"<td>"+val3.code+"</td>"+
							   						"<td>"+val3.desc+"</td>"+
							   						"<td style='font-weight:bold;'>"+prereq+"</td>"+
							   						"<td>"+val3.units+"</td>"+
							   						"<td>"+val3.status+"</td>"+
							   					"</tr>"	
						   				
						   				
						   			})
						   						
   					 			}
   					 			
   					 		})
   					 		if(tbody != ''){
	   					 		body += "<table class='table table-hover'>"+
	   							"<thead>"+
		   							"<tr>"+
		   						    	"<th style='width: 20%'>Code</th>"+
		   						        "<th style='width: 30%'>Description</th>"+
		   						        "<th style='width: 20%'>Prerequisite</th>"+
		   						        "<th style='width: 10%'>Cred. Unit</th>"+
		   						        "<th style='width: 20%'>Status</th>"+
		   						   	"</tr>"+
		   						"</thead>"+
		   						"<tbody>   ";
		   						body += tbody


	   					        body += 	"</tbody>"+
   										"</table>";
   					 			
   					 		}
   					        
   					        
   							body +=  "</div>"+
   							"</section>";
   						})
   						$('#curBody').html(body)
						console.log(item)
   						
   					},
                    error: function (response) {
                    	swal("Error encountered while adding data"+response, "Please try again", "error");
                   }
   				});
			});
		</script>
    </jsp:attribute>
    
	<jsp:attribute name="customImportedScript">      
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>
    </jsp:attribute>    
    
    <jsp:body>
    
    	<div class="col-md-6">
	        <div class="mini-stat">
	            <span class="mini-stat-icon orange">
	            	<i class="fa fa-calendar"></i>
	            </span>	        
 	            <div class="mini-stat-info">
	                <span id="academicyear">${acadyear}</span>
	                Active Academic Years
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
    	<div class="row">
            <div class="col-sm-12">
            	<section class="panel">
                	<div class="panel-body">
                       	<div class="row">
					    	<div class="col-lg-6">
					    		<h4 id="nameLbl" style="color:#68a0b0">Eric Krisopther valdezzxczxczxc</h4>
					    		<h6 style="font-style:italic" id="accNumLbl">Acc num and status </h6>
						    </div>
						    <div class="col-lg-6">
					    		<h4 id="courseLbl" title="View Curriculum" style="cursor:pointer;color:#68a0b0">Course</h4>
					    		<h6 style="font-style:italic" id="sectionLbl">Section</h6>
						    </div>
				         </div>
                	</div>
               	</section>
            </div>
        </div>
        
        <div class="row">
            <div class="col-sm-12">
            	<section class="panel">
                	<div class="panel-body">
                       	<div class="row">
	                       	<div class="col-lg-12">
	                       		<table class="table table-invoice">
		                            <thead>
		                            <tr>
		                                <th style="width:20%">As of</th>
		                                <th style="width:80%">Announcement</th>
		                            </tr>
		                            </thead>
		                            <tbody>
			                            ${tablebody}
		                            </tbody>
		                        </table>
						    </div>
					    </div>
                	</div>
               	</section>
            </div>
        </div>
        
        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="curriculum" class="modal fade">
	        <div class="modal-dialog" style="width:70%">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title" id="schedule-title">Curriculum</h4>
	                </div>
	                <div class="modal-body" id="curBody"> 
	                   
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="closeBtn" type="button">Close</button>
	                </div>
	            </div>
	        </div>
	    </div>	

    </jsp:body>


</t:Student>
