<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>loginUser.jsp</h1>
	<form method=post action="loginUser">	
		<label>아이디 </label>
		<input type="text" name="id" value="hdh" /><br/>	
		<label>비밀번호 </label>
		<input type="number" name="pw" value="1234" /><br/>	
		<input type="submit" value="로그인" /><br/>	
	</form>

	<div id="google_id_login" style="text-align: center">
		<a href="${google_url}"> 구글 로그인 </a>
	</div>
</body>
</html>