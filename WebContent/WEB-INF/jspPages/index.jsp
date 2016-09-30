<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.0-beta.2/angular-sanitize.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Angular</title>
</head>
<body>
   <div ng-app="myApp" ng-controller="mytrl">
        <input type="text" ng-model="name" placeholder="Enter Something">
        <input id="mydata"  type="text" value ={{name}}>
        <h1 ng-bind-html="mtext"></h1>
   </div>
      <script>
      		var app = angular.module("myApp",['ngSanitize']);
      		app.controller("mytrl",function($scope){
      			$scope.mtext="hai";
      			
      		});
      	
      		
      		$('#mydata').change(function(){
      			console.log("1");
      		});
      		      		
      </script>
   
</body>
</html>