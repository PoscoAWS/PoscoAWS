<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>userInsertEndView.jsp</h1>
	<%
		boolean result = (boolean)request.getAttribute("result");
		out.println(result ? "<h1>ȸ������ ����</h1>" : "<h1>ȸ������ ����</h1>");
	%>
	<a href="index.jsp">ó������</a><br/>
</body>
</html>