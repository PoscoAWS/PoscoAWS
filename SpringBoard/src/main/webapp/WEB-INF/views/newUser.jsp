<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
* {
  margin: 0px;
  padding: 0px;
  text-decoration: none;
  font-family:sans-serif;

}

body {
  background-image:#34495e;
}

.joinForm {
  position:absolute;
  width:400px;
  height:400px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:40%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
  z-index:1;
}

.joinForm h2 {
  text-align: center;
  margin: 30px;
}

.textForm {
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}


.id {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
  
}

.pw {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.name {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.email {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.nickname {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.cellphoneNo {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.btn {
  position:relative;
  top:15px;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:80%;
  height:40px;
  background: linear-gradient(125deg,#19A186,#20DED3,#19A186);
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
  font-size: 18px;
}

.btn:hover {
  background-position: right;
}
.a {
display: block;
    width: 40%;
    margin: 0 auto;
    position: relative;
    top: 143px;
    height: 550px;
}
</style>
<body>

<form action="doJoin" method="POST" class="joinForm" onsubmit="DoJoinForm__submit(this); return false;">                                                  
      <h2>회원 가입</h2>
      <div class="textForm">
        <input name="loginId" type="text" class="id" placeholder="아이디">
      </div>
      <div class="textForm">
        <input name="loginPw" type="password" class="pw" placeholder="비밀번호">
      </div>
       <div class="textForm">
        <input name="loginPwConfirm" type="password" class="pw" placeholder="비밀번호 확인">
      </div>
      <div class="textForm">
        <input name="name" type="text" class="name" placeholder="이름">
      </div>
      <input type="submit" class="btn" value="가입 완료"/>
    </form>
      <img class = "a" src = "https://img.freepik.com/premium-photo/simple-white-background-with-smooth-lines-in-light-colors_476363-5220.jpg"/>
      
</body>
</html>