var getcode = '';
var getname = '';
var codeTxt = '';
var descTxt = '';
var semTxt = '';
var course = '';
var yearlvl = '';
var curyear = '';
var maxcred = '';

var unitTxt = '';
var latcode = '';


var EditableTable = function () {

    return {

        //main function to initiate the module
        init: function () {
            function restoreRow(oTable, nRow) {
                var aData = oTable.fnGetData(nRow);
                var jqTds = $('>td', nRow);

                for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
                    oTable.fnUpdate(aData[i], nRow, i, false);
                }

                oTable.fnDraw();

            }

            function editRow(oTable, nRow) {
                var aData = oTable.fnGetData(nRow);
                var jqTds = $('>td', nRow);
                //.substring(aData[0].indexOf("*") + 5, aData[0].length)

                jqTds[0].innerHTML = '<input type="text" class="form-control small " value="' + aData[0] + '" disabled style="width:100%" >';
                jqTds[1].innerHTML = '<input type="text" class="form-control small" value="' + aData[1] + '" style="width:100%">';
                jqTds[2].innerHTML = '<input type="text" class="form-control small" value="' + aData[2] + '" style="width:100%">';
                jqTds[3].innerHTML = '<center> <a class="btn btn-info view" href="javascript:;"><i class="fa fa-eye"></i></a>  <a class="btn btn-success  edit" href=""><i class="fa fa-save"></i></a> <a class="btn btn-danger cancel" href=""><i class="fa fa-ban"></i></a></center>';


            }

            function saveRow(oTable, nRow) {
                var jqInputs = $('input', nRow);

                oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
                oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
                oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
                oTable.fnUpdate("<center> <a class='btn btn-info view' href='javascript:;'><i class='fa fa-eye'></i></a>   <a class='btn btn-success edit' href='javascript:;'><i class='fa fa-edit'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a></center>", nRow, 3, false);
                oTable.fnDraw();


            }

            function cancelEditRow(oTable, nRow) {
                var jqInputs = $('input', nRow);
                oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
                oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
                oTable.fnUpdate('<a class="btn btn-success edit" href="">Edit</a>', nRow, 2, false);
                oTable.fnDraw();
            }
			var amountTotal = 0;
			function getTotalAmount(){
				amountTotal = 0;
				$('#viewmainBodyFee tr').each(function(){
                	var amount = $(this).find('option:selected').data("amount");
                	amount = amount.replace(',', '');
                	var quantity = $(this).find('.quantityText').val();
           
                	if(amount != '' )	
	                	amountTotal = parseFloat(amountTotal) + (parseFloat(amount) * parseFloat(quantity)) ;
				})
				
        		$.ajax({
					type:'POST',
					data:{Amount: amountTotal},
					url: "http://"+window.location.hostname+":"+window.location.port+"/SIS/" +'MoneyConvertion',
					success: function(result){
//						alert(result)
	                	$('#totalAmount').html(result)

                         
					},
                    error: function (response) {
                        swal("Error encountered while accessing the data", "Please try again", "error");
                    }
				});
				
				
			}

            var oTable = $('#editable-sample').dataTable({
                "aLengthMenu": [
                    [5, 15, 20, -1],
                    [5, 15, 20, "All"] // change per page values here
                ],
                // set the initial value
                "iDisplayLength": 5,
                "sDom": "<'row'<'col-lg-6'l><'col-lg-6'f>r>t<'row'<'col-lg-6'i><'col-lg-6'p>>",
                "sPaginationType": "bootstrap",
                "oLanguage": {
                    "sLengthMenu": "_MENU_ records per page",
                    "oPaginate": {
                        "sPrevious": "Prev",
                        "sNext": "Next"
                    }
                }
            });

            jQuery('#editable-sample_wrapper .dataTables_filter input').addClass("form-control medium"); // modify table search input
            jQuery('#editable-sample_wrapper .dataTables_length select').addClass("form-control xsmall"); // modify table per page dropdown

            var nEditing = null;

            $('#editable-sample_new').click(function (e) {

            });

            $('#addBtn').click(function(e){
            	e.preventDefault();
            	 course = $('#courseDrp').val();
				 semTxt = $('#SemesterDrp').val();
				 yearlvl = $('#yearlvlDrp').val();
				 curyear = $('#curyearDrp').val();
				 maxcred = $('#maxcredTxt').val();
				 
				 var numyearlvl = '';
				 if(yearlvl == 'First Year')
					 numyearlvl = '1'
				 else if(yearlvl == 'Second Year')
					 numyearlvl = '2'
				 else if(yearlvl == 'Third Year')
					 numyearlvl = '3'
				 else if(yearlvl == 'Fourth Year')
					 numyearlvl = '4'
				 else if(yearlvl == 'Fifth Year')
					 numyearlvl = '5'
				 codeTxt = course + '-' + numyearlvl +'-'+semTxt
				

				 swal({
                    title: "Are you sure?",
                    text: "The record will be save and will be use for further transaction",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: '#228B22',
                    confirmButtonText: 'Yes!',
                    cancelButtonText: "No!",
                    closeOnConfirm: false,
                    closeOnCancel: false
                },
                function (isConfirm) {
                    if (isConfirm) {
                		$.ajax({
        					type:'POST',
        					data:{codeTxt: codeTxt, yearlvl:yearlvl,course:course,type:"Insert",latcode:latcode,semTxt:semTxt,curyear:curyear,maxcred:maxcred},
        					url:'Controller/Registrar/Curriculum/CurriculumController',
        					success: function(result){
//        						$('#codeTxt').val('') ;
//        						 $('#descTxt').val('');
	                             $("#addcloseBtn").click();
	                             $('#mainBody tr .SubjectDrp').each(function(index,val){
	                        		$.ajax({
	                					type:'POST',
	                					data:{codeTxt: $(this).val(),type:"Insert",latcode:latcode},
	                					url:'Controller/Registrar/Curriculum/CurriculumItemController',
	                					async: true,
	                					success: function(result2){

	                					},
	                                    error: function (response) {
	                                        swal("Error encountered while adding data", "Please try again", "error");
	                                        
	                                    }
	                				});
	             					
	                             });

         						swal("Record Added!", "The data is successfully added!", "success");
// 	                             var aiNew = oTable.fnAddData([codeTxt, descTxt, "<center> <a class='btn btn-info view' href='javascript:;'><i class='fa fa-eye'></i></a>  <a class='btn btn-success edit' data-toggle='modal' href='#SubjectEdit' ><i class='fa fa-edit'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a></center>", '']);
  	                             var aiNew = oTable.fnAddData([codeTxt, descTxt, "<center> <a class='btn btn-success edit' data-toggle='modal' href='#SubjectEdit' ><i class='fa fa-edit'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a></center>", '']);
  	                             var nRow = oTable.fnGetNodes(aiNew[0]);
  	                             document.getElementById("form-data").reset();

	                             
        					},
                            error: function (response) {
                                swal("Error encountered while adding data", "Please try again", "error");
                                $("#editable-sample_new").click();
                            }
        				});

                    } else {

                        swal("Cancelled", "The transaction is cancelled", "error");
                        $("#editable-sample_new").click();
                    }

                });
								
			});
            $('#updateBtn').click(function(e){
            	e.preventDefault();
            	codeTxt = $('#curriculumCode').html();
            	unitTxt = $('#unitsTxt').val();				 
            	descTxt = $('#descUpdateTxt').val();
            	semTxt = $('#updSemesterDrp').val();
            	maxcred = $('#updmaxcredTxt').val();
				
                swal({
                    title: "Are you sure?",
                    text: "The record will be save and will be use for further transaction",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: '#228B22',
                    confirmButtonText: 'Yes!',
                    cancelButtonText: "No!",
                    closeOnConfirm: false,
                    closeOnCancel: false
                },
                function (isConfirm) {
                    if (isConfirm) {
                		$.ajax({
        					type:'POST',
        					data:{codeTxt: codeTxt, descTxt: descTxt,type:"Update",latcode:latcode,semTxt:semTxt,maxcred:maxcred},
        					url:'Controller/Registrar/Curriculum/CurriculumController',
        					success: function(result){
        						 
	                             $('#itemsTblEdit tr .SubjectDrp').each(function(index,val){
		                        		$.ajax({
		                					type:'POST',
		                					data:{codeTxt: $(this).find('option:selected').attr("value"),type:"Update",latcode:latcode},
		                					url:'Controller/Registrar/Curriculum/CurriculumItemController',
		                					async: true,
		                					success: function(result2){

		                					},
		                                    error: function (response) {
		                                        swal("Error encountered while adding data", "Please try again", "error");
		                                        
		                                    }
		                				});
		             					
		                             });

        						 
        						 
        						 
                                 swal({
                                     title: "Record Updated!"
                                     , text: "The data is successfully Added!"
                                     , type: "success"
                                     , confirmButtonColor: '#88A755'
                                     , confirmButtonText: 'Okay'
                                     , closeOnConfirm: false
                                 }, function (isConfirm) {
                                     if (isConfirm) {
                                         window.location.reload();
                                     }
                                 });
	                             
        					},
                            error: function (response) {
                                swal("Error encountered while adding data", "Please try again", "error");
                            }
        				});

                    } else {

                        swal("Cancelled", "The transaction is cancelled", "error");
                    }

                });
								
			});
            
            $('#editable-sample').on('click',' a.view', function (e) {
                e.preventDefault();

                var getval = $(this).closest('tr').children('td:first').text();;
                var nRow = $(this).parents('tr')[0];


                swal({

                        title: "Are you sure?",
                        text: "The record will be save and will be use for further transaction",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: '#228B22',
                        confirmButtonText: 'Yes!',
                        cancelButtonText: "No!",
                        closeOnConfirm: false,
                        closeOnCancel: false
                    },
                    function (isConfirm) {
                        if (isConfirm) {
                            $.ajax({
                                type: 'post',
                                url: 'Controller/Registrar/Curriculum/SubjectController',
                                data: {
                                	codeTxt: codeTxt, descTxt: descTxt,type:"Delete",latcode:getval
                                },
                                success: function (response) {
                                    swal({

                                            title: "Record Deleted!",
                                            text: "The data is successfully deleted!",
                                            type: "success",
                                            confirmButtonColor: '#86CCEB',
                                            confirmButtonText: 'Okay',
                                            closeOnConfirm: false
                                        },
                                        function (isConfirm) {
                                            if (isConfirm) {
                                                window.location.reload();

                                            } else
                                                swal("Cancelled", "The transaction is cancelled", "error");

                                        });
                                },
                                error: function (response) {
                                    swal("Error encountered while adding data", "Please try again", "error");
                                }

                            });

                        } else
                            swal("Cancelled", "The transaction is cancelled", "error");

                    });

            });
            
            
            $('#editable-sample').on('click',' a.delete', function (e) {
                e.preventDefault();

                var getval = $(this).closest('tr').children('td:first').text();
                var nRow = $(this).parents('tr')[0];


                swal({

                        title: "Are you sure?",
                        text: "The record will be save and will be use for further transaction",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: '#228B22',
                        confirmButtonText: 'Yes!',
                        cancelButtonText: "No!",
                        closeOnConfirm: false,
                        closeOnCancel: false
                    },
                    function (isConfirm) {
                        if (isConfirm) {
                            $.ajax({
                                type: 'post',
                                url: 'Controller/Registrar/Curriculum/SubjectController',
                                data: {
                                	codeTxt: codeTxt, descTxt: descTxt,type:"Delete",latcode:getval
                                },
                                success: function (response) {
                                    swal({

                                            title: "Record Deleted!",
                                            text: "The data is successfully deleted!",
                                            type: "success",
                                            confirmButtonColor: '#86CCEB',
                                            confirmButtonText: 'Okay',
                                            closeOnConfirm: false
                                        },
                                        function (isConfirm) {
                                            if (isConfirm) {
                                                window.location.reload();

                                            } else
                                                swal("Cancelled", "The transaction is cancelled", "error");

                                        });
                                },
                                error: function (response) {
                                    swal("Error encountered while adding data", "Please try again", "error");
                                }

                            });

                        } else
                            swal("Cancelled", "The transaction is cancelled", "error");

                    });

            });

            $('#editable-sample ').on('click','a.retrieve', function (e) {
                e.preventDefault();

                var getval = $(this).closest('tr').children('td:first').text();
                var nRow = $(this).parents('tr')[0];


                swal({

                        title: "Are you sure?",
                        text: "The record will be save and will be use for further transaction",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: '#228B22',
                        confirmButtonText: 'Yes!',
                        cancelButtonText: "No!",
                        closeOnConfirm: false,
                        closeOnCancel: false
                    },
                    function (isConfirm) {
                        if (isConfirm) {
                        	$.ajax({
                                type: 'post',
                                url: 'Controller/Registrar/Curriculum/SubjectController',
                                data: {
                                	codeTxt: codeTxt, descTxt: descTxt,type:"Retrieve",latcode:getval
                                },
                                success: function (response) {
                                    swal({

                                            title: "Record Retrieved!",
                                            text: "The data is successfully retrieved!",
                                            type: "success",
                                            confirmButtonColor: '#86CCEB',
                                            confirmButtonText: 'Okay',
                                            closeOnConfirm: false
                                        },
                                        function (isConfirm) {
                                            if (isConfirm) {
                                                window.location.reload();

                                            } else
                                                swal("Cancelled", "The transaction is cancelled", "error");

                                        });
                                },
                                error: function (response) {
                                    swal("Error encountered while adding data", "Please try again", "error");
                                }

                            });

                        } else
                            swal("Cancelled", "The transaction is cancelled", "error");

                    });

            });


            $('#editable-sample').on('click','a.cancel', function (e) {
                e.preventDefault();
                if ($(this).attr("data-mode") == "new") {
                    var nRow = $(this).parents('tr')[0];
                    oTable.fnDeleteRow(nRow);
                } else {
                    restoreRow(oTable, nEditing);
                    nEditing = null;
                }
            });

            function openDataUriWindow(url) {
			    var html = '<html>' +
			        '<style>html, body { padding: 0; margin: 0; } iframe { width: 100%; height: 100%; border: 0;}  </style>' +
			        '<body>' +
			        '<iframe src="' + url + '"></iframe>' +
			        '</body></html>';
			    a = window.open();
			    a.document.write(html);
			}
			
            
            $('#btnPrintCurriculum').on('click', function () {
            	var items = [];
               	var course = $('#updcourseDrp option:selected').val();
               	var semester = $('#updSemesterDrp option:selected').text();
               	var yearLvl = $('#updyearlvlDrp option:selected').val();
               	var maxCred = $('#updmaxcredTxt option:selected').val();
              	var tableBody = ""
              		
                $('#viewmainBody tr').each(function(index, el) {
                	if($(this).closest('tr').find('.SubjectDrp option:selected').val()!= undefined){
                		let subj = $(this).closest('tr').find('.SubjectDrp option:selected').val()
                		let credunit = $(this).closest('tr').find('.unitText').text()
                		let labunit = $(this).closest('tr').find('.labUnitText').text()
                		let lecunit = $(this).closest('tr').find('.lecUnitText').text()
                		let tuitionHrs = $(this).closest('tr').find('.tuitionHrsText').text()
                		let lecHrs = $(this).closest('tr').find('.lecHrsText').text()
                		let labHrs = $(this).closest('tr').find('.labHrsText').text()
                		let prereq = $(this).closest('tr').find('.prereq').text()
                		
                		tableBody += "<tr><td>"+subj+"</td><td>"+prereq+"</td><td>"+credunit+"</td><td>"+labunit+"</td><td>"+labunit+"</td><td>"+lecunit+"</td><td>"+tuitionHrs+"</td><td>"+lecHrs+"</td><td>"+labHrs+"</td></tr>"
                		
                	}
                    	
                })
                
                
                var pdf = new jsPDF('l', 'pt', 'letter');
                var breaker = '_____________________________________________________________________________________________'

                pdf.setFontType("normal");
				pdf.setFontSize(14.5);
				pdf.text(15,15,breaker)

				pdf.setFontType("bold");
				pdf.setFontSize(13);
				pdf.text(15,40,"Quezon City Polytechnic University")

				pdf.setFontType("italic");
				pdf.setFontSize(7);
				var addre = pdf.splitTextToSize("QCPU Technical & Vocational Building, 673 Quirino Hway, Novaliches, Quezon City, 1116 Metro Manila", 230);
				pdf.text(15,55,addre)
				
				pdf.setFontType("normal");
				pdf.setFontSize(14.5);
				pdf.text(15,70,breaker)
				
				pdf.setFontType("italic");
				pdf.setFontSize(14);
				pdf.text(320,110,course + ' - ' + semester + ' - ' + yearLvl )
				
				
				
				specialElementHandlers = {
					'#bypassme': function(element, renderer){
						return true
					}
				}
				
				tableBody = "<thead><th>Code</th><th>Prerequisite</th><th>Credited Units</th><th>Laboratory Units</th><th>Lecture Units</th><th>Tuition Hours</th><th>Laboratory Hours</th><th>Laboratory Hours</th></thead><tbody>"+tableBody+"</tbody>"
				$('#myHiddenTable').html(tableBody)
				var res = pdf.autoTableHtmlToJson(document.getElementById("myHiddenTable"),true);
			    pdf.autoTable(res.columns, res.data, {
			      startY: 170
			    });

			   	
				
                
                
                var myImage = new Image();
				myImage.src = "http://"+window.location.hostname+":"+window.location.port+"/SIS/Assets/images/PUPLogo.png";
				myImage.onload = function(){
					pdf.addImage(myImage , 'png', 700, 20, 50, 50);
					 var uri = pdf.output('dataurlstring');
			  	   	 openDataUriWindow(uri);
			  	};
				
            })
            
            


            $('#editable-sample').on('click','a.edit', function (e) {
                e.preventDefault();
                
                var getcode = $(this).closest('tr').children('td:first').text();
                latcode = getcode;
                var nRow = $(this).parents('tr')[0];
                
        		$('#codeUpdateTxt').val(getcode)
        		$('#curriculumCode').html(getcode)
        		
        		$("#updSemesterDrp").select2("val", $(this).data('semester'));
        		$("#updcourseDrp").select2("val", $(this).data('course'));
        		$("#updyearDrp").select2("val", $(this).data('yearlevel'));
        		$("#updmaxcredTxt").val($(this).data('maxcred'));
        		console.log($(this).data('maxcred'))
        		
        		
        		
        		$('#viewmainBody').html('')
        		$.ajax({
					type:'POST',
					data:{latcode:latcode},
					url:'Controller/Registrar/Curriculum/CurriculumViewItemController',
					success: function(result){
						var item = $.parseJSON(result);
						var i = 0;
						var code = [];
						var units = [];
                    	$('#viewmainBody').html('')
                    	$.each(item, function (key, val) {
                    		$.each(val.group, function (key2, val2) {
                    			i++;
                            });
                    		if(i != 0){
                    			code.push(val.code)
                    			
                    			
                    			
                    		}else{
                    			$('.addItemEdit').click();
                    			$('#viewmainBody').find('tr:last .SubjectDrp').select2("val", val.code).trigger("change")
                    			
                    			
                    		}
                    		i = 0;
                        	
                        	
                        });
                    	$.each(code,function (key,val){
                    		$('.addGroupItemEdit').click();
                    		$('#viewmainBody').find('tr:last .SubjectDrp').select2("val", val).trigger("change")
                    		
                    		
                    	})
                    	
                    	/*
                    	[
                    		{	"unit":"3",
                    			"code":"ACC 1000","desc":"Accounting 1",
                    			"group":{"unit":"2","code":"123123123123","desc":""}
                    		}
                    		
                    	]
                    	[
                    		{"unit":"3","code":"ACC 1000","desc":"Accounting 1","group":{"unit":"2","code":"123123123123","desc":""}},
                    		{"unit":"3","code":"ENG 1000","desc":"English 1","group":{}},
                    		{"unit":"3","code":"FIL 1000","desc":"Filipino 1","group":{}},
                    		{"unit":"3","code":"MATH 1000","desc":"Mathematics 1","group":{}}
                    		]
                    		*/                    	
                    	
                    	
                    	
                    	
                    	
                    	
//                    	
//                        $.each(item, function (key, val) {
//                        	i++;
//                        	
//                        });
//                    	if(i != 0){
//                    		 $.each(item, function (key, val) {
//                    			 $('#viewmainBody').append($('#updateduplicate').html())
//
//                             	code.push(val.code);
//                             	units.push(val.unit); 
//                             	
//                             });
//                         	i=0;
//                            $('#itemsTblEdit tr .SubjectDrp').each(function(index,val){
//                            	
//                            	$(this).find("option[value='"+code[i]+"']").attr('selected', 'selected');
//
//                            	i++;
//                             });
//                            i = 0;
//                            $('#viewmainBody tr').each(function(index,val){
//                            	
//                             	$(this).find(".unitText").html(units[i]);
//
//                            	i++;
//                             });
//                    		
//                    	}
//                    	else{
//                    		 $('#viewmainBody').html($('#duplicate').html())
//                    	}

                         
					},
                    error: function (response) {
                        swal("Error encountered while adding data"+response, "Please try again", "error");
                    }
				});
        		
            });
            
			$('#editable-sample').on('click','a.fee',function(r){
				var curcode = $(this).closest('tr').children('td:first').text();	
				$('#feeCode').html(curcode)
				
				$.ajax({
					type:'POST',
					data:{curcode:curcode},
					url:'Controller/Registrar/Curriculum/CurriculumFeeItemViewController',
					success: function(result){
						var item = $.parseJSON(result);
						var i = 0;
						var code = [];
						var description = [];
						var amount = [];
						var quan = [];
                    	$('#viewmainBodyFee').html('')

                        $.each(item, function (key, val) {
                        	$('#viewmainBodyFee').append($('#feeduplicate').html())

                        	code.push(val.code);
                        	description.push(val.desc); 
                        	amount.push(val.amount); 
                        	quan.push(val.quantity); 
                        	
                        	i++;
                        	
                        });
                        if(i != 0){
                        	i=0;
                            $('#viewmainBodyFee tr .FeeDrp').each(function(index,val){
                            	
                            	$(this).find("option[value='"+code[i]+"']").attr('selected', 'selected');

                            	i++;
                             });
                            i = 0;
                            $('#viewmainBodyFee tr').each(function(index,val){
                            	
                             	$(this).find(".descriptionText").html(description[i]);
                             	$(this).find(".amountText").html(amount[i]+ ' Php');
                             	$(this).find(".quantityText").val(quan[i]);
                             	
                            	i++;
                             });
                            getTotalAmount()
                        	
                        }
                        else{
                   		 $('#viewmainBodyFee').html($('#feeduplicate').html())
                        }
                        

					},
                    error: function (response) {
                        swal("Error encountered while adding data"+response, "Please try again", "error");
                    }
				});
				
			});

			
            
			$('#FeesaveBtn').on('click', function(){
                swal({

                    title: "Are you sure?",
                    text: "The record will be save and will be use for further transaction",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: '#DD6B55',
                    confirmButtonText: 'Yes, do it!',
                    cancelButtonText: "No!",
                    closeOnConfirm: false,
                    closeOnCancel: false
                },
                function (isConfirm) {
                    if (isConfirm) {
                    	var FeeCode = $('#feeCode').html()
        				$.ajax({
        					type:'POST',
        					data:{curcode:FeeCode},
        					url:'Controller/Registrar/Curriculum/CurriculumFeeUpdateController',
        					success: function(result){
        						
        					},
                            error: function (response) {
                                swal("Error encountered while adding data"+response, "Please try again", "error");
                            }
        				});
        				
                        $('#viewmainBodyFee tr ').each(function(index,val){
                        	var FeeCode = $(this).find('.FeeDrp option:selected').attr("value");
                        	var CurCode = $('#feeCode').html();
                        	var Quantity = $(this).find('.quantityText').val();

                    		$.ajax({
            					type:'POST',
            					data:{CurCode:CurCode,FeeCode:FeeCode,Quantity:Quantity,type:'Insert'},
            					url:'Controller/Registrar/Curriculum/CurriculumFeeController',
            					success: function(result){
                                     
            					},
                                error: function (response) {
                                    swal("Error encountered while adding data"+response, "Please try again", "error");
                                }
            				});
         					
                         });
                        
        				swal("Record Updated!", "The data is successfully updated!", "success");


                    } else
                        swal("Cancelled", "The transaction is cancelled", "error");

                });
				
			});
        }

    };

}();
