<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		response.sendRedirect("index.jsp");
		String name = (String)request.getAttribute("name");
		String id = (String)request.getAttribute("id");
		if (name != null) {
			session.setAttribute("name", name);
			session.setAttribute("id", id);
			out.print("<h1>로그인 성공</h1>");
		} else {			
			out.print("<h1>로그인 실패</h1>");
		}
	%>
	<a href="index.jsp">처음으로</a><br/>
</body>
</html>