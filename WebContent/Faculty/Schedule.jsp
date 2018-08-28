<%@page import="java.sql.*"%>
<%@page import="connection.DBConfiguration" %>
<%@page import="configuration.*" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/Faculty" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	if(session.getAttribute("username") == null || !session.getAttribute("type").equals("Faculty")){
		response.sendRedirect("http://"+request.getServerName()+":"+request.getServerPort()+"/SIS/" +"index.jsp");
	}
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
	ResultSet rs = stmnt.executeQuery("SELECT  Section_Code,IF(IFNULL(Schedule_ChildrenID,0)=0,(SELECT Subject_Code FROM r_subject WHERE CurriculumItem_SubjectID  = Subject_ID),(SELECT Subject_Code FROM r_subject WHERE Schedule_ChildrenID = Subject_ID)) CODE,IF(IFNULL(Schedule_ChildrenID,0)=0,(SELECT Subject_Description FROM r_subject WHERE CurriculumItem_SubjectID  = Subject_ID),(SELECT Subject_Description FROM r_subject WHERE Schedule_ChildrenID = Subject_ID)) DESCR, Schedule_Items_Date ,TIME_FORMAT(Schedule_Items_Time_Start, '%H:%i %p') tstart,TIME_FORMAT(Schedule_Items_Time_End, '%H:%i %p') AS tend,IFNULL(Room_Code,'TBA') AS ROOM ,case when Schedule_Items_Date = 'M' then '1' when Schedule_Items_Date = 'T' then '2' when Schedule_Items_Date = 'W' then '3' when Schedule_Items_Date = 'TH' then '4' when Schedule_Items_Date = 'F' then '5' when Schedule_Items_Date = 'S' then '6' else '7' end as ye  FROM `t_schedule_items` left join t_schedule on Schedule_Items_ScheduleID = Schedule_ID inner join r_curriculumitem on CurriculumItem_ID = Schedule_CurriculumItemID inner join r_curriculum on Curriculum_ID = CurriculumItem_CurriculumID  left join r_room on Room_ID = Schedule_Items_RoomID inner join r_section on Schedule_SectionID =  Section_ID left join r_professor on Schedule_ProfessorID =  Professor_ID where Schedule_Items_Display_Status = 'Active'  and Schedule_AcademicYearID = (SELECT Academic_Year_ID FROM r_academic_year WHERE Academic_Year_Active_Flag = 'Present') and Professor_Code = '"+uname+"' ");
	while(rs.next()){
		if(!rs.getString("ROOM").equals("TBA"))
			tablebody += "<tr><td class='hidden'>" + rs.getString("ye") +"</td><td>"+ec.decrypt(ec.key, ec.initVector, rs.getString("CODE"))+"</td><td>"+ec.decrypt(ec.key, ec.initVector, rs.getString("DESCR"))+"</td><td>"+ rs.getString("Section_Code")+"</td><td>" + rs.getString("Schedule_Items_Date") +"</td><td>" + rs.getString("tstart") + "-"+ rs.getString("tend")+"</td><td>"+ec.decrypt(ec.key, ec.initVector, rs.getString("ROOM"))+"</td></tr>"; 
		else
			tablebody += "<tr><td class='hidden'>" + rs.getString("ye") +"</td><td>"+ec.decrypt(ec.key, ec.initVector, rs.getString("CODE"))+"</td><td>"+ec.decrypt(ec.key, ec.initVector, rs.getString("DESCR"))+"</td><td>"+ rs.getString("Section_Code")+"</td><td>" + rs.getString("Schedule_Items_Date") +"</td><td>" + rs.getString("tstart") + "-"+ rs.getString("tend")+"</td><td>TBA</td></tr>"; 

	}
	pageContext.setAttribute("tablebody", tablebody);
	pageContext.setAttribute("campusDrp", campusDrp);

%>    

<t:Faculty title="Schedule" from="Schedule" to="">

	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
				EditableTable.init();
				$("#campusDrp").select2( {width: '100%' });
				
				
			});
		</script>
    </jsp:attribute>
    
	<jsp:attribute name="customImportedScript">      
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>
    </jsp:attribute>    
    
    <jsp:body>
    	<script src="../Assets/Faculty/Schedule/Schedule.js"></script>
    
        <div class="row">
                <div class="col-sm-12">
                	<section class="panel">
                            <div class="panel-body">
                                <div class="adv-table editable-table ">
                                    <div class="clearfix">
                                        <div class="btn-group pull-right">
                                            <button class="btn btn-default " id="btnprint">Print <i class="fa fa-print"></i></button>
                                        </div>
                                    </div>
                                    <div class="space15"></div>
                                    <table class="table table-striped table-hover table-bordered" id="editable-sample">
	                                    <thead>
	                                        <tr>
	                                            <th class="hidden">EKPV</th>
	                                            <th style="width: 20%">Subject Code</th>
	                                            <th style="width: 20%">Subject Description</th>
	                                            <th style="width: 20%">Year & Section</th>
	                                            <th style="width:  10%">Day</th>
	                                            <th style="width: 15%">Time</th>
	                                            <th style="width:  15%">Room</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>    
										    	${tablebody}
	                                    </tbody>
                                    </table>
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


</t:Faculty>
