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
	Dropdowns drp = new Dropdowns();
	String campusDrp = drp.fillcampusDrp();
	String tablebody = "";
	String uname = "";
	if( session.getAttribute("username").toString() != null)
		 uname = session.getAttribute("username").toString(); 
	Statement stmnt = conn.createStatement();
	ResultSet rs = stmnt.executeQuery("SELECT  Section_Code,IF(IFNULL(Schedule_ChildrenID,0)=0,(SELECT Subject_Code FROM r_subject WHERE CurriculumItem_SubjectID  = Subject_ID),(SELECT Subject_Code FROM r_subject WHERE Schedule_ChildrenID = Subject_ID)) CODE,IF(IFNULL(Schedule_ChildrenID,0)=0,(SELECT Subject_Description FROM r_subject WHERE CurriculumItem_SubjectID  = Subject_ID),(SELECT Subject_Description FROM r_subject WHERE Schedule_ChildrenID = Subject_ID)) DESCR, Schedule_Items_Date ,TIME_FORMAT(Schedule_Items_Time_Start, '%H:%i') tstart,TIME_FORMAT(Schedule_Items_Time_End, '%H:%i') AS tend,IFNULL(Room_Code,'TBA') AS ROOM ,case when Schedule_Items_Date = 'M' then '1' when Schedule_Items_Date = 'T' then '2' when Schedule_Items_Date = 'W' then '3' when Schedule_Items_Date = 'TH' then '4' when Schedule_Items_Date = 'F' then '5' when Schedule_Items_Date = 'S' then '6' else '7' end as ye  FROM `t_schedule_items` left join t_schedule on Schedule_Items_ScheduleID = Schedule_ID inner join r_curriculumitem on CurriculumItem_ID = Schedule_CurriculumItemID inner join r_curriculum on Curriculum_ID = CurriculumItem_CurriculumID  left join r_room on Room_ID = Schedule_Items_RoomID inner join r_section on Schedule_SectionID =  Section_ID left join r_professor on Schedule_ProfessorID =  Professor_ID where Schedule_Items_Display_Status = 'Active'  and Schedule_AcademicYearID = (SELECT Academic_Year_ID FROM r_academic_year WHERE Academic_Year_Active_Flag = 'Present') and Professor_Code = '"+uname+"' ");
	while(rs.next()){
		if(!rs.getString("ROOM").equals("TBA"))
			tablebody += "<tr><td class='hidden'>" + rs.getString("ye") +"</td><td>"+ec.decrypt(ec.key, ec.initVector, rs.getString("CODE"))+"</td><td>"+ec.decrypt(ec.key, ec.initVector, rs.getString("DESCR"))+"</td><td>"+ rs.getString("Section_Code")+"</td><td>" + rs.getString("Schedule_Items_Date") +"</td><td>" + rs.getString("tstart") + "-"+ rs.getString("tend")+"</td><td>"+ec.decrypt(ec.key, ec.initVector, rs.getString("ROOM"))+"</td></tr>"; 
		else
			tablebody += "<tr><td class='hidden'>" + rs.getString("ye") +"</td><td>"+ec.decrypt(ec.key, ec.initVector, rs.getString("CODE"))+"</td><td>"+ec.decrypt(ec.key, ec.initVector, rs.getString("DESCR"))+"</td><td>"+ rs.getString("Section_Code")+"</td><td>" + rs.getString("Schedule_Items_Date") +"</td><td>" + rs.getString("tstart") + "-"+ rs.getString("tend")+"</td><td>TBA</td></tr>"; 

	}
	pageContext.setAttribute("tablebody", tablebody);
	pageContext.setAttribute("campusDrp", campusDrp);
	pageContext.setAttribute("uname", "'"+uname+"'");

%>    

<t:Student title="Schedule" from="Schedule" to="">

	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
				EditableTable.init();
				
				 $.ajax({
					type:'POST',
					data:{StudentNumber:${uname}},
					url: "http://"+window.location.hostname+":"+window.location.port+"/SIS/" +'numberPerClass',
					success: function(result){
						var item = $.parseJSON(result)
						var body = ''
						$.each(item,function(key,val){
							//console.log(val)
							var sched = '<tr><td colspan="7" style="text-align:center;font-weight:bold;font-style:italic">No Avaliable Data to show</td>  </tr>'
							var i = 0
							$.each(val.schedule,function(key2,val2){
								if(i == 0)
									sched = ''
								console.log(val2.room)
								sched += val2.time + val2.room + ' ';
								i++
								
							})
							if(i == 0)
								body += '<tr><td>'+val.code+'</td><td>'+val.desc+'</td><td>'+val.lec+'</td><td>'+val.lab+'</td><td>'+val.cred+'</td><td>TBA</td><td>'+val.numberPerClass+'</td></tr>'
							else
								body += '<tr><td>'+val.code+'</td><td>'+val.desc+'</td><td>'+val.lec+'</td><td>'+val.lab+'</td><td>'+val.cred+'</td><td>'+sched+'</td><td>'+val.numberPerClass+'</td></tr>'

						})
						if(body == '')
							$('#schedBody').html('<tr><td colspan="7" style="text-align:center;font-weight:bold;font-style:italic">No Avaliable Data to show</td>  </tr>')
						else
							$('#schedBody').html(body)
                         
					},
                    error: function (response2) {
                        swal("Error encountered while accessing the data", "Please try again", "error");
                    }
				});
				/*
			 	$.ajax({
					type:'POST',
					data:{StudentNumber:${uname}},
					url: "http://"+window.location.hostname+":"+window.location.port+"/SIS/" +'StudentClassmates',
					success: function(result){
						var item = $.parseJSON(result)
						var body = ''
						$.each(item,function(key,val){
							//console.log(val)
							body += '<tr><td>'+val.code+'</td><td>'+val.desc+'</td><td>'+val.count+'</td></tr>'
								
						})
						if(body == '')
							$('#numberPerClass').html('<tr><td colspan="3" style="text-align:center;font-weight:bold;font-style:italic">No Avaliable Data to show</td>  </tr>')
						else
							$('#numberPerClass').html(body)
	                        
					},
	                   error: function (response2) {
	                       swal("Error encountered while accessing the data", "Please try again", "error");
	                   }
				});
				
				*/

				
				/*
				 $.ajax({
	                    type: 'post',
	                    url: 'Controller/Student/Schedule/StudentSchedule',
	                    success: function (result) {
	                    	var item = $.parseJSON(result)
							$('#mainBody').html('')
							var cou = 0
							$.each(item, function (key, val) {
								var sched = ''
								if(jQuery.isEmptyObject(val.group) == true){
	    							$.each(val.schedule, function (key2, val2) {
	    								if( val2.timesched == 'TBA')
	    									sched += 'TBA' + '</br>';
	    								else
	        								sched += val2.timesched + ' - ' + val2.room + '</br>';

	                                });
	    							$('#mainBody').append('<tr><td style="font-size:12px"><label class="codeText"  data-type="solo" data-curriculum-id="'+val.id+'" data-tuition="'+val.tuition+'">'+val.code+'</label></td><td style="font-size:12px" ><label class="descText">'+val.desc+'</label></td><td style="font-size:12px" ><label class="unitText">'+val.units+'</label></td><td class="proffesor" data-code="'+val.profcode+'">'+val.prof+'</td><td class="schedule">'+sched+'</td></tr>')
	    							
								}
	    						else{
	    							$('#mainBody').append('<tr><td colspan="7"  class="codeText" style="font-size:12px;font-weight:bold" data-type="parent" data-curriculum-id="'+val.id+'" >'+val.code+'</td></tr>')
	    							$.each(val.group, function (key2, val2) {
	    								sched=''
	    								$.each(val2.schedule, function (key3, val3) {
	        								if( val3.timesched == 'TBA')
	        									sched += 'TBA' + '</br>';
	        								else
	            								sched += val3.timesched + ' - ' + val3.room + '</br>';

	                                    });
	        							$('#mainBody').append('<tr><td style="font-size:12px;padding-left: 25px;font-style:italic"  ><label class="codeText" data-subject-id="'+val2.id+'" data-type="child" data-tuition="'+val2.tuition+'">'+val2.code+'</label></td><td style="font-size:12px" ><label class="descText">'+val2.desc+'</label></td><td style="font-size:12px" ><label class="unitText">'+val2.units+'</label></td><td class="proffesor"  data-code="'+val2.profcode+'">'+val2.prof+'</td><td class="schedule">'+sched+'</td></tr>')
	                               });
	    							
	    						}
								
	                        });
							if($('#mainBody').html() == ''){
//								$('#mainBody').html('<tr><td style="font-size:12px" ><center class="codeText"></center></td><td style="font-size:12px" ><center class="descText"></center></td><td style="font-size:12px" ><center class="unitText"></center></td><td><center></center></td></tr>')
								$('#mainBody').html('<tr><td colspan="6" style="text-align:center;font-weight:bold;font-style:italic">No Avaliable Data to show</td></tr> ')
							}
							else{
//								$('#mainBody').append('<tr><td style="text-align:right;font-weight: bold;padding-top:10px;padding-bottom:10px" colspan="4" id="totunit">Total: '+totunit+' Units'+'</td></tr>')
							}
	                    },
	                    error: function (response) {
	                        swal("Error encountered while adding data", "Please try again", "error");
	                    }

	                });
				*/
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
                                    <!--<div class="clearfix">
                                        <div class="btn-group pull-right">
                                            <button class="btn btn-default " id="btnprint">Print <i class="fa fa-print"></i></button>
                                        </div>
                                    </div>-->
                                    
                                    <div class="space15"></div>
                                    <table class="table table-hover" id="curTbl">
			                			<thead>
					                    	<tr>
<!--					                       	<th style="width: 15%">Code</th>
					                            <th style="width: 25%">Description</th>
					                            <th style="width: 10%">Units</th>
 	                           					 <th style="width: 20%">Faculty Name</th>				
					                            <th style="width: 20%">Schedule</th>
					                             -->
					                            <th style="width: 10%">Code</th>
					                            <th style="width: 20%">Description</th>
					                            <th style="width: 10%">Lec. Units</th>
					                            <th style="width: 10%">Lab. Unit</th>
					                            <th style="width: 10%">Cred. Unit</th>		                            
					                            <th style="width: 30%">Schedule</th>
					                            <th style="width: 10%"># of Student</th>
					                       	</tr>
			                    		</thead>
			                    		<tbody id="schedBody">   
					                    	<tr>
					                        	<td colspan="7" style="text-align:center;font-weight:bold;font-style:italic">No Avaliable Data to show</td>
					                        </tr> 
			                    		</tbody>
			               			</table>
<!--				               			<table class="table table-hover">
			                			<thead>
					                    	<tr>
					                       	<th style="width: 15%">Code</th>
					                            <th style="width: 25%">Description</th>
					                            <th style="width: 10%">Units</th>
 	                           					 <th style="width: 20%">Faculty Name</th>				
					                            <th style="width: 20%">Schedule</th>
					                             
					                            <th style="width: 15%">Code</th>
					                            <th style="width: 25%">Description</th>
					                            <th style="width: 10%">Students</th>
					                       	</tr>
			                    		</thead>
			                    		<tbody id="numberPerClass">   
					                    	<tr>
					                        	<td colspan="3" style="text-align:center;font-weight:bold;font-style:italic">No Avaliable Data to show</td>
					                        </tr> 
			                    		</tbody>
			               			</table>-->
                                </div>
                            </div>
                        </section>

                </div>
         </div>

         <!-- Modal -->
         <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="Add" class="modal fade">
	        <div class="modal-dialog" style="width:700px">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Add Room</h4>
	                </div>
	                <div class="modal-body">
	                    <form method="post" id="form-data">
	                        <div class="row" style="padding-left:15px;padding-top:10px">
	                        	<div class="col-lg-12">
	                        		<div class="col-lg-4">
		                                 Code <input type="text" class="form-control" placeholder="ex. Acad 202" id="codeTxt" >
		                            </div>
	                        		<div class="col-lg-8">
		                        		Campus
			                            <select class="populate " id="campusDrp">
					                  	    <option value="default" selected="selected" disabled="disabled" >Select a Campus</option>                            	       	
				                  			${campusDrp}      	
				                		</select>
		                            </div>
		                        	<div class="col-lg-12" style="padding-top:10px">
		                                Description<textarea class="form-control" placeholder="ex.  Academic Building 202" rows="3" style="margin: 0px 202.5px 0px 0px;resize:none" id="descTxt"></textarea>
		                            </div>		                        	
	                        	</div>
	                        </div>
	                    </form>
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="addcloseBtn" type="button">Close</button>
	                    <button class="btn btn-success " id="addBtn" type="button">Save</button>
	                </div>
	            </div>
	        </div>
	    </div>	

	    </jsp:body>


</t:Student>
