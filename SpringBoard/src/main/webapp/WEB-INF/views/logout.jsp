<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>logout.jsp</h1>
	<% session.invalidate(); %>
	<h1>�α׾ƿ�</h1>
	<a href="index.jsp">ó������</a><br/>
</body>
</html>