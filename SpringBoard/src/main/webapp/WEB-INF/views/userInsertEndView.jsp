<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>userInsertEndView.jsp</h1>
	<%
		boolean result = (boolean)request.getAttribute("result");
		out.println(result ? "<h1>회원가입 성공</h1>" : "<h1>회원가입 실패</h1>");
	%>
	<a href="index.jsp">처음으로</a><br/>
</body>
</html>