<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id="navbar"><span>Red Stapler - SheetJS </span></div>
<div id="wrapper">
<script type="text/javascript" src="Assets/js/jquery-1.8.3.min.js"></script>
<script lang="javascript" src="Assets/js/xlsx.full.min.js"></script>
<script lang="javascript" src="Assets/js/FileSaver.min.js"></script>
    
        <button id="button-a">Create Excel</button>
</div>
<script>
        var wb = XLSX.utils.book_new();
        wb.Props = {
                Title: "Student Grades",
                Subject: "Grades",
                Author: "EKPV",
                CreatedDate: new Date(2018,08,24)
        };
        
        wb.SheetNames.push("Student Grades");
        var ws_data = [['hello' , 'world'],['hello' , 'world']];
        var ws = XLSX.utils.aoa_to_sheet(ws_data);
        wb.Sheets["Student Grades"] = ws;
        var wbout = XLSX.write(wb, {bookType:'xlsx',  type: 'binary'});
        function s2ab(s) {
  
                var buf = new ArrayBuffer(s.length);
                var view = new Uint8Array(buf);
                for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF;
                return buf;
                
        }
        $("#button-a").click(function(){
                saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), 'test.xlsx');
        });
  
</script>
</body>
</html>