<%@page import="Pack01.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
    <h2>Detail page</h2>
    <table border="1">
        <th> 카테고리 </th>
        <th> 게시글 정보 </th>
        <tr>
            <td>작성일자</td>
            <td><fmt:formatDate value="${listArray.date}"  />
            </td>
        </tr>
        <tr>
            <td>글작성자</td><td>${listArray.name}</td>
        </tr>
          <tr>
            <td>글제목</td><td>${listArray.title}</td>
        </tr>
        <tr>
            <td>글내용</td><td>${listArray.contents}</td>
        </tr>
        <tr><td>ID</td><td>${listArray.id}</td></tr>
    </table>
    <%
		String id = (String)session.getAttribute("id");
    	BoardVO board = (BoardVO)request.getAttribute("listArray");
    	System.out.println(board.getId());
    	if (id != null && id.equals(board.getId()))
    		out.println("<a href='update.do?boardNo="+board.getBoardNo() +"'>수정</a></br>");
    	if (id != null && id.equals(board.getId()))
    		out.println("<a href='delete.do?boardNo="+board.getBoardNo() +"'>삭제</a>");
	%>
    
</body>
</html>
