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
		<label>���̵� </label>
		<input type="text" name="id" value="hdh" /><br/>	
		<label>��й�ȣ </label>
		<input type="number" name="pw" value="1234" /><br/>	
		<input type="submit" value="�α���" /><br/>	
	</form>

	<div id="google_id_login" style="text-align: center">
		<a href="${google_url}"> ���� �α��� </a>
	</div>
</body>
</html>