<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
  <head>
    <title>Simple Map</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    <style>
      html, body {
        height: 50%;
        width : 50%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 100%;
      }
    </style>
  </head>
 
 <%--  --%>
 
  <body>
  
   <a href="<c:url value='$path'/>"></a>
   <%-- <iframe src="${pageContext.request.contextPath}/jspPages/file.html" width="200" height="200"></iframe>
   <iframe src="${pageContext.request.contextPath}/file.html" width="200" height="200"></iframe>
   <iframe src="/jspPages/file.html" width="200" height="200"></iframe>
   <iframe src="/file.html" width="200" height="200"></iframe> --%>
  <%--  <iframe src=" --%>
<%--   <c:import var="testHtml" url="/file.html" />
<c:out value="${testHtml}" escapeXml="false" />
  <%@ include file="${testHtml}" %>
  <h3>test.html</h3>

</div> --%>
  
  <!-- <a id="content"></a>
 
  <script type="text/javascript">
  /* document.getElementById("content").innerHTML='<object type="text/html" data="file.html" ></object>'; */
  $('#content').load("${pageContext.request.contextPath}/file.html");
  
  </script> -->
   
  <%-- <jsp:include page="file.html"/> --%>
    <!-- <div id="map"></div>
    <script>
      var map;	
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 8
        });
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBGEbfQt-zkbHdgh8OjZX2VWYuuza3OrYg&callback=initMap"
    async defer></script> -->
  </body>
</html>