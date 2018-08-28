<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<script type="text/javascript" src="Assets/js/jquery-1.8.3.min.js"></script>

<label class="btn btn-primary" for="my-file-selector">
              <input id="my-file-selector" type="file" style="display:none;" onchange="$('#upload-file-info').html($(this).val()); handleFiles(this.files);">
                Choose File
              </label>
        <input id="show" type="button" value="okay">
              
<span class="label label-info" id="upload-file-info"></span>
</body>
<script>
	var student = [];
	var finstudent = [];
	var studentList = [];
	

		function handleFiles(files) {
		  if (window.FileReader) {
		    getAsText(files[0]);
		  } else {
		    alert('FileReader are not supported in this browser.');
		  }
		}

		function getAsText(fileToRead) {
		  var reader = new FileReader();
		  // Read file into memory as UTF-8
		  reader.readAsText(fileToRead);
		  // Handle errors load
		  reader.onload = loadHandler;
		  reader.onerror = errorHandler;
		}

		function loadHandler(event) {
		  var csv = event.target.result;
		  processData(csv);
		}

		function processData(csv) {
		    var allTextLines = csv.split(/\r\n|\n/);
		    student = []
		    for (var i=1; i<allTextLines.length; i++) {
		        var row = allTextLines[i].split(';');		
		        for (var j=0; j<row.length; j++) {
			        var col = row[j].split(',');
			        if(col[0] != "")
				        student.push({name:col[0],studentnumber:col[1],rand:col[2],rand2:col[3]} );
		        }
		    }
		}

		function errorHandler(evt) {
		  if(evt.target.error.name == "NotReadableError") {
		      alert("Cannot read file!");
		  }
		}


		$('#show').click(function(){
			$(student).each(function(key , val){
				alert(val.name)
				
			})
		})
		

</script>
</html>