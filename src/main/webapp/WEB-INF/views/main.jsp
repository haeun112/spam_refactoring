<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
  
  
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="/spam/js/bot.js"></script>


  <link rel="stylesheet" href="/spam/css/slider.css">
  <link rel="stylesheet" href="/spam/css/bot.css">

  <script>
    $(document).ready(function () {
      let m = "${msg}";
      if (m !== '') {
        alert(m);
      }

      // bxSlider 설정용 스크립트
      $(".slider").bxSlider({
        mode: "horizontal", //가로 슬라이드 모드
        auto: true,
        slideWidth: 600,
      });
    });
    </script>

</head>

<body>
  <div class="wrap">
    <section>
      <div class="content-home">
        <div class="slider">
          <div><img src="img/main_image1.jpg" alt="Image 1"></div>
          <div><img src="img/main_image2.jpg" alt="Image 2"></div>
          <div><img src="img/main_image3.jpg" alt="Image 3"></div>
          <div><img src="img/main_image4.jpg" alt="Image 4"></div>
          <div><img src="img/main_image5.jpg" alt="Image 5"></div>
          <div><img src="img/main_image6.jpg" alt="Image 6"></div>
          <div><img src="img/main_image7.jpg" alt="Image 7"></div>
        </div>
      </div>
    </section>
  </div>

    <!-- 챗봇 아이콘 시작 -->
    <button type="button" style="border:0; position: fixed; left: 0%; top: 10%; transform: translate(50%, -50%);" class="btn_bot" onclick="showChatbot();">
      <img src="/spam/img/botd.png" alt="챗봇 아이콘" class="chatbot-icon" style="width: 100px; height: 100px;">
  </button>
    <!-- 챗봇 아이콘 끝 -->

   <!-- 모달 창 -->
   <div id="chatbotModal" class="modal" onclick="closeModal()">
    <div class="modal-content" onclick="stopPropagation(event)">
        <span class="close" onclick="closeChatbot()">&times;</span>

        <button class="chat-button" onclick="showOptions(['가입/탈퇴', '로그인', '정보변경', '민원처리신청'])">개인정보</button>
        <button class="chat-button" onclick="showOptions(['예약상품 결제', '단체예약/장소대관', '비품대여'])">독서실</button>
        <button class="chat-button" onclick="showOptions(['등록/입점', '퇴점신청', '독서실 사업자 회원 탈퇴', '가격/정보변경'])">사업자 등록</button>
        <button class="chat-button" onclick="showOptions(['칭찬/불만사항 작성', '스팸광고/제휴 문의'])">기타상담</button>

        
    <!-- 이전 버튼 추가 -->
    <button id="prev-button" class="chat-button" onclick="loadLastState()">이전</button>
    
    </div>

</div>


</body>

<%@ include file="footer.jsp" %>

</html>