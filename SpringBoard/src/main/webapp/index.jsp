<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<title>메인 페이지</title>
</head>

<%
	String name = (String)session.getAttribute("name");
	String id = (String)session.getAttribute("id");
%>

<body>
	<h2>게시판</h2>	
	<%
		out.println((name != null) ? 
			"<h4>현재 접속자 : "+ name + "</h4>" : "");
	
		out.println((id == null) ? 
			"<a href='login'>로그인</a><br/>" : 
			"<a href='logout'>로그아웃</a><br/>");
	%>
	<a href="newUser">회원 가입</a><br/>
	<a href="list.do">게시판</a><br/>
</body>
