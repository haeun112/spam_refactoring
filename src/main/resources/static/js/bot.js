let chatHistory = [];

function saveState() { // 상태 저장
    const modalContent = document.querySelector('.modal-content');
    chatHistory.push(modalContent.innerHTML);
}

function applyEventListeners() { // 이벤트 리스너 적용
    const buttons = document.querySelectorAll('.chat-button');
    buttons.forEach((button) => {
        button.addEventListener('click', yourEventHandler); // yourEventHandler는 실제 이벤트를 처리하는 함수입니다.
    });
}

function loadLastState() { // 마지막 상태 불러오기
    const lastState = chatHistory[chatHistory.length - 1];
    if (lastState) {
        const modalContent = document.querySelector('.modal-content');
        modalContent.innerHTML = lastState;
        applyEventListeners(); // 이벤트 리스너 적용
    }
}


function showChatbot() {
    const modal = document.getElementById("chatbotModal");
    modal.style.right = "0"; // 모달을 오른쪽으로 이동
    modal.style.display = "block"; // 모달을 표시
}


function closeModal() {
    const modal = document.getElementById("chatbotModal");
    modal.style.display = "none";
}

function stopPropagation(event) {
    event.stopPropagation();
}

function sendMessage(message) {
    const modal = document.getElementById("chatbotModal");
    const modalContent = modal.querySelector('.modal-content');

    if (message === '개인정보') {
        showOptions(['가입/탈퇴', '로그인', '정보변경', '민원처리신청']);
    } else if (message === '독서실') {
        showOptions(['예약상품 결제', '단체예약/장소대관', '비품대여']);
    } else if (message === '사업자 등록') {
        showOptions(['등록/입점', '퇴점신청', '독서실 사업자 회원 탈퇴', '가격/정보변경']);
    } else if (message === '기타상담') {
        showOptions(['칭찬/불만사항 작성', '스팸광고/제휴 문의']);
    } else {
        // 기타 메시지 처리
    }

    closeChatbot();
}




function showOptions(options) {
    saveState();
    const modalContent = document.querySelector('.modal-content');
    modalContent.innerHTML = ''; // 기존 내용 초기화

    for (const option of options) {
        const optionButton = document.createElement('button');
        optionButton.className = 'chat-button';
        optionButton.textContent = option;
        optionButton.onclick = () => showSubOptions(option);
        modalContent.appendChild(optionButton);
    }
      // '이전' 버튼 추가
      const prevButton = document.createElement('button');
      prevButton.id = 'prev-button';
      prevButton.onclick = () => loadLastState();
      prevButton.textContent = '이전';
      modalContent.appendChild(prevButton);
}

function showSubOptions(parentOption) {
    saveState();
    const modalContent = document.querySelector('.modal-content');
    modalContent.innerHTML = ''; // 기존 내용 초기화
     
    const subOptions = [];
    // 여기에 해당 parentOption 에 따른 하위 옵션을 추가 예정
        //개인정보
    if (parentOption === '가입/탈퇴') {
        subOptions.push('회원 탈퇴는 어떻게 하나요?', '미성년자(14세 미만)도 가입 가능한가요?', '회원가입 시 휴대폰 본인인증 오류가 발생됩니다.');
    } else if (parentOption === '로그인') {
        subOptions.push('로그인 시 등록되지 않은 아이디라고 나옵니다.', '로그인이 안되는 경우는 어떻게 하나요?', '로그인 시 휴먼계정 안내가 됩니다.');
    } else if (parentOption === '정보변경') {
        subOptions.push('회원 아이디, 비밀번호 변경', '휴대폰 번호, 이메일 주소 변경', '이름, 생년월일, 성별 변경', '개명 절차가 어떻게 되나요?');
    } else if (parentOption === '민원처리신청') {
        subOptions.push('작성한 리뷰를 확인하려면 어떻게 하나요?', '예약내역을 확인하고 싶습니다.', '내가 작성한 문의 내역을 확인하고 싶습니다.');
        //독서실
    } else if (parentOption === '예약상품 결제') {
        subOptions.push('결제안내/결제내역 확인', '예약변경/현금영수증', '결제취소/환불');
    } else if (parentOption === '단체예약/장소대관') {
        subOptions.push('단체예약/장소대관 예약 상담은 어디서 하나요?', '범인카드로 결제는 어떻게 하나요?');
    } else if (parentOption === '비품대여') {
        subOptions.push('콘센트 대여 되나요?', '비품대여 신청은 어디서 하나요?');
        //사업자 등록
    } else if (parentOption === '등록/입점') {
        subOptions.push('독서실 등록은 어디서 하나요?', '입점신청 시 바로 운영가능한가요? ', '독서실을 하나 이상 등록 가능한가요?');
    }else if (parentOption === '퇴점신청') {
        subOptions.push('독서실 퇴점신청은 어디서 하나요?');
    }else if (parentOption === '독서실 사업자 회원 탈퇴') {
        subOptions.push('사업자 회원 탈퇴하기');
    }else if (parentOption === '가격/정보변경') {
        subOptions.push('독서실 가격 및 정보 변경');
        //기타 상담
    }else if (parentOption === '칭찬/불만사항 작성') {
        subOptions.push('독서실 칭찬이나 불만사항은 어디에 작성하나요?');
    }else if (parentOption === '스팸광고/제휴 문의') {
        subOptions.push('스팸 광고 및 제휴문의');
    }
     
    
    // 하위 옵션 버튼 생성 및 클릭 이벤트 할당
     for (const optionText of subOptions) {
        const optionButton = document.createElement('button');
        optionButton.className = 'chat-button';
        optionButton.textContent = optionText;
        optionButton.onclick = function() {
            handleOptionClick(optionText);
        };
        modalContent.appendChild(optionButton);
    }
    
     // '이전' 버튼 추가
     const prevButton = document.createElement('button');
     prevButton.id = 'prev-button';
     prevButton.onclick = () => loadLastState();
     prevButton.textContent = '이전';
     modalContent.appendChild(prevButton);
}


// 추가 코드 //
    modalContent.innerHTML = ''; // 기존 내용 초기화
    // 하위 옵션 버튼 생성 및 클릭 이벤트 할당
    for (const optionText of subOptions) {
        const optionButton = document.createElement('button');
        optionButton.className = 'chat-button';
        optionButton.textContent = optionText;
        optionButton.onclick = function() {
            handleOptionClick(optionText);
        };
        modalContent.appendChild(optionButton);
    }

// 추가 코드 //

// --개인정보--가입/탈퇴 시작--// 
function handleOptionClick(option) {
    const modalContent = document.querySelector('.modal-content');
    modalContent.innerHTML = ''; // 기존 내용 초기화

    const responseMessage = document.createElement('div');
    responseMessage.className = 'chat-message bot';

    if (option === '회원 탈퇴는 어떻게 하나요?') {    // option 선택 if문으로 감싸기 !  추가 코드 //
       
        responseMessage.textContent = '회원 탈퇴기능은 "마이페이지" 하단에 있습니다.';
        const link = document.createElement('a');
        link.href = "/spam/i_mypage"; // 회원 탈퇴 페이지 링크
        link.textContent = '마이페이지 바로가기';
        responseMessage.appendChild(document.createElement('br'));
        responseMessage.appendChild(link);

        modalContent.appendChild(responseMessage);

    } else if (option === '미성년자(14세 미만)도 가입 가능한가요?') {   

        responseMessage.textContent = '미성년 회원의 이용이 가능합니다.\n회원가입을 원하시면 아래 링크를 클릭해주세요';
        responseMessage.style.whiteSpace = 'pre-line';

        const link = document.createElement('a');
        link.href = "/spam/member/joinfrm"; // 페이지 링크
        link.textContent = '회원가입으로 이동하기';
        responseMessage.appendChild(document.createElement('br'));
        responseMessage.appendChild(link);

        modalContent.appendChild(responseMessage);

    }else if (option === '회원가입 시 휴대폰 본인인증 오류가 발생됩니다.') {    
        
        responseMessage.textContent = '휴대폰 본인 인증으로 가입하시는 경우 본인 명의의 개통 정보로 가입하셔야 합니다. \n' +  
        '스팸 회원 가입 시 휴대폰 본인 인증 오류인 경우 농심신용평가정보㈜ 고객센터로 하시어 안내를 받으신 후 재가입 시도를 해주셔야 합니다. \n' +  
        '농심신용평가정보(주) 고객센터 :1588-8282';
        responseMessage.style.whiteSpace = 'pre-line';

        const link = document.createElement('a');
        link.href = "/spam/member/joinfrm"; // 페이지 링크
        link.textContent = '회원가입으로 이동하기';
        responseMessage.appendChild(document.createElement('br'));
        responseMessage.appendChild(link);

        modalContent.appendChild(responseMessage);
        
        // --개인정보--가입/탈퇴완--//

         // --개인정보--로그인 시작--//

    }else if (option === '로그인 시 등록되지 않은 아이디라고 나옵니다.') {   
        
        responseMessage.textContent = '스팸 회원 아이디는 이메일 주소 형식(예: spam@study.com)으로 대소문자를 구분합니다. \n ' +
        '첫 글자가 자동으로 대문자로 입력되지 않았는지 확인 부탁드립니다. \n ' + 
        '또한 아이디/비밀번호가 기억나지 않으실 경우 스팸 홈페이지에서 아이디/비밀번호 찾기를 통해 정확한 아이디 정보를 확인 후 로그인 해 주시기 바랍니다.';  
        responseMessage.style.whiteSpace = 'pre-line';

        const link = document.createElement('a');
        link.href = "/spam/member/i_login"; // 페이지 링크
        link.textContent = '아이디 비밀번호 찾기';
        responseMessage.appendChild(document.createElement('br'));
        responseMessage.appendChild(link);

        modalContent.appendChild(responseMessage);
    
    }else if (option === '로그인이 안되는 경우는 어떻게 하나요?') {    
       
        responseMessage.textContent = ' 아이디 또는 비밀번호를 다시 확인해 주세요. \n' +
        '스팸에 가입되지 않은 아이디이거나 아이디 또는 비밀번호를 잘못 입력하지 않았는지 확인해주세요 \n ' + 
        '스팸회원 아이디는 이메일 주소 형식(예: spam@study.com)을 대소문자를 구분하기 때문에 \n'+ 
        '아이디 첫 글자가 자동으로 대문자로 입력되지 않았는지 확인 부탁드리며, 아이디/비밀번호가 기억나지 않으실 경우 아래 링크를 통해 아이디/비밀번호 찾기를 이용해주시기 바랍니다';  
        responseMessage.style.whiteSpace = 'pre-line';
        
        const link = document.createElement('a');
        link.href = "/spam/member/i_login"; // 페이지 링크
        link.textContent = '아이디 비밀번호 찾기';
        responseMessage.appendChild(document.createElement('br'));
        responseMessage.appendChild(link);

        modalContent.appendChild(responseMessage);
    
    } else if (option === '로그인 시 휴먼계정 안내가 됩니다.') {    
       
        responseMessage.textContent = '휴면 계정이란, 최종 로그인 시점으로부터 웹 회원 유지 기간 동안 스팸서비스 이용 이력이 없으신 경우' + 
        '고객님의 개인정보 보호를 위해 본인 인증 후 로그인이 가능하도록 처리한 계정을 의미합니다.' + 
        '로그인 시 휴면 처리 되어 있을 경우 [계정 활성화]를 해주시면 휴면이 해제되며 재로그인 시 서비스 정상 이용이 가능합니다.';
        responseMessage.style.whiteSpace = 'pre-line';

        const link = document.createElement('a');
        link.href = "/spam/member/i_login"; // 페이지 링크
        link.textContent = '로그인으로 이동하기';
        responseMessage.appendChild(document.createElement('br'));
        responseMessage.appendChild(link);

        modalContent.appendChild(responseMessage);

        // --개인정보--로그인 완료--//

        // --개인정보--정보변경 시작--//

    }else if (option === '회원 아이디, 비밀번호 변경') {   
       
        responseMessage.textContent = '회원님의 아이디 변경을 위해서는 "마이페이지" - "정보수정"을 통해 변경 가능합니다.';
        responseMessage.style.whiteSpace = 'pre-line';

        const link = document.createElement('a');
        link.href = "i_mypage"; // 페이지 링크
        link.textContent = '마이페이지로 바로가기';
        responseMessage.appendChild(document.createElement('br'));
        responseMessage.appendChild(link);

        modalContent.appendChild(responseMessage);
    }else if (option === '휴대폰 번호, 이메일 주소 변경') {   
       
        responseMessage.textContent = '회원님의 휴대폰 번호, 이메일 주소 변경을 위해서는 "마이페이지" - "정보수정" 을 통해 변경 가능합니다.';
        responseMessage.style.whiteSpace = 'pre-line';

        const link = document.createElement('a');
        link.href = "i_mypage"; // 페이지 링크
        link.textContent = '마이페이지로 바로가기';
        responseMessage.appendChild(document.createElement('br'));
        responseMessage.appendChild(link);

        modalContent.appendChild(responseMessage);

    }else if (option === '이름, 생년월일, 성별 변경') {    
        
        responseMessage.textContent = '회원님의 이름, 생년월일, 성별 변경을 위해서는 "마이페이지" - "정보수정" 을 통해 변경 가능합니다.';
        responseMessage.style.whiteSpace = 'pre-line';

        const link = document.createElement('a');
        link.href = "i_mypage"; // 페이지 링크
        link.textContent = '마이페이지로 바로가기';
        responseMessage.appendChild(document.createElement('br'));
        responseMessage.appendChild(link);

        modalContent.appendChild(responseMessage);


    }else if (option === '개명 절차가 어떻게 되나요?') {   
       
        responseMessage.textContent = '제출 서류를 준비하시어 이메일 또는 우편으로 접수해주시면 담당팀 확인 후 개명 처리를 해드립니다.' +
        '제출서류 : 개인정보 민원처리 신청서, 신분증 사본(뒷자리 가림)(운전면허증 또는 여권)' +
        '■ 서류접수 하실 곳' + 
        '(이메일) hnt_privacy@hanatour.com'+
        '(주소) 서울특별시 모구모구 얼음동동상길 41 스팸컴퍼니빌딩 와랄랄라팀';
        responseMessage.style.whiteSpace = 'pre-line';

        modalContent.appendChild(responseMessage);

        //--개인정보--정보변경 완료-- //

        //--개인정보--민원처리 신청 시작-- //

    }else if (option === '작성한 리뷰를 확인하려면 어떻게 하나요?') {    // option 선택 if문으로 감싸기 !  추가 코드 //
       
        responseMessage.textContent = '작성한 리뷰 확인방법은 로그인 후  "마이페이지" - "예약 및 리뷰" 페이지에서 확인 가능합니다.';
        responseMessage.style.whiteSpace = 'pre-line';

        const link = document.createElement('a');
        link.href = "i_mypage/list/review_list"; // 페이지 링크
        link.textContent = '나의 이용내역 페이지로 바로가기';
        responseMessage.appendChild(document.createElement('br'));
        responseMessage.appendChild(link);

        modalContent.appendChild(responseMessage);  


}else if (option === '예약내역을 확인하고 싶습니다.') {    
  
    responseMessage.textContent = '예약내역 확인방법은 로그인 후  "마이페이지" - "예약 및 리뷰" 페이지에서 확인 가능합니다.';
    responseMessage.style.whiteSpace = 'pre-line';

    const link = document.createElement('a');
    link.href = "i_mypage/list"; // 페이지 링크
    link.textContent = '나의 이용내역 페이지로 바로가기';
    responseMessage.appendChild(document.createElement('br'));
    responseMessage.appendChild(link);

    modalContent.appendChild(responseMessage);  


}else if (option === '내가 작성한 문의 내역을 확인하고 싶습니다.') {    
   
    responseMessage.textContent = '작성한 문의 내역 확인은 로그인 후  "마이페이지" - "나의 문의 내역" 페이지에서 확인 가능합니다.';
    responseMessage.style.whiteSpace = 'pre-line';

    const link = document.createElement('a');
    link.href = "i_mypage/myqna"; // 페이지 링크
    link.textContent = '내가 작성한 글 보기 페이지로 바로가기';
    responseMessage.appendChild(document.createElement('br'));
    responseMessage.appendChild(link);

    modalContent.appendChild(responseMessage);  
     
    //--개인정보--민원처리 신청 완료-- //
      
    //--독서실/스터디룸--예약상품 결제 시작-- //

}else if (option === '결제안내/결제내역 확인') {   
   
    responseMessage.textContent = '결제내역은 "마이페이지" > "결제내역안내" 에서 확인하실 수 있습니다.';
    responseMessage.style.whiteSpace = 'pre-line';

    const link = document.createElement('a');
    link.href = "spam/member/i_mypage"; // 페이지 링크
    link.textContent = '결제내역 바로가기';
    responseMessage.appendChild(document.createElement('br'));
    responseMessage.appendChild(link);

    modalContent.appendChild(responseMessage);  


} else if (option === '예약변경/현금영수증') {    
  
    responseMessage.textContent = '';
    responseMessage.style.whiteSpace = 'pre-line';

    const link = document.createElement('a');
    link.href = "spam/member/c_login"; // 페이지 링크
    link.textContent = '바로가기';
    responseMessage.appendChild(document.createElement('br'));
    responseMessage.appendChild(link);

    modalContent.appendChild(responseMessage);  


} else if (option === '결제취소/환불') {   
    
    responseMessage.textContent = '';
    responseMessage.style.whiteSpace = 'pre-line';

    const link = document.createElement('a');
    link.href = "spam/member/c_login"; // 페이지 링크
    link.textContent = '바로가기';
    responseMessage.appendChild(document.createElement('br'));
    responseMessage.appendChild(link);

    modalContent.appendChild(responseMessage);  
    //--독서실/스터디룸--예약상품 결제 완료-- //

    //--독서실/스터디룸--단체예약/장소대관  시작-- //

} else if (option === '단체예약/장소대관 예약 상담은 어디서 하나요?') {    
   
    responseMessage.textContent = '';
    responseMessage.style.whiteSpace = 'pre-line';

    const link = document.createElement('a');
    link.href = "/spam/member/c_login"; // 페이지 링크
    link.textContent = '바로가기';
    responseMessage.appendChild(document.createElement('br'));
    responseMessage.appendChild(link);

    modalContent.appendChild(responseMessage);  


} else if (option === '범인카드로 결제는 어떻게 하나요?') {    
   
    responseMessage.textContent = '';
    responseMessage.style.whiteSpace = 'pre-line';

    const link = document.createElement('a');
    link.href = "/spam/member/c_login"; // 페이지 링크
    link.textContent = '바로가기';
    responseMessage.appendChild(document.createElement('br'));
    responseMessage.appendChild(link);

    modalContent.appendChild(responseMessage);  
    //--독서실/스터디룸--단체예약/장소대관  완료-- //

    //--독서실/스터디룸--비품대여 시작-- //

} else if (option === '콘센트 대여 되나요?') {    
   
    responseMessage.textContent = '콘센트 대여 되나요?';
    responseMessage.style.whiteSpace = 'pre-line';

    const link = document.createElement('a');
    link.href = "/spam/member/c_login"; // 페이지 링크
    link.textContent = '바로가기';
    responseMessage.appendChild(document.createElement('br'));
    responseMessage.appendChild(link);

    modalContent.appendChild(responseMessage);  


} else if (option === '비품대여 신청은 어디서 하나요?') {   
   
    responseMessage.textContent = '비품대여신청은 독서실 선택 후 예약하기 클릭 시 옵션선택으로 신청 가능합니다.' + 
    '독서실 예약에서 비품신청을 못 하셨다면, "마이페이지" - "예약내역" 에서 예약하신 독서실을 선택 후 신청 가능합니다.';
    responseMessage.style.whiteSpace = 'pre-line';

    const link = document.createElement('a');
    link.href = "/spam/member/c_login"; // 페이지 링크
    link.textContent = '바로가기';
    responseMessage.appendChild(document.createElement('br'));
    responseMessage.appendChild(link);

    modalContent.appendChild(responseMessage);  
    //--독서실/스터디룸--비품대여 완료-- //

    //--사업자 등록--독서실 등록/입점 시작 -- //

} else if (option === '독서실 등록은 어디서 하나요?') {   
   
    responseMessage.textContent = '';
    responseMessage.style.whiteSpace = 'pre-line';

    const link = document.createElement('a');
    link.href = "/spam/member/c_login"; // 페이지 링크
    link.textContent = '바로가기';
    responseMessage.appendChild(document.createElement('br'));
    responseMessage.appendChild(link);

    modalContent.appendChild(responseMessage);  


} else if (option === '입점신청 시 바로 운영가능한가요?') {    
   
    responseMessage.textContent = ' ';
    responseMessage.style.whiteSpace = 'pre-line';

    const link = document.createElement('a');
    link.href = "/spam/member/c_login"; // 페이지 링크
    link.textContent = '바로가기';
    responseMessage.appendChild(document.createElement('br'));
    responseMessage.appendChild(link);

    modalContent.appendChild(responseMessage);  


} else if (option === '독서실을 하나 이상 등록 가능한가요?') {    
   
    responseMessage.textContent = ' ';
    responseMessage.style.whiteSpace = 'pre-line';

    const link = document.createElement('a');
    link.href = "/spam/member/c_login"; // 페이지 링크
    link.textContent = '바로가기';
    responseMessage.appendChild(document.createElement('br'));
    responseMessage.appendChild(link);

    modalContent.appendChild(responseMessage);  
     //--사업자 등록--독서실 등록/입점 완료 -- //

       //--사업자 등록--독서실 퇴점 신청 -- //
} else if (option === '독서실 퇴점신청은 어디서 하나요?') {   
   
    responseMessage.textContent = '';
    responseMessage.style.whiteSpace = 'pre-line';

    const link = document.createElement('a');
    link.href = "/spam/member/c_login"; // 페이지 링크
    link.textContent = '바로가기';
    responseMessage.appendChild(document.createElement('br'));
    responseMessage.appendChild(link);

    modalContent.appendChild(responseMessage);  
     //--사업자 등록--독서실 퇴점신청완료 -- //


      //--사업자 등록--독서실 사업자 회원 탈퇴 시작 -- //

} else if (option === '사업자 회원 탈퇴 과정') {    
   
    responseMessage.textContent = '?';
    responseMessage.style.whiteSpace = 'pre-line';

    const link = document.createElement('a');
    link.href = "/spam/member/c_login"; // 페이지 링크
    link.textContent = '바로가기';
    responseMessage.appendChild(document.createElement('br'));
    responseMessage.appendChild(link);

    modalContent.appendChild(responseMessage);  
     //--사업자 등록--독서실 사업자 회원 탈퇴 시작 -- //

     //--사업자 등록--독서실 가격/정보변경 시작 -- //
} else if (option === '독서실 가격 및 정보 변경?') {    
   
    responseMessage.textContent = '?';
    responseMessage.style.whiteSpace = 'pre-line';

    const link = document.createElement('a');
    link.href = "/spam/member/c_login"; // 페이지 링크
    link.textContent = '바로가기';
    responseMessage.appendChild(document.createElement('br'));
    responseMessage.appendChild(link);

    modalContent.appendChild(responseMessage);  
    //--사업자 등록--독서실 가격/정보변경 시작 -- //

     //--기타상담  이용 후 칭찬/불만 작성 시작-- //

}else if (option === '독서실 칭찬이나 불만사항은 어디에 작성하나요?') {    
   
    responseMessage.textContent = '?';
    responseMessage.style.whiteSpace = 'pre-line';

    const link = document.createElement('a');
    link.href = "/spam/member/c_login"; // 페이지 링크
    link.textContent = '바로가기';
    responseMessage.appendChild(document.createElement('br'));
    responseMessage.appendChild(link);

    modalContent.appendChild(responseMessage);  
    //--기타상담 스팸광고/제휴 문의-- //

} else if (option === '스팸 광고 및 제휴문의') {  
    responseMessage.textContent = '?';
    responseMessage.style.whiteSpace = 'pre-line';

    const link = document.createElement('a');
    link.href = "/spam/member/c_login"; // 페이지 링크
    link.textContent = '바로가기';
    responseMessage.appendChild(document.createElement('br'));
    responseMessage.appendChild(link);

    modalContent.appendChild(responseMessage);  
    //--기타상담 완료-- //

}   
    showOptions(subOptions);
}