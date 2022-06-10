<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-06-08
  Time: 오후 1:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <style>
        @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");

        html {
            height: 100%;
        }
        .container {
            max-width: 500px;
        }
        body {
            width:100%;
            height:100%;
            margin: 0;
            padding-top: 80px;
            padding-bottom: 40px;
            font-family: "Nanum Gothic", arial, helvetica, sans-serif;
            background-repeat: no-repeat;
            background-size: 2000px;

        }
        .card {
            margin: 0 auto; /* Added */
            float: none; /* Added */
            margin-bottom: 10px; /* Added */
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
        .form-signin .form-control {
            position: relative;
            height: auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            padding: 10px;
            font-size: 16px;
        }

    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<div class="card align-middle" style="width:45rem; border-radius:20px;">
    <div class="card-title" style="margin-top:30px;">
        <h2 class="card-title text-center" style="color:#113366;">회원가입</h2>
    </div>
    <div class="container mt-3"></div> <%-- mt-3 = 자기 기준으로 위를 3만큼 띄움 --%>
    <div class="container" style="color: #6f6d74;">
        <div class="py-5 ">
            <form action="/member/save" method="post" enctype="multipart/form-data">
                <i id="idIcon-result" class="bi bi-tags-fill"></i>아이디<br><input class="form-control mb-2" type="text" onblur="duplicateCheck()" id="memberId" name="memberId" placeholder="ID를 만들어주세요 띄어쓰기 없이 영/숫자 6-10자"><p id="check-result"></p>
                <p id="memberId-result"></p>
                <span id="dup-check-result"></span><br>
                <i id="pwIcon-result" class="bi bi-tags-fill"></i> 비밀번호<br><input class="form-control mb-2" type="password" onblur="pw()" name="memberPassword" placeholder="비밀번호 입력 8-15자의 영문 대소문자, 숫자, 특수문자(-_!#$) 조합">
                <p id="pw-result"></p>
                <i id="pwcIcon-result" class="bi bi-tags-fill"></i> 비밀번호 확인<br><input class="form-control mb-2" type="password" onblur="pwC()" name="memberPassword2"  placeholder="위의 비밀번호를 다시 입력해주세요.">
                <p id="memberPassword2-result"></p>
                <i id="nameIcon-result" class="bi bi-tags-fill"></i> 이름<input class="form-control mb-2" type="text"  name="memberName" placeholder="이름">
                <i id="emailIcon-result" class="bi bi-tags-fill"></i> Email<input class="form-control mb-2" type="text" name="memberEmail" placeholder="이메일">
                <i id="mobileIcon-result" class="bi bi-tags-fill"></i> 전화번호<input class="form-control mb-2" type="text" name="memberMobile" placeholder="전화번호">
                <%--            <input class="form-control mb-2" type="text" onblur="memberMobile()" name="memberMobile" placeholder="전화번호">--%>
                <a href="/"  class="btn btn-secondary" id="myBtn2">처음으로</a>
                <input class="btn btn-primary" type="submit" value="가입">
            </form>
        </div>
    </div>
    <script src="/resources/js/jquery.js"></script>
</body>
<script>
    const duplicateCheck = () => {
        const memberId = document.getElementById("memberId").value;
        const checkResult = document.getElementById("dup-check-result");
        $.ajax({
            type: "post", // http request method
            url: "/member/duplicate-check", // 요청주소 (컨트롤러 주소값)
            data: {"memberId": memberId}, // 전송하는 파라미터
            dataType: "text", // 리턴받을 데이터 형식
            success: function (result) {
                if (result == "ok") {
                    // 사용 가능한 아이디
                    checkResult.innerHTML = "사용가능한 아이디 입니다.";
                    checkResult.style.color = "green";
                } else {
                    // 이미 사용중인 아이디
                    checkResult.innerHTML = "이미 사용중인 아이디 입니다.";
                    checkResult.style.color = "red";
                }
                // alert("ajax 성공");
            },
            error: function () {
                alert("오타체크");
            }
        });

    }
    function pw() {
        const pw = document.getElementById("pw").value;
        const exp = /^(?=.*[a-z])(?=.*\d)(?=.*[-_!#$])[A-Za-z\d-_!#$]{8,15}$/;
        console.log(`pw: ${pw}`);
        console.log(pw.length);
        const pwResult = document.getElementById("pw-result");
        const pwIconResult = document.getElementById("pwIcon-result");

        if(pw.match(exp)) {
            pwResult.innerHTML = "사용 가능합니다."
            pwResult.style.color = "#2183d3";
            pwIconResult.style.color = "#2183d3";
        } else {
            pwResult.innerHTML = "띄어쓰기 없는 8~15자의 영문 대/소문자, 숫자, 특수문자(-_!#$) 조합으로 입력해주세요.";
            pwResult.style.color = "red";
            pwIconResult.style.color = "red";
        }
    }

    function pwC() {
        const membersPassword2 = document.getElementById("memberPassword2").value;
        const membersPassword = document.getElementById("memberPassword").value;
        console.log(`membersPassword2: ${memberPassword}`);
        console.log(membersPassword2.length);
        const pwcResult = document.getElementById("memberPassword2-result");
        const pwcIconResult = document.getElementById("pwcIcon-result")
        if(membersPassword2.length == 0){
            pwcResult.innerHTML = "비밀번호가 일치하지않습니다.";
            pwcResult.style.color = "red";
            pwcIconResult.style.color = "red";
        }else if(membersPassword == membersPassword2){
            pwcResult.innerHTML = "비밀번호가 일치합니다.";
            pwcResult.style.color = "#2183d3";
            pwcIconResult.style.color = "#2183d3";

        }else {
            pwcResult.innerHTML = "비밀번호가 일치하지않습니다.";
            pwcResult.style.color = "red";
            pwcIconResult.style.color="red";
        }
    }
</script>

</html>