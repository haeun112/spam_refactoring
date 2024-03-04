<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en" data-bs-theme="auto">

<head>
    <script src="js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.115.4">
    <title>SPAM</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.3/examples/navbars-offcanvas/">



    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

    <link href="css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

    <style>
        @font-face {
            font-family: 'TheJamsil5Bold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        body {
            font-family: 'TheJamsil5Bold', sans-serif !important;
        }

        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }

        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }

        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }

        .btn-outline-light {
            --bs-btn-color: #fcf5a9 !important;
            --bs-btn-border-color: #f8f9fa !important;
            --bs-btn-hover-color: #e5ff00 !important;
            --bs-btn-hover-bg: #000000 !important;
            --bs-btn-hover-border-color: #f8f9fa !important;
            --bs-btn-focus-shadow-rgb: 248, 249, 250 !important;
            --bs-btn-active-color: #000 !important;
            --bs-btn-active-bg: #f8f9fa !important;
            --bs-btn-active-border-color: #f8f9fa !important;
            --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125) !important;
            --bs-btn-disabled-color: #f8f9fa !important;
            --bs-btn-disabled-bg: transparent !important;
            --bs-btn-disabled-border-color: #f8f9fa !important;
            --bs-gradient: none !important;
        }

        .btn-light {
            --bs-btn-color: #fcf5a9 !important;
            --bs-btn-bg: #8a7fd1 !important;
            --bs-btn-border-color: #f8f9fa;
            --bs-btn-hover-color: #e5ff00 !important;
            --bs-btn-hover-bg: #000000 !important;
            --bs-btn-hover-border-color: #fcfaa7 !important;
            --bs-btn-focus-shadow-rgb: 248, 249, 250 !important;
            --bs-btn-active-color: #000 !important;
            --bs-btn-active-bg: #fcfaa7 !important;
            --bs-btn-active-border-color: #fcfaa7 !important;
            --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125) !important;
            --bs-btn-disabled-color: #fcfaa7 !important;
            --bs-btn-disabled-bg: transparent !important;
            --bs-btn-disabled-border-color: #fcfaa7 !important;
            --bs-gradient: none !important;
        }

        .btn-bd-primary {
            --bd-violet-bg: #712cf9;
            --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

            --bs-btn-font-weight: 600;
            --bs-btn-color: var(--bs-white);
            --bs-btn-bg: var(--bd-violet-bg);
            --bs-btn-border-color: var(--bd-violet-bg);
            --bs-btn-hover-color: var(--bs-white);
            --bs-btn-hover-bg: #6528e0;
            --bs-btn-hover-border-color: #6528e0;
            --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
            --bs-btn-active-color: var(--bs-btn-hover-color);
            --bs-btn-active-bg: #5a23c8;
            --bs-btn-active-border-color: #5a23c8;
        }

        .bd-mode-toggle {
            z-index: 1500;
        }

        .offcanvas {
            background-color: #867070 !important;
            /* 어두운 배경색으로 변경 */
        }

        .offcanvas-title {
            color: #F5EBEB;
            /* 원하는 글씨 색상으로 변경 */
        }

        .navbar-dark.bg-dark {
            background-color: #867070 !important;
            /* 원하는 배경색으로 변경 */
        }

        .navbar-brand {
            color: #F5EBEB !important;
        }
    </style>


    <!-- Custom styles for this template -->
    <link href="navbars-offcanvas.css" rel="stylesheet">
    <link rel="icon" href="https://img.icons8.com/color/48/spam-can.png" type="image/png">


</head>



<svg xmlns="http://www.w3.org/2000/svg" class="d-none">
    <symbol id="check2" viewBox="0 0 16 16">
        <path
            d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z" />
    </symbol>
    <symbol id="circle-half" viewBox="0 0 16 16">
        <path d="M8 15A7 7 0 1 0 8 1v14zm0 1A8 8 0 1 1 8 0a8 8 0 0 1 0 16z" />
    </symbol>
    <symbol id="moon-stars-fill" viewBox="0 0 16 16">
        <path
            d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z" />
        <path
            d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z" />
    </symbol>
    <symbol id="sun-fill" viewBox="0 0 16 16">
        <path
            d="M8 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z" />
    </symbol>
</svg>




<main>
    <nav class="navbar navbar-dark bg-dark" aria-label="Dark offcanvas navbar">
        <div class="container-fluid">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/main">SPAM</a>

            <div class="d-flex justify-content-end align-items-center">

                <!-- 로그인 상태 확인 후 표시 여부 결정 -->
                <c:choose>
                    <c:when test="${not empty sessionScope.customer_id or not empty sessionScope.company_id}">
                        <span class="mx-2 text-light">
                            환영합니다, 
                            <c:choose>
                                <c:when test="${not empty sessionScope.customer_id}">
                                    ${sessionScope.customer_id} 님
                                </c:when>
                                <c:otherwise>
                                    ${sessionScope.company_id} 님
                                </c:otherwise>
                            </c:choose>
                        </span>
                        <!-- 로그아웃 버튼 -->
                        <a class="btn btn-outline-light mx-2 btn-logout" type="button"
                            href="${pageContext.request.contextPath}/member/logout" id="btn-logout">로그아웃</a>
                    </c:when>
                    <c:otherwise>
                        <button class="btn btn-outline-light mx-2 btn-login" type="button"
                            onclick="location.href='${pageContext.request.contextPath}/member/i_login'">로그인</button>
                        <button class="btn btn-light mx-2 btn-signup" type="button"
                            onclick="location.href='${pageContext.request.contextPath}/member/joinfrm'">회원가입</button>
                    </c:otherwise>
                </c:choose>


                <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas"
                    data-bs-target="#offcanvasNavbarDark" aria-controls="offcanvasNavbarDark"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
            <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasNavbarDark"
                aria-labelledby="offcanvasNavbarDarkLabel">

                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasNavbarDarkLabel">SPAM</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas"
                        aria-label="Close"></button>

                </div>

                <div class="offcanvas-body">

                    <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page"
                                href="${pageContext.request.contextPath}/main">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/search">독서실 검색</a>
                        </li>
                        <li class="nav-item dropdown">
                            <c:choose>
                                <c:when test="${not empty sessionScope.customer_id}">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/i_mypage">마이페이지</a>
                                </c:when>
                                <c:when test="${not empty sessionScope.company_id}">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/c_mypage">마이페이지</a>
                                </c:when>
                                <c:otherwise>
                                    <a class="nav-link" href="${pageContext.request.contextPath}/member/i_login" onclick="loginAlert()">마이페이지</a>
                                </c:otherwise>
                            </c:choose>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link " href="${pageContext.request.contextPath}/qna/list">Q&A</a>
                        </li>
                    </ul>
                    <br>
                    <!-- <form class="d-flex mt-3" role="search">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form> -->
                </div>
            </div>
        </div>
    </nav>




</main>
<script src="js/bootstrap.bundle.min.js"
    integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous">
</script>
<script>
    function loginAlert() {
        alert("로그인 후 이용 가능한 서비스입니다.");
        window.location.href = "${pageContext.request.contextPath}/member/i_login";
        return false;
    }
</script>