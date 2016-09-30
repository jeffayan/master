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
   <div ng-app="">
        <!-- <input type="text" ng-blur="num=num+1" ng-model="name" placeholder="Enter Something" ng-init="num=0" >
        <p ng-change="func()">{{name}}<p>
        <h1 ng-model="mydata"></h1> -->
        
        <input type="checkbox" ng-model="all" >all
        <input type="checkbox" ng-checked="all" >one 
        <input type="checkbox" ng-checked="all" >two
        
        
   </div>
      <script>
      		var app = angular.module("myApp",['ngSanitize']);
      		app.controller("mytrl",function($scope){
      			$scope.func= function(){
      				$scope.mydata=$scope.name	;
      			};
      			
      		});
      	
      		
      		$('input').change(function(){
      			app.controller("mytrl",function($scope){
          			$scope.mtext=$('p[0]').val();
          			
          		});
      		});
      		      		
      </script>
      
      <script>
    angular.module('myApp',[]).controller('myCtrl',['$scope',function($scope){
         $scope.func= function(){
          alert('Copy not allowed');
}
}])
</script>
      
   
</body>
</html>