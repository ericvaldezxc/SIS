<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author">
    <link rel="shortcut icon" href="Assets/images/favicon.png">

    <title>Login</title>

    <!--Core CSS -->
    <link href="Assets/bs3/css/bootstrap.min.css" rel="stylesheet">
    <link href="Assets/css/bootstrap-reset.css" rel="stylesheet">
    <link href="Assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="Assets/css/style.css" rel="stylesheet">
    <link href="Assets/css/style-responsive.css" rel="stylesheet" />

    <link rel="icon" href="Assets/images/PUPLogo.png" sizes="32x32">
    <link href="Assets/js/plugins/sweetalert/sweetalert.css" type="text/css" rel="stylesheet" media="screen,projection">

</head>

  <body class="login-body">

    <div class="container">

      <form class="form-signin" action="#" method="POST"">

        <img class="form-images" src="Assets/images/PUPLogo.png">        
        <h2 class="form-signin-heading">QCPU<br>Student Information System</h2>

        <div class="login-wrap">
	        <form>
	            <div class="user-login-info">
	                <input type="text" id="usernameTxt" class="form-control" placeholder="Username"  />              
	                <input type="password"  id="passwordTxt"  class="form-control" placeholder="Password"  />
	            </div>
	            <button class="btn btn-lg btn-login btn-block" type="button" style="background-color: #073b4c" id="loginBtn">Log in</button>
			</form>
        </div>
          
          <!-- modal -->

      </form>

    </div>

    <!--Core js-->
	<script type="text/javascript" src="Assets/js/jquery-1.8.3.min.js"></script>
    <script src="Assets/js/jquery.js"></script>
    <script src="Assets/bs3/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="Assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="Assets/js/jquery.scrollTo.min.js"></script>
    <script src="Assets/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.js"></script>
    <script src="Assets/js/jquery.nicescroll.js"></script>
        <script type="text/javascript" src="Assets/js/plugins/sweetalert/sweetalert.min.js"></script>
    
    
    <!--common script init for all pages-->

	<script type="text/javascript">
		$(document).ready(function(e){
			$(document).keypress(function(event) {
			    var keycode = event.keyCode || event.which;
			    if(keycode == '13') {
			    	$('#loginBtn').click();
			    }
			});
			$('#loginBtn').click(function(){
				if($('#usernameTxt').val().length == 0)
					swal("You can't leave your username blank", "Please try again", "error");
				else if ($('#passwordTxt').val().length == 0)
					swal("You can't leave your password blank", "Please try again", "error");
				else{
            		$.ajax({
    					type:'POST',
    					data:{password:$('#passwordTxt').val(),username:$('#usernameTxt').val()},
    					url:'LoginController',
    					success: function(result){
    						var item = $.parseJSON(result);
                            $.each(item, function (key, val) {
								if(val.unexist == "0"){
									swal("You're usernames doesn't exist", "Please try again", "error");
									
								}
								else if(val.pswrong == "0"){
									swal("You enter wrong password", "Please try again", "error");
									
								}
								else{
									if(val.type == "Admin")
										window.location =  "http://"+window.location.hostname+":"+window.location.port+"/SIS/Admin/" +"Dashboard.jsp"
									else if(val.type == "Registrar")
										window.location =  "http://"+window.location.hostname+":"+window.location.port+"/SIS/Registrar/" +"Dashboard.jsp"
									else if(val.type == "Cashier")
										window.location =  "http://"+window.location.hostname+":"+window.location.port+"/SIS/Cashier/" +"Dashboard.jsp"
									else if(val.type == "Faculty")
										window.location =  "http://"+window.location.hostname+":"+window.location.port+"/SIS/Faculty/" +"Dashboard.jsp"
									else if(val.type == "Student")
										window.location =  "http://"+window.location.hostname+":"+window.location.port+"/SIS/Student/" +"Dashboard.jsp"

								}
                            });				
                             
    					},
                        error: function (response) {
                            swal("Error encountered while accessing data", "Please try again", "error");
                        }
    				});
					
					
				}
			});
	
			
		});
	</script>
  </body>
</html>



