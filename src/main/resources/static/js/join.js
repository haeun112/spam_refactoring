$(document).ready(function () {
    $("#customer_birth").keyup(function () {
        let birth = $(this).val();
        let birthPattern = /^[0-9]{4}[0-9]{2}[0-9]{2}$/;

        let birthErrorMsg = $("#birth_error_msg");

        if (!birthPattern.test(birth)) {
            birthErrorMsg.html("생년월일 형식에 맞게 입력해주세요 (YYYYMMDD)");
        } else {
            // 생년월일의 유효성 검사
            let year = parseInt(birth.substring(0, 4));
            let month = parseInt(birth.substring(4, 6)) - 1; // 월은 0부터 시작
            let day = parseInt(birth.substring(6, 8));

            let date = new Date(year, month, day);

            if (date.getFullYear() !== year || date.getMonth() !== month || date.getDate() !==
                day) {
                birthErrorMsg.html("유효하지 않은 날짜입니다.");
            } else {
                birthErrorMsg.html("");
            }
        }
        // 생년월일 자릿수 제한
        if (birth.replace(/[^0-9]/g, '').length > 8) {
            $(this).val(birth.substring(0, 8));
        }
    });
    // 아이디 중복 확인 버튼 클릭 시
    $("#id_check").click(function () {
        let customer_id = $("#customer_id").val();
        let idCheckMsg = $("#id_check_msg");

        $.ajax({
            url: "/spam/member/check/id", // 아이디 중복 확인 주소로 변경
            type: "GET",
            data: {
                customer_id: customer_id
            },
            success: function (response) {
                if (response === "exists") {
                    idCheckMsg.html("이미 사용 중인 아이디입니다.");
                } else {
                    idCheckMsg.html(
                        "<span style='color: blue;'>사용 가능한 아이디 입니다.</span>");
                }
            },
            error: function () {
                idCheckMsg.html("아이디 중복 확인 중 오류가 발생했습니다.");
            }
        });
    });

    // 비밀번호 확인 입력란 값 변경 시
    $("#customer_pwd_re").keyup(function () {
        let password = $("#customer_pwd").val();
        let confirmPassword = $(this).val();
        let mismatchMsg = $("#password_mismatch_msg");

        if (password !== confirmPassword) {
            mismatchMsg.html("비밀번호가 일치하지 않습니다.");
        } else {
            mismatchMsg.html("<span style='color: blue;'>비밀번호가 일치합니다.</span>");
        }
    });
    // 전화번호 입력 필드에 자동으로 하이픈 추가 및 유효성 검사
    $("#customer_phone").keyup(function () {
        autoHyphen(this);

        let phoneNumber = $(this).val();
        let phonePattern = /^\d{3}-\d{3,4}-\d{4}$/;

        let phoneErrorMsg = $("#phone_error_msg");

        if (!phonePattern.test(phoneNumber)) {
            phoneErrorMsg.html("전화번호 형식에 맞게 입력해주세요 (-)자동 입력 (010-1234-5678)");
        } else {
            phoneErrorMsg.html("");
        }
        // 전화번호 자릿수 제한
        if (phoneNumber.replace(/[^0-9]/g, '').length > 11) {
            $(this).val(phoneNumber.substring(0, 11));
        }
    });

    // 전화번호 입력 필드에 자동으로 하이픈 추가하는 함수
    const autoHyphen = (target) => {
        target.value = target.value
            .replace(/[^0-9]/g, '')
            .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3")
            .replace(/(\-{1,2})$/g, "");
    };
});