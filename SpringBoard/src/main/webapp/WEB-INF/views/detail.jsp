<%@page import="java.util.List"%>
<%@page import="Pack01.board.CommentVO"%>
<%@page import="Pack01.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%-- <html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<%
	String id = (String)session.getAttribute("id");
   	BoardVO board = (BoardVO)request.getAttribute("listArray");
%>

<!-- kakao sdk 호출 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
  // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
  Kakao.init('2b17cff530baee65d3a277587567ca48');

  // SDK 초기화 여부를 판단합니다.
  console.log(Kakao.isInitialized());

  function kakaoShare() {
    Kakao.Link.sendDefault({
      objectType: 'feed',
      content: {
        title: 'SpringBoard',
        description: '게시판 글 공유',
        imageUrl: 'https://mud-kage.kakao.com/dn/NTmhS/btqfEUdFAUf/FjKzkZsnoeE4o19klTOVI1/openlink_640x640s.jpg',
        link: {
          mobileWebUrl: 'http://localhost:8080/SpringBoard/detail.do?boardNo=' + <%=board.getBoardNo()%>,
          webUrl: 'http://localhost:8080/SpringBoard/detail.do?boardNo=' + <%=board.getBoardNo()%>,
        },
      },
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            mobileWebUrl: 'http://localhost:8080/SpringBoard/detail.do?boardNo=' + <%=board.getBoardNo()%>,
            webUrl: 'http://localhost:8080/SpringBoard/detail.do?boardNo=' + <%=board.getBoardNo()%>,
          },
        },
      ],
      // 카카오톡 미설치 시 카카오톡 설치 경로이동
      installTalk: true,
    })
  }
  // https://localhost:8080/SpringBoard/detail.do?boardNo=' + <%=board.getBoardNo()%>
</script>
</head>
<body>
    <h2 style = "font-weight : bold; margin-bottom: 50px;">게시글 상세보기</h2>
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
       	
        <tr><td>파일</td><td><video src="${listArray.file}" ></video></td></tr>
    </table>
    <a id="kakao-link-btn" href="javascript:kakaoShare()">
    	<img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" />
    </a>
	<a href="https://www.youtube.com/watch?v=ihtn_k_OH_4">동영상 보기</a>

	<%
		String name = (String)session.getAttribute("name");
		List<CommentVO> commentList = (List<CommentVO>)request.getAttribute("commentList");
		if (id != null) {
	%>
	<form method=post action="insertComment">
		<input type="hidden" name="boardNo" value=<%=board.getBoardNo()%> readonly="readonly" />	
		<input type="hidden" name="name" value=<%=name%> readonly="readonly" />	
		<input type="hidden" name="id" value=<%=id%> readonly="readonly"/>
		<label>댓글 내용 </label>
		<input type="text" name="comment" />
		<input type="submit" value="댓글 작성" /><br/>	
	</form>
	<% } %>

	<table border="1">
		<thead>
			<tr>
				<th scope="col">댓글작성자</th>
				<th scope="col">댓글작성자 ID</th>
				<th scope="col">댓글 내용</th>
				<th scope="col">댓글 작성일</th>
				<th scope="col">삭제</th>
			</tr>
		</thead>

		<tbody>
			<%for(CommentVO comment : commentList) {%>
				<tr>
					<td class="text_ct"><%=comment.getName() %></td>
					<td class="text_ct"><%=comment.getId() %></td>
					<td class="text_ct"><%=comment.getComment() %></td>
					<td class="text_ct"><fmt:formatDate value="<%=comment.getDate() %>"
							pattern="yyyy/MM/dd" /></td>
					<% if ((id != null ) && ((id.equals(board.getId())) || (id.equals(comment.getId())))) { %>
					<td class="text_ct">
						<a href='deleteCommet?commentNo=<%=comment.getCommentNo() %>&
						boardNo=${listArray.boardNo}'>
						삭제</a>
					</td>
					<% } %>
				</tr>
			<% } %>
		</tbody>
	</table>

	<%
    	System.out.println(board.getId());
    	if (id != null && id.equals(board.getId()))
    		out.println("<a href='update.do?boardNo="+board.getBoardNo() +"'>수정</a></br>");
    	if (id != null && id.equals(board.getId()))
    		out.println("<a href='delete.do?boardNo="+board.getBoardNo() +"'>삭제</a></br>");
	%>
    <a href="boardList">게시판으로</a><br/>


</body>
</html> --%>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>Table Style</title>
  <meta name="viewport" content="initial-scale=1.0; maximum-scale=1.0; width=device-width;">
	<style>
	@import url(https://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100);

body {
  font-family: "Roboto", helvetica, arial, sans-serif;
  font-size: 16px;
  font-weight: 400;
  text-rendering: optimizeLegibility;
}

div.table-title {
   display: block;
  max-width: 600px;
  padding:5px;
  width: 100%;
}

.table-title h3 {
   color: #fafafa;
   font-size: 30px;
   font-weight: 400;
   font-style:normal;
   font-family: "Roboto", helvetica, arial, sans-serif;
   text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
   text-transform:uppercase;
}


/*** Table Styles **/

.table-fill {
  background: white;
  border-radius:3px;
  border-collapse: collapse;
  height: 320px;
  padding:5px;
  width: 80%;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
  animation: float 5s infinite;
}
 
th {
  color:#D5DDE5;;
  background:#1b1e24;
  border-bottom:1px solid #9ea7af;
  border-right: 1px solid #343a45;
  font-size:23px;
  font-weight: 100;
  padding:24px;
  text-align:left;
  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
  vertical-align:middle;
}

th:first-child {
  border-top-left-radius:3px;
}
 
th:last-child {
  border-top-right-radius:3px;
  border-right:none;
}
  
tr {
  border-top: 1px solid #C1C3D1;
  border-bottom-: 1px solid #C1C3D1;
  color:#666B85;
  font-size:16px;
  font-weight:normal;
  text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
}
 
tr:hover td {
  background:#4E5066;
  color:#FFFFFF;
  border-top: 1px solid #22262e;
}
 
tr:first-child {
  border-top:none;
}

tr:last-child {
  border-bottom:none;
}
 

tr:last-child td:first-child {
  border-bottom-left-radius:3px;
}
 
tr:last-child td:last-child {
  border-bottom-right-radius:3px;
}
 
td {
  background:#FFFFFF;
  padding:20px;
  text-align:left;
  vertical-align:middle;
  font-weight:300;
  font-size:18px;
  text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
  border-right: 1px solid #C1C3D1;
}

td:last-child {
  border-right: 0px;
}

th.text-left {
  text-align: left;
}

th.text-center {
  text-align: center;
}

th.text-right {
  text-align: right;
}



td.text-center {
  text-align: center;
}

td.text-right {
  text-align: right;
}
.text-left2{
text-align:center;
 background:#EBEBEB;
font-weight: bold;
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
  color: #fff;
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
bottom: 100px;       
}
.btn:hover{
  background-position: right;
}
	</style>
	
	<%
	String id = (String)session.getAttribute("id");
   	BoardVO board = (BoardVO)request.getAttribute("listArray");
%>

<!-- kakao sdk 호출 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
  // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
  Kakao.init('2b17cff530baee65d3a277587567ca48');

  // SDK 초기화 여부를 판단합니다.
  console.log(Kakao.isInitialized());

  function kakaoShare() {
    Kakao.Link.sendDefault({
      objectType: 'feed',
      content: {
        title: 'SpringBoard',
        description: '게시판 글 공유',
        imageUrl: 'https://mud-kage.kakao.com/dn/NTmhS/btqfEUdFAUf/FjKzkZsnoeE4o19klTOVI1/openlink_640x640s.jpg',
        link: {
          mobileWebUrl: 'http://52.197.203.173:80/SpringBoard/detail.do?boardNo=' + <%=board.getBoardNo()%>,
          webUrl: 'http://52.197.203.173:80/SpringBoard/detail.do?boardNo=' + <%=board.getBoardNo()%>,
        },
      },
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            mobileWebUrl: 'http://52.197.203.173:80/SpringBoard/detail.do?boardNo=' + <%=board.getBoardNo()%>,
            webUrl: 'http://52.197.203.173:80/SpringBoard/detail.do?boardNo=' + <%=board.getBoardNo()%>,
          },
        },
      ],
      // 카카오톡 미설치 시 카카오톡 설치 경로이동
      installTalk: true,
    })
  }
  // https://localhost:8080/SpringBoard/detail.do?boardNo=' + <%=board.getBoardNo()%>
</script>
</head>
<body>
<div>
<div class="table-title">
<h2 style = "font-weight : bold; margin-bottom: 50px; font-size:30px;">게시글 상세보기</h2>
</div>
<table class="table-fill">
<thead>
<tr style= "height: 40px;">
<th class="text-left1" style = "background-color: #009688; color: #fff; padding: 10px; border-right:none;"></th>
<th class="text-left1" style ="background-color: #009688;color: #fff; padding: 10px;"></th>
</tr>
</thead>
<tbody class="table-hover">
<tr>
<td class="text-left2" style = "width:20%">글작성일</td>
 <td ><fmt:formatDate value="${listArray.date}"  />
</tr>
<tr>
<td class="text-left2">ID</td>
<td class="text-left">${listArray.id}</td>
</tr>
<tr>
<td class="text-left2">글작성자</td>
<td class="text-left" style = "width:70%">${listArray.name}</td>
</tr>
<tr>
<td class="text-left2">글제목</td>
<td class="text-left">${listArray.title}</td>
</tr>
<tr>
<td class="text-left2" style = "height:300px;">글내용</td>
<td class="text-left" style = "height:300px;" >${listArray.contents}</td>
</tr>
</tbody>
</table>
</div>
    <a id="kakao-link-btn" href="javascript:kakaoShare()">
    	<img src="https://t1.daumcdn.net/cfile/tistory/99BEE8465C3D7D1214" style= "position: relative; top: 112px; right:23px;" />
    </a>
    
    <%
    	System.out.println(board.getId());
    	if (id != null && id.equals(board.getId()))
    		out.println("<a  class='btn' href='update.do?boardNo="+board.getBoardNo() +"'>수정</a></br>");
    	if (id != null && id.equals(board.getId()))
    		out.println("<a  class='btn' style = 'position: relative; bottom: 221px; left: 108px;' href='delete.do?boardNo="+board.getBoardNo() +"'>삭제</a>");
	%>  
	<%
		String name = (String)session.getAttribute("name");
		List<CommentVO> commentList = (List<CommentVO>)request.getAttribute("commentList");
		if (id != null) {
	%>
	<form method=post action="insertComment">
		<input type="hidden" name="boardNo" value=<%=board.getBoardNo()%> readonly="readonly" />	
		<input type="hidden" name="name" value=<%=name%> readonly="readonly" />	
		<input type="hidden" name="id" value=<%=id%> readonly="readonly"/>
		<label>댓글 내용 </label>
		<input type="text" name="comment" />
		<input type="submit" value="댓글 작성" /><br/>	
	</form>
	<% } %>
	<table border="1">
		<thead>
			<tr>
				<th scope="col">댓글작성자</th>
				<th scope="col">댓글작성자 ID</th>
				<th scope="col">댓글 내용</th>
				<th scope="col">댓글 작성일</th>
				<th scope="col">삭제</th>
			</tr>
		</thead>

		<tbody>
			<%for(CommentVO comment : commentList) {%>
				<tr>
					<td class="text_ct"><%=comment.getName() %></td>
					<td class="text_ct"><%=comment.getId() %></td>
					<td class="text_ct"><%=comment.getComment() %></td>
					<td class="text_ct"><fmt:formatDate value="<%=comment.getDate() %>"
							pattern="yyyy/MM/dd" /></td>
					<% if ((id != null ) && ((id.equals(board.getId())) || (id.equals(comment.getId())))) { %>
					<td class="text_ct">
						<a href='deleteCommet?commentNo=<%=comment.getCommentNo() %>&
						boardNo=${listArray.boardNo}'>
						삭제</a>
					</td>
					<% } %>
				</tr>
			<% } %>
		</tbody>
	</table>
	

  </body>
  
  <%@ include file="../fix/footer.jsp" %>