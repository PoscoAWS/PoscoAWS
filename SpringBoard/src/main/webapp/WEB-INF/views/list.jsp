<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
<form name="userForm">
<h1>List page</h1>
<table>
 <thead>
  <tr>
  <th scope="col">글작성자</th>
  <th scope="col">ID</th>
  <th scope="col">제목</th>
  <th scope="col">내용</th>
  <th scope="col">작성일</th>
  </tr>
 </thead>
 
 <tbody>
	 <c:forEach var="listArray" items="${allList}">
	 <tr>
            <td class="text_ct"><a href="detail.do?boardNo=${listArray.boardNo}">${listArray.title}</a></td>
            <td class="text_ct">${listArray.id}</td>
            <td class="text_ct">${listArray.title}</td>
            <td class="text_ct">${listArray.contents}</td>
            <td class="text_ct"><fmt:formatDate value="${listArray.date}" pattern="yyyy/MM/dd" /></td>
	 </tr>
	</c:forEach>
 </tbody> 
</table>
</form>
<a href="create.do">게시글 작성</a><br/>
</body>
</html>