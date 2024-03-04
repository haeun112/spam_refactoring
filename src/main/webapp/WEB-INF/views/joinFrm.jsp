<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="/spam/css/findID.css">
<style>
         body{
            background-color: #f0e9e4 !important;  /* 밝은 베이지 */
        }
</style>
</head>

<body>
    <div id="content_nav" class="find-id-form">
        <div class="area">
            <section class="container">
                <!-------------------- 본문 -------------------->
                <div class="contents join" id="container_id">
                    <h3 class="no_line">회원가입 유형 선택</h3>

                    <div class="group">
                        <div class="paragraph_group text_center only_pc">
                            <p class="fs24 fw600 lh30 mt0">개인회원과 기업회원 중 원하는 유형을 선택해주세요.</p>
                            <p class="fs20"> 개인회원과 기업회원 두 개의 유형으로 가입할 수 있습니다.</p>
                        </div>

                        <div class="join_box">
                            <div class="type">
                                <div class="caption">
                                    <a href="/spam/member/i_join">개인회원가입</a>
                                </div>
                                <div class="caption">
                                    <a href="/spam/member/c_join">기업회원가입</a>
                                </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- //group -->
                </div><!-- //contents -->
                <!-------------------- //본문 -------------------->
            </section>
        </div>
    </div>
</body>
<%@ include file="footer.jsp" %>
</html>