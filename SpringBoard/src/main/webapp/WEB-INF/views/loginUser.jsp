<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method=post action="loginUser">	
		<label>ì•„ì´ë”” </label>
		<input type="text" name="id" value="hdh" /><br/>	
		<label>ë¹„ë°€ë²ˆí˜¸ </label>
		<input type="number" name="pw" value="1234" /><br/>	
		<input type="submit" value="ë¡œê·¸ì¸" /><br/>	
	</form>

	<div id="google_id_login" style="text-align: center">
		<a href="${google_url}"> ±¸±Û ·Î±×ÀÎ </a>
	</div>
</body>
</html>