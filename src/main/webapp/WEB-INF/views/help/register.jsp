<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

<style>
/*노랑 배경색 : #ffe164
  파랑 배경색 : #264d73
  빨간 포인트색 : #f0615c
  하늘색 배경색 : #eef2f6 */
#body {
	/* height: calc(100vh-72px); */
	width: 100%;
	justify-content: center;
	display: flex;
}

#inner {
	width: 900px;
	height: 100%;
}

.패딩정리 {
	padding-right: 0px;
	padding-left: 0px;
}

.form-group {
	font-family: 'IBM Plex Sans KR', sans-serif;
}

#input4 {
	height: 150px;
}

#input6 {
	width: 20%;
}

.btn-register {
	color: #f0615c;
}

.btn-cancel {
	color: #264d73;
}

.container_radio {
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

/* Hide the browser's default radio button */
.container_radio input {
	position: absolute;
	opacity: 0;
	cursor: pointer;
}

/* Create a custom radio button */
.checkmark {
	position: absolute;
	top: 0;
	left: 0;
	height: 24px;
	width: 24px;
	background-color: #eee;
	border-radius: 50%;
}

/* On mouse-over, add a grey background color */
.container_radio:hover input ~.checkmark {
	background-color: #ccc;
}

/* When the radio button is checked, add a blue background */
.container_radio input:checked ~.checkmark {
	background-color: #2196F3;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
	content: "";
	position: absolute;
	display: none;
}

/* Show the indicator (dot/circle) when checked */
.container_radio input:checked ~.checkmark:after {
	display: block;
}

/* Style the indicator (dot/circle) */
.container_radio .checkmark:after {
	top: 8px;
	left: 8px;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background: white;
}

#line {
	height: 3px;
	background-color: #264d73;
	width: 100%;
}
</style>

<title>게시물 작성</title>
</head>
<body>
<b:header></b:header>
	<div class="container" id="body">
		<div class="row" id="inner">
			<div class="col 패딩정리">
			<b:innerNav></b:innerNav>
				<h1>게시물 작성</h1>


			<form method="post" enctype="multipart/form-data">
				
				<input type="hidden" class="form-control" id="input1" name="memberId" value="${sessionScope.loginUser.id }">

					<div class="form-group">
						<label for="input2">닉네임</label>
						<input type="text" class="form-control" id="input2" name="nickname" value="${sessionScope.loginUser.nickname }" readonly>
					</div>

					<div class="form-group">
						<label for="input5">지역</label>
						<input type="text" class="form-control" name="location" value="${sessionScope.loginUser.location }" id="input5" readonly>
					</div>

          			<div class="form-group">
            			<label for="input3">제목</label>
           				<input type="text" class="form-control" id="input3" name="title">
          			</div>
          
         			 <div class="form-group">
           				 <label for="input4">내용</label>
          				 <textarea class="form-control" id="input4" name="content"></textarea>
          			</div>
          
  		 		    <div class="form-group">
           				 <label for="input6">태그</label>
           				 <select class="form-control" id="input6" name="tag">
          				  	<option value="기타" selected>태그 선택</option>
          				  	<option value="사다주세요">사다주세요</option>
           				 	<option value="맡아주세요">맡아주세요</option>
           				 	<option value="빌려주세요">빌려주세요</option>
           				 	<option value="옮겨주세요">옮겨주세요</option>
           				 	<option value="기타">기타</option>
          				</select>
         			  </div>

					<div class="form-group">
						<label for="input7">Image</label>
						<input type="file" class="form-control-file" id="input7" name="files" accept="image/*" onchange=setThumbnail(event) multiple>
				    </div>
				    
				    <!-- 구분 선 -->
				    <div id="d-line"></div>
				    
				    <!-- 미리보기 선택 알림 -->
				    <div id="choose_preview" class="d-flex"></div>
				    	
				    <!-- 이미지들 미리보기 컨테이너 -->
					<div id="image_container" class="d-flex"></div>

					<button class="btn-register" type="submit">등록</button>
					<a href="${pageContext.request.contextPath }/help/list?location=" class="btn-cancel">취소</a>
				</form>

			</div>
		</div>
	</div>

	<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="	crossorigin="anonymous" referrerpolicy="no-referrer"></script>	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	<script>

	function setThumbnail(event) {
		console.log("set");
		/* 현재 미리보기는 모두 지워야 한다. */
		$("#image_container").empty();
		$("#d-line").empty();

		const line = $(`
			<div id="line"></div>
		</div>`)
		
		$("#d-line").append(line);
		
		//업로드한 이미지가 하나 이상일 경우 썸네일 고르라는 문구를 띄운다.
		if(event.target.files.length > 1) {
			
			const notation = $(`
				<p>썸네일로 보여줄 이미지를 선택하세요 ! </p>
			`);
			
			$("#choose_preview").append(notation);
			
		}  else {
			$("#choose_preview").empty();
		}

		for (const image of event.target.files) {
			
			console.log(image.name);
			var reader = new FileReader();
			reader.readAsDataURL(image);
			reader.onload = function (event) {

				const replyMediaObject = $(`
                	<span id = "\${event.timeStamp}" style="height: 200px; width: 200px; position:relative;">
					
                	<div style = "position: absolute; z-index:100; opacity:1; top: 8px; left: 8px;">
						<label class= "container_radio">
							<input 
								type="radio" 
								id="thumbNailChoice"
								name="radio"
								checked="checked" 
								value="\${image.name}"
								style = "position: relatve; z-index:101; opacity:0;"
							/>
							<span class="checkmark"></span>
						</label>
					</div>
					
					<div 
						class = "closeButton"
						style = "position: absolute; z-index:101; top: 5px; right: 5px; width: 30px; height: 30px; cursor:pointer;" 
						onclick = "deletePicture(\${event.timeStamp})"
					>
						<i class="fas fa-times fa-2x"></i>
					</div>
						<img src= "\${event.target.result}" class="img-thumbnail d-block" style="height: 100%; width: 100%" atl="aaaa"/>	
					</span>
                	
                `);

				$("#image_container").append(replyMediaObject);
				
			};

		}
	}
	
	$(document).ready(function(){
		$("#help").attr("class", "btn btn-outline ml-1 active");
	});
	
</script>
</body>
</html>