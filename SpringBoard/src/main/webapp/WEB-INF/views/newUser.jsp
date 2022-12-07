<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>newUser.jsp</h1>
	<form method=post action="insertUser">
		<label>이름 </label>
		<input type="text" name="name" value="동현" /><br/>	
		<label>아이디 </label>
		<input type="text" name="id" value="hdh" /><br/>	
		<label>비밀번호 </label>
		<input type="number" name="pw" value="1234" /><br/>	
		<input type="submit" value="회원가입" /><br/>	
	</form>
</body>
</html>