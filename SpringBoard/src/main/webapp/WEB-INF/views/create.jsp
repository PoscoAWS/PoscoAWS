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
.textarea_field {
    border: 1px solid #ddd;
    border-radius: 4px;
    padding: 4px;
    margin: 3px 0;
    font-size: 14px;
    width: 100%;
    height: 160px;
}
.a1{
border-top: 2px solid;
}

.btn{
  display: block;
  width: 5%;
  height: 50px;
  border-radius: 25px;
  outline: none;
  border: none;
  background-image: linear-gradient(to right, #32be8f, #38d39f, #32be8f);
  background-size: 200%;
  font-size: 1.2rem;
    font-family: 'Poppins', sans-serif;
  text-transform: uppercase;
  margin: 1rem 0;
  cursor: pointer;
  transition: .5s;
  text-align: center;
   padding-top: 20px;
   font-weight: bold;
   text-decoration:none;
       position: relative;
       float:right;
       color: white;
  
}
.btn:hover{
  background-position: right;
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
        <h2 style = "font-weight : bold; margin-bottom: 50px;">게시글 작성</h2>
        <div class = "a1">

        <div class="form-group">
              <label>ID</label>
            <input type="text" class="form-control" name="id" value="<%=id %>" readonly >
        </div>
        <div class="form-group">
            <label>이름</label>
            <input type="text" class="form-control" name="name" value="<%=name %>" readonly >
        </div>
        <div class="form-group">
            <label>글제목</label>
            <input class="form-control" name="title" placeholder="글제목 적어주세요.">
        </div>
       <div class="form-group">
            <label>글내용</label>
            <textarea class="form-control" name="contents" placeholder="내용 적어주세요."  style=" border: 1px solid #ddd; border-radius: 4px; padding: 4px; margin: 3px 0;  width: 100%; height: 160px;"></textarea>
        </div>

        <div class="form-group">
            <label>파일</label>
            <input  class="form-control" type="file" name="file"><br>
        </div>
        </div>	
   
    <button type="submit" class="btn"><a href="list.do" style = "color: white; text-decoration:none; font-weight: bold;">돌아가기</a></button>    
    <button type="submit" class="btn" style="margin-right:10px; font-weight: bold;">등록</button>
   

    </form>
</body>
<%@ include file="../fix/footer.jsp" %>
</html>
