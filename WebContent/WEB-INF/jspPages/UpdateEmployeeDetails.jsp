<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Employee</title>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<!--  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> -->
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
 <!--  <link rel="stylesheet" href="/resources/demos/style.css"> -->
     
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.21/jquery-ui.min.js"></script>
<script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>

<script type="text/javascript">
 $(document).ready(function(){
	 var gender = '${empdetail[0].gender}';
	 var maritalStatus = '${empdetail[0].maritalStatus}';
	 var designation = '${empdetail[0].designation}';
	 $('#gender > option').filter(function() { return $(this).val() == gender; }).prop('selected', true);
	 $('#maritalStatus > option').filter(function() { return $(this).val() == maritalStatus; }).prop('selected', true);
	 $('#designation > option').filter(function() { return $(this).val() == designation; }).prop('selected', true);
}); 
</script>
<script>

function valstate(r){

     var a = "state"+r;
	 
	 var state=document.getElementById(a).value; 
	/*  state = r.value;
	 alert(state); */
	 	
	  $.ajax({
		type:"GET",
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
function  valdis(r) {
	
   var a = "district"+r;
	 
   var district=document.getElementById(a).value; 
	// alert(district);
	 /* distric = r.value; */
    
	$.ajax({
		type:"get",
		url:"${pageContext.request.contextPath}/district",
		data:{districtId:district},
		contentType:"application/json; charset=utf-8",
		success:function(res){
			//alert("success");
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
<center><h2>Update Employee Data</h2>

<form name ="details" id="register" method="post" action="update" >
	<div>
	
		<table align="center">
		     <tr>
		    <td><input type="hidden" name="empId" id="empId" value= '${empdetail[0].empId}' /></td>
		    </tr>
			<tr>
				<td>Employee Name</td>
				<td><input type ="text" name="empName" id ="empName" value= '${empdetail[0].empName}'  /></td>
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
				<td><input type="text" name="dateOfBirth" id="datePick" value='${empdetail[0].dateOfBirth}' /></td>
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
			<div id="addressBlock0">
			<h4>Address Block</h4>
			<c:if test="${!empty empdetail[0].address}">
				<c:forEach items="${empdetail[0].address}" var ="temp"><br>
			<table>
			 <tr>
		    <td><input type="hidden" name="addId" id="addId" value= '${temp.addId}' /></td>
		    </tr>
		     <tr>
				<td>State</td>
				<td><select name="state" id="state${temp.addId}"  onchange="valstate('${temp.addId}')">				
				<option value="${temp.state.stateId}">${temp.state.state}</option>			
				<c:forEach items = "${stateBe}" var="temp1">				   
					<option value="${temp1.stateId}">${temp1.state}</option>
				</c:forEach>				
				</select></td>
			</tr>
			<tr>
				<td>District</td>
				<td><select name="district" id="district${temp.addId}" onchange="valdis('${temp.addId}')">	
				<option value="${temp.district.districtId}">${temp.district.district}</option>									
				</select></td>
			</tr>
			<tr>
			<td>City</td>
			<td><select name="city" id="city${temp.addId}">
			<option value="${temp.city.cityId}">${temp.city.city}</option>
			</select></td>
			
			</tr></table>	
				
				</c:forEach>			
			</c:if>
			
			</div>
        <button type="button" id ="btn1" >Add Address</button>
		<input type="submit" value="Submit"><br>
			
		
</div>
</form>
<a href="http://localhost:8080/EmployeeDetails/">Goto Home</a>
</center>

<script type="text/javascript">
$(function(){
	$("#datePick").datepicker({
		changeMonth:true, ChangeYear:true,yearRange:"1992:2000"
	});
});

</script>
<script>

$(document).ready(function() {       
    var x = 100;    
    $('#btn'+x).click(function(){    
   
            x++;            
            $('#addressBlock0').append('<div id=addressBlock'+x+'><p><a>Address Block'+x+'</a></p> <table><tr><td>State</td><td><select name="state" id="state'+x+'" onchange="valstate('+x+')"><option value ="">Select state</option><c:forEach items = "${stateBe}" var="temp"><option value="${temp.stateId}">${temp.state}</option></c:forEach></select></td></tr><tr><td>District</td><td><select name="district" id="district'+x+'" onchange="valdistrict('+x+')"></select></td></tr><tr><td>City</td><td><select name="city" id="city'+x+'"></select></td></tr></table></div>');     
    });
   
});
</script>
</body>

</html>