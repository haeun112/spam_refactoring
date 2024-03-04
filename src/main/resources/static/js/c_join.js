$(document).ready(function () {
    let isIdAvailable = false;
    // 아이디 중복 확인 버튼 클릭 시
    $("#id_check").click(function () {
        let company_id = $("#company_id").val();
        let idCheckMsg = $("#id_check_msg");
        let customer_id = $("#company_id").val();
        // 아이디 유효성 검사
        let idPattern = /^[a-z][a-z0-9]{4,11}$/;

        if (!idPattern.test(company_id, customer_id)) {
            idCheckMsg.html(
                "아이디는 영문 소문자로 시작하고, 영문 소문자와 숫자로만 구성되어야 합니다. 길이는 5자 이상 12자 이하여야 합니다."
            );
        } else {

            // 유효한 아이디인 경우, 중복 확인 AJAX 요청 보내기
            $.ajax({
                url: "/spam/member/check/id", // 아이디 중복 확인 주소로 변경
                type: "GET",
                data: {
                    company_id: company_id,
                    customer_id: customer_id
                },
                success: function (response) {
                    if (response === "exists") {
                        idCheckMsg.html("이미 사용 중인 아이디입니다.");
                        isIdAvailable = false;
                    } else {
                        idCheckMsg.html(
                            "<span style='color: blue;'>사용 가능한 아이디 입니다.</span>"
                        );
                        isIdAvailable = true;
                    }
                },
                error: function () {
                    idCheckMsg.html("아이디 중복 확인 중 오류가 발생했습니다.");
                    isIdAvailable = false;
                }
            });
        }
    });

    // 가입하기 버튼 클릭 시
    $("button[type='submit']").click(function (event) {
        if (!isIdAvailable) {
            event.preventDefault();
            alert("아이디 중복 확인을 먼저 해주세요.");
        } else {
            let password = $("#company_pwd").val();
            let confirmPassword = $("#company_pwd_re").val();
            let passwordErrorMsg = $("#password_mismatch_msg");

            if (password !== confirmPassword) {
                passwordErrorMsg.html("비밀번호가 일치하지 않습니다.");
                event.preventDefault();
            } else {
                passwordErrorMsg.html(""); // 비밀번호 불일치 메시지 초기화

                // 비밀번호 유효성 검사 추가
                let passwordPattern =
                    /^(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

                if (!passwordPattern.test(password)) {
                    passwordErrorMsg.html(
                        "비밀번호는 소문자, 숫자, 특수문자를 혼합하여 8자 이상으로 설정해야 합니다."
                    );
                    event.preventDefault();
                } else {
                    // 여기에 폼을 서버로 제출하는 로직을 추가할 수 있습니다.
                }
            }
        }
    });


    // 비밀번호 확인 입력란 값 변경 시
    $("#company_pwd_re").keyup(function () {
        let password = $("#company_pwd").val();
        let confirmPassword = $(this).val();
        let mismatchMsg = $("#password_mismatch_msg");

        if (password !== confirmPassword) {
            mismatchMsg.html("비밀번호가 일치하지 않습니다.");
        } else {
            mismatchMsg.html("<span style='color: blue;'>비밀번호가 일치합니다.</span>");
        }
    });
    // 전화번호 입력 필드에 자동으로 하이픈 추가 및 유효성 검사
    $("#company_phone").keyup(function () {
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
    // 사업자 번호 입력 필드에 자동으로 하이픈 추가 및 유효성 검사
    $("#company_businessnum").keyup(function () {
        autoHyphenForBusinessNum(this);

        let businessnum = $(this).val();
        let businessPattern = /^\d{3}-\d{2}-\d{5}$/;
        let businessErrorMsg = $("#business_error_msg");

        if (!businessPattern.test(businessnum)) {
            businessErrorMsg.html('사업자번호 형식에 맞게 입력해주세요 ex - (123-45-67890)');
        } else {
            businessErrorMsg.html('');
        }

        // 사업자 번호 자릿수 제한
        if (businessnum.replace(/[^0-9]/g, '').length > 10) {
            $(this).val(businessnum.substring(0, 10));
        }
    });

    // 하이픈 자동 추가
    const autoHyphenForBusinessNum = (target) => {
        target.value = target.value
            .replace(/[^0-9]/g, '') // 숫자 이외의 문자 제거
            .replace(/^(\d{0,3})(\d{0,2})(\d{0,5})$/g, "$1-$2-$3") // 하이픈 추가
            .replace(/(\-{1,2})$/g, ""); // 끝에 있는 하이픈 제거
    };

    // 전화번호 입력 필드에 자동으로 하이픈 추가하는 함수
    const autoHyphen = (target) => {
        target.value = target.value
            .replace(/[^0-9]/g, '') // 숫자 이외의 문자 제거
            .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3") // 하이픈 추가
            .replace(/(\-{1,2})$/g, ""); // 끝에 있는 하이픈 제거
    };
});