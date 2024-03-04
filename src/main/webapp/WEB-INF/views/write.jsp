<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardWrite</title>
<script src="/js/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="/css/style.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script	src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<style>
    .t_content {
	display: block;
	float: left;
	height: 30px;
	font-size: 16px;
	line-height: 1.6;
	text-align: center;
	background-color: pink;
	border: 1px solid #ccc;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

.d_content {
	display: block;
	float: left;
	height: 30px;
	font-size: 16px;
	line-height: 1.6;
	text-align: center;
	background-color: #e7e7e7;
	border: 1px solid #ccc;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

.content_h {
	height: 200px;
	line-height: 200px;
}

.content_in {
	overflow: auto;
	line-height: 1.6;
	text-align: left;
	box-sizing: border-box;
	height: 168px;
}

.content_tag {
	line-height: 1.6;
	text-align: left;
	height: 30px;
	box-sizing: border-box;
	margin-left: 5px;
}

.content_tag>a {
	text-decoration: none;
}
.content_tag>a:link {
	color: black;
}
.content_tag>a:visited {
	color: black;
}

.file_h {
	height: 60px;
	line-height: 55px;
	box-sizing: border-box;
}

.con_table {
	width: 100%;
}
/************************/
.data-row>div {
	display: block;
	float: left;
	height: 40px;
	font-size: 14px;
	line-height: 2.5;
	text-align: center;
	background-color: #e7e7e7;
	border: 1px solid #bfbfbf;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	overflow: hidden;
	padding: 2px;
}

.data-area {
	margin-bottom: 10px;
}

.btn-area .paging {
	width: 100%;
	margin: 0px auto;
	opacity: 0.8;
	text-align: center;
}

.paging .pno {
	background-color: #efefef;
	margin: 2px;
	border: 1px solid #6c6c6c;
	border-radius: 3px;
	line-height: 1.5;
	font-size: 15px;
	height: 20px;
}

.paging>a {
	text-decoration: none;
}

.paging>a:visited {
	color: #575757;
}

.btn-area {
	margin: 0px auto;
	width: 300px;
	text-align: center;
}

span.file-title {
	height: 40px;
	line-height: 40px;
	float: left;
	padding: 0 5px;
	margin-left: 5px;
	margin-bottom: 5px;
	background-color: #fff;
	border-radius: 5px;
	border: 1px solid gray;
}

.wr-btn {
	display: block;
	width: 80%;
	padding: 10px 16px;
	font-size: 16px;
	line-height: 1.5;
	border-radius: 6px;
	color: #fff;
	background-color: #ff2f34;
	border-color: #ff0000;
	margin-top: 10px;
	margin-left: auto;
	margin-right: auto;
}

.p-10 {
	width: 10%;
}
.p-15 {
	width: 15%;
}
.p-20 {
	width: 20%;
}
.p-30 {
	width: 30%;
}
.p-35 {
	width: 35%;
}
.p-50 {
	width: 50%;
}
.p-85 {
	width: 85%;
}

.dp-10 {
	width: 10%;
}
.dp-15 {
	width: 15%;
}
.dp-20 {
	width: 20%;
}
.dp-30 {
	width: 30%;
}

.wrap {
	min-height: 100%;
	position: relative;
	padding-bottom: 58px; /* footer height */
}

.footer-bar {
	position: absolute;
	left: 0;
	bottom: 0;
	width: 100%;
	background-color: #5b5b5b;
	color: #fff;
	min-height: 58px;
	line-height: 58px;
	padding: 0px;
}

.footer-logo {
	width: 30px;
	border-radius: 5px;
}

.fcontents {
	text-align: center;
	padding: 0px;
}

.footer-logo, .footer-txt {
	margin: 0px auto;
	vertical-align: middle;
}

.ta {
	margin-top: 5px;
	margin-bottom: 5px;
	resize: none;
}

.write-form {
	max-width: 600px;
	padding: 15px;
	margin: 0px auto;
}

.write-form .write-input {
	position: relative;
	height: auto;
	box-sizing: border-box;
	padding: 10px;
	font-size: 16px;
	display: block;
	width: 100%;
	line-height: 1.5;
	color: #555;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

.btn-write {
	width: 50px;
	padding: 10px 16px;
	font-size: 16px;
	line-height: 1.5;
	border-radius: 6px;
	color: #fff;
	background-color: #ff2f34;
	border-color: #ff0000;
	margin-top: 10px;
}

.btn-write[type="reset"], .btn-write[type="button"] {
	background-color: #f68c8e;
	border-color: #ff7575;
}

.btn-sub {
	width: 50px;
	padding: 10px 16px;
	font-size: 16px;
	line-height: 1.5;
	border-radius: 6px;
	color: #fff;
	background-color: #f68c8e;
	border-color: #ff7575;
	margin-top: 10px;
}

.filebox input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: 10px 20px;
	color: #999;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-radius: 5px;
	width: 20%;
}

/* named upload */
.filebox .upload-name {
	display: inline-block;
	width: 79%;
	height: 35px;
	font-size: 16px;
	padding: 0 10px;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-radius: 5px;
}

.rtbl-head {
	background-color: pink;
	text-align: center;
	height: 30px;
}

/*
 * Responsive css
 */
@media only screen and (max-width: 768px) {
	.content {
		max-width: 100%;
	}
	.board-form, .write-form {
		max-width: 360px;
		padding: 0px;
	}
	.title-row .t-date, .title-row .t-view, .data-row .t-date, .data-row .t-view
		{
		display: none;
	}
	.p-10 {
		width: 20%;
	}
	.p-15 {
		width: 25%;
	}
	.p-30 {
		width: 55%;
	}
	.p-85 {
		width: 75%;
	}
	.dp-30, .dp-20, .dp-15, .dp-10 {
		width: 75%;
	}
	.filebox label {
		text-align: center;
		width: 100%;
	}
	.filebox .upload-name {
		width: 100%;
	}
	.top-home {
		display: none;
	}
}
</style>
<script>
	$(()=>{
		let m='${msg}';
		if(m!=''){
			alert(m)
		}
	})
	
	$('#summernote').summernote({
		height : 300, 
		minHeight : null,
		maxHeight : null, 
		focus : true, 
		lang : "ko-KR",
		placeholder : '최대 2048자까지 쓸 수 있습니다' 
	});
	
	$(()=>{
	let loginName='${mb.m_name}';
		$('#m_name').html(loginName+' 님');
		$('.suc').css('display','block');
		$('.bef').css('display','none');
	})
	
</script>
</head>
<body>
<div class="wrap">
    <header>
        <jsp:include page="header.jsp"></jsp:include>
    </header>
    <section>
        <div class="content">
            <form action="/board/write" class="write-form" 
            method="post" enctype="multipart/form-data">
               <h2 class="login-header">글쓰기</h2>
                <input type="hidden" name="b_id" value="${mb.m_id}">
                <input type="text" name="b_title" class="write-input" 
                       autofocus placeholder="제목" required>
                 <textarea id="summernote" name="b_contents"></textarea>  
                   
                <div class="filebox">
                    <label for="attachments">업로드</label>
                    <input type="file" name="attachments" id="attachments" multiple>
                    <input type="text" class="upload-name"
                           value="파일선택" readonly>
                </div>
                <div class="btn-area">
                    <input type="submit" class="btn-write" value="W">
                    <input type="reset" class="btn-write" value="R">
                    <input type="button" class="btn-write"
                           value="B" onclick="backbtn()">
                </div>
            </form>
        </div>
    </section>
    <footer>
        <jsp:include page="footer.jsp"></jsp:include>
    </footer>
</div>
<script>
$('#attachments').on('change',function(){
	//파일 선택후 열기 버튼을 누르면 change이벤트 발생
	console.log($('#attachments'));
	let files = $('#attachments')[0].files;
	console.log(files);
	
	let fileName='';
	if(files.length > 1){
		fileName=files[0].name+' 외 '+(files.length-1)+'개';
	}else if(files.length==1){
		fileName=files[0].name;
	}else{
		fileName="파일 선택";
	}
	$(".upload-name").val(fileName);
})

const backbtn=function(){
		let url="/board/list?";
		let col= '${sDto.colname}';
		let keyw='${sDto.keyword}';
		
		if(col==null){
			url+='pageNum=${pageNum}';
		}else{
			url+='colname=${sDto.colname}'+'&keyword=${sDto.keyword}'
			     +'&pageNum=${pageNum}' 
		}
		location.href= url;
	}
</script>
</body>
</html>