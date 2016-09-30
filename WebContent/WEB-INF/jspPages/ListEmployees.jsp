<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
      <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List Employees</title>
</head>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>     
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.21/jquery-ui.min.js"></script>
<script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>

<body>

<center> 
<div id ="listt">
<select name = "empId" id="empI" onchange="vald(this)">
<option>Select Employee</option>
<option value="0">All</option>
<c:forEach items="${drop}" var="temp">
<option value="${temp.empId}">${temp.empName}</option>
</c:forEach>
</select><br> 
 <br>
 <a href="http://localhost:8080/EmployeeTest/">Home Page</a>
 <br>
<form method="get" id ="formId">
 <div >
		<c:if test="${!empty empdetail}">
			<table align ="center"  id="empTableId">
				<tr>
					<td>Employee Id</td>
					<td>Employee Name</td>
					<td>Gender</td>
					<td>Date Of Birth</td>
					<td>Marital Status</td>
					<td>Designation</td>
					<td>Employee Address</td>		
					<td>Update</td>
					<td>Delete</td>		
				</tr>			 			   
				<c:forEach items="${empdetail}" var="temp">
				<tr class ="tableData">
				<td>${temp.empId}</td>
				<td>${temp.empName}</td>
				<td>${temp.gender}</td>
				<td>${temp.dateOfBirth}</td>
				<td>${temp.maritalStatus}</td>
				<td>${temp.designation}</td>
				<%-- <td><a href="http://localhost:8080/EmployeeDetails/address/${temp.empId}">GetAddress</a></td>
				<td><button id="get${temp.empId}" value='${temp.empId}' onclick="getAddress(this)">GetAddress</button></td> --%>
			    <td><button id="emp${temp.empId}" value='${temp.empId}'  onclick="valUpdate(this)">Change</button></td>
				<td><a href="http://localhost:8080/EmployeeTest/delete/${temp.empId}">Delete</a></td>
				</tr>			
				</c:forEach>				
			</table>
		</c:if>	
</div> 
</form>
</div>

<!-- Update Portion -->
	

<form name ="details" id="register" method="post" action="update" onsubmit="return validate();" >
	<h2>Update Employee Data</h2>
	<div id ="UpdateArea">
   <table align="center">
		     <tr>
		    <td><input type="hidden" name="empId" id="empId" /></td>
		    </tr>
			<tr>
				<td>Employee Name</td>
				<td><input type ="text" name="empName" id ="empName"  /></td>
			</tr>
			<tr>
				<td>Gender</td>
				<td><select name = "gender" id="gender">				
						<option value="male">Male</option>
						<option value="female">Female</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>Date Of Birth</td>
				<td><input type="text" name="dateOfBirth" id="datePick" /></td>
			</tr>
			<tr>
				<td>Marital Status</td>
				<td><select name="maritalStatus" id = "maritalStatus">
				<option value="single">Single</option>
				<option value="married">Married</option>				
				</select></td>
			</tr>
			<tr>
				<td>Designation</td>
				<td><select name="designation" id ="designation">
				<option value="fresher">Fresher</option>
				<option value="senior">Senior</option>
				</select></td> 
			</tr>			
			</table>
	</div>
	<input type="button" value="Add Address" onclick="addAddress()">
	<input type="submit" value="Update"><br>
</form>
</center>

 <select id ='stateTag' >
 <c:forEach items = '${stateBe}' var="temp1">			   
	<option value='${temp1.stateId}'>${temp1.state}</option>
</c:forEach>
 </select>


<script type="text/javascript">

   $('#register').hide();   
   $('#stateTag').hide();
   
   var arrAddId ="";
   var idList;
  // console.log(state.length);
 
 /*  $(document).ready(function (){
	  $("select[name='district']").rules("add", {required:true, messages: {required:"Disrict required.."}});
	  $("select[name='city']").rules("add", {required:true, messages: {required:"City required.."}});
	  $('#register').validate();
  });
    */
function addAddress()
    {
    	id=idList+1;
    	var addressBlock ='<div class = "addressBlock">'+
		'<div id="addrBlock'+idList+'">'+
		'<a>Address Block'+id+' </a>'+
		'<table>'+
		' <tr>'+
	   	 '<td><input type="hidden" name="addId" id="addId'+idList+'" /></td>'+
	    '</tr>'+
	    '<tr>'+
		'<td>State</td>'+
		'<td><select name="state" id="state'+idList+'"  onchange="valstate('+idList+')">'+	
		'	</select></td>'+
		'</tr>'+
		'<tr>'+
		'	<td>District</td>'+
			'<td><select name="district" id="district'+idList+'" onchange="valdis('+idList+')">'+									
		'	</select></td>'+
		'</tr>'+
		'<tr>'+
		'<td>City</td>'+
		'<td><select name="city" id="city'+idList+'">'+
		'</select>'+'<input type="button" value ="Remove" onclick="Remove('+idList+')"/>'+
		'</td>'+			
		'</tr></table>'+	
		'</div>'+
		'</div>' ;
		
		$('#UpdateArea').append(addressBlock);			

		var $options = $("#stateTag > option").clone();			
		$('#state'+idList).append($options);
    	
		idList++;
    }
    
    
    
function validate(){
	  var state= document.getElementsByName("state");
	  var district = document.getElementsByName("district");
	  var city = document.getElementsByName("city");
	  var bool = true;
	  var data="";
	  console.log("state "+state.length+"city "+city.length+"district "+district.length);
	  for(var i=0; i<state.length;i++){
		  var id=i+1;
		  
		  if(district[i].value=='')
			 	 {bool= false; data+="Select Address Block"+id+" District\n";}
		  if(city[i].value=='')
				      {bool= false; data+="Select Address Block"+id+" City\n";}
			// event.stopPropagation();		  
	  }	 
	      if(bool==false)
	    	  alert(data);
	  
	      if(bool==true)
	      {
	    	  if(arrAddId!="" && arrAddId!=null){
	    	  arrAddId = arrAddId.slice(0,-1);
	    	  console.log(arrAddId);
	    	  
	    	  $.ajax({
	  			type:"GET",
	  			url:"${pageContext.request.contextPath}/removeAddr",
	  			data:{addId:arrAddId},
	  			contentType:"application/json; charset=utf-8",		
	  			success:function(message){
	  				console.log(message);
	  			},
	  			error: function(jqXHR, textStatus, errorThrown){
	  				alert("jqXHR : "+JSON.stringify(jqXHR)+"\n Text Status "+JSON.stringify(textStatus)+"\n  errorThrown "+JSON.stringify(errorThrown));
	  			}
	  		
	  		});	
	    	}
	    	  
	      }      
	      
	      
	  return bool;
  } 
  

 function vald(r){	 
	 $('#addTableId').remove();
	 $('#empTableId').show();
	 $('#register').hide();
	var id = r.value;
	if(id==0)
	{
		$.ajax({
			type:"GET",
			url:"${pageContext.request.contextPath}/search1",
			data:{},
			contentType:"application/json;charset=utf-8",
			success:function(data){
				alert(JSON.stringify(data));
				$('.tableData').remove();
				for(var i=0;i<data.length;i++){
					var app = '<tr class="tableData">'+
					'<td>'+data[i].empId+'</td>'+
					'<td>'+data[i].empName+'</td>'+
					'<td>'+data[i].gender+'</td>'+
					'<td>'+data[i].dateOfBirth+'</td>'+
					'<td>'+data[i].maritalStatus+'</td>'+
					'<td>'+data[i].designation+'</td>'+
				    '<td><button id="emp'+data[0].empId+'" value='+data[i].empId+' onclick="valUpdate(this)">Change</button></td>'+
					'<td><a href="http://localhost:8080/EmployeeTest/delete/'+data[i].empId+'">Delete</a></td>'+
					'</tr>';
					$('#empTableId').append(app);	
				}
		},
		error:function (jqXHR, textStatus, errorThrown){
			alert("jqXHR : "+JSON.stringify(jqXHR)+"\n Text Status "+JSON.stringify(textStatus)+"\n  errorThrown "+JSON.stringify(errorThrown));
		}
				
	 });
	}	
	else{
	$.ajax({
		type:"GET",
		url:"${pageContext.request.contextPath}/search",
		data:{empId:id},
		contentType:"application/json;charset=utf-8",
		success:function(data){
			alert(JSON.stringify(data));
			$('.tableData').remove();
				var app = '<tr class="tableData">'+
				'<td>'+data.empId+'</td>'+
				'<td>'+data.empName+'</td>'+
				'<td>'+data.gender+'</td>'+
				'<td>'+data.dateOfBirth+'</td>'+
				'<td>'+data.maritalStatus+'</td>'+
				'<td>'+data.designation+'</td>'+
			    '<td><button id="emp'+data.empId+'" value='+data.empId+' onclick="valUpdate(this)">Change</button></td>'+
				'<td><a href="http://localhost:8080/EmployeeTest/delete/'+data.empId+'">Delete</a></td>'+
				'</tr>';
				$('#empTableId').append(app);	
				
				var addrDetail = data.address;
				if(addrDetail!=null){
					
					var appendd='<div>'+
					   '<table align="center" id="addTableId">'+
					   '<tr>'+
					   	 ' <td>Address Id</td>'+
					   	  '<td>Employee Id</td>'+
					   	  '<td>City</td>'+
					   	  '<td>District</td>'+
					   	  '<td>State</td>'+
					   '</tr>'+		
				    '</table>'+
				    '</div>';
				   $('#formId').append(appendd);
				   
				   for(var i=0;i<addrDetail.length;i++){
							var app = '<tr class="tableData">'+
							'<td>'+addrDetail[i].addId+'</td>'+
							'<td>'+addrDetail[i].empId+'</td>'+
						 	'<td>'+addrDetail[i].city.city+'</td>'+
							'<td>'+addrDetail[i].district.district+'</td>'+ 
							'<td>'+addrDetail[i].state.state+'</td>'+
							'</tr>';
							$('#addTableId').append(app);				
							
					};		
				};			
			
		},
		error:function (jqXHR, textStatus, errorThrown){
			alert("jqXHR : "+JSON.stringify(jqXHR)+"\n Text Status "+JSON.stringify(textStatus)+"\n  errorThrown "+JSON.stringify(errorThrown));
		}
	});};	
	  
  }; 
  
  function getAddress(r)
  {
	  var id = r.value;
	  event.preventDefault();
	  $.ajax({
			type:"GET",
			url:"${pageContext.request.contextPath}/address",
			data:{empId:id},
			contentType:"application/json; charset=utf-8",		
			success:function(addrDetail){
                appendAddr(addrDetail);
			},
			error: function(jqXHR, textStatus, errorThrown){
				alert("jqXHR : "+JSON.stringify(jqXHR)+"\n Text Status "+JSON.stringify(textStatus)+"\n  errorThrown "+JSON.stringify(errorThrown));
			}
			
		});	
	  
	   function appendAddr(addrDetail){
		   $('#empTableId').hide();
		   
		   var appendd='<div>'+
			   '<table align="center" id="addTableId">'+
			   '<tr>'+
			   	 ' <td>Address Id</td>'+
			   	  '<td>Employee Id</td>'+
			   	  '<td>City</td>'+
			   	  '<td>District</td>'+
			   	  '<td>State</td>'+
			   '</tr>'+		
		    '</table>'+
		    '</div>';
		   $('#formId').append(appendd);
		   
		   for(var i=0;i<addrDetail.length;i++){
					var app = '<tr class="tableData">'+
					'<td>'+addrDetail[i].addId+'</td>'+
					'<td>'+addrDetail[i].empId+'</td>'+
				/* 	'<td>'+addrDetail[i].city.city+'</td>'+
					'<td>'+addrDetail[i].district.district+'</td>'+ */
					'<td>'+addrDetail[i].stateBag[0].state+'</td>'+
					'</tr>';
					$('#addTableId').append(app);				
					
				}		   
		   }	  
  }
  
  
  
  
  function valUpdate(r)
    {
	    var id = r.value;
	 event.preventDefault();
		$.ajax({
			type:"GET",
			url:"${pageContext.request.contextPath}/updatt",
			data:{empId:id},
			contentType:"application/json; charset=utf-8",		
			success:function(detail){
				 appendDiv(detail);
				 check(detail);
			},
			error: function(jqXHR, textStatus, errorThrown){
				alert("jqXHR : "+JSON.stringify(jqXHR)+"\n Text Status "+JSON.stringify(textStatus)+"\n  errorThrown "+JSON.stringify(errorThrown));
			}
			
		});	

	function appendDiv(detail)
	{	
		    $('#empTableId').show();
			$('.addressBlock').remove();
			idList=detail.address.length;
			
		for(var i=0;i<idList;i++)		
		{		var id=i+1;
			//console.log();
			 var addressBlock ='<div class = "addressBlock">'+
			'<div id="addrBlock'+i+'">'+
			'<a>Address Block'+id+' </a>'+
			'<table>'+
			' <tr>'+
		   	 '<td><input type="hidden" name="addId" id="addId'+i+'" /></td>'+
		    '</tr>'+
		    '<tr>'+
			'<td>State</td>'+
			'<td><select name="state" id="state'+i+'"  onchange="valstate('+i+')">'+	
			'	</select></td>'+
			'</tr>'+
			'<tr>'+
			'	<td>District</td>'+
				'<td><select name="district" id="district'+i+'" onchange="valdis('+i+')">'+									
			'	</select></td>'+
			'</tr>'+
			'<tr>'+
			'<td>City</td>'+
			'<td><select name="city" id="city'+i+'">'+
			'</select>'+'<input type="button" value ="Remove" onclick="Remove('+i+')"/>'+
			'</td>'+			
			'</tr></table>'+	
			'</div>'+
			'</div>' ;
			
			$('#UpdateArea').append(addressBlock);			
	
			var $options = $("#stateTag > option").clone();			
			$('#state'+i).append($options);
			 var addr =detail.address[i];
		    $('#addId'+i).val(addr.addId);
		    $('#state'+i+' > option').filter(function() { return $(this).val() ==addr.stateId ; }).prop('selected', true);			
		    $('#district'+i).append("<option value=\""+addr.district.districtId + "\">"+addr.district.district+"</option>");
		    $('#city'+i).append("<option value=\""+addr.city.cityId + "\">"+addr.city.city+"</option>");
		 
		}
	}
	
	
	function check(detail){	
		
		 var gender = detail.gender;
		 var maritalStatus = detail.maritalStatus;
		 var designation = detail.designation;
		 $('#gender > option').filter(function() { return $(this).val() == gender; }).prop('selected', true);
		 $('#maritalStatus > option').filter(function() { return $(this).val() == maritalStatus; }).prop('selected', true);
		 $('#designation > option').filter(function() { return $(this).val() == designation; }).prop('selected', true);
		
		 $('#empId').val(detail.empId); 
		 $('#empName').val(detail.empName);
		 $('#datePick').val(detail.dateOfBirth);
		 $('#designation').val(detail.designation);		 

		$('#register').show();
	};
	
};
   
   function Remove(divId){	
	   var addrId = $('#addId'+divId).val();
	   arrAddId+=addrId+",";
	   
	    $('#addrBlock'+divId).remove();	   
	   
   }
   
/* function val(r){
	
	 var id=r.value; 
	 if(id=='')
		 {
			 location.href="http://localhost:8080/EmployeeDetails/employee/";
		 }
	 else	
		 {
			 location.href="http://localhost:8080/EmployeeDetails/search/"+id;	
		 }	    		
	};
	
	 */
	 
	function  valdis(r) {
		 var a = "district"+r;
			 
			 var district =document.getElementById(a).value;	
			 var xhttp = new XMLHttpRequest();
			
			 xhttp.onreadystatechange=function (){
				 if(xhttp.readyState==4 && xhttp.status==200){
					 res =JSON.parse(xhttp.responseText);
					 showCity(res);
				 }
				 else console.log(xhttp.statusText);
			 };	
			 xhttp.open("get","${pageContext.request.contextPath}/district?districtId="+district,true);
			 xhttp.send();
			 
			 
			 /* $.ajax({
				type:"get",
				url:"${pageContext.request.contextPath}/district",
				data:{districtId:district},
				contentType:"application/json; charset=utf-8",
				success:function(res){
					showCity(res);			
				},
				error: function(res){
					alert("error : "+res);
				}
				
			});  */
			
			 function showCity(res){
				 $('#city'+r).empty();
				 $('#city'+r).append("<option value=''>Select city</option>");
				for(var i=0, len=res.length;i<len;++i){
					var city = res[i];
					$('#city'+r).append("<option value=\""+city.cityId + "\">"+city.city+"</option>");
				}};		 
		} 
	
	 function valstate(r){

		 var a = "state"+r;
		 
		 var state=document.getElementById(a).value;	
		 	
		  $.ajax({
			type:"get",
			url:"${pageContext.request.contextPath}/state",
			data:{stateId:state},
			contentType:"application/json; charset=utf-8",
			success:function(res){
				showdistrict(res);
				//alert("success");
			},
			error: function(res){
				alert("error : "+res);
			}
			
		}); 
		
		  function showdistrict(res){
			  
				 $('#district'+r).empty();
		    	 $('#district'+r).append("<option value=''>Select district</option>");
					  for(var i=0, len=res.length; i<len;++i){
						   var District = res[i];
					       $('#district'+r).append("<option value=\""+ District.districtId + "\">"+ District.district+"</option>");				       
				}  };
	}
	
	 $(document).ready(function(){
		 val();	
		 });

 function val(){
		 	
	 $('#register').validate({		 		
		 		rules:{
		 			empName:"required",
		 			dateOfBirth:"required",				
		 		},
		 	    messages:{
		 	    	empName:"Complete First Name",
		 	    	dateOfBirth:"Complete date Of Birth",
		 	    }	  
		 			
		 	}); 
		 };

		 $(function(){
				$("#datePick").datepicker({
					changeMonth:true, ChangeYear:true,yearRange:"1992:2000"					
					        
				});
			});
</script> 

</body>
</html>