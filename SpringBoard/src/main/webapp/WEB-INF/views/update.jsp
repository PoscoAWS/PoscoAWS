<%@page import="Pack01.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%
	BoardVO board = (BoardVO)request.getAttribute("board");
%>
<body>
    <h2>Update page</h2>
    <form name="update" method="POST" action="update.do?boardNo=<%= board.getBoardNo() %>">
        <div>글번호 : <%= board.getBoardNo() %></div>
        <div>이름 : </div>
        <div><input name="name" value="<%= board.getName() %>" type="text" readonly="readonly"/></div>
        <div>ID : </div>
        <div><input name="id" value="<%= board.getId() %>" type="text" readonly="readonly"/></div>
        <div>Title</div>
        <div><input name="title" value="<%= board.getTitle() %>" type="text"/></div>
        <div>글 내용</div>
        <div><input name="contents" value="<%= board.getContents() %>" type="text"/></div>
        <div>작성일자</div>
        <div><fmt:formatDate value="<%= board.getDate() %>" pattern="yyyy/MM/dd" /></div>
        
        
        <div>        
            <input type="submit" class="btn btn-outline-info" value="완료"/>
            <input type="reset" class="btn btn-outline-info" value="리셋"/>
        </div>
    </form>
    
</body>
</html>