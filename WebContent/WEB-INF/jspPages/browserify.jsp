<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <input type="text" name="uname" id="uname"><br>
    <input type="password" name="pass" id="pass"><br>
    <input type="button" value="submit" onclick="check">
</body>
<script></script>
<script src="/WEB-INF/jspPages/bundle.js">

var Mongodb = require('mongodb');
var Promise = require('promise');
var MongoClient = Mongodb.MongoClient;

var url = 'mongodb://localhost:27017/OFC';


function getConnection(){
	return new Promise(function (resolve,reject) {
		MongoClient.connect(url,function(err,connection){
			if(err){ console.log("error connection"+ url); reject(err); }
			else{console.log("success"); resolve(connection);}
		});
	});
}
getConnection();
//console.log()


</script>

</html>