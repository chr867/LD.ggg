<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이멘토링</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
	<div class='container'>
	<h2>${member.lol_account} 회원님의 마이멘토링(멘토 전용) 페이지입니다~~</h2>
	<br>
	<h4>받은 견적서</h4>
	<div id="received_estimate"></div>
	<br>
	<h4>보낸 견적서</h4>
	<div id="sent_estimate"></div>
	<br>
	<h4>내가 신청한 수업 목록</h4>
	<div id="apply_class_history"></div>
	<br>
	<h4>수강 신청한 멘티 목록</h4>
	<div id="request_class_history"></div>
	<br>
	<h4>도움이 필요한 멘티목록</h4>
	<div id="menti_list"></div>
	<br>
	<h4>내가 찜한 멘토 목록</h4>
	<div id="like_mentor_list"></div>
	<br>
	<h4>내가 작성한 멘토 리뷰</h4>
	<div id="written_review"></div>
	<br>
	<h4>나에게 달린 리뷰</h4>
	<div id="review_for_me"></div>
	<br>
	
	<!-- 견적서 쓰기 모달 -->
	<div class="modal fade" id="estimateModal" tabindex="-1" aria-labelledby="estimateModalLabel" aria-hidden="true" style="display: none;">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="estimateModalLabel"></h5>
      </div>
      <div class="modal-body">
        <form id="estimateForm">
          <div class="mb-3">
            <label for="estimateContent" class="form-label">견적 내용</label>
            <textarea class="form-control" id="estimateContent" rows="5"></textarea>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">닫기</button>
            <button type="submit" class="btn btn-primary">전송</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<!-- 리뷰 쓰기 모달 -->

	<div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="reviewModalLabel" aria-hidden="true" style="display: none;">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="reviewModalLabel"></h5>
      </div>
      <div class="modal-body">
        <form id="reviewForm">
        <div class="mb-3">
		  <label for="grade" class="form-label">평점</label>
		  <div>
		    <span class="star-grade">
		      <input type="radio" name="grade" id="grade-1" value="1" />
		      <label for="grade-1"><i class="fa fa-star"></i>1</label>
		      <input type="radio" name="grade" id="grade-2" value="2" />
		      <label for="grade-2"><i class="fa fa-star"></i>2</label>
		      <input type="radio" name="grade" id="grade-3" value="3" />
		      <label for="grade-3"><i class="fa fa-star"></i>3</label>
		      <input type="radio" name="grade" id="grade-4" value="4" />
		      <label for="grade-4"><i class="fa fa-star"></i>4</label>
		      <input type="radio" name="grade" id="grade-5" value="5" />
		      <label for="grade-5"><i class="fa fa-star"></i>5</label>
		    </span>
		  </div>
		</div>
          <div class="mb-3">
            <label for="reviewContent" class="form-label">리뷰 내용</label>
            <textarea class="form-control" id="reviewContent" rows="5"></textarea>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">닫기</button>
            <button type="submit" class="btn btn-primary">전송</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

</div> <!-- container -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script>
$(document).ready(function() {
	
	getRequestHistory(); //나에게 수강 신청한 멘티 
	getSentEstimate(); //보낸 견적서
	getReceivedEstimate(); //받은 견적서
	getWrittenReview(); //내가 쓴 리뷰
	getClassApplyList(); //내가 신청한 수업
	
	$.ajax({ //도움이 필요한 멘티 목록 가져오기
        type: "GET",
        url: "/mentor/recom-menti",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
    	success: function(data) {
    		  let mentiList = $("#menti_list");
    		  let table = $("<table>").addClass("table");
    		  let header = $("<thead>");
    		  let tr = $("<tr>").append(
    				  $("<th>").attr("scope","col").text(""),
    		    $("<th>").attr("scope","col").text("멘티 아이디"),
    		    $("<th>").attr("scope","col").text("배우고 싶은 포지션"),
    		    $("<th>").attr("scope","col").text("배우고 싶은 챔피언"),
    		    $("<th>").attr("scope","col").text("목표 티어")
    		  );
    		  header.append(tr);
    		  table.append(header);
    		  for (let i = 0; i < data.length; i++) {
    		    let menti = data[i];
    		    $.ajax({
    		    	type: "GET",
    		        url: "/mentor/get-champ-name-by-id?id="+menti.champion_to_learn,
    		        contentType: "application/json; charset=utf-8",
    		        dataType: "json",
    		        success: function(data){
    		        	let champion_to_learn = data.champion_kr_name
    		        	if (menti.lol_account !== "${member.lol_account}"){ //현재 조회중인 사람이 아닌 멘티 정보
    	    		    	let tbody = $("<tbody>");
    	    		    let row = $("<tr>").append(
    	    		    $("<th>").attr("scope","row").text(i+1),
    	    		      $("<td>").text(menti.lol_account),
    	    		      $("<td>").text(menti.position_to_learn),
    	    		      $("<td>").text(champion_to_learn),
    	    		      $("<td>").text(menti.target_tier),
    	    		      $("<button>").attr("type","button")
    	                		.addClass("btn btn-outline-primary")
    	   		    		  .attr("id", menti.lol_account).text("견적서 작성")
    	   		    		  .on('click', function() {
    	   		    			  let menti_summoner_name = $(this).attr('id');
    	   		    			    $("#estimateModal").modal("show");
    	   		    			    $(".modal-title").attr("id",menti_summoner_name);
    	   		    			    $(".modal-title").text(menti_summoner_name+"님에게 견적서 보내기");
    	   		              })
    	    		    );
    	    		    tbody.append(row);
    	    		    table.append(tbody);
    	    		    }
    	    		  }
    		        	
    		        })
  			  }
    		    
    		  mentiList.empty().append(table);
		},
        error: function(xhr, status, error) {
            console.error(xhr.responseText);
            console.error(status);
            console.error(error);
        }
    });

	function getClassApplyList(){
	$.ajax({ //수업 신청 내역 가져오기
	    type: "POST",
	    url: "/mentor/get-mentoring-history",
	    contentType: "application/json; charset=utf-8",
	    dataType: "json",
	    data: JSON.stringify({
			email: "${member.email}"
		}),
	    success: function(data) {
	        let myMtList = $("#apply_class_history");
	        let table = $("<table>").addClass("table");
	        let header = $("<thead>");
	        let tr = $("<tr>").append(
	        		$("<th>").attr("scope","col").text(""),
	            $("<th>").attr("scope","col").text("수업 이름"),
	            $("<th>").attr("scope","col").text("멘토 이름"),
	            $("<th>").attr("scope","col").text("상태"),
	            $("<th>").attr("scope","col").text("신청 날짜"),
	            $("<th>").attr("scope","col").text("완료 날짜")
	        );
	        header.append(tr);
	        table.append(header);
	        for (let i = 0; i < data.length; i++) {
	            let myMt = data[i];
	            let tbody = $("<tbody>");
	            let row = $("<tr>").append(
	            		$("<th>").attr("scope","row").text(i+1),
	                $("<td>").text(myMt.class_name),
	                $("<td>").text(myMt.mentor_lol_account),
	                $("<td>").text(myMt.menti_state === 0 ? "대기중" : myMt.menti_state === 1 ? "진행중" : "수업 완료"),
	                $("<td>").text(myMt.apply_date),
	                $("<td>").text(myMt.done_date),
	                myMt.menti_state === 0 ? $("<button>").attr("type","button")
	                		.addClass("btn btn-outline-warning")
	                    .attr("id", myMt.class_id)
	                    .text("신청 취소").on('click', function(event) { //수업 신청 취소
	                		let classId = $(this).attr("id");
	                	    let mentiEmail = "${member.email}";
	                	    let data ={
	                	    	menti_email: mentiEmail,
	                	    	class_id: classId
	                	    }
	                		$(this).closest('tr').remove();
	                		$.ajax({
	                            url: "/mentor/delete-mentoring-history",
	                            type: "DELETE",
	                            data: JSON.stringify(data),
	                            contentType: "application/json; charset=utf-8",
	                            success: function() {
	                                alert("수업 신청이 취소되었습니다");
	                            },
	                            error: function() {
	                                alert("수업 신청 취소 실패");
	                            }
	                        });
	                		
	                	}) : null,
	                myMt.menti_state === 1 ? $("<button>").attr("type","button")
	                		.addClass("btn btn-outline-danger")
	                    .attr("id", myMt.class_id)
	                    .text("환불").on('click', function(event) { //수업 환불
	                		let classId = $(this).attr("id");
	                	    let mentiEmail = "${member.email}";
	                	    let data ={
	                		    	menti_email: mentiEmail,
	                		    	class_id: classId
	                		    }
	                		$(this).closest('tr').remove();
	                	    $.ajax({
	                            url: "/mentor/refund-mentoring-history",
	                            type: "DELETE",
	                            data: JSON.stringify(data),
	                            contentType: "application/json; charset=utf-8",
	                            success: function() {
	                                alert("수업 환불 완료");
	                            },
	                            error: function() {
	                                alert("환불 실패");
	                            }
	                        });
	                		
	                	}) : null,
	                myMt.menti_state === 2 ? $("<button>").attr("type","button")
	                		.addClass("btn btn-outline-primary")
	                    .attr("id", myMt.mentoring_id)
	                    .attr("name", myMt.class_id)
	                    .text("리뷰 쓰기").on('click', function() {
	        	            let mentor_name = this.id;
	        	            let class_id = this.name;
	        	            console.log(class_id);
	        	            $("#reviewModal").modal("show"); //리뷰 모달 켜기
	        	            $(".modal-title").attr("id",mentor_name);
	        	            $(".modal-title").attr("name",class_id);
	        	            $(".modal-title").text(mentor_name+"님에게 리뷰 쓰기");
	        	        }) : null
	            );
	            tbody.append(row)
	            table.append(tbody);
	            if (myMt.menti_state === 2) {
	                $.ajax({
	                    url: "/mentor/get-review-by-reviewer",
	                    type: "POST",
	                    contentType: "application/json; charset=utf-8",
	                    dataType: "json",
	                    data: JSON.stringify({
	                        reviewer_email: "${member.email}"
	                    }),
	                    success: function(data) {
	                        for (let i = 0; i < data.length; i++) {
	                            let myReview = data[i];
	                            if (myReview.class_id === myMt.class_id) {
	                            	 row.find("#"+myMt.mentoring_id+"").hide();
	                                break;
	                            }
	                        }
	                    },
	                    error: function(xhr, status, error) {
	                        console.error(xhr.responseText);
	                        console.error(status);
	                        console.error(error);
	                    }
	                });
	            }
	        }
	        myMtList.empty().append(table);
	        
	    },
	    error: function(xhr, status, error) {
	        console.error(xhr.responseText);
	        console.error(status);
	        console.error(error);
	    }
	});
	}

	
	$(".btn-close").click(()=>{ //리뷰 모달 끄기
		$("#reviewModal").modal("hide");
	});
	$(function() { 
		let grade = 0;
		  $('.star-grade input').change(function() {//리뷰 평점 바꿀때마다 적용
		    grade = $(this).val();
		  });
		
	  $("#reviewForm").submit(function(event) {
	    event.preventDefault();
	    let form_data = {
    		reviewer_email: "${member.email}",
    		class_id: $(".modal-title").attr('name'),
	    	review_content: $("#reviewContent").val(),
	    	mentor_email: $(".modal-title").attr("id"),
	      	grade: grade
	    };
	    $.ajax({ //리뷰 보내기 기능
	      type: "POST",
	      url: "/mentor/save-review",
	      data: JSON.stringify(form_data),
	      contentType: "application/json; charset=utf-8",
	      success: function(data) {
	        alert("리뷰 작성 완료.");
	        $("#reviewModal").modal("hide");
	        getWrittenReview();
	        getClassApplyList();
	      },
	      error: function(xhr, status, error) {
	        console.error(xhr.responseText);
	        console.error(status);
	        console.error(error);
	      }
	    });
	  });
	});
	
	$.ajax({ //내가 찜한 멘토 가져오기
		url: "/mentor/get-like-mentor",
		type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: JSON.stringify({
			email: "${member.email}"
		}),
        success: function(data) {
    		  let likeMentorList = $("#like_mentor_list");
    		  let table = $("<table>").addClass("table");
    		  let header = $("<thead>");
    		  let tr = $("<tr>").append(
    				  $("<th>").attr("scope","col"),
    		    $("<th>").text("찜한 멘토")
    		  );
    		  header.append(tr);
    		  table.append(header);
    		  for (let i = 0; i < data.length; i++) {
    		    let like_mentor = data[i];
    		    let tbody = $("<tbody>");
    		    let row = $("<tr>").append(
    		    		$("<th>").attr("scope","row").text(i+1),
    		      $("<td>").text(like_mentor.mentor_lol_account),
    		      $("<button>").attr("type","button")
          		.addClass("btn btn-outline-secondary")
    		      .text("찜 해제").on("click", function() {
    		          $(this).closest('tr').remove(); // 클릭한 버튼이 속한 행 삭제
    		          let data ={
    		        	email: "${member.email}",
		                like_mentor: ""+like_mentor.like_mentor
    		          }
    		          $.ajax({
		                    url: "/mentor/delete-like-mentor",
		                    type: "DELETE",
		                    data: JSON.stringify(data),
		                    contentType: "application/json; charset=utf-8",
		                    success: function() {
		                        alert("찜 목록에서 삭제 되었습니다.");
		                    },
		                    error: function() {
		                        alert("삭제 실패.");
		                    }
		                });
    		      })
    		    );
    		    tbody.append(row);
    		    table.append(tbody);
    		  }
    		  likeMentorList.empty().append(table);
		},
        error: function(xhr, status, error) {
            console.error(xhr.responseText);
            console.error(status);
            console.error(error);
        }
    });
	function getWrittenReview() {
	$.ajax({ //내가 쓴 리뷰
		url: "/mentor/get-review-by-reviewer",
		type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: JSON.stringify({
			reviewer_email: "${member.email}"
		}),
        success: function(data) {
    		  let writtenReviewList = $("#written_review");
    		  let table = $("<table>").addClass("table");
    		  let header = $("<thead>");
    		  let tr = $("<tr>").append(
    		    $("<th>").attr("scope","col"),
    		    $("<th>").attr("scope","col").text("작성자"),
    		    $("<th>").attr("scope","col").text("멘토"),
    		    $("<th>").attr("scope","col").text("수업 이름"),
    		    $("<th>").attr("scope","col").text("리뷰 내용"),
    		    $("<th>").attr("scope","col").text("작성일"),
    		    $("<th>").attr("scope","col").text("평점")
    		  );
    		  header.append(tr);
    		  table.append(header);
    		  for (let i = 0; i < data.length; i++) {
    		    let written_review = data[i];
    		    let tbody = $("<tbody>");
    		    let row = $("<tr>").append(
    		      $("<th>").attr("scope","row").text(i+1),
    		      $("<td>").text(written_review.reviewer_lol_account),
    		      $("<td>").text(written_review.mentor_lol_account),
    		      $("<td>").text(written_review.class_name),
    		      $("<td>").text(written_review.review_content),
    		      $("<td>").text(written_review.review_date),
    		      $("<td>").text(written_review.grade+'점'),
    		      $("<button>").attr("type","button")
          		.addClass("btn btn-outline-danger")
    		      .text("리뷰 삭제").on("click", function() {
    		          $(this).closest('tr').remove(); // 클릭한 버튼이 속한 행 삭제
    		          let data ={
   		        		  review_num: written_review.review_num
    		          }
    		          $.ajax({//리뷰 삭제
		                    url: "/mentor/delete-review",
		                    type: "DELETE",
		                    data: JSON.stringify(data),
		                    contentType: "application/json; charset=utf-8",
		                    success: function() {
		                        alert("리뷰가 삭제 되었습니다.");
		                    },
		                    error: function() {
		                        alert("삭제 실패.");
		                    }
		                });
    		      })
    		    );
    		    tbody.append(row);
    		    table.append(tbody);
    		  }
    		  writtenReviewList.empty().append(table);
		},
        error: function(xhr, status, error) {
            console.error(xhr.responseText);
            console.error(status);
            console.error(error);
        }
    });
	}
	
	$.ajax({ //내게 달린 리뷰
		url: "/mentor/get-review-for-me",
		type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: JSON.stringify({
			mentor_email: "${member.email}"
		}),
        success: function(data) {
    		  let reviewForMeList = $("#review_for_me");
    		  let table = $("<table>").addClass("table");
    		  let header = $("<thead>");
    		  let tr = $("<tr>").append(
    		    $("<th>").attr("scope","col"),
    		    $("<th>").attr("scope","col").text("작성자"),
    		    $("<th>").attr("scope","col").text("멘토"),
    		    $("<th>").attr("scope","col").text("수업 이름"),
    		    $("<th>").attr("scope","col").text("리뷰 내용"),
    		    $("<th>").attr("scope","col").text("작성일"),
    		    $("<th>").attr("scope","col").text("평점")
    		  );
    		  header.append(tr);
    		  table.append(header);
    		  for (let i = 0; i < data.length; i++) {
    		    let review_for_me = data[i];
    		    let tbody =$("<tbody>");
    		    let row = $("<tr>").append(
    		    		$("<th>").attr("scope","row").text(i+1),
    		      $("<td>").text(review_for_me.reviewer_lol_account),
    		      $("<td>").text(review_for_me.mentor_lol_account),
    		      $("<td>").text(review_for_me.class_name),
    		      $("<td>").text(review_for_me.review_content),
    		      $("<td>").text(review_for_me.review_date),
    		      $("<td>").text(review_for_me.grade+'점'),
    		      $("<button>").attr("type","button")
          		.addClass("btn btn-outline-danger")
    		      .text("리뷰 삭제").on("click", function() {
    		          $(this).closest('tr').remove(); // 클릭한 버튼이 속한 행 삭제
    		          let data ={
   		        		  review_num: review_for_me.review_num
    		          }
    		          $.ajax({//리뷰 삭제
		                    url: "/mentor/delete-review",
		                    type: "DELETE",
		                    data: JSON.stringify(data),
		                    contentType: "application/json; charset=utf-8",
		                    success: function() {
		                        alert("리뷰가 삭제 되었습니다.");
		                    },
		                    error: function() {
		                        alert("삭제 실패.");
		                    }
		                });
    		      })
    		    );
    		    tbody.append(row)
    		    table.append(tbody);
    		  }
    		  reviewForMeList.empty().append(table);
		},
        error: function(xhr, status, error) {
            console.error(xhr.responseText);
            console.error(status);
            console.error(error);
        }
    });
	
	/* $(document).on('click', '.cancel-btn', function(event) { //수업 신청 취소
		let classId = $(this).attr("id");
	    let mentiEmail = "${member.email}";
	    let data ={
	    	menti_email: mentiEmail,
	    	class_id: classId
	    }
		$(this).closest('tr').remove();
		$.ajax({
            url: "/mentor/delete-mentoring-history",
            type: "DELETE",
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            success: function() {
                alert("수업 신청이 취소되었습니다");
            },
            error: function() {
                alert("수업 신청 취소 실패");
            }
        });
		
	}) */
	/* $(document).on('click', '.refund-btn', function(event) { //수업 환불
		let classId = $(this).attr("id");
	    let mentiEmail = "${member.email}";
	    let data ={
		    	menti_email: mentiEmail,
		    	class_id: classId
		    }
		$(this).closest('tr').remove();
	    $.ajax({
            url: "/mentor/refund-mentoring-history",
            type: "DELETE",
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            success: function() {
                alert("수업 환불 완료");
            },
            error: function() {
                alert("환불 실패");
            }
        });
		
	}) */
	
	$(".btn-close").click(()=>{ //견적서 모달 끄기
		$("#estimateModal").modal("hide");
	});
	  $("#estimateForm").submit(function(event) {
	    event.preventDefault();
	    let form_data = {
	    	estimate_info: $("#estimateContent").val(),
	      	mentor_email: "${member.email}",
	      	menti_email: $(".modal-title").attr("id")
	    };
	    $.ajax({ //견적서 보내기 기능
	      type: "POST",
	      url: "/mentor/save-estimate",
	      data: JSON.stringify(form_data),
	      contentType: "application/json; charset=utf-8",
	      success: function(data) {
	        alert("견적서가 전송되었습니다.");
	        $("#estimateModal").modal("hide");
	        getSentEstimate();
	        getReceivedEstimate();
	      },
	      error: function(xhr, status, error) {
	        console.error(xhr.responseText);
	        console.error(status);
	        console.error(error);
	      }
	    });
	  });
	  
	  
	  function getRequestHistory() {
			$.ajax({ //수업 요청 내역 가져오기
				type: "POST",
			    url: "/mentor/get-request-history",
			    contentType: "application/json; charset=utf-8",
			    dataType: "json",
			    data: JSON.stringify({
					email: "${member.email}"
				}),
		    	success: function(data) {
		    		  let myMtList = $("#request_class_history");
		    		  let table = $("<table>").addClass("table");
		    		  let header = $("<thead>");
		    		  let tr = $("<tr>").append(
		  				$("<th>").attr("scope","col"),
		  				$("<th>").attr("scope","col").text("신청한 멘티"),
		  				$("<th>").attr("scope","col").text("수업 이름"),
		    		    $("<th>").attr("scope","col").text("상태"),
		    		    $("<th>").attr("scope","col").text("신청 날짜"),
		    		    $("<th>").attr("scope","col").text("완료 날짜")
		    		  );
		    		  header.append(tr);
		    		  table.append(header);
		    		  for (let i = 0; i < data.length; i++) {
		    			  let myMt = data[i];
		    			  let tbody = $("<tbody>");
		    			  let row = $("<tr>").append(
		    					  $("<th>").attr("scope","row").text(i+1),
		    			    $("<td>").text(myMt.menti_lol_account),
		    			    $("<td>").text(myMt.class_name),
		    			    $("<td>").text(myMt.menti_state === 0 ? "대기중" : myMt.menti_state === 1 ? "진행중" : "수업 완료"),
		    			    $("<td>").text(myMt.apply_date),
		    			    $("<td>").text(myMt.done_date),
		    			    myMt.menti_state === 0 ? 
		    			    		$("<div>").append(
		    			    		    $("<button>").attr("type","button").addClass("btn btn-outline-primary")
		    			    		        .attr("id", myMt.class_id)
		    			    		        .text("수락").on('click', function(event) { //수락 버튼 누를떄 멘토링 내역 수정
		    			    		    		let mentiEmail = $(this).closest('tr').find('td:eq(0)').text(); //소환사명
		    			    		    		let class_id = $(this).attr("id");
		    			    		    		let mentor_email = "${member.email}"
		    			    		    		$.ajax({
		    			    		    		    type: "PUT",
		    			    		    		    url: "/mentor/update-mentoring-history", 
		    			    		    		    contentType: "application/json; charset=utf-8",
		    			    		    		    data: JSON.stringify({
		    			    		    		    	menti_email: mentiEmail, //소환사명
		    			    		    		        class_id: class_id,
		    			    		    		        menti_state: 1, // 상태를 업데이트 합니다.
		    			    		    		    }),
		    			    		    		    success: function() {
		    			    		    		      // 성공적으로 업데이트 되었을 경우 처리할 내용을 작성합니다.
		    			    		    		      	console.log("1: "+class_id)
		    			    		    		      	$.ajax({// 클래스 아이디로 클래스 정보 가져오기
		    			    		    				    url: "/mentor/select-by-id-mentor-class?class_id=" + class_id,
		    			    		    				    type: "GET",
		    			    		    				    contentType: "application/json;charset=UTF-8",
		    			    		    				    success: function (mentor_class) {
		    			    		    				    	let mentor_class_info = JSON.parse(mentor_class)
		    			    		    				    	class_price = mentor_class_info.price
		    			    		    						let chargedPoint = parseInt(class_price - (class_price / 10));
		    			    		    				 		$.ajax({
		    			    		    							method : 'post',
		    			    		    							url : '/mentor/myMentoring/tx.json',
		    			    		    							contentType : "application/json; charset=utf-8",
		    			    		    							data : JSON.stringify({
		    			    		    								sender_id : mentiEmail,
		    			    		    								receiver_id : mentor_email,
		    			    		    								points_sent : class_price,
		    			    		    								points_received : chargedPoint
		    			    		    							})
		    			    		    						}).done(res=>{
		    			    		    							console.log(res);
		    			    		    							alert("승인 되었습니다!");
		    			    		    						}).fail(err=>{
		    			    		    						})
		    			    		    				    },
		    			    		    				    error: function (xhr, status, error) {
		    			    		    				      console.error(error);
		    			    		    				    },
		    			    		    				  });
		    			    		    		      	getRequestHistory();
		    			    		    		    },
		    			    		    		    error: function(xhr, status, error) {
		    			    		    		      console.error(xhr.responseText);
		    			    		    		      console.error(status);
		    			    		    		      console.error(error);
		    			    		    		    }
		    			    		    		  });
		    			    		    	}),
		    			    		    $("<button>").attr("type","button").addClass("btn btn-outline-danger")
		    			    		        .attr("id", myMt.class_id)
		    			    		        .text("거절").on('click', function(event) { //거절 버튼 누를떄 멘토링 내역 수정
		    			    		    		let classId = $(this).attr("id");
		    			    		    		let mentiEmail = $(this).closest('tr').find('td:eq(0)').text(); //멘티 소환사명
		    			    		    	    let data ={
		    			    		    	    	menti_email: mentiEmail,
		    			    		    	    	class_id: classId
		    			    		    	    }
		    			    		    		$(this).closest('tr').remove();
		    			    		    		$.ajax({
		    			    		                url: "/mentor/reject-mentoring-history",
		    			    		                type: "DELETE",
		    			    		                data: JSON.stringify(data),
		    			    		                contentType: "application/json; charset=utf-8",
		    			    		                success: function() {
		    			    		                    alert("수업이 거절되었습니다");
		    			    		                },
		    			    		                error: function() {
		    			    		                    alert("거절 실패");
		    			    		                }
		    			    		            });
		    			    		    	})
		    			    		) : null,
		    			    myMt.menti_state === 1 ? $("<button>")
		    			    		.attr("type","button").addClass("btn btn-outline-success")
		    			    		.attr("id", myMt.class_id)
		    			    		.text("수업 완료").on('click', function(event) { //수업완료 버튼 누를떄 멘토링 내역 수정
		    			    			let mentiEmail = ""+$(this).closest('tr').find('td:eq(0)').text();
		    			    			const date = new Date();
		    			    			const kstDate = new Date(date.getTime() + (9 * 60 * 60 * 1000)); //로컬 시간으로 변경
		    			    			const localeTime = kstDate.toISOString();
		    			    			$.ajax({
		    			    			    type: "PUT",
		    			    			    url: "/mentor/update-mentoring-history", 
		    			    			    contentType: "application/json; charset=utf-8",
		    			    			    data: JSON.stringify({
		    			    			    	menti_email: mentiEmail, //소환사명
		    			    			        class_id: $(this).attr("id"),
		    			    			        mentor_email: "${member.email}",
		    			    			        menti_state: 2, // 상태를 업데이트 합니다.
		    			    					done_date: localeTime
		    			    			    }),
		    			    			    success: function() {
		    			    			      // 성공적으로 업데이트 되었을 경우 처리할 내용
		    			    			    	getRequestHistory();
		    			    			    },
		    			    			    error: function(xhr, status, error) {
		    			    			      console.error(xhr.responseText);
		    			    			      console.error(status);
		    			    			      console.error(error);
		    			    			    }
		    			    			  });
		    			    		}) : null
		    			  );
		    			  tbody.append(row);
		    		    table.append(tbody);
		    		  }
		    		  myMtList.empty().append(table);
				},
		        error: function(xhr, status, error) {
		            console.error(xhr.responseText);
		            console.error(status);
		            console.error(error);
		        }
		    });
			}
	  
	  function getReceivedEstimate() {
	  $.ajax({ //받은 견적서 목록 가져오기
	        type: "GET",
	        url: "/mentor/get-received-estimate",
	        contentType: "application/json; charset=utf-8",
	        dataType: "json",
	    	success: function(data) {
	    		  let rEstList = $("#received_estimate");
	    		  let table = $("<table>").addClass("table");
	    		  let header = $("<thead>");
	    		  let tr = $("<tr>").append(
	    		    $("<th>").attr("scope","col"),
	    		    $("<th>").attr("scope","col").text("견적서를 보낸 멘토"),
	    		    $("<th>").attr("scope","col").text("견적 내용"),
	    		    $("<th>").attr("scope","col").text("보낸 날짜")
	    		  );
	    		  header.append(tr);
	    		  table.append(header);
	    		  for (let i = 0; i < data.length; i++) {
	    		    let est = data[i];
	    		    let tbody = $("<tbody>");
	    		    let row = $("<tr>").append(
	    		    		$("<th>").attr("scope","row").text(i+1),
	    		      $("<td>").text(est.mentor_lol_account),
	    		      $("<td>").text(est.estimate_info),
	    		      $("<td>").text(est.estimate_date),
	    		       $("<button>").attr("type","button").addClass("btn btn-outline-danger")
	    		       .attr("id",est.estimate_id).text("견적서 삭제").on("click", function() {
	    		          $(this).closest('tr').remove(); // 클릭한 버튼이 속한 행 삭제
	    		          let estid = this.id;
	    		          let data ={
	    		        	estimate_id: estid
	    		          }
	    		          $.ajax({
			                    url: "/mentor/delete-estimate",
			                    type: "DELETE",
			                    data: JSON.stringify(data),
			                    contentType: "application/json; charset=utf-8",
			                    success: function() {
			                        alert("견적서가 삭제 되었습니다.");
			                    },
			                    error: function() {
			                        alert("삭제 실패.");
			                    }
			                });
	    		      })
	    		    );
	    		    tbody.append(row)
	    		    table.append(tbody);
	    		  }
	    		  rEstList.empty().append(table);
			},
	        error: function(xhr, status, error) {
	            console.error(xhr.responseText);
	            console.error(status);
	            console.error(error);
	        }
	    });
	  }
	  
	  function getSentEstimate() {
	  $.ajax({ //보낸 견적서 목록 가져오기
	        type: "GET",
	        url: "/mentor/get-sent-estimate",
	        contentType: "application/json; charset=utf-8",
	        dataType: "json",
	    	success: function(data) {
	    		  let sEstList = $("#sent_estimate");
	    		  let table = $("<table>").addClass("table");
	    		  let header = $("<thead>");
	    		  let tr = $("<tr>").append(
	    		    $("<th>").attr("scope","col"),
	    		    $("<th>").attr("scope","col").text("내 견적서를 받은 멘티"),
	    		    $("<th>").attr("scope","col").text("견적 내용"),
	    		    $("<th>").attr("scope","col").text("보낸 날짜")
	    		  );
	    		  header.append(tr);
	    		  table.append(header);
	    		  for (let i = 0; i < data.length; i++) {
	    		    let est = data[i];
	    		    let tbody = $("<tbody>");
	    		    let row = $("<tr>").append(
	    		    		$("<th>").attr("scope","row").text(i+1),
	    		      $("<td>").text(est.menti_lol_account),
	    		      $("<td>").text(est.estimate_info),
	    		      $("<td>").text(est.estimate_date),
	    		      $("<button>").attr("type","button").addClass("btn btn-outline-danger")
	    		      .attr("id",est.estimate_id).text("견적서 삭제").on("click", function() {
	    		          $(this).closest('tr').remove(); // 클릭한 버튼이 속한 행 삭제
	    		          let estid = this.id;
	    		          let data ={
	    		        	estimate_id: estid
	    		          }
	    		          $.ajax({
			                    url: "/mentor/delete-estimate",
			                    type: "DELETE",
			                    data: JSON.stringify(data),
			                    contentType: "application/json; charset=utf-8",
			                    success: function() {
			                        alert("견적서가 삭제 되었습니다.");
			                    },
			                    error: function() {
			                        alert("삭제 실패.");
			                    }
			                });
	    		      })
	    		    );
	    		    tbody.append(row)
	    		    table.append(tbody);
	    		  } 
	    		  sEstList.empty().append(table);
			},
	        error: function(xhr, status, error) {
	            console.error(xhr.responseText);
	            console.error(status);
	            console.error(error);
	        }
	    });
	  }
	});
</script>


	
</body>
</html>