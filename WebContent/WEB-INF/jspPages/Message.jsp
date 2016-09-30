<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.io.File" %>
<%@page import="java.io.FileInputStream"%>
<%@page import="org.apache.commons.lang.builder.ToStringBuilder" %>
<%@page import ="org.apache.pdfbox.cos.COSDocument" %>
<%@page import ="org.apache.pdfbox.pdfparser.PDFParser" %>
<%@page import ="org.apache.pdfbox.pdmodel.PDDocument" %>
<%@page import ="org.apache.pdfbox.util.PDFTextStripper" %>
<%@page import=" java.io.IOException"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Redirect</title>
</head>
<body>
<body onload="setTimeout(function(){window.location = 'http://localhost:8080/EmployeeTest/';}, 5000)">
<h1>${message}</h1><br>
<a href="http://localhost:8080/EmployeeTest/">Click this link if you are not redirected in 5 Sec</a>
<input type="hidden" name="myObjectId" value="${testFile}" />
<pre>

<%
    String fil="";
    // fil= request.getSession().getAttribute(myObjectId);
	PDFTextStripper pdfStripper = null;
    PDDocument pdDoc = null;
    COSDocument cosDoc = null;
    String parsedText=null;
    File file = new File(fil);
    try {
        PDFParser parser = new PDFParser(new FileInputStream(file));
        parser.parse();
        cosDoc = parser.getDocument();
        pdfStripper = new PDFTextStripper();
        pdDoc = new PDDocument(cosDoc);
       // pdfStripper.setStartPage(1);
       // pdfStripper.setEndPage(5);
        parsedText = pdfStripper.getText(pdDoc);
        out.println(parsedText);
    } catch (IOException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    }
	
	

%>

</pre>

</body>
</body>
</html>