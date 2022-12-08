<%@page import="Pack01.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head><style>
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
<title>Insert title here</title>
</head>

<%
	BoardVO board = (BoardVO)request.getAttribute("board");
%>
<body>
<%--     <h2>Update page</h2>
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
        <div>파일</div>
        <div><input name="file" value="<%= board.getFile() %>" type="text" readonly="readonly"/></div>
        
        
        <div>        
            <input type="submit" class="btn btn-outline-info" value="완료"/>
            <input type="reset" class="btn btn-outline-info" value="리셋"/>
        </div>
    </form> --%>
    <form name="update" method="POST"  class="center" action="update.do?boardNo=<%= board.getBoardNo() %>">
        <h2 style = "font-weight : bold; margin-bottom: 50px;">게시글 수정</h2>
        <div class = "a1">
        <div class="form-group">
            <label>ID</label>
           <input type="text" class="form-control" name="id" value="<%= board.getId() %>"  readonly="readonly"/>
        </div>
        <div class="form-group">
            <label>이름</label>
           <input type="text" class="form-control" name="name" value="<%= board.getName() %>" readonly="readonly"/>
        </div>
        <div class="form-group">
            <label>글제목</label>
            <input  type="text" class="form-control" name="title" value="<%= board.getTitle() %>"/>
        </div>
       <div class="form-group">
            <label>글내용</label>
            <textarea type="text" class="form-control" name="contents" value="<%= board.getContents() %>" placeholder="내용 적어주세요."  style=" border: 1px solid #ddd; border-radius: 4px; padding: 4px; margin: 3px 0;  width: 100%; height: 160px;"></textarea>
        </div>
        <div class="form-group">
            <label>작성 일자</label>
            <fmt:formatDate value="<%= board.getDate() %>" pattern="yyyy/MM/dd" />
        </div>
        </div>	
   
   <button type="submit" class="btn" style = "font-weight: bold;">돌아가기</button>
    <button type="submit" class="btn" style ="margin-right:10px; color: white; text-decoration:none; font-weight: bold;">수정 완료</button>    
    
   
    </form>
    
    
</body>
<%@ include file="../fix/footer.jsp" %>
</html>