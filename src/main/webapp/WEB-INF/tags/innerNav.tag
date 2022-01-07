<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
#location, #all, #news, #question, #life, #help, #keyword, #icon {
	border: 3px solid;
	border-color: #2f6091;
	border-radius: 4px;
	font-size: large;
	margin-bottom: 8px;
}

#accident, #adv, #other1, 
#lostnfound, #conven, #complain, #suggest, #other2, 
#nlife, #hobby, #movdra, #pet, #other3, 
#hlepAll, #buy, #care,	#move, #other4 {
	border: 2px solid;
	border-color: #2f6091;
	border-radius: 4px;
	font-size: medium;
}

#nav-color {
	background-color: #ffe164;
	border-radius: 6px;
	margin-top: 20px;
	margin-bottom: 20px;
	border: 3px solid;
	border-color: #2f6091;
	z-index: 980;
	font-family: 'Jua', sans-serif;
	padding-bottom: 0px;
}

#icon {
	float: right;
	margin-top: -49px;
	background-color: #f5f5f5;
	padding: 10px 12px;
	height: 41px;
	position: relative;
	z-index: 990;
	border-color: #2f6091;
	border-radius: 4px;
	margin-bottom: 0px;
	diplay: felx;
	align-item: center;
}

a.goTop {
	position: fixed;
	right: 50px;
	bottom: 30px;
	color: #264d73;
	z-index: 999;
	width: 8.5%;
}

.active {
	background-color: #264d73;
	color: white;
}

#nav-sub {
	list-style-type: none;
	float: left;
}

#wrap {
	position: relative;
}

#wrap ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

#wrap li {
	float: left;
}

#wrap>ul>li>a {
	display: inline-block;
	padding: 18px 0 20px 0;;
	width: 250px;
	background: #d0d0d0;
	text-align: center;
	font-weight: bold;
	font-size: 16px;
	color: #000
}

#wrap li ul li a {
	display: inline-block;
	padding: 5px 20px;
	font-size: 12px;
	color: #fff;
}

#wrap li ul li a:hover {
	color: #000
}

#wrap li ul.news {
	display: none;
	position: absolute;
	top: 53px;
	left: 120px;
	padding : 5px;
	background-color: #ffe164;
	border: 3px solid #2f6091;
	border-top: 0px;
	height : fit-content;
}

#wrap li ul.question {
	display: none;
	position: absolute;
	top: 53px;
	left: 100px;
	padding : 5px;
	background-color: #ffe164;
	border: 3px solid #2f6091;
	border-top: 0px;
	height : fit-content;
}

#wrap li ul.life {
	display: none;
	position: absolute;
	top: 53px;
	left: 220px;
	padding : 5px;
	background-color: #ffe164;
	border: 3px solid #2f6091;
	border-top: 0px;
	height : fit-content;
}

#wrap li ul.help {
	display: none;
	position: absolute;
	top: 53px;
	left: 280px;
	padding : 5px;
	background-color: #ffe164;
	border: 3px solid #2f6091;
	border-top: 0px;
	height : fit-content;
}

#wrap>ul>li:hover>ul {
	display: block;
}
</style>

<nav class="navbar navbar-expand-sm navbar-dark sticky-top" aria-label="Third navbar example" id="nav-color">
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="wrap">
			<ul class="navbar-nav me-auto mb-2 mb-sm-0 main1">
				<li class="nav-item">
					<form method="get">
						<select class="custom-select" id="location" style="height: 100%" name="location" onchange="locationChange()">
							<option value="" <c:if test="${location eq '' || empty location}">selected</c:if>>Region</option>
							<option <c:if test="${location eq '강남구'}">selected</c:if>>강남구</option>
							<option <c:if test="${location eq '마포구'}">selected</c:if>>마포구</option>
							<option <c:if test="${location eq '서초구'}">selected</c:if>>서초구</option>
						</select>
					</form>
				</li>
				<!-- 나중엘 radio 버튼으로 교체 -->
				<li id="nav-all" class="nav-item">
					<button type="button" id="all" class="btn btn-outline-dark ml-1">전체보기</button>
				</li>
				<li id="nav-news" class="nav-item">
					<button type="button" id="news" class="btn btn-outline-dark ml-1">동네소식</button>
					<ul id="nav-sub" class="news">
						<li id="nav-sub" class="nav-item accident">
							<button type="button" id="accident" class="btn btn-outline-dark ml-1">사건/사고</button>
						</li>
						<li id="nav-sub" class="nav-item adv">
							<button type="button" id="adv" class="btn btn-outline-dark ml-1">광고</button>
						</li>
						<li id="nav-sub" class="nav-item other1">
							<button type="button" id="other1" class="btn btn-outline-dark ml-1">기타</button>
						</li>
					</ul>
				</li>
				<li id="nav-question" class="nav-item">
					<button type="button" id="question" class="btn btn-outline-dark ml-1">동네질문</button>
					<ul id="nav-sub" class="question">
						<li id="nav-sub" class="nav-item lostnfound">
							<button type="button" id="lostnfound" class="btn btn-outline-dark ml-1">분실물</button>
						</li>
						<li id="nav-sub" class="nav-item conven">
							<button type="button" id="conven" class="btn btn-outline-dark ml-1">편의시설(학원, 병원 등)</button>
						</li>
						<li id="nav-sub" class="nav-item complain">
							<button type="button" id="complain" class="btn btn-outline-dark ml-1">불만</button>
						</li>
						<li id="nav-sub" class="nav-item suggest">
							<button type="button" id="suggest" class="btn btn-outline-dark ml-1">건의</button>
						</li>
						<li id="nav-sub" class="nav-item other2">
							<button type="button" id="other2" class="btn btn-outline-dark ml-1">기타</button>
						</li>
					</ul>
				</li>
				<li id="nav-life" class="nav-item">
					<button type="button" id="life" class="btn btn-outline-dark ml-1">일상생활</button>
					<ul id="nav-sub" class="life">
						<li id="nav-sub" class="nav-item nlife">
							<button type="button" id="nlife" class="btn btn-outline-dark ml-1">일상</button>
						</li>
						<li id="nav-sub" class="nav-item hobby">
							<button type="button" id="hobby" class="btn btn-outline-dark ml-1">취미</button>
						</li>
						<li id="nav-sub" class="nav-item movdra">
							<button type="button" id="movdra" class="btn btn-outline-dark ml-1">영화 & 드라마</button>
						</li>
						<li id="nav-sub" class="nav-item pet">
							<button type="button" id="pet" class="btn btn-outline-dark ml-1">반려동물</button>
						</li>
						<li id="nav-sub" class="nav-item other3">
							<button type="button" id="other3" class="btn btn-outline-dark ml-1">기타</button>
						</li>
					</ul>
				</li>
				<li id="nav-help" class="nav-item ">
					<button type="button" id="help" class="btn btn-outline-dark ml-1">해주세요</button>
					<ul id="nav-sub" class="help">
						<li id="nav-sub" class="nav-item hlepAll">
							<button type="button" id="hlepAll" class="btn btn-outline-dark ml-1">전체보기</button>
						</li>
						<li id="nav-sub" class="nav-item buy">
							<button type="button" id="buy" class="btn btn-outline-dark ml-1">사다주세요</button>
						</li>
						<li id="nav-sub" class="nav-item care">
							<button type="button" id="care" class="btn btn-outline-dark ml-1">맡아주세요</button>
						</li>
						<li id="nav-sub" class="nav-item move">
							<button type="button" id="move" class="btn btn-outline-dark ml-1">옮겨주세요</button>
						</li>
						<li id="nav-sub" class="nav-item other4">
							<button type="button" id="other4" class="btn btn-outline-dark ml-1">기타</button>
						</li>
					</ul>
				</li>
			</ul>

			<form class="ml-auto" method="get" onsubmit="return false;">
				<input class="form-control" type="text" placeholder="검색어를 입력하세요" id="keyword" aria-label="Search" />
				<label id=icon>
					<i class="fa fa-search" aria-hidden="true"></i>
				</label>
			</form>
		</div>
	</div>
</nav>



<script>
function locationChange() {
	

	
	
	//현재 위치
	var location = $("#location option:selected").val();
	var board = "${boardType}"
	var tag = "${tag}"
	//현재 태그
	
	//question 게시판 전용
	if(board == "question") {
		
		console.log(location);
		
		if(location == "") {
			console.log("empty");
			location  = "";
		} else {
			
			console.log("question borad location, not empty");
			location = "&location="+location;
		}
		
		if(tag == null || tag == "") {
			
			tag = "";
		} else {
			tag = "&tag="+tag;
		}
		
		window.location.href = "/controller1/question/list?page=1"+location+tag;
		return 
	}
	
	if(location == "") {
		console.log("empty");
		location  = "?";
	} else {
		location = "?location="+location;
	}
	
	console.log(tag);
	
	if(tag == null || tag == "") {
		
		tag = "";
	} else {
		tag = "&tag="+tag;
	}
	
	window.location.href = "/controller1/"+board+"/list"+location+tag;

	/*
	var link = window.location.href;
	const regex = /(location=.*)(?=&|$)/i;
	//빈 문자열이면 현재의 위치를 없애버린다.
	if(location == "") {
		
		const regex1 = /(&location=.*)(?=&|$)/i;
		const regex2 = /(\?location=.*)(?=&|$)/i;
		link = link.replace(regex1, "");
		link = link.replace(regex2, "");
		window.location.href = link;
		return
	
	} else {
		if(link.includes('?')) {
				
			if(link.includes("location")) {
				
				window.location.href = link.replace(regex , "location="+location);
			} else {
				window.location.href = link + "&location=" + location;
			}
			
			
		} else {
			
			window.location.href = link + "?location=" + location;
		}
		

		
	}
	*/
}

	$(document).ready(function() {
		//현재의 tag 값과 region 값을 가져온다.
		var loc = "${location}";
		var tag    = "${tag}";
		//console.log(region);
		
		//현재 model의 값으로 select 박스의 값 세팅 (나중에 )
		//$("#region").val(region).attr("selected", "selected");
		
		//검색 아이콘 누르면 call되는 함수 (현재 입력창에 있는 값을 받아서 넘긴다. 현재 select 상태와 버튼 눌려진 상태를 포함한다.) 
		$("#icon").click(function() {
			var query = $("#keyword").val();
			
			//빈 문자열이면 return 시켜 실행되지 않게 한다.
			if(query== "") {
				return 
			}
			
			//&이 포함되면 안된다...
			if(query.includes('&')) {
				alert('&은 검색 문자열에 포함할 수 없습니다!')
				return 
			}
			
			var link = window.location.href;
			
			
			if(link.includes('query')) {
				const regex = /(query=.*)(?=&|$)/i;
				console.log(link.replace(regex, "query=" + query))
				location.href = link.replace(regex , "query=" + query)
				
			} else {
				
				if(link.includes('?')) {
					location.href = link + "&query="+query;

				} else {
					location.href = link + "?query="+query;
				}
				
			}
		})
		
		//model attribute에서 현재 어느 태그인지 검사하고 select의 현재 상태 변경시기키 (model 값을 스크립트 내부에서 사용해야 한다.)
		$("#all").click(function() {
			var loc = $("#location option:selected").val();
			location.href = "/controller1/all/list";
		});
		
		//탭에 있는 버튼들 누르면 해당 링크로 이동한다. 현재 select 상태를 함께 포함해 컨트롤러에 get 요청 날린다.
		$("#news").click(function() {
			var loc = $("#location option:selected").val();
			location.href = "/controller1/news/list";
		});

		$("#question").click(function() {
			var loc = $("#location option:selected").val();
			location.href = "/controller1/question/list?page=1";
		});

		$("#life").click(function() {
			var loc = $("#location option:selected").val();
			location.href = "/controller1/life/list";
		});

		$("#help").click(function() {
			var loc = $("#location option:selected").val();
			location.href = "/controller1/help/list"
		});
		
		$("#hlepAll").click(function() {
			location.href = "/controller1/help/list?" + getLocation();
		})
		$("#buy").click(function() {
			window.location.href = "/controller1/help/list?tag=사다주세요"+ getLocation();
		})
		$("#care").click(function() {
			window.location.href = "/controller1/help/list?tag=맡아주세요"+ getLocation();
		})
		$("#move").click(	function() {
			window.location.href = "/controller1/help/list?tag=옮겨주세요"+ getLocation();
		})
		$("#other4").click(function() {
			location.href = "/controller1/help/list?tag=기타" + getLocation();
		})
		
		function getLocation() {


			var location = "${location}";

			if (location == "") {
				return "";
			} else {
				return "&location=" + location;
			}

	}
	})
	
</script>

<a class="goTop" href="#top">
	<i class="fas fa-arrow-up a-fw fa-3x m-r-3 go-to-the-top"></i>
</a>