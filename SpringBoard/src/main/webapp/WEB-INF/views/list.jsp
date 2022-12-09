<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<style>
table {
    width: 100%;
    text-align: center;
    border: 1px solid #fff;
    border-spacing: 1px;
    font-family: 'Cairo', sans-serif;
  margin: auto;
}

caption {
    font-weight: bold;
}

table td {
    padding: 10px;
    background-color: #eee;
}

table th {
    background-color: #009688;
    color: #fff;
    padding: 10px;
}

img {
    width: 90px;
    height: 90px;
}

.view,
.delete {
    border: none;
    padding: 5px 10px;
    color: #fff;
    font-weight: bold;
}

.view {
    background-color: #03A9F4;
}

.delete {
    background-color: #E91E63;
}

.tablefoot {
    padding: 0;
    border-bottom: 3px solid #009688;
}
.a{
font-size:50px;
text-align:center;
}

.btn{
  display: block;
  width: 7%;
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
       float:right;
}
.btn:hover{
  background-position: right;
}
</style>
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
Kakao.init('2b17cff530baee65d3a277587567ca48'); //발급받은 키 중 javascript키를 사용해준다.
function logoutCheck() {
	if (!Kakao.Auth.getAccessToken()) {
		window.location.href='logout';
	} else {
		window.location.href='logout';
		secession();
	}
}

function secession() {
	Kakao.API.request({
    	url: '/v1/user/unlink',
    	success: function(response) {
    		console.log(response);
    		//callback(); //연결끊기(탈퇴)성공시 서버에서 처리할 함수
    		window.location.href='logout'
    	},
    	fail: function(error) {
    		console.log('탈퇴 미완료')
    		console.log(error);
    	},
	});
};
</script>
</head>
<%
	String name = (String)request.getAttribute("name");
	String id = (String)request.getAttribute("id");
	if (name != null) {
		session.setAttribute("name", name);
		session.setAttribute("id", id);
	}
	
%>
<body>

        <h1 class = "a">포스코ICT 게시판</h1>
<table>

        <thead>
            <tr>
                <th width="10%">글작성자</th>
                <th width="10%">ID</th>
                <th width="20%">제목</th>
                <th width="50%">내용</th>
                <th width="10%">작성일</th>
            </tr>
        </thead>
         <tbody>

	 <c:forEach var="listArray" items="${allList}">
	 <tr>
            <td class="text_ct">${listArray.name}&nbsp;</td>
            <td class="text_ct">${listArray.id}</td>
            <td class="text_ct"><a href="detail.do?boardNo=${listArray.boardNo}">${listArray.title}</a></td>
            <td class="text_ct">${listArray.contents}</td>
            <td class="text_ct"><fmt:formatDate value="${listArray.date}" pattern="yyyy/MM/dd" /></td>
            
	 </tr>
	</c:forEach>
 </tbody> 
        <tfoot>
            <td colspan="5" class="tablefoot"></td>
        </tfoot>
    </table>
    <%
	String id2 = (String)session.getAttribute("id");
    
    if(id2 != null) {

    	out.println("<a href='create.do' class='btn'>게시글 작성</a><br/><a href='javascript:logoutCheck();' class='btn' style = 'bottom: 20px; margin-right: 10PX;'>로그아웃</a><br/>");

    } else {
    	out.println("<a href='index.jsp' class='btn'>처음으로</a><br/>");
    }
%>

</body>
<%@ include file="../fix/footer.jsp" %>
</html>