<%@page import="java.sql.*"%>
<%@page import="connection.DBConfiguration" %>
<%@page import="configuration.*" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/Faculty" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	DBConfiguration db = new DBConfiguration();
	Connection conn = db.getConnection();
	if(conn == null)
		out.print("failasded");
	String username = "";
	username = session.getAttribute("username").toString();
	EncryptandDecrypt ec = new EncryptandDecrypt();
	Dropdowns drp = new Dropdowns();
	String campusDrp = drp.fillcampusDrp();
	String tablebody = "";
	String fullname = "";	
	String fname = "";	
	String mname = "";	
	String prereq = "";
	String lname = "";	
	String prereqcount ="";
	Statement stmnt = conn.createStatement();
	Statement stmnt2 = conn.createStatement();
	Statement stmnt3 = conn.createStatement();
	ResultSet rs = stmnt.executeQuery("SELECT * FROM `r_faculty_subject` inner join r_subject on Subject_ID = Faculty_Subject_SubjectID where Faculty_Subject_ProfessorID = (SELECT Professor_ID FROM `r_professor` WHERE `Professor_Code` = '"+username+"')");
	while(rs.next()){
		prereq = "";

		ResultSet rs2 = stmnt2.executeQuery("select count(*) as prereqcount from r_prerequisite inner join r_subject on Subject_ID = Prerequisite_Prequisite_SubjectID where Prerequisite_Main_SubjectID = '"+rs.getString("Subject_ID")+"'");
		while(rs2.next()){
			prereqcount = rs2.getString("prereqcount");
			
		}
		ResultSet rs3 = stmnt3.executeQuery("select * from r_prerequisite inner join r_subject on Subject_ID = Prerequisite_Prequisite_SubjectID where Prerequisite_Main_SubjectID = '"+rs.getString("Subject_ID")+"' and Prerequisite_Display_Status = 'Active' ");
		while(rs3.next()){
			if(Integer.parseInt(prereqcount) == 0){
				prereq = "<span class='label label-primary'>No Prerequisite</span>";
			}else{
				prereq += "<span class='label label-success'>"+ec.decrypt(ec.key, ec.initVector, rs3.getString("Subject_Code"))+"</span> ";
				

			}
			
			
		}
		if(prereq == ""){
			prereq = "<span class='label label-primary'>No Prerequisite</span>";
		}
		
		tablebody += "<tr><td>" + ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code")) + "</td><td>"+ ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Description")) +"</td><td><center style='margin-top:10px'>"+prereq+"</center></td></tr>"; 
//		tablebody += "<tr><td>" + ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code")) + "</td><td>"+ ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Description")) +"</td><td><center style='margin-top:10px'>"+prereq+"</center></td><td>"; 
//
//		if(rs.getString("Subject_Display_Stat").equals("Active"))
//			tablebody += "<center><a class='btn btn-info prof' data-toggle='modal' href='#Profile' href='javascript:;'><i class='fa fa-folder'></i></a><center></td></tr>";
//		else
//			tablebody += "<center><a class='btn btn-info retrieve' href='javascript:;'><i class='fa fa-rotate-left'></i></a><center></td></tr>";
	}
	pageContext.setAttribute("tablebody", tablebody);

%>    

<t:Faculty title="Subject" from="" to="Subject">

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
    	<script src="../Assets/Faculty/Subject/Subject.js"></script>
    
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
	                                            <th style="width: 200px">Subject Code</th>
	                                            <th style="width: 350px">Subject Description</th>
	                                            <th style="width: 350px">Prerequisite</th>
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
