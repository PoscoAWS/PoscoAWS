<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% session.invalidate(); 
	response.sendRedirect("index2.jsp");
	%>
	
	<h1>로그아웃</h1>
	<a href="index2.jsp">처음으로</a><br/>
</body>
</html>