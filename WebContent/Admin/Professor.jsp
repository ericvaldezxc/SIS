<%@page import="java.sql.*"%>
<%@page import="connection.DBConfiguration" %>
<%@page import="configuration.EncryptandDecrypt" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/Admin" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	DBConfiguration db = new DBConfiguration();
	Connection conn = db.getConnection();
	if(conn == null)
		out.print("failasded");
	
	EncryptandDecrypt ec = new EncryptandDecrypt();
	
	String tablebody = "";
	String fullname = "";	
	String fname = "";	
	String mname = "";	
	String lname = "";	
	Statement stmnt = conn.createStatement();
	ResultSet rs = stmnt.executeQuery("Select * from r_professor");
		while(rs.next()){
			fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Professor_FirstName"));
			mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Professor_MiddleName"));
			lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Professor_LastName"));
			if(mname.equals(""))
				fullname = lname + ", " + fname;
			else	
				fullname = lname + ", " + fname + " " +  mname;

			
			
			tablebody += "<tr><td>" + rs.getString("Professor_Code")+ "</td><td>"+fullname+"</td><td>"+ec.decrypt(ec.key, ec.initVector, rs.getString("Professor_Description")) +"</td><td>"; 
			if(rs.getString("Professor_Display_Status").equals("Active"))
//				tablebody += "<center> <a class='btn btn-info view' href='javascript:;'><i class='fa fa-eye'></i></a> <a class='btn btn-success edit' data-toggle='modal' href='#CurriculumEdit'><i class='fa fa-edit'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a><center></td></tr>";
				tablebody += "<center> <a class='btn btn-success edit' data-toggle='modal' href='#FeeEdit'><i class='fa fa-edit'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a><center></td></tr>";
			else
				tablebody += "<center><a class='btn btn-info retrieve' href='javascript:;'><i class='fa fa-rotate-left'></i></a><center></td></tr>";
			
		}
	pageContext.setAttribute("tablebody", tablebody);


%>    

<t:Admin title="Professor" from="Faculty Setup" to="Professor">

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
    	<script src="../Assets/Admin/FacultySetup/Professor.js"></script>
    
        <div class="row">
                <div class="col-sm-12">
                	<section class="panel">
                            <div class="panel-body">
                                <div class="adv-table editable-table ">
                                    <div class="clearfix">
                                        <div class="btn-group">
                                            <button id="editable-sample_new" class="btn btn-success add" data-toggle="modal" href="#ProfessorAdd">
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
	                                            <th style="width: 200px">Professor Number</th>
	                                            <th style="width: 100px">Name</th>
	                                            <th style="width: 100px">Description</th>
	                                            <th style="width: 120px">Action</th>  
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
         <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="ProfessorAdd" class="modal fade">
	        <div class="modal-dialog" style="width:700px">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Add Professor</h4>
	                </div>
	                <div class="modal-body">
	                    <form method="post" id="form-data">
	                        <div class="row" style="padding-left:15px;padding-top:10px">
	                        	<div class="col-lg-12">
	                        		<div class="col-lg-4">
		                                First Name <input type="text" class="form-control" placeholder="ex. Juan" id="fnameTxt" >
		                            </div>
	                        		<div class="col-lg-4">
		                                Middle Name <input type="text" class="form-control" placeholder="ex. Paciano" id="mnameTxt" >
		                            </div>
	                        		<div class="col-lg-4">
		                                Last Name <input type="text" class="form-control" placeholder="ex. Dela Cruz" id="lnameTxt" >
		                            </div>
		                        	<div class="col-lg-12" style="padding-top:10px">
		                                Description<textarea class="form-control" placeholder="ex. Finished Bachelor of Arts in Information Technology" rows="3" style="margin: 0px 202.5px 0px 0px;resize:none" id="descTxt"></textarea>
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


</t:Admin>
