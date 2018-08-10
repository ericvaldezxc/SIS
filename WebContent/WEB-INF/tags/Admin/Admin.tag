<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@attribute name="title" type="java.lang.String" required="true" %>
<%@attribute name="from" type="java.lang.String" required="true" %>
<%@attribute name="to" type="java.lang.String" required="true" %>
<%@attribute name="myscript" fragment="true" %>
<%@attribute name="customImportedScript" fragment="true" %>
<%
	if(session.getAttribute("username") == null || !session.getAttribute("type").equals("Admin")){
		response.sendRedirect("http://"+request.getServerName()+":"+request.getServerPort()+"/SIS/" +"index.jsp");
	}

%>
<!DOCTYPE html public "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd ">
<html lang="en">
<head>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author">
    <link rel="shortcut icon" href="../Assets/images/favicon.png">

    <title>${title} </title>

    <!--Core CSS -->
    <link href="../Assets/bs3/css/bootstrap.min.css" rel="stylesheet">
    <link href="../Assets/css/bootstrap-reset.css" rel="stylesheet">
    <link href="../Assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <!--dynamic table-->
    <link href="../Assets/js/advanced-datatable/css/demo_page.css" rel="stylesheet" />
    <link href="../Assets/js/advanced-datatable/css/demo_table.css" rel="stylesheet" />
    <link rel="stylesheet" href="../Assets/js/data-tables/DT_bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../Assets/js/jquery-multi-select/css/multi-select.css" />
    <link rel="stylesheet" type="text/css" href="../Assets/js/jquery-tags-input/jquery.tagsinput.css" />

    <link rel="stylesheet" type="text/css" href="../Assets/js/select2/select2.css" />

    <!-- Custom styles for this template -->
    <link href="../Assets/css/style.css" rel="stylesheet">
    <link href="../Assets/css/style-responsive.css" rel="stylesheet" />

	<link rel="stylesheet" type="text/css" href="../Assets/js/select2/select2.css" />
    <link href="../Assets/js/plugins/sweetalert/sweetalert.css" type="text/css" rel="stylesheet" media="screen,projection">

    <link rel="icon" href="../Assets/images/PUPLogo.png" sizes="32x32">

</head>

<body>
<section id="container" >
<!--header start-->
<header class="header fixed-top clearfix">
<!--logo start-->
<div class="brand">
    <a href="../index.jsp" class="logo">
            <!--  <img src="../Assets/images/sis-logo.png" style="width: 193px; height: 37px;" alt="">  -->
    </a>

    <div class="sidebar-toggle-box">
        <div class="fa fa-bars"></div>
    </div>
</div>
<!--logo end-->

<div class="top-nav clearfix">
    <!--search & user info start-->
    <ul class="nav pull-right top-menu">
        <!-- user login dropdown start-->
        <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
            	<img alt="" src="../Assets/images/User/default.png" alt="" >
                <span class="username"> ${sessionScope.fullname} </span>
                <b class="caret"></b>
            </a>
            <ul class="dropdown-menu extended logout">
                <li><a href="ADProfile.php"><i class=" fa fa-suitcase"></i>Profile</a></li>
                <li><a id="logoutBtn"><i class="fa fa-key" ></i> Log Out</a></li>
            </ul>
        </li>
    </ul>
    <!--search & user info end-->
</div>  
</header>
<!--header end-->
<aside>
    <div id="sidebar" class="nav-collapse">
        <!-- sidebar menu start-->
        <div class="leftside-navigation">
            <ul class="sidebar-menu" id="nav-accordion">
            	<li > 
            		<a href="Dashboard.jsp" class="" id="DashboardBtn">
                     	<i class ="fa fa-dashboard" ></i>
                     	<span>Dashboard</span>
                    </a> 
                </li>
                <li class="sub-menu">
                    <a href="javascript:;" id="StudentSetup" class="">
                        <i class="fa  fa-meh-o"></i>
                        <span>Student Setup</span>
                    </a>
                    <ul class="sub">
                    	<li class="" id="CourseBtn"><a href="Course.jsp">Course</a></li>
                    	<li class="" id="SectionBtn"><a href="Section.jsp">Section</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;" class="" id="CurriculumSetup" >
                        <i class="fa fa-tasks"></i>
                        <span>Curriculum Setup</span>
                    </a>
                    <ul class="sub">
                    	<li class="" id="SubjectBtn"><a href="Subject.jsp">Subject</a></li>
                    	<li class="" id="DocumentBtn"><a href="Document.jsp">Document</a></li>
                    	<li class="" id="CurriculumBtn"><a href="Curriculum.jsp">Curriculum</a></li>						   
                    	<li class="" id="CurriculumYearBtn"><a href="CurriculumYear.jsp">Curriculum Year</a></li>						   
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;" class="" id="FeeSetup" >
                        <i class="fa fa-money"></i>
                        <span>Fee Setup</span>
                    </a>
                    <ul class="sub">
                    	<li class="" id="FeeBtn"><a href="Fee.jsp">Fee</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;" class="" id="FacultySetup" >
                        <i class="fa fa-bookmark"></i>
                        <span>Faculty Setup</span>
                    </a>
                    <ul class="sub">
                    	<li class="" id="ProfessorBtn"><a href="Professor.jsp">Professor</a></li>
                    	<li class="" id="RoomBtn"><a href="Room.jsp">Room</a></li>
                    	<li class="" id="AcademicYearBtn"><a href="AcademicYear.jsp">Academic Year</a></li>
                    	<li class="" id="SemesterBtn"><a href="Semester.jsp">Semester</a></li>
                    	<li class="" id="Campus"><a href="Campus.jsp">Campus</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;" id="UserManagement" class="">
                        <i class="fa fa-user"></i>
                        <span>User Management</span>
                    </a>
                    <ul class="sub">
                        <li><a href="#">#</a></li>
                        <li><a href="#">#</a></li>  
                    </ul>
                </li>
            </ul>            
        </div>
        <!-- sidebar menu end-->
    </div>
</aside>

<!--sidebar end-->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
        <!-- page start-->
            <div class="row">
                <div class="col-md-12">
                    <!--breadcrumbs start -->
                    <ul class="breadcrumb">
                        <li><i class="fa fa-asterisk"></i><strong> &nbsp; ${from} </strong></li>
                        <li><strong>  ${to} </strong></li>
                    </ul>
                    <!--breadcrumbs end -->
                </div>
            </div>
            <div id="body">
		      <jsp:doBody/>
		    </div>
        <!-- page end-->
        </section>
    </section>
    <!--main content end-->
<!--right sidebar start-->
<div class="right-sidebar">
    <div class="search-row">
        <input type="text" placeholder="Search" class="form-control">
    </div>
    <div class="right-stat-bar">
        <ul class="right-side-accordion">
        <li class="widget-collapsible">
            <ul class="widget-container">
                <li>
                    <div class="prog-row side-mini-stat clearfix">
                        <div class="side-graph-info">
                            <h4>Target sell</h4>
                            <p>
                                25%, Deadline 12 june 13
                            </p>
                        </div>
                        <div class="side-mini-graph">
                            <div class="target-sell">
                            </div>
                        </div>
                    </div>
                    <div class="prog-row side-mini-stat">
                        <div class="side-graph-info">
                            <h4>product delivery</h4>
                            <p>
                                55%, Deadline 12 june 13
                            </p>
                        </div>
                        <div class="side-mini-graph">
                            <div class="p-delivery">
                                <div class="sparkline" data-type="bar" data-resize="true" data-height="30" data-width="90%" data-bar-color="#39b7ab" data-bar-width="5" data-data="[200,135,667,333,526,996,564,123,890,564,455]">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="prog-row side-mini-stat">
                        <div class="side-graph-info payment-info">
                            <h4>payment collection</h4>
                            <p>
                                25%, Deadline 12 june 13
                            </p>
                        </div>
                        <div class="side-mini-graph">
                            <div class="p-collection">
                                <span class="pc-epie-chart" data-percent="45">
                                <span class="percent"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="prog-row side-mini-stat">
                        <div class="side-graph-info">
                            <h4>delivery pending</h4>
                            <p>
                                44%, Deadline 12 june 13
                            </p>
                        </div>
                        <div class="side-mini-graph">
                            <div class="d-pending">
                            </div>
                        </div>
                    </div>
                    <div class="prog-row side-mini-stat">
                        <div class="col-md-12">
                            <h4>total progress</h4>
                            <p>
                                50%, Deadline 12 june 13
                            </p>
                            <div class="progress progress-xs mtop10">
                                <div style="width: 50%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="20" role="progressbar" class="progress-bar progress-bar-info">
                                    <span class="sr-only">50% Complete</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </li>
        </ul>
    </div>
</div>
<!--right sidebar end-->

</section>


<!-- Placed js at the end of the document so the pages load faster -->

<!--Core js-->
    <jsp:invoke fragment="customImportedScript"/>
    
    <script src="../Assets/js/jquery.js"></script>
    <script src="../Assets/bs3/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="../Assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="../Assets/js/jquery.scrollTo.min.js"></script>
    <script src="../Assets/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.js"></script>
    <script src="../Assets/js/jquery.nicescroll.js"></script>
   	<script src="../Assets/js/select2/select2.js"></script>
	<script src="../Assets/js/select-init.js"></script>

    <!--dynamic table-->
    <script type="text/javascript" language="javascript" src="../Assets/js/advanced-datatable/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="../Assets/js/data-tables/DT_bootstrap.js"></script>
    <!--common script init for all pages-->
    <script src="../Assets/js/iCheck/jquery.icheck.js"></script>
	<script type="text/javascript" src="../Assets/js/jquery-multi-select/js/jquery.multi-select.js"></script>
	<script type="text/javascript" src="../Assets/js/jquery-multi-select/js/jquery.quicksearch.js"></script>
	<script src="../Assets/js/select2/select2.js"></script>
	<script src="../Assets/js/select-init.js"></script>
	<script type="text/javascript" src="../Assets/js/ckeditor/ckeditor.js"></script>


    <script src="../Assets/js/scripts.js"></script>
    <!--icheck init -->
	<script src="../Assets/js/icheck-init.js"></script>

    <!--dynamic table initialization -->

    <script type="text/javascript" src="../Assets/js/plugins/sweetalert/sweetalert.min.js"></script>
	<script >
	$(document).ready(function (){
		var title = document.title;
		if(title == 'Subject') 
			$("#SubjectBtn").addClass("active");
		else if(title == 'Curriculum') 
			$("#CurriculumBtn").addClass("active");
		else if(title == 'Curriculum Year') 
			$("#CurriculumYearBtn").addClass("active");
		else if(title == 'Document') 
			$("#DocumentBtn").addClass("active");
		else if(title == 'Fee') 
			$("#FeeBtn").addClass("active");
		else if(title == 'Section') 
			$("#SectionBtn").addClass("active");
		else if(title == 'Course') 
			$("#CourseBtn").addClass("active");
		else if(title == 'Admission') 
			$("#AdmissionBtn").addClass("active");
		else if(title == 'Dashboard') 
			$("#DashboardBtn").addClass("active");
		else if(title == 'Professor') 
			$("#ProfessorBtn").addClass("active");
		else if(title == 'Room') 
			$("#RoomBtn").addClass("active");
		else if(title == 'Semester') 
			$("#SemesterBtn").addClass("active");
		else if(title == 'Academic Year') 
			$("#AcademicYearBtn").addClass("active");
		
		if(title == 'Subject' || title == 'Curriculum' || title == 'Curriculum Year' || title == 'Document' ) 
			$('#CurriculumSetup').click(); 
		else if(title == 'Fee' ) 
			$('#FeeSetup').click();
		else if(title == 'Section' || title == 'Course' || title == 'Admission' ) 
			$('#StudentSetup').click(); 
		else if(title == 'Professor' || title == 'Room' || title == 'Academic Year' || title == 'Semester' ) 
			$('#FacultySetup').click();
		
		$('#logoutBtn').click(function(){
    		$.ajax({
				type:'POST',
				url:"http://"+window.location.hostname+":"+window.location.port+"/SIS/" +"Logout",
				success: function(result){
					window.location = "http://"+window.location.hostname+":"+window.location.port+"/SIS/" +"index.jsp";
                     
				},
                error: function (response) {
                    swal("Error encountered while accessing data", "Please try again", "error");
                }
			});
		});
				
		
		
		
	});
	</script>
    <jsp:invoke fragment="myscript"/>
</body>
</html>
