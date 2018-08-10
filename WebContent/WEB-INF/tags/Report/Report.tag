<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@attribute name="title" type="java.lang.String" required="true" %>
<%@attribute name="from" type="java.lang.String" required="true" %>
<%@attribute name="to" type="java.lang.String" required="true" %>
<%@attribute name="myscript" fragment="true" %>
<%@attribute name="customImportedScript" fragment="true" %>
<%
	if(session.getAttribute("username") == null || !session.getAttribute("type").equals("Registrar")){
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

	 <link rel="stylesheet" type="text/css" href="../Assets/js/gritter/css/jquery.gritter.css" />
    <!--dynamic table-->
    <link href="../Assets/js/advanced-datatable/css/demo_page.css" rel="stylesheet" />
    <link href="../Assets/js/advanced-datatable/css/demo_table.css" rel="stylesheet" />
    <link rel="stylesheet" href="../Assets/js/data-tables/DT_bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../Assets/js/jquery-multi-select/css/multi-select.css" />
    <link rel="stylesheet" type="text/css" href="../Assets/js/jquery-tags-input/jquery.tagsinput.css" />

    <link rel="stylesheet" type="text/css" href="../Assets/js/select2/select2.css" />

    <link href="../Assets/js/iCheck/skins/minimal/minimal.css" rel="stylesheet">
    <link href="../Assets/js/iCheck/skins/minimal/red.css" rel="stylesheet">
    <link href="../Assets/js/iCheck/skins/minimal/green.css" rel="stylesheet">
    <link href="../Assets/js/iCheck/skins/minimal/blue.css" rel="stylesheet">
    <link href="../Assets/js/iCheck/skins/minimal/yellow.css" rel="stylesheet">
    <link href="../Assets/js/iCheck/skins/minimal/purple.css" rel="stylesheet">

    <link href="../Assets/js/iCheck/skins/square/square.css" rel="stylesheet">
    <link href="../Assets/js/iCheck/skins/square/red.css" rel="stylesheet">
    <link href="../Assets/js/iCheck/skins/square/green.css" rel="stylesheet">
    <link href="../Assets/js/iCheck/skins/square/blue.css" rel="stylesheet">
    <link href="../Assets/js/iCheck/skins/square/yellow.css" rel="stylesheet">
    <link href="../Assets/js/iCheck/skins/square/purple.css" rel="stylesheet">

    <link href="../Assets/js/iCheck/skins/flat/grey.css" rel="stylesheet">
    <link href="../Assets/js/iCheck/skins/flat/red.css" rel="stylesheet">
    <link href="../Assets/js/iCheck/skins/flat/green.css" rel="stylesheet">
    <link href="../Assets/js/iCheck/skins/flat/blue.css" rel="stylesheet">
    <link href="../Assets/js/iCheck/skins/flat/yellow.css" rel="stylesheet">
    <link href="../Assets/js/iCheck/skins/flat/purple.css" rel="stylesheet">




    <!-- Custom styles for this template -->
    <link href="../Assets/css/style.css" rel="stylesheet">
    <link href="../Assets/css/style-responsive.css" rel="stylesheet" />

	<link rel="stylesheet" type="text/css" href="../Assets/js/select2/select2.css" />
    <link href="../Assets/js/plugins/sweetalert/sweetalert.css" type="text/css" rel="stylesheet" media="screen,projection">

    <link rel="icon" href="../Assets/images/PUPLogo.png" >
 	<style>
	    .invoice-box {
	        max-width: 800px;
	        margin: auto;
	        padding: 30px;
	        border: 1px solid #eee;
	        box-shadow: 0 0 10px rgba(0, 0, 0, .15);
	        font-size: 16px;
	        line-height: 24px;
	        font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
	        color: #555;
	    }
	    
	    .invoice-box table {
	        width: 100%;
	        line-height: inherit;
	        text-align: left;
	    }
	    
	    .invoice-box table td {
	        padding: 5px;
	        vertical-align: top;
	    }
	    
	    .invoice-box table tr td:nth-child(2) {
	        text-align: right;
	    }
	    
	    .invoice-box table tr.top table td {
	        padding-bottom: 20px;
	    }
	    
	    .invoice-box table tr.top table td.title {
	        font-size: 45px;
	        line-height: 45px;
	        color: #333;
	    }
	    
	    .invoice-box table tr.information table td {
	        padding-bottom: 40px;
	    }
	    
	    .invoice-box table tr.heading td {
	        background: #eee;
	        border-bottom: 1px solid #ddd;
	        font-weight: bold;
	    }
	    
	    .invoice-box table tr.details td {
	        padding-bottom: 20px;
	    }
	    
	    .invoice-box table tr.item td{
	        border-bottom: 1px solid #eee;
	    }
	    
	    .invoice-box table tr.item.last td {
	        border-bottom: none;
	    }
	    
	    .invoice-box table tr.total td:nth-child(2) {
	        border-top: 2px solid #eee;
	        font-weight: bold;
	    }
	    
	    @media only screen and (max-width: 600px) {
	        .invoice-box table tr.top table td {
	            width: 100%;
	            display: block;
	            text-align: center;
	        }
	        
	        .invoice-box table tr.information table td {
	            width: 100%;
	            display: block;
	            text-align: center;
	        }
	    }
	    
	    /** RTL **/
	    .rtl {
	        direction: rtl;
	        font-family: Tahoma, 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
	    }
	    
	    .rtl table {
	        text-align: right;
	    }
	    
	    .rtl table tr td:nth-child(2) {
	        text-align: left;
	    }
	    .emphasize{
	    	font-weight:bold;
	    }
    </style>

</head>

<body>

	<div id="body">
		<jsp:doBody/>
	</div>
	
	
    <jsp:invoke fragment="customImportedScript"/>
    
    <script src="../Assets/js/jquery.js"></script>
    <script src="../Assets/bs3/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="../Assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="../Assets/js/jquery.scrollTo.min.js"></script>
    <script src="../Assets/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.js"></script>
    <script src="../Assets/js/jquery.nicescroll.js"></script>
   	<script src="../Assets/js/select2/select2.js"></script>
	<script src="../Assets/js/select-init.js"></script>
	<script type="text/javascript" src="../Assets/js/gritter/js/jquery.gritter.js"></script>
    <!--dynamic table-->
    <script type="text/javascript" language="javascript" src="../Assets/js/advanced-datatable/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="../Assets/js/data-tables/DT_bootstrap.js"></script>
    <!--common script init for all pages-->
	<script type="text/javascript" src="../Assets/js/jquery-multi-select/js/jquery.multi-select.js"></script>
	<script type="text/javascript" src="../Assets/js/jquery-multi-select/js/jquery.quicksearch.js"></script>
	<script src="../Assets/js/select2/select2.js"></script>
	<script src="../Assets/js/select-init.js"></script>
    <script src="../Assets/js/iCheck/jquery.icheck.js"></script>
	<script type="text/javascript" src="../Assets/js/ckeditor/ckeditor.js"></script>
	<script src="../Assets/js/flot-chart/jquery.flot.js"></script>
	<script src="../Assets/js/flot-chart/jquery.flot.tooltip.min.js"></script>
	<script src="../Assets/js/flot-chart/jquery.flot.resize.js"></script>
	<script src="../Assets/js/flot-chart/jquery.flot.pie.resize.js"></script>

    <script src="../Assets/js/scripts.js"></script>
    <!--icheck init -->
	<script src="../Assets/js/icheck-init.js"></script>

	<script src="../Assets/js/gritter.js" type="text/javascript"></script>
    <!--dynamic table initialization -->

    <script type="text/javascript" src="../Assets/js/plugins/sweetalert/sweetalert.min.js"></script>

    <jsp:invoke fragment="myscript"/>
</body>
</html>
