<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>LD.GG</title>
<!--BOOTSTRAP CSS-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<!--BOOTSTRAP JavaScript-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous">
</script>
<!--SWEET-ALERT2 CSS-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<!--SWEET-ALERT2 JS-->
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<!--JQUERY-->
<script src="https://code.jquery.com/jquery-3.6.3.js"
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>
<!--AJAX-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!--JQUERY VALIDATE-->
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js"></script>
<!--sideBar CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/css/main/sideBar.css">
<!--header CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/css/main/header.css">
<!--footer CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/css/main/footer.css">
<!--loginModal CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/css/main/loginModal.css">
<!--로그인 및 세션관련 JS-->
<script src="/resources/js/main/loginSession.js" defer></script>
<!-- 채팅 관련 JS-->
<script src="/resources/js/main/chat.js" defer></script>
</head>
<style>
.main-container {
	display: flex;
	text-align: center;
	margin-top: 80px;
}

#left_container {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	box-sizing: border-box;
	margin-left: 200px;
	margin-top: 20px;
	width: 40%;
	height: 58vh;
}

#right_container {
	display: flex;
	flex-direction: column;
	box-sizing: border-box;
	margin-top: 20px;
	width: 40%;
	height: 58vh;
}

#bottom_container {
	display: flex;
	box-sizing: border-box;
	margin-left: 540px;
	width: 100%;
}


#champ_search_box input {
	width: 220px;
	border-radius: 5px;
}

#my_champion_img {
	width: 370px;
	height: 400px;
	padding-top: 20px;
	padding-bottom: 15px;
	border-radius: 70%;
}

#build_recom_box button {
	margin-top: 20px;
}

.select_lane{
	background-color: #E4E6EF;
	display: flex;
	justify-content: space-between;
	position: relative;
	left: 10%;
	width: 80%;
}

.select_lane img{
	width: 100px;
	height: 100px;
}
.select_tag{
	background-color: #E4E6EF;
	display: flex;
	width: 100%;
	height: 100px;
	margin-top: 15px;
	justify-content: space-between;
}

.select_tag div{
	width: 100px;
	height: 100px;
	line-height: 100px;
	text-align: center;
}

#right_champion_img {
	position: relative;
	left: 0%;
	width: 140px;
	height: 140px;
	border-radius: 70%;
}

#right_champion_search div{
	position: relative;
	left: 10%;
}

#right_champ_search_box {
	margin-top: 20px;	
}

.search_box{
	display: flex;
	width: 500px;
}

.search_box div{
	margin-left: 20px;
	line-height: 140px;
}

#right_champ_search{
	margin-bottom: 10px;
}


#recom_img_container {
	position: relative;
	left: 10%;
}

#recom_champ img {
	width: 140px;
	height: 140px;
	margin-right: 20px;
	border-radius: 70%;
}

#span_container {
	display: grid;
}
</style>
<body>
	<div id="session-summoner-name" style="display: none">${sessionScope.lol_account}</div>
	<div id="session-user-type" style="display: none">${sessionScope.user_type}</div>
	<div id="session-summoner-name" style="display: none">${sessionScope.summoner_name}</div>
	<div id="session-summoner-icon" style="display: none">${sessionScope.summoner_icon}</div>
	<div id="error-check" style="display: none">${check}</div>
	<!----------------------------------------------------------------------------------------------------------------->
	<!-- 사이드바 -->
	<div class="sidebar">
		<div class="sidebar-nothover-menu">
			<div class="sidebar-menu" style="padding: 8px 0px 8px 12px;">
				<img src="/resources/img/logo/LD_logo_gray.png" alt=""
					style="width: 40px; height: 40px;">
			</div>
			<div class="sidebar-menu" style="padding: 18px;">
				<img src="" alt="">
			</div>
			<div class="sidebar-menu">
				<img src="/resources/img/icon/free-icon-ranking-3162263.png" alt=""
					class="side-bar-icon">
			</div>
			<div class="sidebar-menu">
				<img src="/resources/img/icon/free-icon-community-3594834.png"
					alt="" class="side-bar-icon">
			</div>
			<div class="sidebar-menu">
				<img src="/resources/img/icon/free-icon-mentorship-8920780.png"
					alt="" class="side-bar-icon">
			</div>
			<div class="sidebar-menu">
				<img src="/resources/img/icon/free-icon-game-control-4315528.png"
					alt="" class="side-bar-icon">
			</div>
			<div class="sidebar-menu">
				<img src="/resources/img/icon/free-icon-user-996484.png" alt=""
					class="side-bar-icon">
			</div>
			<div class="sidebar-menu">
				<img src="/resources/img/icon/free-icon-megaphone-92206.png" alt=""
					class="side-bar-icon">
			</div>
		</div>

		<div class="sidebar-area">
			<div class="sidebar-logo-box" onclick="moveMain()">
				<img src="/resources/img/logo/LoLing in the Deep2.svg" alt="LD.GG로고">
			</div>

			<div class="accordion" id="accordionExample">

				<div class="accordion-item">
					<h2 class="accordion-header" id="headingOne">
						<button class="accordion-button" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseOne"
							aria-expanded="true" aria-controls="collapseOne">
							<img src="/resources/img/icon/free-icon-ranking-3162263.png"
								alt="" class="side-bar-icon"> 랭킹
						</button>
					</h2>
					<div id="collapseOne" class="accordion-collapse collapse"
						aria-labelledby="headingOne" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<div class="accordion-body-menu">
								<a href="/champion/rank" class="accordion-body-link"><span>•
										챔피언 티어</span></a>
							</div>
							<div class="accordion-body-menu">
								<a href="/summoner/rank" class="accordion-body-link"><span>•
										소환사 랭킹</span></a>
							</div>
						</div>
					</div>
				</div>

				<div class="accordion-item">
					<h2 class="accordion-header" id="headingTwo">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo">
							<img src="/resources/img/icon/free-icon-community-3594834.png"
								alt="" class="side-bar-icon"> 커뮤니티
						</button>
					</h2>
					<div id="collapseTwo" class="accordion-collapse collapse"
						aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<span class="bullet bullet-dot"></span>
							<div class="accordion-body-menu">
								<a href="/tip/" class="accordion-body-link"><span>•
										챔피언 공략</span></a>
							</div>
							<div class="accordion-body-menu">
								<a href="/mate/" class="accordion-body-link"><span>•
										롤 메이트</span></a>
							</div>
						</div>
					</div>
				</div>

				<div class="accordion-item">
					<h2 class="accordion-header" id="headingThree">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree">
							<img src="/resources/img/icon/free-icon-mentorship-8920780.png"
								alt="" class="side-bar-icon"> 멘토링
						</button>
					</h2>
					<div id="collapseThree" class="accordion-collapse collapse"
						aria-labelledby="headingThree" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<div class="accordion-body-menu">
								<a href="/mentor/custom-mentor/" class="accordion-body-link"><span>•
										맞춤 멘토</span></a>
							</div>
							<div class="accordion-body-menu">
								<a href="/mentor/list/" class="accordion-body-link"><span>•
										멘토 찾기</span></a>
							</div>
						</div>
					</div>
				</div>

				<div class="accordion-item">
					<h2 class="accordion-header" id="headingFour">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseFour"
							aria-expanded="false" aria-controls="collapseFour">
							<img src="/resources/img/icon/free-icon-game-control-4315528.png"
								alt="" class="side-bar-icon"> 미니게임
						</button>
					</h2>
					<div id="collapseFour" class="accordion-collapse collapse"
						aria-labelledby="headingFour" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<div class="accordion-body-menu">
								<a href="" class="accordion-body-link"><span>• 승부예측</span></a>
							</div>
						</div>
					</div>
				</div>

				<div class="accordion-item">
					<h2 class="accordion-header" id="headingFive">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseFive"
							aria-expanded="false" aria-controls="collapseFive">
							<img src="/resources/img/icon/free-icon-user-996484.png" alt=""
								class="side-bar-icon"> 마이 메뉴
						</button>
					</h2>
					<div id="collapseFive" class="accordion-collapse collapse"
						aria-labelledby="headingFive" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<div class="accordion-body-menu">
								<a href="/summoner/testDashBoard" class="accordion-body-link"><span>•
										대시보드</span></a>
							</div>
							<div class="accordion-body-menu">
								<a href="/mentor/write-profile" class="accordion-body-link"><span>•
										프로필</span></a>
							</div>
							<div class="accordion-body-menu">
								<a href="" class="accordion-body-link"><span>• 개인정보
										수정</span></a>
							</div>
							<div class="accordion-body-menu">
								<a href="/mentor/my-mentoring/" class="accordion-body-link"><span>•
										마이 멘토링</span></a>
							</div>
							<div class="accordion-body-menu">
								<a href="" class="accordion-body-link"><span>• 내 지갑</span></a>
							</div>
						</div>
					</div>
				</div>

				<div class="accordion-item">
					<h2 class="accordion-header" id="headingSix">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseSix"
							aria-expanded="false" aria-controls="collapseSix">
							<img src="/resources/img/icon/free-icon-megaphone-92206.png"
								alt="" class="side-bar-icon"> 고객지원
						</button>
					</h2>
					<div id="collapseSix" class="accordion-collapse collapse"
						aria-labelledby="headingSix" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<div class="accordion-body-menu">
								<a href="/userinterface/notice" class="accordion-body-link"><span>•
										공지사항</span></a>
							</div>
							<div class="accordion-body-menu">
								<a href="/faq/" class="accordion-body-link"><span>•
										FAQ</span></a>
							</div>
							<div class="accordion-body-menu">
								<a href="/faq/inquiries/" class="accordion-body-link"><span>•
										문의사항</span></a>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!----------------------------------------------------------------------------------------------------------------->
	<!----------------------------------------------------------------------------------------------------------------->
	<!-- 헤더 -->
	<div class="header-container">
		<header>

			<div class="search-bar-box">
				<img src="/resources/img/logo/LD_logo_bluered.png" alt=""
					class="search-bar-logo"> <input type="text"
					class="search-bar-input" placeholder="소환사명을 입력해주세요"
					autocomplete="off"> <img
					src="/resources/img/icon/free-icon-magnifying-glass-49116.png"
					alt="" class="search-bar-icon">
			</div>

			<div class="header-icon-box" style="display: none;">
				<div class="message-icon-box">
					<img src="/resources/img/icon/free-icon-message-5941217.png" alt=""
						class="message-icon-img" onclick="chatPopup();">
					<div class="message-notification"></div>
				</div>
				<div class="alarm-icon-box">
					<img
						src="/resources/img/icon/free-icon-notification-bell-3680267.png"
						alt="" class="alarm-icon-img"> <span
						class="alarm-notification"></span>
				</div>
				<div class="bookmark-icon-box">
					<img src="/resources/img/icon/free-icon-bookmark-white-25667.png"
						alt="" class="bookmark-icon-img">
				</div>
			</div>

			<div class="user-info-box" style="display: none;"
				onclick="go_mypage()">
				<div class="summoner-profile-icon-box">
					<img
						src="/resources/img/profileicon/${sessionScope.summoner_icon}.png"
						alt="">
				</div>
				<div class="summoner-name-box">
					<h5>${sessionScope.lol_account}님</h5>
				</div>
				<div class="user-type-box">
					<div class="user-type-common" style="display: none;">
						<h5>일반회원</h5>
					</div>
					<div class="user-type-mentor" style="display: none;">
						<h5>멘토회원</h5>
					</div>
					<div class="user-type-admin" style="display: none;">
						<h5>어드민</h5>
					</div>
					<div class="user-type-stop" style="display: none;">
						<h5>정지회원</h5>
					</div>
				</div>
			</div>

			<div class="login-button-box">
				<button class="login-button" data-bs-toggle="modal"
					data-bs-target="#login-modal" onclick="loginCheck()">LOGIN</button>
			</div>

			<div class="logout-button-box" style="display: none;">
				<form id="logoutFrm" action="/member/logout" method="post">
					<button class="logout-button" onclick="logout()">LOGOUT</button>
				</form>
			</div>

		</header>
	</div>
	<!----------------------------------------------------------------------------------------------------------------->
	<!----------------------------------------------------------------------------------------------------------------->
	<!-- 로그인 모달박스 -->
	<div class="modal fade" id="login-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #172B36;">
					<h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" style="background-color: #ffffff;"></button>
				</div>
				<div class="modal-body login-modal-body"
					style="background-image: url(/resources/img/logo/2020_key_art_Banner.png);">
					<div class="login-img-box">
						<img src="/resources/img/logo/main.png" alt="로그인 이미지">
					</div>
					<div class="login-box">
						<div class="input-area">
							<div>
								<img src="/resources/img/logo/LD_logo.svg" alt="LD_logo"
									style="width: 100px; height: 100px;">
							</div>
							<form action="/member/login" name="logFrm" method="post">
								<div class="input-id">
									<input type="text" placeholder="아이디" name="email">
								</div>
								<div class="input-pw">
									<input type="password" placeholder="비밀번호" name="password">
								</div>
								<div>
									<button class="login-modal-button">로그인</button>
								</div>
							</form>
							<div>
								<button class="login-modal-button" onclick="join()">회원가입</button>
							</div>
							<div>
								<a href="/member/findEmail" class="find-tag">이메일아이디 찾기</a>
							</div>
							<div>
								<a href="/member/findPassword" class="find-tag">비밀번호 찾기</a>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer" style="background-color: #1E3D4F;">
				</div>
			</div>
		</div>
	</div>
	<!----------------------------------------------------------------------------------------------------------------->
	<!----------------------------------------------------------------------------------------------------------------->
	<!-- 푸터 -->
	<div class="footer-container">
		<footer>
			<div class="team-name-box">
				<img src="/resources/img/logo/team_name_logo.png" alt=""
					class="team-name-img">
				<h5 class="team-name-h5">TEAM : Loling Thunder</h5>
			</div>

			<div class="team-members-box">
				<h5 class="team-members-box">TEAM MEMBERS: 오건오, 박민규, 채희정, 최형로,
					김시현, 이태현</h5>
			</div>
		</footer>
	</div>
	<!----------------------------------------------------------------------------------------------------------------->
	<!----------------------------------------------------------------------------------------------------------------->
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<br> <br> <br> <br> <br> <br> <br>
		<br>

		<div id="left_container">
			<div id="my_champion">
				<div id="champ_search_box">
					<form id=champ_search>
						<input id='champion_name_input' type="text"
							name="champion_kr_name" placeholder="내 챔피언 검색">
					</form>
					<img id="my_champion_img" alt="#"
						src="/resources/img/profileicon/29.png">
				</div>
				<div id="build_recom_box">
					<span></span>
					<form id=build_recom>
						<input id="build_recom_left_val" type="text" name="left_champion"
							style="display: none"> <input id="build_recom_right_val"
							type="text" name="right_champion" style="display: none">
						<button>추천 빌드</button>
					</form>
				</div>
			</div>
		</div>

		<div id="right_container">
			<div id="counter_champion">
				<div class="select_lane">
					<img src="/resources/img/ranked-positions/Position_Silver-Top.png" class="TOP" alt="">
					<img src="/resources/img/ranked-positions/Position_Silver-Jungle.png" class="JUNGLE" alt="">
					<img src="/resources/img/ranked-positions/Position_Silver-Mid.png" class="MIDDLE" alt="">
					<img src="/resources/img/ranked-positions/Position_Silver-Bot.png" class="BOTTOM" alt="">
					<img src="/resources/img/ranked-positions/Position_Silver-Support.png" class="UTILITY" alt="">
				</div>

				<div class="select_tag">
					<div class="all">전체</div>
					<div class="Assassin">암살자</div>
					<div class="Fighter">전사</div>
					<div class="Mage">마법사</div>
					<div class="Marksman">원거리 딜러</div>
					<div class="Controller">서포터</div>
					<div class="Tank">탱커</div>
				</div>

				<div id="right_champ_search_box">
					<div>
						<form id=right_champ_search>
							<input id='right_champ_name_input' type="text"
								name="champion_kr_name" placeholder="상대 챔피언 검색">
						</form>
						<div class="search_box">
							<img id="right_champion_img" alt="#"
								src="/resources/img/profileicon/29.png"> <div></div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>


	<div id="bottom_container">

		<div id="recom_champ">
			<div id="recom_img_container">
				<img src="/resources/img/profileicon/29.png" class="champ1" alt=""
					id="recom_champ_0" onclick="recom_click(this)"> <img
					src="/resources/img/profileicon/29.png" class="champ2" alt=""
					id="recom_champ_1" onclick="recom_click(this)"> <img
					src="/resources/img/profileicon/29.png" class="champ3" alt=""
					id="recom_champ_2" onclick="recom_click(this)"> <img
					src="/resources/img/profileicon/29.png" class="champ4" alt=""
					id="recom_champ_3" onclick="recom_click(this)"> <img
					src="/resources/img/profileicon/29.png" class="champ5" alt=""
					id="recom_champ_4" onclick="recom_click(this)">
			</div>
			
			<div id="span_container">
				<div id="recom_champ_name">
					<span></span> <span></span> <span></span> <span></span> <span></span>
				</div>
				<div id="lane_kill_rate">
					<span>만난 횟수</span> <span></span> <span></span> <span></span> <span></span>
					<span></span>
				</div>
				<div id="match_up_win_rate">
					<span>승률</span> <span></span> <span></span> <span></span> <span></span>
					<span></span>
				</div>
			</div>
		</div>
	</div>
	<!-- 추천 빌드 모달 -->

	<script type="text/javascript">
	let selected_lane;
	let selected_tag;
	let selected_left_champion;
	let selected_right_champion;


	function go_mypage(){
		location.href="/member/mypage"
	}
	
	let select_lane_imgs = document.querySelectorAll('.select_lane img')
	
	select_lane_imgs.forEach(lane=>{
		lane.addEventListener('click', function(){
			$('.select_lane img').css('background-color', '#E4E6EF');
			lane.style.backgroundColor = "black";
			selected_lane = lane.className;
			console.log(selected_lane);
			if(selected_lane && selected_tag && selected_right_champion){
				recom_champ(selected_lane, selected_tag, selected_right_champion)
			}
		})
	})

	let select_tag_divs = document.querySelectorAll('.select_tag div')
	
	select_tag_divs.forEach(tag=>{
		tag.addEventListener('click', function(){
			$('.select_tag div').css('background-color', '#E4E6EF');
			tag.style.backgroundColor = "black";
			selected_tag = tag.className;
			console.log(selected_tag);
			if(selected_lane && selected_tag && selected_right_champion){
				recom_champ(selected_lane, selected_tag, selected_right_champion)
			}
		})
	})




	function recom_click(champ){
		$('#my_champion_img').attr('src', champ.src);
		$('#build_recom_left_val').attr('value', $(champ).attr('class'));
		$.ajax({
			url: "/champion/search-eng.json",
			type: 'POST',
			data: {champion_en_name: $(champ).attr('class')},
		}).done(res=>{
			$('#build_recom_box ').text(res);
		}).fail(err=>{
			$('#build_recom_box span').text('챔피언을 선택해 주세요');
		})
	}

	function recom_champ(lane, tag, right_champion){
		$.ajax({
			url: "/champion/champ-recom.json",
			type: 'POST',
			data: {lane: lane, tag: tag, right_champion: right_champion}
		}).done(res=>{
			res.forEach(champ=>{
				let idx = res.indexOf(champ)
				let champ_name = champ.cm.champion_name
				let path = `/resources/img/champion_img/tiles/\${champ_name}_0.jpg`
				$(`#recom_champ_\${idx}`).attr('src', path);
				$(`#recom_champ_\${idx}`).attr('class', champ_name);
				$('#recom_champ_name span').eq(idx).text(champ.name)
				$('#lane_kill_rate span:not(:first)').eq(idx).text(champ.cm.match_up_cnt);
				$('#match_up_win_rate span:not(:first)').eq(idx).text(champ.cm.match_up_win_rate);
			})
		}).fail(err=>{
			console.log(err)
		})
	}

	$('#build_recom').submit(function(event){
		event.preventDefault();
		let formData = $(this).serialize();

		$.ajax({
			url: "/champion/build-recom.json",
			type: 'POST',
			data: formData,
		}).done(res=>{
			console.log(res);
						
		}).fail(err=>{
			console.log(err)
		})
		
	})

// left 챔피언
	$('#champ_search').submit(function(event){		
		event.preventDefault();
		let formData = $(this).serialize();		
		
		$('#build_recom_box span').text($('#champion_name_input').val());
		$('#champion_name_input').val('');
		
		$.ajax({
			url: "/champion/search.json",
			type: 'POST',
			data: formData,
		}).done(res=>{
			if(res){
				selected_left_champion = res  // champion_en_name
				console.log(selected_left_champion)
				$('#my_champion_img').attr('src', `/resources/img/champion_img/tiles/\${res}_0.jpg`);
				$('#build_recom_left_val').attr('value', res);
			}else{
				$('#build_recom_box span').text('챔피언 이름을 확인해주세요');
			}
			
		}).fail(err=>{
			console.log(err)
		})
		
	})
// left 챔피언 끝

// right 챔피언
	$('#right_champ_search').submit(function(evt){
		event.preventDefault();
		let formData = $(this).serialize();		
		let right_champ_name = $('#right_champ_name_input').val()
		$('.search_box div').text(right_champ_name);
		$('#right_champ_name_input').val('');
		
		$.ajax({
			url: "/champion/search.json",
			type: 'POST',
			data: formData,
		}).done(res=>{
			if(res){
				selected_right_champion = res  // champion_en_name
				console.log(selected_right_champion)
				$('#right_champion_img').attr('src', `/resources/img/champion_img/tiles/\${res}_0.jpg`);
				$('#champ_recom_right_val').attr('value', res);
				$('#build_recom_right_val').attr('value', res);
				if(selected_lane && selected_tag && selected_right_champion){
					recom_champ(selected_lane, selected_tag, selected_right_champion)
				}
			}else{
				$('#right_champion_img').attr('src', '/resources/img/profileicon/29.png')
				$('.search_box div').text('챔피언 이름을 확인해주세요');
			}
			
		}).fail(err=>{
			console.log(err)
		})
		
	})
// right 챔피언 끝
</script>
</body>

</html>