<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Animated Login Form</title>
  
  <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
  <script src="https://kit.fontawesome.com/a81368914c.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
  *{
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}


body{
    font-family: 'Poppins', sans-serif;
    overflow: hidden;
}

.wave{
  position: fixed;
  bottom: 0;
  left: 0;
  height: 100%;
  z-index: -1;
}

.container{
    width: 100vw;
    height: 100vh;
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    grid-gap :7rem;
    padding: 0 2rem;
}

.img{
  display: flex;
  justify-content: flex-end;
  align-items: center;
}

.login-content{
  display: flex;
  justify-content: flex-start;
  align-items: center;
  text-align: center;
}

.img img{
  width: 500px;
}

form{
  width: 360px;
}

.login-content img{
    height: 100px;
}

.login-content h2{
  margin: 15px 0;
  color: #333;
  text-transform: uppercase;
  font-size: 2.9rem;
}

.login-content .input-div{
  position: relative;
    display: grid;
    grid-template-columns: 7% 93%;
    margin: 25px 0;
    padding: 5px 0;
    border-bottom: 2px solid #d9d9d9;
}

.login-content .input-div.one{
  margin-top: 0;
}

.i{
  color: #d9d9d9;
  display: flex;
  justify-content: center;
  align-items: center;
}

.i i{
  transition: .3s;
}

.input-div > div{
    position: relative;
  height: 45px;
}

.input-div > div > h5{
  position: absolute;
  left: 10px;
  top: 50%;
  transform: translateY(-50%);
  color: #999;
  font-size: 18px;
  transition: .3s;
}

.input-div:before, .input-div:after{
  content: '';
  position: absolute;
  bottom: -2px;
  width: 0%;
  height: 2px;
  background-color: #38d39f;
  transition: .4s;
}

.input-div:before{
  right: 50%;
}

.input-div:after{
  left: 50%;
}

.input-div.focus:before, .input-div.focus:after{
  width: 50%;
}

.input-div.focus > div > h5{
  top: -5px;
  font-size: 15px;
}

.input-div.focus > .i > i{
  color: #38d39f;
}

.input-div > div > input{
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  border: none;
  outline: none;
  background: none;
  padding: 0.5rem 0.7rem;
  font-size: 1.2rem;
  color: #555;
  font-family: 'poppins', sans-serif;
}

.input-div.pass{
  margin-bottom: 4px;
}

a{
  display: block;
  text-align: right;
  text-decoration: none;
  color: #999;
  font-size: 0.9rem;
  transition: .3s;
}

a:hover{
  color: #38d39f;
}

.btn{
  display: block;
  width: 100%;
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
}
.btn:hover{
  background-position: right;
}
  </style>
</head>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('2b17cff530baee65d3a277587567ca48'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단

const path = 'http://54.199.201.157/SpringBoard';
function kakaoLogin() {
    window.Kakao.Auth.login({
        scope: 'profile_nickname, account_email', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
        success: function(response) {
            console.log(response); // 로그인 성공하면 받아오는 데이터
            window.Kakao.API.request({ // 사용자 정보 가져오기 
                url: '/v2/user/me',
                success: (res) => {
                    const kakao_account = res.kakao_account;
                    console.log(res.kakao_account.email);
                    console.log(res.kakao_account.profile.nickname);
                    
                    let name = res.kakao_account.profile.nickname;
                    let getId = res.kakao_account.email;
                    let kakaoId = getId.split('@')[0];
                    console.log(kakaoId);
                    
                    // 회원가입 및 로그인
                    $.ajax({
    					type : "post",
    					url : 'idDuplicateCheck', // ID중복체크를 통해 회원가입 유무를 결정한다.
    					data : kakaoId,
    					dataType: "json",
    			        contentType: "application/json; charset=utf-8",
    					success : function(data){  
    						// true : 카카오 아이디 존재
    						// false : 카카오 아이디 존재 X
    						if(data.check){
    							// 존재하는 경우 로그인 처리
    							window.location.href=path+'/loginKakaoUser?id='+kakaoId+'&name='+name;	 							
    						} else{
    							alert('카카오 계정으로 회원가입을 진행합니다.');
    							// 회원가입
    							var userData = {};
    							userData.id = kakaoId;
    							userData.name = name;
    							console.log(userData);
    							console.log(JSON.stringify(userData));
    							
    							$.ajax({
    								type : "post",
    		    					url : path+'/kakaoSignUp',
    		    					data : JSON.stringify(userData),
    		    					dataType :"json",
    		    					contentType: "application/json; charset=utf-8",
    		    					success : function(isSignUp){
    		    						if(isSignUp){
    		    							// 로그인
    		    							window.location.href=path+'/loginKakaoUser?id='+kakaoId+'&name='+name;
    		    						} else {
    		    							alert('카카오 회원가입 실패. 일반계정으로 로그인하시기 바랍니다.');
    		    						}
    		    					},
    		    					error: function(request, status, error){
    		    		            	alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
    		    		            }
    							});
    						}						
    					},
    					error: function(request, status, error){
    		               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
    		            }
                    });
                }
            });
        },
        fail: function(error) {
            console.log(error);
        }
    });
}
</script>

<body>

  <img class="wave" src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/wave.png">
  <div class="container">
    <div class="img">
      <img src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/bg.svg">
    </div>
    <div class="login-content">
      <form method=post action="loginUser">
        <img src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/avatar.svg">
        <h2 class="title" style = "font-size: 35px;">포스코ICT 2조 게시판</h2>
              <div class="input-div one">
                 <div class="i">
                    <i class="fas fa-user"></i>
                 </div>
                 <div class="div">
                    <h5>Username</h5>
                    <input type="text" class="input" name="id">
                 </div>
              </div>
              <div class="input-div pass">
                 <div class="i"> 
                    <i class="fas fa-lock"></i>
                 </div>
                 <div class="div">
                    <h5>Password</h5>
                    <input type="password" class="input" name="pw">
                 </div>
              </div>
          		<input type="submit" class="btn" style ="text-align: center; padding-top: 10px; font-weight: bold;" value='로그인'/>
              <a href="newUser" class="btn" style ="text-align: center; padding-top: 10px; font-weight: bold;">회원 가입</a><br/>
              <a href="boardList" class="btn" style = "text-align: center; padding-top: 10px; position: relative; bottom: 40px; font-weight: bold;">게시판</a><br/>

				<a href="javascript:kakaoLogin();" ><img  src="https://blog.kakaocdn.net/dn/bYZZHh/btrfibui4Cj/DofAXcdzmQGCKkhTNUUAHk/img.png" alt="카카오계정 로그인" style="height: 100px;     position: relative; bottom: 58px;"/></a>
            </form>
           
			

        </div>
    </div>
    <script>
    const inputs = document.querySelectorAll(".input");


    function addcl(){
      let parent = this.parentNode.parentNode;
      parent.classList.add("focus");
    }

    function remcl(){
      let parent = this.parentNode.parentNode;
      if(this.value == ""){
        parent.classList.remove("focus");
      }
    }


    inputs.forEach(input => {
      input.addEventListener("focus", addcl);
      input.addEventListener("blur", remcl);
    });
    </script>
</body>
</html>