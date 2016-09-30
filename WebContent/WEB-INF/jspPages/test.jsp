<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="testFile" enctype="multipart/form-data" method="post">
<input type="file" name="file"/><br>
<input type="submit" value="Test"/>
</form>
<c:if test="${!empty testFile}">
<pre>${testFile}</pre>
</c:if>
<script type="text/javascript">
/*window.onload = function() {
 var data =<c:out value="${testFile}"/>
if(data!=null){	
//fileDisplayArea.innerHTML = data; 	
    alert (data);
};
};
 */
</script>
  
</body>
</html>