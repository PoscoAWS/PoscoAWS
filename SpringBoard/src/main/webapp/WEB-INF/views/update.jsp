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
<body>
    <h2>Update page</h2>
    <form name="update" method="POST" action="${path}update?no=${data.no}">
        <div>글번호 : ${data.no}</div>
        <div>이름 : </div>
        <div><input name="name" value="${data.name}" type="text"/></div>
        <div>ID : </div>
        <div><input name="id" value="${data.id}" type="text"/></div>
        <div>GOAL</div>
        <div><input name="goal" value="${data.goal}" type="text"/></div>
        <div>작성일자</div>
        <div><fmt:formatDate value="${data.date}" pattern="yyyy/MM/dd" /></div>
        <div>작성시간</div>
        <div><fmt:formatDate value="${data.time}" pattern="HH:mm:ss" /></div>
        
        <div>        
            <input type="submit" class="btn btn-outline-info" value="완료"/>
            <input type="reset" class="btn btn-outline-info" value="리셋"/>
        </div>
    </form>
    
</body>
</html>