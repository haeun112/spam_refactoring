<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Button Chatbot</title>
    <link rel="icon" href="https://img.icons8.com/color/48/spam-can.png" type="image/png">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="/spam/js/bot.js"></script>
    <link rel="stylesheet" href="/spam/css/bot.css">
</head>

<body>
    
    <button type="button" style="border:0" class="btn_bot" onclick="showChatbot()">
        <img src="/spam/img/botd.png" alt="챗봇 아이콘" class="chatbot-icon">
    </button>
    
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
</html>

