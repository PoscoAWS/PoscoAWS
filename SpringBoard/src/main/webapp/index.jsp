<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<title>메인 페이지</title>
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
Kakao.init('2b17cff530baee65d3a277587567ca48'); //발급받은 키 중 javascript키를 사용해준다.
function logoutCheck() {
	if (!Kakao.Auth.getAccessToken()) {
		window.location.href='logout';
	} else {
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
	String name = (String)session.getAttribute("name");
	String id = (String)session.getAttribute("id");
%>

<body>
	<h2>게시판</h2>	
	<%
		out.println((name != null) ? 
			"<h4>현재 접속자 : "+ name + "</h4>" : "");
	
		out.println((id == null) ? 
			"<a href='login'>로그인</a><br/>" : 
			//"<a href='logout'>로그아웃</a><br/>"
				"<a href='javascript:logoutCheck();'>로그아웃</a><br/>"
				);
	%>
	<a href="newUser">회원 가입</a><br/>
	<a href="boardList">게시판</a><br/>
</body>
