<%@page import="Pack01.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
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
        title: '카카오공유하기 시 타이틀',
        description: '카카오공유하기 시 설명',
        imageUrl: 'https://mud-kage.kakao.com/dn/NTmhS/btqfEUdFAUf/FjKzkZsnoeE4o19klTOVI1/openlink_640x640s.jpg',
        link: {
          mobileWebUrl: 'https://developers.kakao.com',
          webUrl: 'https://developers.kakao.com',
        },
      },
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            mobileWebUrl: 'https://developers.kakao.com',
            webUrl: 'https://developers.kakao.com',
          },
        },
      ],
      // 카카오톡 미설치 시 카카오톡 설치 경로이동
      installTalk: true,
    })
  }
</script>
</head>
<body>
    <h2>Detail page</h2>
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
    </table>
    
    <a id="kakao-link-btn" href="javascript:kakaoShare()">
    	<img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" />
    </a>
    <%
		String id = (String)session.getAttribute("id");
    	BoardVO board = (BoardVO)request.getAttribute("listArray");
    	System.out.println(board.getId());
    	if (id != null && id.equals(board.getId()))
    		out.println("<a href='update.do?boardNo="+board.getBoardNo() +"'>수정</a></br>");
    	if (id != null && id.equals(board.getId()))
    		out.println("<a href='delete.do?boardNo="+board.getBoardNo() +"'>삭제</a>");
	%>
    
</body>
</html>