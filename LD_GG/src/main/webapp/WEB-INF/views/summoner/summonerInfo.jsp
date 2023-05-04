<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.3.js"
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>
	
	
</head>
<body>

	<div id = "whole_div">
		<div id = "background-profile">
			<div id = "summoner-profile">
			
				<div id = "profile-icon">
					<img alt="#" src="https://ddragon.leagueoflegends.com/cdn/13.8.1/img/profileicon/${summoner.profile_icon_id}.png">
				</div>
				
				<p id = "summoner-level">${summoner.s_level}</p>
			
				<button id = "renewal" value = "전적 갱신">전적 갱신</button>
				
			</div>
			
		</div><!-- 소환사 프로필 배경 -->
		
		<div id = "solo-rank">
			<img alt="#" src="https://opgg-static.akamaized.net/images/medals/${summoner.solo}.png">
		</div>
		
		<div id = "flex-rank">
			<img alt="#" src="https://opgg-static.akamaized.net/images/medals/${summoner.flex}.png">
		</div>
		
		<div id = "tier-graph">
		
		</div>
		
		<div id = "champ-stat">
		
			<div id = "champ_rank_filter">
				<input type = "radio" value = "랭크 전체" class = "rank_filter" id = "champ_all">
				<input type = "radio" value = "솔로 랭크" class = "rank_filter" id = "champ_solo">
				<input type = "radio" value = "자유 랭크" class = "rank_filter" id = "champ_flex">
				<input type = "radio" value = "일반" class = "rank_filter" id = "champ_classic">
			</div>
			
			<div id = "champ_position_filter">
			
			</div>
			
			<table>
				<thead>
					<tr>
						<th>챔피언</th>
						<th>승률</th>
						<th>게임수</th>
						<th>승리</th>
						<th>패배</th>
						<th>KDA</th>
						<th>킬</th>
						<th>데스</th>
						<th>어시스트</th>
						<th>CS</th>
						<th>분당 CS</th>
					</tr>
				</thead>
				
				<tbody id = "champ">
				
				</tbody>
				
			</table>
			
		</div><!-- 해당 소환사의 Top3 챔피언 통계 -->
		
		<div>
			<div id = "match_history">
				<span id = "history">매치 히스토리</span>
			</div><!-- 전적 정보 필터 -->
			
			<div id = "record_filter">
				<button type = "button" id = "all_game_filter">전체</button>
				<button type = "button" id = "solo_filter">솔로 랭크</button>
				<button type = "button" id = "flex_filter">자유 랭크</button>
				<button type = "button" id = "classic_filter">일반</button>
			</div>
			
			<div>
				<span id = "20games">최근 20게임 전적 요약</span>
				<table id = "recent_20games">
				
				</table>
			</div>
			
			<table id = "recent_table">
				<tr>
					<th>승률</th>
					<th>평점</th>
					<th>최고평점</th>
					<th>포지션 픽률</th>
					<th>자주 플레이한 챔피언</th>
				</tr>
			</table>
			
				<table id = "record">
					
				</table><!-- 전적 정보 테이블 -->
		
		</div><!-- 소환사 전적 -->
		
	</div>	<!-- 전체 -->

	<script type="text/javascript">
	$('#renewal').click(function(){
		$.ajax({//전적 정보 전체 갱신
			method : 'post',
			url : '/summoner/renewal',
			data : {summoner_name : '${summoner.summoner_name}'}
		}).done(res=>{
			console.log(res)
		}).fail(err=>{
			console.log(err)
		})
	})
	
	$.ajax({//소환사의 챔피언 통계 필터 버튼 생성(포지션별 픽률 높은 순으로 생성)
		method : 'get',
		url : '/summoner/get_champ_position_filter',
		data : {summoner_name : '${summoner.summoner_name}'}
	}).done(res=>{
		let pList = '<button id = "position"><img src = "" alt ="#"></button>'
		for(position of res){
			pList = '<button type = "button" class = "position"><img src = "" alt = "#"></button>'
			pList = '<button type = "button" class = "position"><img src = "" alt = "#"></button>'
			pList = '<button type = "button" class = "position"><img src = "" alt = "#"></button>'
			pList = '<button type = "button" class = "position"><img src = "" alt = "#"></button>'
			pList = '<button type = "button" class = "position"><img src = "" alt = "#"></button>'
		$('#champ_position_filter').html(pList)
		}
	})
	
	$.ajax({//소환사의 챔피언 통계
		method : 'get',
		url : '/summoner/get_champ_record',
		data : {summoner_name : '${summoner.summoner_name}'}
	}).done(res=>{
		let cList = '<tbody>'
		for(champ of res){
			cList += '<tr class = "'+champ.champ_id+'">'
			cList += '<td><div><img src="https://ddragon.leagueoflegends.com/cdn/13.4.1/img/champion/'+champ.champ_name+'.png" alt="#"><p>'+champ.champ_name+'</p></div></td>'
			cList += '<td>'+champ.winrate+'%</td>'
			cList += '<td>'+champ.games+'</td>'
			cList += '<td>'+champ.wins+'</td>'
			cList += '<td>'+champ.lose+'</td>'
			cList += '<td>'+champ.KDA+'</td>'
			cList += '<td>'+champ.kills+'</td>'
			cList += '<td>'+champ.deaths+'</td>'
			cList += '<td>'+champ.assists+'</td>'
			cList += '<td>'+champ.cs+'</td>'
			cList += '<td>'+champ.cs_per_minute+'</td>'
		cList += '</tbody>'
		$('#champ').html(cList)
		}
	})
	
	$.ajax({//최근 20전적 요약본
		method : 'get',
		url : '/summoner/get_20games_summary',
		data : {summoner_name : '${summoner.summoner_name}'}
	}).done(res=>{
		let gList = '<tbody>'
		gList += '<td><span>'+res.winrate+'</span><span>'+res.wins+'승 '+res.lose+'패</span></td>'
		gList += '<td>'+res.ava_point+'</td>'
		gList += '<td>'+res.maximan_ava+'</td>'
		gList += '<td>'+res.position_pick+'</td>'
		gList += '<td><div><img src="https://ddragon.leagueoflegends.com/cdn/13.4.1/img/champion/'+res.most_champ_id2+'.png" alt="#"><p><span>'+res.most_champ2_winrate+'</span><span>'+res.most_champ1_win+'승'+res.most_champ1_lose+'패</span></p></div></td>'
		gList += '<td><div><img src="https://ddragon.leagueoflegends.com/cdn/13.4.1/img/champion/'+res.most_champ_id2+'.png" alt="#"><p><span>'+res.most_champ2_winrate+'</span><span>'+res.most_champ2_win+'승'+res.most_champ2_lose+'패</span></p></div></td>'
		gList += '<td><div><img src="https://ddragon.leagueoflegends.com/cdn/13.4.1/img/champion/'+res.most_champ_id3+'.png" alt="#"><p><span>'+res.most_champ3_winrate+'</span><span>'+res.most_champ3_win+'승'+res.most_champ3_lose+'패</span></p></div></td>'
		let gList += '</tbody>'
		$('#recent_20games').html(gList)
	}).fail(err=>{
		console.log(err)
	})
	
	$.ajax({//전적 정보 가져오기
		method : 'get',
		url : '/summoner/get_summoner_record',
		data : {summoner_name : '${summoner.summoner_name}'}
	}).done(res=>{
		let rList = '<tbody>';
		for(record of res){
			rList += '<tr id = "'+record.summoner_name+'">'
			rList += '<td><span class = "win_lose"></span><span class = "game_mode"></span></td>'
			rList += '<td><div><img src="https://ddragon.leagueoflegends.com/cdn/13.4.1/img/champion/'+record.champ_name+'.png" alt="#"></div></td>'
			rList += '<td><div></div></td>'
		rList += '</tbody>'
		}
		$('#record').html(rList)
	}).fail(err=>{
		console.log(err)
	})
	
	//빌드 버튼 클릭 시
	$('#build').click(function(){
		$.ajax({
			method : 'get',
			url : '/summoner/get_record_build',
			data : {summoner_name : '${summoner.summoner_name}'}
		}).done(res=>{
			console.log(res)
			dList = '<div>'
			for(build of res){
				dList += '<div><div><header><div></div></header><header><div></div></header></div></div>'//아이템 빌드, 스킬 마스터리
				dList += '<div><header><div></div><div></div></header></div>'//룬 빌드 정보
			dList += '</div>'
			}
			$('.build_info').html(dList)
		}).fail(err=>{
			console.log(err)
		})
	})
	
	//랭킹 버튼 클릭 시
	$('#ranking').click(function(){
		$.ajax({
			method : 'get',
			url : '/summoner/get_record_build',
			data : {summoner_name : '${summoner.summoner_name}'}
		}).done(res=>{
			console.log(res)
		}).fail(err=>{
			console.log(err)
		})
	})
	
	
	$('.rank_filter').click(function(){
		$('.rank_filter').not(this).prop('checked', false)
	})
	
	</script>

</body>
</html>