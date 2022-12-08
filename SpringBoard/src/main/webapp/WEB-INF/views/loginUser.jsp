<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('2b17cff530baee65d3a277587567ca48'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단

const path = 'http://localhost:8080/SpringBoard';
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
	<form method=post action="loginUser">	
		<label>아이디 </label>
		<input type="text" name="id" value="hdh" /><br/>	
		<label>비밀번호 </label>
		<input type="number" name="pw" value="1234" /><br/>	
		<input type="submit" value="로그인" /><br/>	
	</form>
	
	
	<ul>
	<a href="javascript:kakaoLogin();"><img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" alt="카카오계정 로그인" style="height: 100px;"/></a>
</ul>
</body>
</html>