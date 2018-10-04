<%@page import="java.sql.*"%>
<%@page import="connection.DBConfiguration" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/Admin" %>
<%@page import="configuration.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	EncryptandDecrypt ec = new EncryptandDecrypt();
	Dropdowns drp = new Dropdowns();
	DBConfiguration db = new DBConfiguration();
	Connection conn = db.getConnection();
	String campus = "";
	if(conn == null)
		out.print("failasded");
	String tablebody = "";
	Statement stmnt = conn.createStatement();
	Statement stmnt2 = conn.createStatement();
	ResultSet rs = stmnt.executeQuery("Select * from r_course ");
		while(rs.next()){
			campus = "";

			ResultSet rs2 = stmnt2.executeQuery("select * from r_campus_course inner join r_campus on Campus_Course_CampusID = Campus_ID where Campus_Course_CourseID = '"+rs.getString("Course_ID")+"'");
			while(rs2.next()){
				campus += "<span class='label label-success' >"+ec.decrypt(ec.key, ec.initVector, rs2.getString("Campus_Code"))+"</span> ";
				
			}
			
			
			
			tablebody += "<tr><td>" + ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Code")) + "</td><td>"+ ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Description")) +"</td><td>"+ campus +"</td><td style='margin-top:10px'>"+rs.getString("Course_Years")+"</td><td>"; 
			if(rs.getString("Course_Display_Status").equals("Active"))
				tablebody += "<center><a class='btn btn-success edit' data-toggle='modal' href='#CourseEdit'><i class='fa fa-edit'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a><center></td></tr>";
			else
				tablebody += "<center><a class='btn btn-info retrieve' href='javascript:;'><i class='fa fa-rotate-left'></i></a><center></td></tr>";
			
		}
	
	pageContext.setAttribute("tablebody", tablebody);
	pageContext.setAttribute("campus", drp.fillcampusDrp());

%>    

<t:Admin title="Course" from="Student Setup" to="Course">

	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
				EditableTable.init();
				
			});
		</script>
    </jsp:attribute>
    
	<jsp:attribute name="customImportedScript">      
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>
    </jsp:attribute>    
    
    <jsp:body>
    	<script src="../Assets/Admin/StudentSetup/Course.js"></script>
    
        <div class="row">
                <div class="col-sm-12">
                	<section class="panel">
                            <div class="panel-body">
                                <div class="adv-table editable-table ">
                                    <div class="clearfix">
                                        <div class="btn-group">
                                            <button id="editable-sample_new" class="btn btn-success add" data-toggle="modal" href="#SubjectAdd">
                                        Add New <i class="fa fa-plus"></i>
                                    </button>
                                        </div>
                                        <div class="btn-group pull-right">
                                            <button class="btn btn-default " id="btnprint">Print <i class="fa fa-print"></i></button>
                                        </div>
                                    </div>
                                    <div class="space15"></div>
                                    <table class="table table-striped table-hover table-bordered" id="editable-sample">
	                                    <thead>
	                                        <tr>
	                                            <th style="width: 20%">Code</th>
	                                            <th style="width: 25%">Description</th>
	                                            <th style="width: 25%">Campus</th>
	                                            <th style="width: 15%">No. of Years</th>
	                                            <th style="width: 15%">Action</th>  
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
         <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="SubjectAdd" class="modal fade">
	        <div class="modal-dialog" style="width:60%">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Add Course</h4>
	                </div>
	                <div class="modal-body">
	                    <form method="post" id="form-data">
	                        <div class="row" style="padding-left:15px;padding-top:10px">
	                        	<div class="col-lg-8">
	                                Code <input type="text" class="form-control" placeholder="ex. BSIT" id="codeTxt" >
	                            </div>
	                            <div class="col-lg-4">
	                                No. of Years <input type="number" class="form-control" placeholder="ex. 4" min="1" max="5" value="4" id="yeartxt" >
	                            </div>
                               <div class="col-lg-12" style="padding-top:10px" >
	                            	Campus
	                            	</br>
	                            	<select multiple name="e9" id="e9" style="width:100%" class="populate ">
                                        ${campus}
                                    </select>
	                            </div>
	                            <div class="col-lg-12" style="padding-top:10px">
	                                Description<textarea class="form-control" placeholder="ex. Bachelord of Information Technology" rows="6" style="margin: 0px 202.5px 0px 0px;resize:none" id="descTxt"></textarea>
	                            </div>
	                        </div>
	                    </form>
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="addcloseBtn" type="button"><u>C</u>lose</button>
	                    <button class="btn btn-success " id="addBtn" type="button"><u>S</u>ave</button>
	                </div>
	            </div>
	        </div>
	    </div>
        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="SubjectEdit" class="modal fade">
	        <div class="modal-dialog" style="width:60%">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Edit Subject</h4>
	                </div>
	                <div class="modal-body">
	                    <form method="post" id="form-data">
	                        <div class="row" style="padding-left:15px;padding-top:10px">
	                        	<div class="col-lg-12">
	                                Subject Code <input type="text" class="form-control" placeholder="ex. INTE 4213" id="codeUpdateTxt">
	                            </div>
	                            <div class="col-lg-12" style="padding-top:10px">
	                                Subject Description<textarea class="form-control" placeholder="ex. Capstone Project Description" rows="6" style="margin: 0px 202.5px 0px 0px;resize:none" id="descUpdateTxt"></textarea>
	                            </div>
	                        </div>
	                    </form>
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="updatecloseBtn" type="button"><u>C</u>lose</button>
	                    <button class="btn btn-success " id="updateBtn" type="button"><u>S</u>ave</button>
	                </div>
	            </div>
	       </div>
	    </div>	
	    </jsp:body>


</t:Admin>
