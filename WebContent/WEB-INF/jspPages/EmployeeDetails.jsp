<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Employee</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
     
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.21/jquery-ui.min.js"></script>
<script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>

<script type="text/javascript">
 function vald(id)
 {
	 var idd = "address"+id;
	 //alert(idd);
	(document.getElementById(idd)).remove();
//	 divv.remove();
	 
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
  
</script>
<script>
function  valdistrict(r) {
 var a = "district"+r;
	 
	 var district =document.getElementById(a).value;	
	 
	$.ajax({
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
		
	});
	
	function showCity(res){
		 $('#city'+r).empty();
		for(var i=0, len=res.length;i<len;++i){
			var city = res[i];
			$('#city'+r).append("<option value=\""+city.cityId + "\">"+city.city+"</option>");
		}};		
} 

</script>

</head>
<body>
<center><h2>Add Employee Data</h2>
<form name ="details" id="register" method="post" action="upload" >
	<div>
		<table align="center">
		   <tr>
				<td>Employee Name</td>
				<td><input type ="text" name="empName" class="required" /></td>
			</tr>
			<tr>
				<td>Gender</td>
				<td><select name = "gender">
						<option value="male">Male</option>
						<option value="female">Female</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>Date Of Birth</td>
				<td><input type="text" name="dateOfBirth" id="datePick" class="required" /></td>
			</tr>
			<tr>
				<td>Marital Status</td>
				<td><select name="maritalStatus">
				<option value="single">Single</option>
				<option value="married">Married</option>
				</select></td>
			</tr>
			<tr>
				<td>Designation</td>
				<td><select name="designation">
				<option value="fresher">Fresher</option>
				<option value="senior">Senior</option>
				</select></td> 
			</tr>
			</table>
		</div>	
		
	<div id=address0>
          <p><a>Address Block 1</a></p>
		<table>		
		      <tr>
				<td>State</td>
				<td><select name="state" id="state0" onchange="valstate('0')">
				<option value ="">Select state</option>
				<c:forEach items = "${stateBe}" var="temp">
					<option value="${temp.stateId}">${temp.state}</option>
				</c:forEach>
				</select></td>
			</tr> 
			<tr>
				<td>District</td>
				<td><select name="district" id="district0" onchange="valdistrict('0')" class="required" ></select></td>
			</tr>
			<tr>
				<td>City</td>
				<td><select name="city" id="city0" class="required"></select></td>
			</tr>
		</table>
	</div>
	
	    <button type="button" id ="btn1" >Add Address</button>
		<input type="submit" value="Upload Data" onclick="val()"><br>
		<a href="http://localhost:8080/EmployeeDetails/">Goto Home</a>
		

</form>
</center>

<script>

$(document).ready(function() {       
    var x = 1;     
    $('#btn'+x).click(function(){ 
            x++;   
          
            $('#address0').append('<div id=address'+x+'><p><a>Address Block'+x+'</a></p> <table><tr><td>State</td><td><select name="state" id="state'+x+'" onchange="valstate('+x+')"><option value ="">Select state</option><c:forEach items = "${stateBe}" var="temp"><option value="${temp.stateId}">${temp.state}</option></c:forEach></select></td></tr><tr><td>District</td><td><select name="district" id="district'+x+'" onchange="valdistrict('+x+')" class="required" ></select></td></tr><tr><td>City</td><td><select name="city" id="city'+x+'" class="required"></select></td></tr></table> <button type="button" id ="btn'+x+'" onclick= vald('+x+') >Remove Address</button> </div>');     
            $('#district'+x+'').rules("add", "required");
            $('#city'+x+'').rules("add", "required");
    });
   
});

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
/* 
  $("district").each(function(){
	$(this).rules('add',{
		required:true,
		messages:{
			required: "Select District"}
	});
});

$("city").each(function(){
	$(this).rules('add',{
		required:true,
		messages:{
			required:"Select City"
		}
	});
}); */ 



</script>
<script type="text/javascript">
$(function(){
	$("#datePick").datepicker({
		changeMonth:true, ChangeYear:true,yearRange:"1992:2000"
	});
});

</script>
</body>

</html>