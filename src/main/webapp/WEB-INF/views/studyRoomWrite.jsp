<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPAM : 독서실 등록</title>
    <style>
          body{
            background-color: #f0e9e4 !important;  /* 밝은 베이지 */
        }

       .c_insert{
    position: relative; /* 상대 위치 지정 */
    left: 20%;
    top: 20%;
    transform: translate(-20%, -20%); /* 화면 중앙 정렬을 위한 transform 사용 */
}

.c_insert  h1{
position: fixed; /* 고정 위치 지정 */
left: 20%; /* 왼쪽에서 20% */
top: -100%; /* 위에서 20% */
transform: translate(-20%, 100%); /* 화면 중앙 정렬을 위한 transform 사용 */
}

.std-button {
            /* 스타일을 원하는 대로 설정 */
            padding: 10px 20px;
            background-color: #FFF0F0;
            color: #442727;
            border: none;
            cursor: pointer;
            width: 120px;
            max-width: 200px;
            height: 50px;
            border-radius: 30px; /* 모서리 둥글게 설정 */
            position: relative;
            left: 75%;
            top: 650px;
        }

.c_menu {
display: flex; /* Flexbox 사용 */
flex-direction: column; /* 세로로 정렬 */
align-items: center; /* 가운데 정렬 */
position: absolute;
left: 5%; /* 왼쪽에서 10% 여백 */
top: 30%; /* 위에서 20% 여백 */
}

.btn_cmenu {
display: flex;
flex-direction: column; /* 세로로 정렬 */
gap: 10px; /* 버튼 사이의 간격 조절 */
width: 100%;
}

.btn_cmenu button {
/* 버튼 스타일 */
padding: 10px 20px;
background-color: #442727;
color: #DCE682;
border: none;
cursor: pointer;
width: 120px; /* 버튼 상자 너비 설정 */
max-width: 200px; /* 최대 가로 너비 설정 (원하는 크기로 조정 가능) */
height: 50px; /* 버튼 상자 높이 설정 */
}

form#stdForm1 {
            position: absolute;
            top: 30%; /* 원하는 아래쪽 여백 조정 */
            right: 38%; /* 원하는 오른쪽 여백 조정 */
            font-size: 28px; /* 폰트 크기를 원하는 크기로 설정 */
        }

        input[name^="stdR"] {
            display: block;
  width: 100%;
  font-size: inherit; /* 폰트 크기를 상속받도록 수정 */
  line-height: inherit; /* 라인 높이를 상속받도록 수정 */
  font-family: inherit; /* 폰트 패밀리를 상속받도록 수정 */
  margin-bottom: inherit; /* 마진을 상속받도록 수정 */
  border: none;
  margin-bottom: 20px; /* 마진을 추가하여 공백 생성 */
  border: none;
  border-bottom: 5px solid #AA7070;
  background: #AA7070; /* $form-bg 변수를 직접 값을 대입해 주세요 */
  min-width: 250px;
  padding-left: 5px;
  outline: none;
  color: white;
        }

        input[name^="stdR"]:focus {
  border-bottom: 5px solid #fff; /* $form-shadow 변수를 직접 값을 대입해 주세요 */
}
input:-webkit-autofill,
input:-webkit-autofill:hover,
input:-webkit-autofill:focus {
  border-bottom: 5px solid #442727;
  -webkit-text-fill-color: #fff;
  -webkit-box-shadow: 0 0 0px 1000px #AA7070 inset;
  transition: background-color 5000s ease-in-out 0s;
}

        
        #stdB {
    display: block;
    margin: 0 auto;
    line-height: 32px; /* $font-size * 2를 계산한 값으로 변경해 주세요 */
    padding: 0 20px;
    background: #FFF0F0; /* $form-shadow 변수를 직접 값을 대입해 주세요 */
    letter-spacing: 2px;
    transition: 0.2s all ease-in-out;
    outline: none;
    border: 1px solid #442727;
    box-shadow: 3px 3px 1px 1px #442727, 3px 3px 1px 2px #442727;
    position: absolute;
    bottom: -45%; /* 원하는 아래쪽 여백 설정 */
    right: 30%; /* 원하는 오른쪽 여백 설정 */
}

#stdB:hover {
    background: #442727;
    color: white;
    border: 1px solid #442727;
}

 /* 숫자 입력 필드의 스타일 재정의 */
 input[type="number"]::-webkit-inner-spin-button,
    input[type="number"]::-webkit-outer-spin-button {
        -webkit-appearance: none;
        appearance: none;
        margin: 0; /* 버튼의 여백을 제거하여 숨깁니다. */
    }


    </style>
    <script>
        window.onload = function() {
    // 영업 시간 입력란을 가져옵니다.
    var stdRDescriptionInput = document.getElementById("stdRDescription");

    // 원하는 기본 값을 설정합니다.
    stdRDescriptionInput.value = "9~23 시";
};

        function std_write(){
            let stdRName = document.stdForm1.stdRName.value;
            let stdRDescription = document.stdForm1.stdRDescription.value;
            let stdRTPrice = document.stdForm1.stdRTPrice.value;
            let stdRDPrice = document.stdForm1.stdRDPrice.value;
            let stdRRegion = document.stdForm1.stdRRegion.value;

            if(stdRName ==""){
                alert("독서실명을 입력하세요");
                document.stdForm1.stdRName.focus();
                return;
            }
            if(stdRDescription ==""){
                alert("영업 시간을 입력하세요");
                document.stdForm1.stdRDescription.focus();
                return;
            }
            if(stdRTPrice ==""){
                alert("시간별 가격을 입력하세요");
                document.stdForm1.stdRTPrice.focus();
                return;
            }
            if(stdRDPrice ==""){
                alert("일별 가격을 입력하세요");
                document.stdForm1.stdRDPrice.focus();
                return;
            }
            if(stdRRegion ==""){
                alert("지역을 입력하세요");
                document.stdForm1.stdRRegion.focus();
                return;
            }

                    // 중복 키 예외 처리를 여기에서 확인하도록 수정
    <c:if test="${not empty errorAlert}">
        alert("${errorAlert}");
        // 오류 메시지 처리 후 필요한 동작 수행
        location.reload(); // 페이지를 리로드
    </c:if>

            document.stdForm1.action = "/spam/c_mypage/insert/write"; //insert 페이지로 std-form1에 저장된 자료를 전송함
            document.stdForm1.submit();
        }

        // 입력 필드에서 숫자 이외의 입력을 막는 함수
    function allowNumbersOnly(inputElement) {
        inputElement.value = inputElement.value.replace(/[^0-9]/g, '');
    }

    // 시간별 가격 입력 필드에서 숫자 이외의 입력을 막음
    document.getElementById('stdRTPrice').addEventListener('input', function() {
        allowNumbersOnly(this);
    });

    // 일별 가격 입력 필드에서 숫자 이외의 입력을 막음
    document.getElementById('stdRDPrice').addEventListener('input', function() {
        allowNumbersOnly(this);
    });

    </script>

    <link rel="icon" href="https://img.icons8.com/color/48/spam-can.png" type="image/png">
    <script src="js/code.jquery.com_jquery-3.7.0.min.js"></script>
    
</head>
<body>
    <%@ include file="header.jsp" %>
    <%-- Success message --%>
    <c:if test="${param.success == 'true'}">
        <div class="alert alert-success" role="alert">
            입력이 성공적으로 완료되었습니다.
        </div>
    </c:if>

    <%-- Error message --%>
    <c:if test="${param.success == 'false'}">
        <div class="alert alert-danger" role="alert">
            입력 중 오류가 발생하였습니다.
        </div>
    </c:if>
    <section class="c_insert">
        <h1>독서실 등록</h1>
        
    </section>
    <form id="stdForm1" name="stdForm1" method="post">
        <table>
            <tr>
                <td>독서실명</td>
                <td><input name="stdRName"></td>
            </tr>
            <tr>
                <td>영업 시간</td>
                <td><input name="stdRDescription" id="stdRDescription" value="9~23 시" readonly></td>
            </tr>
            <tr>
                <td>시간별 가격</td>
                <td><input name="stdRTPrice" type="number" min="0" step="1"></td>
            </tr>
            <tr>
                <td>일별 가격</td>
                <td><input name="stdRDPrice" type="number" min="0" step="1"></td>
            </tr>
            <tr>
                <td>지역</td>
                <td><input name="stdRRegion"></td>
            </tr>
              
                        
                <td>
                    
                    <input type="button" id="stdB" value="등록" onclick="std_write()">
            </td> 
            
            </tr>
            <!-- 등록 버튼을 누르면 위쪽에 있는 스크립트문에서 std_write() 함수가 호출되서 실행되어 insert 페이지로 자료를 전송한다. -->
        </table>

    </form>
    <%@ include file="footer.jsp" %>
</body>

</html>