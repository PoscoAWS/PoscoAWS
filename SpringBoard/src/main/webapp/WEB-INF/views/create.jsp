<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
.center{
margin: 5px 25px; padding: 20px
}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Create</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
%>
    <form action = "create2.do" class="center" method="post" enctype="multipart/form-data">
        <h2>Create Page</h2>
        <div class="form-group">
              <label>ID</label>
            <input type="text" class="form-control" name="id" value="<%=id %>" readonly placeholder="아이디 작성해주세요.">
        </div>
        <div class="form-group">
            <label>Name</label>
            <input type="text" class="form-control" name="name" value="<%=name %>" readonly placeholder="이름 적어주세요.">
        </div>
        <div class="form-group">
            <label>Title</label>
            <input class="form-control" name="title" placeholder="글제목 적어주세요.">
        </div>
       <div class="form-group">
            <label>Contents</label>
            <input class="form-control" name="contents" placeholder="내용 적어주세요.">
        </div>
        <div class="form-group" >
            <label>file</label>
            <input  class="form-control" type="file" name="file"><br>
        </div>
       
    	<button type="submit" class="btn btn-outline-info">등록</button>
    	<button type="submit" class="btn btn-outline-info"><a href="list.do">돌아가기</a></button>
    </form>
</body>
</html>
