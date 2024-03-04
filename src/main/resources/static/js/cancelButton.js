
function confirmCancel(status, start_time) {
    var now = new Date().getTime(); // 현재 시간 (타임스탬프)

    if (status === '0') {
        alert("이미 취소된 예약입니다.");
        return false;
    } else if (new Date(start_time).getTime() < now) { // start_time을 Date 객체로 변환하여 비교
        alert("취소가 불가능한 예약입니다.");
        return false;
    } else {
        // 예약 취소 확인 다이얼로그 표시
        var confirmed = confirm("예약을 취소하시겠습니까?");
        
        if (confirmed) {
            alert("취소가 완료되었습니다.");
        }
        return confirmed;
    }
}
