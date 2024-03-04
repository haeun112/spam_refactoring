// return.js 파일
document.addEventListener("DOMContentLoaded", function() {
    document.getElementById("returnButton").addEventListener("click", function() {
        // 반납 정보를 담은 객체 생성
        const requestData = {
            roomName: document.getElementById("roomName").value,
            equipmentName: document.getElementById("equipmentName").value,
            startTime: document.getElementById("startTime").value,
            returnTime: document.getElementById("returnTime").value,
        };

        // 서버에 반납을 요청하기 위한 AJAX 요청
        $.ajax({
            url: "/백엔드-엔드포인트-URL",  // 이 부분을 프로젝트에 맞게 수정해주세요.
            method: "POST",  // POST나 PUT 메서드를 사용할 수 있습니다.
            data: requestData,
            success: function(data) {
                // 성공적으로 반납이 이루어졌다는 메시지를 출력
                alert("반납이 완료되었습니다.");

                // 만약 필요하다면 이곳에서 페이지를 리로드하거나 다른 페이지로 리디렉션할 수 있습니다.
                // 예: window.location.reload();
            },
            error: function() {
                // 서버에서 데이터를 처리하는 중 오류가 발생했다는 메시지를 출력
                alert("서버에서 데이터를 처리하는 중 오류가 발생했습니다.");
            }
        });
    });
});
