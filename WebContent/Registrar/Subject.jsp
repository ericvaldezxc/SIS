<%@page import="java.sql.*"%>
<%@page import="connection.DBConfiguration" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/Registrar" %>
<%@page import="configuration.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	EncryptandDecrypt ec = new EncryptandDecrypt();
	DBConfiguration db = new DBConfiguration();
	Dropdowns drp = new Dropdowns();
	
	Connection conn = db.getConnection();
	if(conn == null)
		out.print("failasded");
	String tablebody = "";
	String prereqcount = "";
	String subjectDrp = drp.fillsubjectDrp();
	String prereq = "";
	String curid="";
	Statement stmnt = conn.createStatement();
	Statement stmnt2 = conn.createStatement();
	Statement stmnt3 = conn.createStatement();
	ResultSet rs = stmnt.executeQuery("Select * from r_subject");
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
			
			tablebody += "<tr><td>" + ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code")) + "</td><td>"+ ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Description")) +"</td><td><center style='margin-top:10px'>"+prereq+"</center></td><td>"; 
			if(rs.getString("Subject_Display_Stat").equals("Active"))
				tablebody += "<center><a class='btn btn-success edit' data-toggle='modal' href='#SubjectEdit'><i class='fa fa-edit'></i></a> <a class='btn btn-info prof' data-toggle='modal' href='#Profile' href='javascript:;'><i class='fa fa-folder'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a><center></td></tr>";
			else
				tablebody += "<center><a class='btn btn-info retrieve' href='javascript:;'><i class='fa fa-rotate-left'></i></a><center></td></tr>";
		}
	
	//rs = stmnt.executeQuery("Select Subject_Code,Subject_Description,Subject_Units from r_subject WHERE Subject_Display_Stat = 'Active'");
	//while(rs.next()){
		//subjectDrp += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code"))+"' data-unit='"+rs.getString("Subject_Units")+"'>"+ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Description"))+"</option>";
	//}
	pageContext.setAttribute("tablebody", tablebody);
	pageContext.setAttribute("subjectDrp", subjectDrp);


%>    

<t:Registrar title="Subject" from="Curriculum Setup" to="Subject">

	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
				EditableTable.init();

                $("#updsubjectDrp").select2();
                $("#updprereq").select2();
			});
		</script>
    </jsp:attribute>
    
	<jsp:attribute name="customImportedScript">      
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>

    </jsp:attribute>    
    
    <jsp:body>
    	<script src="../Assets/Registrar/Curriculum/Subject.js"></script>
    
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
	                                            <th style="width: 200px">Subject Code</th>
	                                            <th style="width: 350px">Subject Description</th>
	                                            <th style="width: 350px">Prerequisite</th>
	                                            <th style="width: 200px">Action</th>  
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
         <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="SubjectAdd" class="modal fade">
	        <div class="modal-dialog" style="width:720px">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Add Subject</h4>
	                </div>
	                <div class="modal-body">
	                    <form method="post" id="form-data">
	                        <div class="row" style="padding-left:15px;padding-top:10px">
	                            <div class="row">
		                            <div class="col-lg-6">
		                                Code <input type="text" class="form-control" placeholder="ex. INTE 4213" id="codeTxt" >
		                            </div>
		                            <div class="col-lg-6">
		                                Description <input type="text" class="form-control" placeholder="ex. Capstone Project Description" id="descTxt" >
		                            </div>
	                            </div>     
                    	        <div class="row">
	                    	        <div class="col-lg-6" style="padding-top:10px" >
		                            	Prerequisite
		                            	</br>
		                            	<select multiple name="e9" id="e9" style="width:300px" class="populate ">
	                                        ${subjectDrp}
	                                    </select>
		                            </div>
                    	        
		                            <div class="col-lg-6" style="padding-top:10px" >
		                            	Group
		                            	</br>
	                        			<select class="populate " style="width: 290px" id="subjectDrp">
	                        				<option value="0">No Group</option>
	                                      	 ${subjectDrp} 
	                                   	</select> 
		                            </div>
	                            </div>
	                            <div class="row">
		                            <div class="col-lg-4" style="padding-top:10px">
		                                Lecture Units <input type="number" value="0" class="form-control" placeholder="ex. 3" id="lectureunitTxt" >
		                            </div>
		                            <div class="col-lg-4" style="padding-top:10px">
		                                Laboratory Units <input type="number" value="0" class="form-control" placeholder="ex. 3" id="laboratoryunitTxt" >
		                            </div>
		                            <div class="col-lg-4" style="padding-top:10px">
		                                Credited Units <input type="number" value="0" class="form-control" placeholder="ex. 3" id="creditedunitTxt" >
		                            </div>
	                            </div>
	                            <div class="row">
		                            <div class="col-lg-4" style="padding-top:10px">
		                                Lecture Hours <input type="number" value="0" class="form-control" placeholder="ex. 3" id="lecturehourTxt" >
		                            </div>
		                            <div class="col-lg-4" style="padding-top:10px">
		                                Laboratory Hours <input type="number" value="0" class="form-control" placeholder="ex. 3" id="laboratoryhourTxt" >
		                            </div>
		                            <div class="col-lg-4" style="padding-top:10px">
		                                Tuition Hours <input type="number" value="0" class="form-control" placeholder="ex. 3" id="creditedhourTxt" >
		                            </div>
	                            </div>
	                            <div class="row" style="text-align:center;padding-top:10px;margin-left:0%">
	                           		 <div class="col-lg-12">
	                           		 	
                                       <label class="radio-inline">
										  <input type="radio" name="type" value="academic" checked="checked" id="academictype"> Academic
										</label>
										<label class="radio-inline">
										  <input type="radio" name="type" value="non-academic"> Non-Academic
										</label>
                                    </div>
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
	        <div class="modal-dialog" style="width:700px">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Edit Subject</h4>
	                </div>
	                <div class="modal-body">
	                    <form method="post" id="form-data">
	                     	<div class="row" style="padding-left:15px;padding-top:10px">
	                            <div class="row">
		                            <div class="col-lg-6">
		                                Code <input type="text" class="form-control" placeholder="ex. INTE 4213" id="updcodeTxt" >
		                            </div>
		                            <div class="col-lg-6">
		                                Description <input type="text" class="form-control" placeholder="ex. Capstone Project Description" id="upddescTxt" >
		                            </div>
	                            </div>     
                    	        <div class="row">
	                    	        <div class="col-lg-6" style="padding-top:10px" >
		                            	Prerequisite
		                            	</br>
		                            	<select multiple id="updprereq" style="width:300px" class="populate ">
	                                        ${subjectDrp}
	                                    </select>
		                            </div>
                    	        
		                            <div class="col-lg-6" style="padding-top:10px" >
		                            	Group
		                            	</br>
	                        			<select class="populate " style="width: 290px" id="updsubjectDrp">
	                        				<option value="0">No Group</option>
	                                      	 ${subjectDrp} 
	                                   	</select> 
		                            </div>
	                            </div>
	                            <div class="row">
		                            <div class="col-lg-4" style="padding-top:10px">
		                                Lecture Units <input type="number" value="0" class="form-control" placeholder="ex. 3" id="updlectureunitTxt" >
		                            </div>
		                            <div class="col-lg-4" style="padding-top:10px">
		                                Laboratory Units <input type="number" value="0" class="form-control" placeholder="ex. 3" id="updlaboratoryunitTxt" >
		                            </div>
		                            <div class="col-lg-4" style="padding-top:10px">
		                                Credited Units <input type="number" value="0" class="form-control" placeholder="ex. 3" id="updcreditedunitTxt" >
		                            </div>
	                            </div>
	                            <div class="row">
		                            <div class="col-lg-4" style="padding-top:10px">
		                                Lecture Hours <input type="number" value="0" class="form-control" placeholder="ex. 3" id="updlecturehourTxt" >
		                            </div>
		                            <div class="col-lg-4" style="padding-top:10px">
		                                Laboratory Hours <input type="number" value="0" class="form-control" placeholder="ex. 3" id="updlaboratoryhourTxt" >
		                            </div>
		                            <div class="col-lg-4" style="padding-top:10px">
		                                Tuition Hours <input type="number" value="0" class="form-control" placeholder="ex. 3" id="updtuitionhourTxt" >
		                            </div>
	                            </div>
	                            <div class="row" style="text-align:center;padding-top:10px;margin-left:0%">
	                           		 <div class="col-lg-12">
	                           		 	
                                       <label class="radio-inline">
										  <input type="radio" name="type" value="academic" checked="checked" id="updacademictype"> Academic
										</label>
										<label class="radio-inline">
										  <input type="radio" name="type" value="non-academic"  id="updacademictype2"> Non-Academic
										</label>
                                    </div>
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
	    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="Profile" class="modal fade">
	        <div class="modal-dialog" style="width:700px">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title" id="profiletitle"></h4>
	                </div>
	                <div class="modal-body">
	                	<div class="row">
		                	<div class="col-lg-6">
	                        	 Group
	                        	 <h4 id="grp">CAPS - Capstone</h4>
		                    </div>
		                    <div class="col-lg-6" style="text-align:right">
	                        	 Type
	                        	 <h4 id="acadtype">Academic</h4>
		                    </div>	 	                   
	                	</div>
	                	<div class="row">
		                	<div class="col-lg-12">
		                		Units
                        	  	<table class="table table-striped table-hover table-bordered" >
                                  	<thead>
                                       <tr>
                                           <th>Lecturer Unit/s</th>
                                           <th>Laboratory Unit/s</th>
                                           <th>Credited Unit/s</th>
                                       </tr>
                                   </thead>
                                   <tbody>   
	                                  	<tr> 
	                                  		<td id="lectunit"></td>
	                                  		<td id="labounit"></td>
	                                  		<td id="credunit"></td>
	                                  	</tr>
                                   </tbody>
                                </table>
		                    </div>	 
	                    </div>	
	                    <div class="row">	
		                    <div class="col-lg-12">
		                		Hours
                        	  	<table class="table table-striped table-hover table-bordered" >
                                  	<thead>
                                       <tr>
                                           <th>Lecturer Hour/s</th>
                                           <th>Laboratory Hour/s</th>
                                           <th>Tuition Hour/s</th>
                                       </tr>
                                   </thead>
                                   <tbody>    
	                                   	<tr> 
	                                   		<td id="lecthrs"></td>
	                                   		<td id="labohrs"></td>
	                                   		<td id="tuithrs"></td>
	                                   	</tr>
                                   </tbody>
                                </table>
		                    </div>	                   
	                	</div>
	                	<div class="row">
		                	<div class="col-lg-12">
		                		Prerequisite
                        	  	<table class="table table-striped table-hover table-bordered" >
                                  	<thead>
                                       <tr>
                                           <th style="width: 200px">Subject Code</th>
                                           <th style="width: 350px">Subject Description</th>
                                       </tr>
                                   </thead>
                                   <tbody id="prereqbody">    
                                   </tbody>
                                </table>
		                    </div>	                   
	                	</div>
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="updatecloseBtn" type="button"><u>C</u>lose</button>
	                    <button class="btn btn-success " id="updateBtn" type="button"><u>S</u>ave</button>
	                </div>
	            </div>
	       </div>
	    </div>	
	    </jsp:body>


</t:Registrar>
