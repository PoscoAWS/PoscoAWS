<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
   footer{
      width: 100%;
      margin: 0 auto;
      margin-top: 100px;
   }
   footer div:first-child {
       height: 50px;
       border-bottom: 1px solid gray;
       border-top: 1px solid gray;
   }
   footer div:first-child ul:first-child{
      height: 100%;
      margin: 0;
   }
   footer div:first-child ul li{
      padding: 0 20px;
   }
   footer div:first-child ul li a{
      color: #2d2d2d;
       font-size: 14px;   
   }
   footer div:last-child ul li span{
      color: gray;
       font-size: 16px;   
   }
   footer div:first-child ul li:last-child{
      border: none;
   }
  
   footer div:last-child ul {
      padding-right: 100px;
   }
   footer div:last-child ul li span:first-child {
      font-size: 40px;
      font-weight: bold;
   }


</style>
<footer>
   <div>
      <ul class="flex between" style = "display: flex; position: relative; top: 70px;">
         <li style = "list-style:none;">
            <span>Study</span><br>
            <span>평일 09:00-18:00, 점심 12:50-14:00</span><br>
            <span>주말, 공휴일 휴무</span>
         </li>
         <li style= "margin: 0 auto; list-style:none;">
            <span>Github</span><br>
            <span>이성현 : https://github.com/LSHmygit</span><br>
            <span>이소현 : https://github.com/sohyeon-lee</span><br>
            <span>황동현 : https://github.com/hdh980217</span><br>
            <span>이재하 : https://github.com/jaehawilly</span><br>
         </li>
         <li style = "list-style:none;">
            <span>Information</span><br>
            <span>비트교육센터  대표자  이성현</span><br>
            <span>포스코ICT 채용확정형 교육 / spring 구현 프로젝트</span><br>
            <span>주소 서울특별시 서초구 서초대로74길 33 3층</span><br>
         </li>
      </ul>
   </div>
</footer>