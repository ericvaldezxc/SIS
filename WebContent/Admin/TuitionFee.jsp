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
	String courseDrp = "";
	String yearDrp = "";


	Statement stmnt = conn.createStatement();
	ResultSet rs = stmnt.executeQuery("Select Academic_Year_Description,Course_Description,Tuition_Fee_Amount,CASE WHEN Tuition_Fee_Year_Level = 1 THEN 'First Year' WHEN Tuition_Fee_Year_Level = 1 THEN 'Second Year' WHEN Tuition_Fee_Year_Level = 1 THEN 'Third Year' ELSE 'Fourth Year' END as yearlvl,Tuition_Fee_Display_Status from r_tuition_fee inner join r_academic_year on Tuition_Fee_AcademicYearID = Academic_Year_ID inner join r_course on Tuition_Fee_CourseID = Course_ID where Course_Display_Status = 'Active' and  Academic_Year_Display_Status = 'Active' ");
		while(rs.next()){
			tablebody += "<tr><td>" + ec.decrypt(ec.key, ec.initVector, rs.getString("Academic_Year_Description"))+ "</td><td>"+ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Description"))+"</td><td>"+rs.getString("yearlvl")+"</td><td>"+rs.getString("Tuition_Fee_Amount")+"</td><td>"; 
			if(rs.getString("Tuition_Fee_Display_Status").equals("Active"))
//				tablebody += "<center> <a class='btn btn-info view' href='javascript:;'><i class='fa fa-eye'></i></a> <a class='btn btn-success edit' data-toggle='modal' href='#CurriculumEdit'><i class='fa fa-edit'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a><center></td></tr>";
				tablebody += "<center> <a class='btn btn-success edit' data-toggle='modal' href='#FeeEdit'><i class='fa fa-edit'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a><center></td></tr>";
			else
				tablebody += "<center><a class='btn btn-info retrieve' href='javascript:;'><i class='fa fa-rotate-left'></i></a><center></td></tr>";
			
		}
		
		rs = stmnt.executeQuery("Select Course_Code,Course_Description from r_course WHERE Course_Display_Status = 'Active'");
		while(rs.next()){
			courseDrp += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Code"))+"' >"+ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Description"))+"</option>";
		}
		
		rs = stmnt.executeQuery("Select Academic_Year_Code,Academic_Year_Description from r_academic_year WHERE Academic_Year_Display_Status = 'Active'");
		while(rs.next()){
			yearDrp += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Academic_Year_Code"))+"' >"+ec.decrypt(ec.key, ec.initVector, rs.getString("Academic_Year_Description"))+"</option>";
		}
		
		
		
	pageContext.setAttribute("tablebody", tablebody);
	pageContext.setAttribute("courseDrp", courseDrp);
	pageContext.setAttribute("yearDrp", yearDrp);



%>    

<t:Admin title="Tuition Fee" from="Fee Setup" to="Tuition Fee">

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
    	<script src="../Assets/Admin/FeeSetup/TuitionFee.js"></script>
    
        <div class="row">
        
                <div class="col-sm-12">
                	<section class="panel">
                            <div class="panel-body">
                                <div class="adv-table editable-table ">
                                    <div class="clearfix">
                                        <div class="btn-group">
                                            <button id="editable-sample_new" class="btn btn-success add" data-toggle="modal" href="#FeeAdd">
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
	                                            <th style="width: 200px">Academic Year</th>
	                                            <th style="width: 100px">Course</th>
	                                            <th style="width: 100px">Year Level</th>
	                                            <th style="width: 150px">Amount</th>
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
         <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="FeeAdd" class="modal fade">
	        <div class="modal-dialog" style="width:700px">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Add Tuition Fee</h4>
	                </div>
	                <div class="modal-body">
	                    <form method="post" id="form-data">
	                    
	                        <div class="row" style="padding-left:15px;padding-top:10px">
	                        	<div class="col-lg-12">
	                        		<div class="col-lg-6">
		                                Academic Year 
		                                <select class='populate' style='width: 290px;' id="yearDrp" >
	                                		 ${yearDrp} 
	                                	 </select>
		                            </div>
	                        		<div class="col-lg-6">
	                        			Course
	                        			<select id="courseDrp" class="populate " style="width: 290px">
                                      	  ${courseDrp} 
                                    	</select>                      			
		                            </div>
		                        	<div class="col-lg-6" style="padding-top:10px">
		                        		Year Level 
		                        			<select class='form-control ' style='width: 300px;' id="lvlDrp" >
		                                		<option value='1' selected='selected' >First Year</option>
		                                		<option value='2' >Second Year</option>
		                                		<option value='3' >Third Year</option>
		                                		<option value='4' >Fourth Year</option>
		                                	 </select>
		                            </div>	
		                            <div class="col-lg-6" style="padding-top:10px">
		                        		Amount <input type="number" min="0.00" max="10000.00" step="0.01" class="form-control" placeholder="ex. 8" id="amountTxt" >
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

	    </jsp:body>


</t:Admin>
