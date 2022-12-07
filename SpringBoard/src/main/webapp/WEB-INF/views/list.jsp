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
  <th scope="col">번호</th>
  <th scope="col">ID</th>
  <th scope="col">제목</th>
  <th scope="col">내용</th>
  <th scope="col">작성일</th>
  </tr>
 </thead>
 
 <tbody>
	 <c:forEach items="${list}" var="list">
	 <tr>
            <td class="text_ct">${list.no}&nbsp;</td>
            <td class="text_ct">${list.id}&nbsp;</td>
            <td class="text_ct">${list.title}&nbsp;</td>
            <td class="text_ct">${list.contents}&nbsp;</td>
            <td class="text_ct"><fmt:formatDate value="${list.date}" pattern="yyyy/MM/dd" /></td>
	 </tr>
	</c:forEach>
 </tbody> 
</table>
</form>
</body>
</html>