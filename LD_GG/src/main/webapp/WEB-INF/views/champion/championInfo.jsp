<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챔피언 상세</title>
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
<!--CHAMPION INFO CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/css/champion/info.css">
<style type="text/css">
.main-container {
	display: flex;
	box-sizing: border-box;
	padding: 100px 50px 100px 100px;
}

.left-container {
	box-sizing: border-box;
	width: 350px;
	height: 100%;
	margin-right: 20px;
}

.middle-container {
	box-sizing: border-box;
	width: 630px;
	height: 100%;
}

.right-container {
	box-sizing: border-box;
	width: 770px;
	height: 100%;
	margin-left: 20px;
}
</style>

<!-- right_container start -->
<style>
.match_up_chart {
	display: flex;
}

#match_up_left, #match_up_right {
	display: flex;
	flex-direction: column;
	justify-content: center;
}

#match_up_left span, #match_up_right span {
	text-align: center;
}

#chartdiv {
	margin-left: 50px;
	margin-right: 50px;
	width: 540px;
}

.bar_title {
	display: grid;
	position: relative;
	text-align: center;
}

.bar_title_left {
	grid-row: 1;
	justify-self: left;
}

.bar_title_content {
	grid-row: 1;
	justify-self: center;
}

.bar_title_right {
	grid-row: 1;
	justify-self: right;
}
</style>
<!-- right_container end -->

<style type="text/css">
.skill-build-container {
	width: 100%;
	height: 300px;
	background-color: #fff;
	margin-top: 20px;
	border-radius: 0.5rem;
}
.skill-build-title{
	text-align: center;
}
.skill-build-title h4{
	font-size: 18px;
	font-weight: 700;
}
.arrow-img img{
	width: 40px;
	height: 40px;
}
.skill-build-sequence-box{
	display: flex;
}
.skill-build-sequence{
box-sizing: border-box;
}
.skill-key-icon{
	position: relative;
	width: 15px;
	height: 15px;
	background-color: black;
	border-radius: 3px;
	bottom: 15px;
	text-align: center;
}
.skill-key-icon h6{
	color: white;
	font-size: 10px;
	font-weight: 700;
}
</style>
</head>

<body>

	<div id="session-summoner-name" style="display: none">${sessionScope.lol_account}</div>
	<div id="session-user-type" style="display: none">${sessionScope.user_type}</div>
	<div id="session-summoner-name" style="display: none">${sessionScope.summoner_name}</div>
	<div id="session-summoner-icon" style="display: none">${sessionScope.summoner_icon}</div>
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
	<div class="main-container">
		<div class="left-container">
			<div class="lane-select-box"></div>
			<div class="champion-info-box">
				<table class="champion-table">
					<tr>
						<td rowspan="2"><img alt=""
							src="/resources/img/champion_img/square/${chamInfo.champion_img}"
							class="champion-img"></td>
						<td colspan="5"><h3 class="champion_name">${chamInfo.champion_kr_name}</h3></td>
					</tr>
					<tr>
						<td><img alt=""
							src="/resources/img/passive/${chamInfo.champion_p_img}"
							class="ability-img">
							<div class="skill-key-icon">
								<h6>P</h6>
							</div>
							<div class="tooltip">
								<div>${chamInfo.champion_p_name}</div>
								<br>
								<div>${chamInfo.champion_p_desc}</div>
							</div></td>
						<td><img alt=""
							src="/resources/img/spell/${chamInfo.champion_q_img}"
							class="ability-img">
							<div class="skill-key-icon">
								<h6>Q</h6>
							</div>
							<div class="tooltip">
								<div>${chamInfo.champion_q_name}</div>
								<br>
								<div>${chamInfo.champion_q_desc}</div>
							</div></td>
						<td><img alt=""
							src="/resources/img/spell/${chamInfo.champion_w_img}"
							class="ability-img">
							<div class="skill-key-icon">
								<h6>W</h6>
							</div>
							<div class="tooltip">
								<div>${chamInfo.champion_w_name}</div>
								<br>
								<div>${chamInfo.champion_w_desc}</div>
							</div></td>
						<td><img alt=""
							src="/resources/img/spell/${chamInfo.champion_e_img}"
							class="ability-img">
							<div class="skill-key-icon">
								<h6>E</h6>
							</div>
							<div class="tooltip">
								<div>${chamInfo.champion_e_name}</div>
								<br>
								<div>${chamInfo.champion_e_desc}</div>
							</div></td>
						<td><img alt=""
							src="/resources/img/spell/${chamInfo.champion_r_img}"
							class="ability-img">
							<div class="skill-key-icon">
								<h6>R</h6>
							</div>
							<div class="tooltip">
								<div>${chamInfo.champion_r_name}</div>
								<br>
								<div>${chamInfo.champion_r_desc}</div>
							</div></td>
					</tr>
				</table>
			</div>
			<div class="champion-twpb-box">
				<table>
					<tr>
						<th class="champion-twpb">티어</th>
						<th class="champion-twpb">승률</th>
						<th class="champion-twpb">픽률</th>
						<th class="champion-twpb">밴률</th>
					</tr>
					<tr>
						<td class="champion-tier" id="tier"></td>
						<td class="champion-tier" id="win-rate"></td>
						<td class="champion-tier" id="pick-rate"></td>
						<td class="champion-tier" id="ban-rate"></td>
					</tr>
				</table>
			</div>
			<div class="champion-easy-box">
				<caption>상대하기 쉬운 챔피언</caption>
				<table>
					<tr>
						<th class="easy-champ-img"></th>
						<th class="easy-champ-img"></th>
						<th class="easy-champ-img"></th>
						<th class="easy-champ-img"></th>
						<th class="easy-champ-img"></th>
					</tr>
					<tr>
						<td class="easy-champ-win-rate"></td>
						<td class="easy-champ-win-rate"></td>
						<td class="easy-champ-win-rate"></td>
						<td class="easy-champ-win-rate"></td>
						<td class="easy-champ-win-rate"></td>
					</tr>
				</table>
			</div>
			<div class="champion-hard-box">
				<caption>상대하기 힘든 챔피언</caption>
				<table>
					<tr>
						<th class="hard-champ-img"></th>
						<th class="hard-champ-img"></th>
						<th class="hard-champ-img"></th>
						<th class="hard-champ-img"></th>
						<th class="hard-champ-img"></th>
					</tr>
					<tr>
						<td class="hard-champ-win-rate"></td>
						<td class="hard-champ-win-rate"></td>
						<td class="hard-champ-win-rate"></td>
						<td class="hard-champ-win-rate"></td>
						<td class="hard-champ-win-rate"></td>
					</tr>
				</table>
			</div>
			<div class="spell-container">
				<div class="spell-title">
					<h4>추천 스펠</h4>
					<div class="spell-box"></div>
				</div>
			</div>
		</div>
		<div class="middle-container">
			<div class="rune-select-box"></div>
			<div class="rune-title">
				<h4>추천 룬</h4>
			</div>
			<div class="rune-container">
				<div class="rune-box main-runes">
					<div class="first-rune main-rune-top" style="margin: 0 auto"></div>
					<div class="runes main-rune-first"></div>
					<div class="runes main-rune-second"></div>
					<div class="runes main-rune-third"></div>
					<div class="runes main-rune-fourth"></div>
				</div>
				<div class="rune-box sub-runes">
					<div class="first-rune sub-rune-top" style="margin: 10px auto"></div>
					<div class="runes sub-rune-first"></div>
					<div class="runes sub-rune-second"></div>
					<div class="runes sub-rune-third"></div>
				</div>
				<div class="rune-box sub-ability">
					<div class="runes sub-ability-first">
						<div class="rune fragment">
							<img
								src="/resources/img/perk-images/StatMods/StatModsAdaptiveForceIcon.png"
								alt="" id="first-fragment-5008" class="fragment-img">
							<div class="rune-desc">
								<div>OFFENSE</div>
								<br>
								<div>적응형 능력치 +9</div>
							</div>
						</div>
						<div class="rune fragment">
							<img
								src="/resources/img/perk-images/StatMods/StatModsAttackSpeedIcon.png"
								alt="" id="first-fragment-5005" class="fragment-img">
							<div class="rune-desc">
								<div>OFFENSE</div>
								<br>
								<div>공격속도 10%</div>
							</div>
						</div>
						<div class="rune fragment">
							<img
								src="/resources/img/perk-images/StatMods/StatModsCDRScalingIcon.png"
								alt="" id="first-fragment-5007" class="fragment-img">
							<div class="rune-desc">
								<div>OFFENSE</div>
								<br>
								<div>스킬 가속 +8</div>
							</div>
						</div>
					</div>
					<div class="runes sub-ability-second">
						<div class="rune fragment">
							<img
								src="/resources/img/perk-images/StatMods/StatModsAdaptiveForceIcon.png"
								alt="" id="second-fragment-5008" class="fragment-img">
							<div class="rune-desc">
								<div>OFFENSE</div>
								<br>
								<div>적응형 능력치 +9</div>
							</div>
						</div>
						<div class="rune  fragment">
							<img
								src="/resources/img/perk-images/StatMods/StatModsArmorIcon.png"
								alt="" id="second-fragment-5002" class="fragment-img">
							<div class="rune-desc">
								<div>FLEX</div>
								<br>
								<div>방어력 +6</div>
							</div>
						</div>
						<div class="rune fragment">
							<img
								src="/resources/img/perk-images/StatMods/StatModsMagicResIcon.png"
								alt="" id="second-fragment-5003" class="fragment-img">
							<div class="rune-desc">
								<div>FLEX</div>
								<br>
								<div>마법저항력 +8</div>
							</div>
						</div>
					</div>
					<div class="runes sub-ability-third">
						<div class="rune fragment">
							<img
								src="/resources/img/perk-images/StatMods/StatModsHealthScalingIcon.png"
								alt="" id="third-fragment-5001" class="fragment-img">
							<div class="rune-desc">
								<div>DEFFENSE</div>
								<br>
								<div>체력 +15 ~ 140</div>
							</div>
						</div>
						<div class="rune fragment">
							<img
								src="/resources/img/perk-images/StatMods/StatModsArmorIcon.png"
								alt="" id="third-fragment-5002" class="fragment-img">
							<div class="rune-desc">
								<div>FLEX</div>
								<br>
								<div>방어력 +6</div>
							</div>
						</div>
						<div class="rune fragment">
							<img
								src="/resources/img/perk-images/StatMods/StatModsMagicResIcon.png"
								alt="" id="third-fragment-5003" class="fragment-img">
							<div class="rune-desc">
								<div>FLEX</div>
								<br>
								<div>마법저항력 +8</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<div class="skill-build-container">
				<div class="skill-build-title"><h4>추천 스킬 빌드</h4></div>
				<div class="skill-build-sequence-box">
					<div class="skill-build-sequence">
					<img alt="" src="/resources/img/passive/${chamInfo.champion_p_img}" class="ability-img">
					<div class="skill-key-icon">
						<h6>Q</h6>
					</div>
					<div class="tooltip">
					<div>${chamInfo.champion_p_name}</div>
					<br>
					<div>${chamInfo.champion_p_desc}</div>
					</div>
					</div>
					<div class="arrow-img">
						<img alt="" src="/resources/img/icon/arrow-icon-right.png">
					</div>
					<div class="skill-build-sequence">
					<img alt="" src="/resources/img/passive/${chamInfo.champion_p_img}" class="ability-img">
					<div class="skill-key-icon">
						<h6>W</h6>
					</div>
					<div class="tooltip">
					<div>${chamInfo.champion_p_name}</div>
					<br>
					<div>${chamInfo.champion_p_desc}</div>
					</div>
					</div>
					<div class="arrow-img">
						<img alt="" src="/resources/img/icon/arrow-icon-right.png">
					</div>
					<div class="skill-build-sequence">
					<img alt="" src="/resources/img/passive/${chamInfo.champion_p_img}" class="ability-img">
					<div class="skill-key-icon">
						<h6>E</h6>
					</div>
					<div class="tooltip">
					<div>${chamInfo.champion_p_name}</div>
					<br>
					<div>${chamInfo.champion_p_desc}</div>
					</div>
					</div>
				</div>
			</div>
		</div>
		<div class="right-container">
			<!-- match_up_conatiner start -->
			<div class="match_up_container">
				<!-- match_up_chart start -->
				<div class="match_up_chart">
					<div id="match_up_left"></div>
					<!-- chartdiv start -->
					<div id="chartdiv">
						<div class="bar_block">
							<div class="bar_title lane_kill_rate">
								<div class="bar_title_left lane_kill_rate"></div>
								<div class="bar_title_content">라인킬 확률</div>
								<div class="bar_title_right enemy_lane_kill_rate"></div>
							</div>

							<div class="progress">
								<div class="progress-bar" role="progressbar" style="width: 46%;"
									aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
								<div class="progress-bar bg-danger" role="progressbar"
									style="width: 100%" aria-valuenow="100" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</div>

						<div class="bar_block">
							<div class="bar_title kill_participation">
								<div class="bar_title_left kill_participation"></div>
								<div class="bar_title_content">킬 관여율</div>
								<div class="bar_title_right enemy_kill_participation"></div>
							</div>
							<div class="progress">
								<div class="progress-bar" role="progressbar" style="width: 25%"
									aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
								<div class="progress-bar bg-danger" role="progressbar"
									style="width: 100%" aria-valuenow="100" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</div>

						<div class="bar_block">
							<div class="bar_title kda">
								<div class="bar_title_left kda"></div>
								<div class="bar_title_content">평점</div>
								<div class="bar_title_right enemy_kda"></div>
							</div>
							<div class="progress">
								<div class="progress-bar" role="progressbar" style="width: 50%"
									aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
								<div class="progress-bar bg-danger" role="progressbar"
									style="width: 100%" aria-valuenow="100" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</div>

						<div class="bar_block">
							<div class="bar_title tower_kill_time">
								<div class="bar_title_left tower_kill_time"></div>
								<div class="bar_title_content">라인 첫 타워 파괴 시간</div>
								<div class="bar_title_right enemy_tower_kill_time"></div>
							</div>
							<div class="progress">
								<div class="progress-bar" role="progressbar" style="width: 75%"
									aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
								<div class="progress-bar bg-danger" role="progressbar"
									style="width: 100%" aria-valuenow="100" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</div>

						<div class="bar_block">
							<div class="bar_title win_rate">
								<div class="bar_title_left win_rate"></div>
								<div class="bar_title_content">포지션 승률</div>
								<div class="bar_title_right enemy_win_rate"></div>
							</div>
							<div class="progress">
								<div class="progress-bar" role="progressbar" style="width: 100%"
									aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
								<div class="progress-bar bg-danger" role="progressbar"
									style="width: 100%" aria-valuenow="100" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</div>

						<div class="bar_block">
							<div class="bar_title pick_rate">
								<div class="bar_title_left pick_rate"></div>
								<div class="bar_title_content">포지션 픽률</div>
								<div class="bar_title_right enemy_pick_rate"></div>
							</div>
							<div class="progress">
								<div class="progress-bar" role="progressbar" style="width: 100%"
									aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
								<div class="progress-bar bg-danger" role="progressbar"
									style="width: 100%" aria-valuenow="100" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</div>

						<div class="bar_block">
							<div class="bar_title ban_rate">
								<div class="bar_title_left ban_rate"></div>
								<div class="bar_title_content">밴률</div>
								<div class="bar_title_right enemy_ban_rate"></div>
							</div>
							<div class="progress">
								<div class="progress-bar" role="progressbar" style="width: 100%"
									aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
								<div class="progress-bar bg-danger" role="progressbar"
									style="width: 100%" aria-valuenow="100" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</div>

					</div>
					<!-- chartdiv end -->

					<div id="match_up_right"></div>
				</div>
				<!-- match_up_chart end -->
				<div class="match_up_table"></div>
				<!-- match_up_conatiner end -->
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">

document.addEventListener("DOMContentLoaded", function() {
	championLaneInfo(${chamInfo.champion_id});
});

function championLaneInfo(champion_id) {
	  $.ajax({
	    method: 'get',
	    url: '/champion/info/lane',
	    data: { champion_id: champion_id },
	  }).done(res => {
	    let laneSelectBox = document.querySelector('.lane-select-box');
	    laneSelectBox.innerHTML = ''; // 기존 내용 초기화

	    for (let i = 0; i < res.length; i++) {
	      let team_position = res[i].team_position;
	      let html = '';

	      if (team_position === 'TOP') {
	        html = '<div class="lane-img lane-top" onclick="selectLane(\'TOP\')"><img src="/resources/img/ranked-positions/Position_Silver-Top.png" alt="로그인 이미지"></div>';
	      } else if (team_position === 'JUNGLE') {
	        html = '<div class="lane-img lane-jungle" onclick="selectLane(\'JUNGLE\')"><img src="/resources/img/ranked-positions/Position_Silver-Jungle.png" alt="로그인 이미지"></div>';
	      } else if (team_position === 'MIDDLE') {
	        html = '<div class="lane-img lane-middle" onclick="selectLane(\'MIDDLE\')"><img src="/resources/img/ranked-positions/Position_Silver-Mid.png" alt="로그인 이미지"></div>';
	      } else if (team_position === 'BOTTOM') {
	        html = '<div class="lane-img lane-bottom" onclick="selectLane(\'BOTTOM\')"><img src="/resources/img/ranked-positions/Position_Silver-Bot.png" alt="로그인 이미지"></div>';
	      } else if (team_position === 'UTILITY') {
	        html = '<div class="lane-img lane-support" onclick="selectLane(\'UTILITY\')"><img src="/resources/img/ranked-positions/Position_Silver-Support.png" alt="로그인 이미지"></div>';
	      }

	      laneSelectBox.innerHTML += html;
	    }
	    champion_position = res[0].team_position
	    championBuildInfo(res[0].champion_id, res[0].team_position);
	  }).fail(err => {
	    console.log(err);
	  });
	}

function selectLane(team_position) {
	championBuildInfo(${chamInfo.champion_id}, team_position);
}

function championBuildInfo(champion_id, team_position) {
	$.ajax({
		  method: 'get',
		  url: '/champion/info/build',
		  data: { champion_id: champion_id, team_position: team_position},
		}).done(res => {
			let championBuildInfo = res;
			let champRuneData = championBuildInfo.champRuneData;
			let champItemData = championBuildInfo.champItemData;
			let champMythicItemData = championBuildInfo.champMythicItemData;
			let champItemBuildData = championBuildInfo.champItemBuildData;
			let champShoesData = championBuildInfo.champShoesData;
			let champSpellData = championBuildInfo.champSpellData;
			let champSkillBuildData = championBuildInfo.champSkillBuildData;
			let champAccessoriesData = championBuildInfo.champAccessoriesData;
			let champTierData = championBuildInfo.champTierData;
			let champEasyChampData = championBuildInfo.champEasyChampData;
			let champHardChampData = championBuildInfo.champHardChampData;
			
			  console.log(champRuneData);
			  console.log(champItemData);
			  console.log(champMythicItemData);
			  console.log(champItemBuildData);
			  console.log(champShoesData);
			  console.log(champSpellData);
			  console.log(champSkillBuildData);
			  console.log(champAccessoriesData);
			  console.log(champTierData[0].tier);
			  console.log(champTierData[0].win_rate);
			  console.log(champTierData[0].pick_rate);
			  console.log(champTierData[0].ban_rate);
			  console.log(champTierData[0].tier);
			  console.log(champTierData[0].win_rate);
			  console.log(champTierData[0].pick_rate);
			  console.log(champTierData[0].ban_rate);
			  console.log(champEasyChampData);
			  console.log(champHardChampData);
			  //-----------------------------------------------------------------------------------
			  //챔피언 티어 승률 픽률 밴률 
			  if(champTierData[0].tier == 0){
				  document.getElementById('tier').textContent = 'OP';
			  }else{
				  document.getElementById('tier').textContent = champTierData[0].tier;  
			  }
			  document.getElementById('win-rate').textContent = champTierData[0].win_rate+'%';
			  document.getElementById('pick-rate').textContent = champTierData[0].pick_rate+'%';
			  document.getElementById('ban-rate').textContent = champTierData[0].ban_rate+'%';
			  //-----------------------------------------------------------------------------------
			  // 상대하기 쉬운 챔피언 
			  let easyTableHeaders = document.getElementsByClassName('easy-champ-img');
			  for (var i = 0; i < easyTableHeaders.length; i++) {
				  easyTableHeaders[i].innerHTML = '';
				  easyTableHeaders[i].innerHTML = '<img alt="" src="/resources/img/champion_img/square/'+champEasyChampData[i].champion_img+'" class="champion-img" id="'+ champEasyChampData[i].enemy_champ_id +'">';
			  }
			  let hardEasyTableData = document.getElementsByClassName('easy-champ-win-rate');

			  for (var i = 0; i < hardEasyTableData.length; i++) {
				  hardEasyTableData[i].innerHTML = '';
				  hardEasyTableData[i].innerHTML = champEasyChampData[i].match_up_win_rate+'%';
			  }
			  //-----------------------------------------------------------------------------------
			  // 상대하기 어려운 챔피언 
			  let hardTableHeaders = document.getElementsByClassName('hard-champ-img');
			  for (var i = 0; i < hardTableHeaders.length; i++) {
				  hardTableHeaders[i].innerHTML = '';
				  hardTableHeaders[i].innerHTML = '<img alt="" src="/resources/img/champion_img/square/'+champHardChampData[i].champion_img+'" class="champion-img" id="'+ champHardChampData[i].enemy_champ_id +'">';
			  }
			  var hardTableData = document.getElementsByClassName('hard-champ-win-rate');

			  for (var i = 0; i < hardTableData.length; i++) {
				  hardTableData[i].innerHTML = '';
				  hardTableData[i].innerHTML = champHardChampData[i].match_up_win_rate+'%';
			  }
			  
			  let champ_img = document.querySelectorAll('.champion-img')
			  champ_img.forEach(champion=>{
				champion.addEventListener('click', function(){
					if(champion.id){
						location.href = `info?champion=\${champion.id}`
					}
				})
			  })
			  //-----------------------------------------------------------------------------------
			  rune_full_data(champRuneData[0].main_KEYSTONE_ID,champRuneData[0].sub_KEYSTONE_ID,0,champRuneData);
			  
			  let rune_select_box = document.getElementsByClassName('rune-select-box')[0]; 
			  rune_select_box.innerHTML = ''
			  for (var i = 0; i < champRuneData.length; i++) {
				html = ''
				html += '<div class="rune-select-button">'
				html += '<div class="rune-select-main">'
				html += '<img src="/resources/img/'+champRuneData[i].main_KEYSTONE_ID_img+'" alt="">'
				html += '</div>'
				html += '<div class="rune-select-mainStyle rune-combination">'
				html += '<img src="/resources/img/'+champRuneData[i].main_SUB1_ID_img+'" alt="">'
				html += '</div>'
				html += '<div class="rune-select-sub rune-combination">'
				html += '<img src="/resources/img/'+champRuneData[i].sub_KEYSTONE_ID_img+'" alt="">'
				html += '</div>'
				html += '<div class="rune-combination-desc">'
				html += '<div>승률 : '+champRuneData[i].win_rate+'%</div>'
				html += '<div>픽률 : '+champRuneData[i].pick_rate+'%</div>'
				html += '</div>'
				html += '</div>'
				rune_select_box.innerHTML += html
				}
			  
			  let rune_select_buttons = document.getElementsByClassName('rune-select-button');
				for (let i = 0; i < rune_select_buttons.length; i++) {
					rune_select_buttons[i].addEventListener('click', function() {
						rune_full_data(champRuneData[i].main_KEYSTONE_ID,champRuneData[i].sub_KEYSTONE_ID,i,champRuneData);
					});
				}
				
				spellSplit(champSpellData);
		}).fail(err => {
		  console.log(err);
		});	
}
function spellSplit(champSpellData) {
	let spell_box = document.getElementsByClassName('spell-box')[0]; 
	spell_box.innerHTML = ''
	for (let i = 0; i < champSpellData.length; i++) {
		let spells = champSpellData[i].spells
		let win_rate = champSpellData[i].win_rate
		let pick_rate = champSpellData[i].pick_rate
		let parts = spells.split(','); 
		let first_spell = parseInt(parts[0]);
		let second_spell = parseInt(parts[1]);
		spellHtml(first_spell,second_spell,win_rate,pick_rate);
	}
}

function spellHtml(first_spell,second_spell,win_rate,pick_rate) {
	$.ajax({
	    method: 'get',
	    url: '/champion/info/spell',
	    data: { first_spell : first_spell, second_spell : second_spell },
	  }).done(res => {
		let spell_box = document.getElementsByClassName('spell-box')[0]; 
		html = ''
		html += '<div class="spells">'
		html += '<div class="spell">'
		html += '<img alt="" src="/resources/img/spell/'+res[0].spell_img+'">'
		html += '<div class="spell-desc">'
		html += '<div>'+res[0].spell_kr_name+'</div>'
		html += '<br>'
		html += '<div>'+res[0].spell_desc+'</div>'
		html += '<br>'
		html += '<div>쿹타임 '+res[0].spell_cooldown+'</div>'
		html += '</div>'
		html += '</div>'
		html += '<div class="spell" style="margin-right: 30px;">'
		html += '<img alt="" src="/resources/img/spell/'+res[1].spell_img+'">'
		html += '<div class="spell-desc">'
		html += '<div>'+res[1].spell_kr_name+'</div>'
		html += '<br>'
		html += '<div>'+res[1].spell_desc+'</div>'
		html += '<br>'
		html += '<div>쿹타임 '+res[1].spell_cooldown+'</div>'
		html += '</div>'
		html += '</div>'
		html += '<div class="spell-text"><h6>승률</h6></div>'
		html += '<div><h4>'+win_rate+'%</h4></div>'
		html += '<div class="spell-text"><h6>픽률</h6></div>'
		html += '<div><h4>'+pick_rate+'%</h4></div>'
		html += '</div>'
		spell_box.innerHTML += html
	  }).fail(err => {
	    console.log(err);
	  });
}


function rune_full_data(main,sub,i,champRuneData) {
	let main_key = '';
	switch (main) {
	  case '8200':
		  main_key = 'Sorcery';
	    break;
	  case '8400':
		  main_key = 'Resolve';
	    break;
	  case '8000':
		  main_key = 'Precision';
	    break;
	  case '8300':
		  main_key = 'Inspiration';
	    break;
	  case '8100':
		  main_key = 'Domination';
	    break;
	  default:
	    break;
	} 
	let sub_key = '';
	switch (sub) {
	  case '8200':
		  sub_key = 'Sorcery';
	    break;
	  case '8400':
		  sub_key = 'Resolve';
	    break;
	  case '8000':
		  sub_key = 'Precision';
	    break;
	  case '8300':
		  sub_key = 'Inspiration';
	    break;
	  case '8100':
		  sub_key = 'Domination';
	    break;
	  default:
	    break;
	}
	
	$.ajax({
	  method: 'get',
	  url: '/champion/info/rune/main',
	  data: { main_key: main_key },
	}).done(res => {
		console.log(res)
		let main_rune_top = document.getElementsByClassName('main-rune-top')[0];
		let main_rune_first = document.getElementsByClassName('main-rune-first')[0];
		let main_rune_second = document.getElementsByClassName('main-rune-second')[0];
		let main_rune_third = document.getElementsByClassName('main-rune-third')[0];
		let main_rune_fourth = document.getElementsByClassName('main-rune-fourth')[0];
		main_rune_top.innerHTML = ''
		main_rune_first.innerHTML = ''
		main_rune_second.innerHTML = ''
		main_rune_third.innerHTML = ''
		main_rune_fourth.innerHTML = ''
		for (let i = 0; i < res.length; i++) {
			rune_num = res[i].rune_num % res[0].rune_num
			if(rune_num == 0){
				main_rune_top.innerHTML += '<img src="/resources/img/'+res[i].rune_img+'" alt="">'
			}else if(rune_num > 0 && rune_num < 100){
				html = ''
				html += '<div class="rune">'
				html += '<img src="/resources/img/'+res[i].rune_img+'" alt="" id="'+res[i].rune_id+'">'
				html += '<div class="rune-desc">'
				html += '<div>'+res[i].rune_kr_name+'</div>'
				html += '<br>'
				html += '<div>'+res[i].rune_desc+'</div>'
				html += '</div>'
				html += '</div>'
				main_rune_first.innerHTML += html
			}else if(rune_num > 100 && rune_num < 200){
				html = ''
				html += '<div class="rune">'
				html += '<img src="/resources/img/'+res[i].rune_img+'" alt="" id="'+res[i].rune_id+'">'
				html += '<div class="rune-desc">'
				html += '<div>'+res[i].rune_kr_name+'</div>'
				html += '<br>'
				html += '<div>'+res[i].rune_desc+'</div>'
				html += '</div>'
				html += '</div>'
				main_rune_second.innerHTML += html
			}else if(rune_num > 200 && rune_num < 300){
				html = ''
				html += '<div class="rune">'
				html += '<img src="/resources/img/'+res[i].rune_img+'" alt="" id="'+res[i].rune_id+'">'
				html += '<div class="rune-desc">'
				html += '<div>'+res[i].rune_kr_name+'</div>'
				html += '<br>'
				html += '<div>'+res[i].rune_desc+'</div>'
				html += '</div>'
				html += '</div>'
				main_rune_third.innerHTML += html
			}else if(rune_num > 300){
				html = ''
				html += '<div class="rune">'
				html += '<img src="/resources/img/'+res[i].rune_img+'" alt="" id="'+res[i].rune_id+'">'
				html += '<div class="rune-desc">'
				html += '<div>'+res[i].rune_kr_name+'</div>'
				html += '<br>'
				html += '<div>'+res[i].rune_desc+'</div>'
				html += '</div>'
				html += '</div>'
				main_rune_fourth.innerHTML += html
			}
		}
	}).fail(err => {
	  console.log(err);
	});
	
	 $.ajax({
		  method: 'get',
		  url: '/champion/info/rune/sub',
		  data: { sub_key : sub_key },
		}).done(res => {
			console.log(res)
			let sub_rune_top = document.getElementsByClassName('sub-rune-top')[0];
			let sub_rune_first = document.getElementsByClassName('sub-rune-first')[0];
			let sub_rune_second = document.getElementsByClassName('sub-rune-second')[0];
			let sub_rune_third = document.getElementsByClassName('sub-rune-third')[0];
			sub_rune_top.innerHTML = ''
			sub_rune_first.innerHTML = ''
			sub_rune_second.innerHTML = ''
			sub_rune_third.innerHTML = ''
			for (let i = 0; i < res.length; i++) {
				rune_num = res[i].rune_num % res[0].rune_num
				if(rune_num == 0){
					sub_rune_top.innerHTML += '<img src="/resources/img/'+res[i].rune_img+'" alt="">'
				}else if(rune_num > 100 && rune_num < 200){
					html = ''
					html += '<div class="rune">'
					html += '<img src="/resources/img/'+res[i].rune_img+'" alt="" id="'+res[i].rune_id+'">'
					html += '<div class="rune-desc">'
					html += '<div>'+res[i].rune_kr_name+'</div>'
					html += '<br>'
					html += '<div>'+res[i].rune_desc+'</div>'
					html += '</div>'
					html += '</div>'
					sub_rune_first.innerHTML += html
				}else if(rune_num > 200 && rune_num < 300){
					html = ''
					html += '<div class="rune">'
					html += '<img src="/resources/img/'+res[i].rune_img+'" alt="" id="'+res[i].rune_id+'">'
					html += '<div class="rune-desc">'
					html += '<div>'+res[i].rune_kr_name+'</div>'
					html += '<br>'
					html += '<div>'+res[i].rune_desc+'</div>'
					html += '</div>'
					html += '</div>'
					sub_rune_second.innerHTML += html
				}else if(rune_num > 300){
					html = ''
					html += '<div class="rune">'
					html += '<img src="/resources/img/'+res[i].rune_img+'" alt="" id="'+res[i].rune_id+'">'
					html += '<div class="rune-desc">'
					html += '<div>'+res[i].rune_kr_name+'</div>'
					html += '<br>'
					html += '<div>'+res[i].rune_desc+'</div>'
					html += '</div>'
					html += '</div>'
					sub_rune_third.innerHTML += html
				}
			}
			setTimeout(() => {
			    main_SUB1_ID = champRuneData[i].main_SUB1_ID;
			    main_SUB2_ID = champRuneData[i].main_SUB2_ID;
			    main_SUB3_ID = champRuneData[i].main_SUB3_ID;
			    main_SUB4_ID = champRuneData[i].main_SUB4_ID;
			    sub_SUB1_ID = champRuneData[i].sub_SUB1_ID;
			    sub_SUB2_ID = champRuneData[i].sub_SUB2_ID;
				 fragment1_ID = champRuneData[i].fragment1_ID;
				 fragment2_ID = champRuneData[i].fragment2_ID;
				 fragment3_ID = champRuneData[i].fragment3_ID;

			    document.getElementById(main_SUB1_ID).style.filter = 'none';
			    document.getElementById(main_SUB2_ID).style.filter = 'none';
			    document.getElementById(main_SUB3_ID).style.filter = 'none';
			    document.getElementById(main_SUB4_ID).style.filter = 'none';
			    document.getElementById(sub_SUB1_ID).style.filter = 'none';
			    document.getElementById(sub_SUB2_ID).style.filter = 'none';
			    document.getElementById(main_SUB1_ID).style.opacity = '1';
			    document.getElementById(main_SUB2_ID).style.opacity = '1';
			    document.getElementById(main_SUB3_ID).style.opacity = '1';
			    document.getElementById(main_SUB4_ID).style.opacity = '1';
			    document.getElementById(sub_SUB1_ID).style.opacity = '1';
			    document.getElementById(sub_SUB2_ID).style.opacity = '1';
			    let elements = document.getElementsByClassName('fragment-img');

				 for (let i = 0; i < elements.length; i++) {
				     elements[i].style.filter = "grayscale(100%)";
				     elements[i].style.filter = "0.5";
				 }
				 document.getElementById('first-fragment-'+fragment3_ID).style.filter = 'none'; 
				 document.getElementById('second-fragment-'+fragment2_ID).style.filter = 'none'; 
				 document.getElementById('third-fragment-'+fragment1_ID).style.filter = 'none'; 
				 document.getElementById('first-fragment-'+fragment3_ID).style.opacity = "1";
				 document.getElementById('second-fragment-'+fragment2_ID).style.opacity = "1"; 
				 document.getElementById('third-fragment-'+fragment1_ID).style.opacity = "1"; 
			    
			  }, 100);  // 0.1초 후에 코드 실행
		}).fail(err => {
		  console.log(err);
		}); 
}
 
</script>

<!-- right_container -->
<script>
document.addEventListener("DOMContentLoaded", function() {
	get_match_up(${chamInfo.champion_id});
	
});

let response;
let cid;

	// get_match_up
	function get_match_up(champion_id){
		$.ajax({
			url: '/champion/match-up.json',
			type: 'POST',
			data: {champion_id: champion_id}
		}).done(res=>{
			response = res;
			cid = champion_id;
			console.log(res)
			let left = res['champion']
			let right = res['enemy']
			make_chart(left[0], right[0])
			make_table(res['enemy'])
		}).fail(err=>{
			console.log(err)
		})
	}
	// get_match_up 끝
	
function make_chart(left, right){
	let titles = document.querySelectorAll('.bar_title')
	let keys = Object.keys(left)
	
	titles.forEach(title=>{
		keys.forEach(key=>{
			let class_name = title.className.split('bar_title')[1].trim();
			if(key == class_name){
				if(key == 'tower_kill_time'){
					let left_time = new Date(left[key] * 1000);
					let left_minutes = left_time.getMinutes();
					let left_seconds = left_time.getSeconds();
					let left_time_string = `\${left_minutes}'\${left_seconds}"`
					console.log(left_time_string)
					title.querySelector('.bar_title_left').textContent = left_time_string;

					let right_time = new Date(right[key] * 1000);
					let right_minutes = right_time.getMinutes();
					let right_seconds = right_time.getSeconds();
					let right_time_string = `\${right_minutes}'\${right_seconds}"`
					title.querySelector('.bar_title_right').textContent = right_time_string;
					
				}else{
					title.querySelector('.bar_title_left').textContent = left[key];
					title.querySelector('.bar_title_right').textContent = right[key];

				}

				let key_sum = left[key] + right[key];
				let high_key_percent = (Math.max(left[key], right[key]) / key_sum) * 100;
				let low_key_percent = (Math.min(left[key], right[key]) / key_sum) * 100;
				let bar_block = title.nextElementSibling;
				
				if (left[key] > right[key]) {
				  bar_block.querySelector('.progress-bar').style.width = high_key_percent + '%';
				  bar_block.querySelector('.bg-danger').style.width = low_key_percent + '%';
				} else {
				  bar_block.querySelector('.progress-bar').style.width = low_key_percent + '%';
				  bar_block.querySelector('.bg-danger').style.width = high_key_percent + '%';
				}

			}
		})
	})
	
	let left_html_list = '<img src="/resources/img/champion_img/square/'+ left.champion_img +'" alt="'+ left.champion_name +'" class="champion_img" id="'+ left.champion_id +'"">'
	left_html_list += '<span>' + left.champion_name + '</span>'
	left_html_list += '<span>' + left.match_up_win_rate + '</span>'

	let right_html_list = '<img src="/resources/img/champion_img/square/'+ right.champion_img +'" alt="'+ right.champion_name +'" class="champion_img2" id="'+ right.champion_id +'">'
	right_html_list += '<span>' + right.champion_name + '</span>'
	right_html_list += '<span>' + right.match_up_win_rate + '</span>'

	document.getElementById('match_up_left').innerHTML = left_html_list
	document.getElementById('match_up_right').innerHTML = right_html_list

	let right_champ = document.querySelector('.champion_img2')
	
	right_champ.addEventListener('click', function(){
		location.href = `info?champion=\${this.id}`
	})
	
	right_champ.style.cursor = 'pointer';
}
	
function make_table(enemys){
	console.log(enemys)
}

</script>
</html>