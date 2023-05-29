<%--
  Created by IntelliJ IDEA.
  User: chaehuijeong
  Date: 2023/05/12
  Time: 7:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>title</title>
    <link rel="stylesheet" href="/resources/css/question/questionList.css">
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
    <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
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
        justify-content: center;
        text-align: center;
    }

    #my_champion{
        position: absolute;
        top: 15%;
        left: 15%;
    }

    #champ_search_box input{
        width: 220px;
        border-radius: 5px;
    }

    #my_champion_img{
        width: 370px;
        height: 400px;
        padding-top: 20px;
        padding-bottom: 15px;
        border-radius: 70%;
    }

    #build_recom_box button{
        margin-top: 20px;
    }

    #counter_champion{
        position: absolute;
        height: auto;
        top: 25%;
        left: 55%;
    }

    #right_champion_img{
        width: 140px;
        height: 140px;
        border-radius: 70%;
    }

    #right_champ_search_box{
        position: relative;
        left: -30%;
        top: 30%;
    }

    #recom_champ{
        position: absolute;
        left: 36%;
        top: 67%;
    }

    #recom_champ img{
        width: 140px;
        height: 140px;
        margin-right: 20px;
        border-radius: 70%;
    }

    #span_container{
        display: grid;
    }

</style>
<body>
<%@ include file="../header.jsp" %>
<%@ include file="../sidebar.jsp" %>
<%@ include file="../footer.jsp" %>
<div class="main-container-q">
    <div id="email" hidden="true">
        ${email}
    </div>
    <div class="select-question-box">
        <button class="select-option-btn" onclick="select_question(this.value)" value="1">답변 완료</button>
        <button class="select-option-btn" onclick="select_question(this.value)" value="2">답변 대기</button>
        <button class="select-option-btn" onclick="select_question(this.value)" value="3">내 스크랩</button>
        <button class="select-option-btn" onclick="select_question(this.value)" value="4">내 질문</button>
    </div>
    <div class="tag-box" id="tag_list">
        <table>
            <tr>
                <td>포지션</td>
                <td>
                    <button class="table-btn" id="position_btn" value="all" onclick="tag1_search(event)">전체</button>
                    <button class="table-btn" id="position_btn" value="top" onclick="tag1_search(event)">탑</button>
                    <button class="table-btn" id="position_btn" value="jungle" onclick="tag1_search(event)">정글</button>
                    <button class="table-btn" id="position_btn" value="mid" onclick="tag1_search(event)">미드</button>
                    <button class="table-btn" id="position_btn" value="bottom" onclick="tag1_search(event)">바텀</button>
                    <button class="table-btn" id="position_btn" value="supporter" onclick="tag1_search(event)">서포터</button>
                </td>
            </tr>
            <tr>
                <td>챔피언</td>
                <td>
                    <input class="input_champ"type="text" id="champion_txt">
                    <button class="table-btn" id="tag-2" onclick="tag2_search(event)">검색</button>
                </td>
            </tr>
        </table>
    </div>
    <div class="question-write-box">
        <div class="recom-ment">궁금하신 점이 있으신가요? 질문글을 작성하세요!</div>
        <button class="question-write-btn" id="question_write">질문 작성하기</button>
    </div>
    <div class="question-box" id="question_list">
    </div>
</div>
<div></div>
<script src="/resources/js/question/questionList.js"></script>
<script type="text/javascript">
    function goWrite(frm) {
        console.log(frm);
        let contents = frm.a_content.value; //공백 => &nbsp
        console.log(contents);
        let question_id = frm.question_id.value;
        console.log(question_id);
        let email = frm.email.value;
        console.log(email);

        if (contents.trim() == '') {
            alert('내용을 입력해주세욧!!!')
            return false;
        }

        frm.submit();
    }
</script>
</body>
</html>