<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>loginEnd.jsp</h1>
	<%
		String name = (String)request.getAttribute("name");
		String id = (String)request.getAttribute("id");
		if (name != null) {
			session.setAttribute("name", name);
			session.setAttribute("id", id);
			out.print("<h1>�α��� ����</h1>");
		} else {			
			out.print("<h1>�α��� ����</h1>");
		}
	%>
	<a href="index.jsp">ó������</a><br/>
</body>
</html>