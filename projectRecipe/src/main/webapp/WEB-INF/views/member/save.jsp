<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-06-08
  Time: 오후 1:35
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>index.jsp</title>


    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="\resources\css/main.css"/><link rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

    <style>
        @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");

        .container {
            max-width: 600px;
            float: none;
            margin: 0 auto;
        }
        .card {
            margin: 0 auto; /* Added */
            float: none; /* Added */
            margin-bottom: 10px; /* Added */
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

    </style>
</head>

<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper">

    <!-- Main -->
    <div id="main">
        <div class="inner">

            <!-- Header -->
            <header id="header">

                <ul class="icons">
                    <c:choose>
                        <c:when test="${sessionScope.loginId == null}">
                            <%--        <li><a href="/">Home</a></td>--%>
                            <%--        <li><a href="/member/login-form">로그인</a></td>--%>
                            <%--        <li><a href="/member/save-form">회원가입</a></td>--%>
                        </c:when>
                        <c:when test="${sessionScope.loginMemberId == 'admin'}">
                            <li><a href="/member/findAll">관리자페이지</a></li>
                            <li><a href="/member/logout-form">로그아웃</a></li>
                            <li><a href="/member/update-form">마이페이지</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="/member/logout-form">로그아웃</a></li>
                            <li><a href="/member/update-form">마이페이지</a></li>
                        </c:otherwise>
                    </c:choose>
                    <%--        <li><a href="/board/paging">글목록</a></td>--%>
                </ul>


            </header>

            <!-- Banner -->
            <section id="banner">
                <div class="content">
                    <div class="card align-middle" style="width:45rem; border-radius:20px;">
                        <div class="card-title" style="margin: auto">
                            <h2 class="card-title text-center" style="color:#113366;" align="center">회원가입</h2>
                        </div>
                        <div class="container mt-3"></div> <%-- mt-3 = 자기 기준으로 위를 3만큼 띄움 --%>
                        <div class="container" style="color: #6f6d74;">
                            <div class="py-5 ">
                                <form action="/member/save" method="post" enctype="multipart/form-data">
                                    <i id="idIcon-result" class="bi bi-tags-fill"></i>아이디<br><input class="form-control mb-2" type="text" onblur="duplicateCheck()" id="memberId" name="memberId" placeholder="ID를 만들어주세요 띄어쓰기 없이 영/숫자 6-10자">
                                    <span id="dup-check-result"></span>
                                    <p id="memberId-result"></p>
                                    <i id="pwIcon-result" class="bi bi-tags-fill"></i> 비밀번호<br><input class="form-control mb-2" type="password" onblur="pw()" id="memberPassword" name="memberPassword" placeholder="비밀번호 입력 8-15자의 영문 대소문자, 숫자, 특수문자(-_!#$) 조합">
                                    <p id="pw-result"></p>
                                    <i id="pw2Icon-result" class="bi bi-tags-fill"></i> 비밀번호 확인<br><input class="form-control mb-2" type="password" onblur="pw2()" id="memberPassword2" name="memberPassword2"  placeholder="위의 비밀번호를 다시 입력해주세요.">
                                    <p id="memberPassword2-result"></p>
                                    <i id="nameIcon-result" class="bi bi-tags-fill"></i> 이름<br><input class="form-control mb-2" type="text" onblur="userName()" id="memberName"  name="memberName" placeholder="이름">
                                    <p id="memberName-result"></p>
                                    <ul class="icons">
                                        <i id="emailIcon-result" class="bi bi-tags-fill"></i> Email<br><li><input class="from-control mb-2"  type="text" style="width: 160px" onblur="email()" id="memberEmail" name="memberEmail" placeholder="이메일"></li><li>@</li>
                                        <li><input class="from-control mb-2" type="text" style="width: 160px" onblur="email2()" id="memberEmail2" name="memberEmail" placeholder="이메일"></li>
                                    <li><select id="emailCk" onchange="ck()" style="width: 170px" name = "emailSelect">
                                        <option value="직접입력">직접입력</option>
                                        <option value="naver.com">naver.com</option>
                                        <option value="daum.net">daum.net</option>
                                        <option value="hotmail.com">hotmail.com</option>
                                        <option value="nate.com">nate.com</option>
                                        <option value="yahoo.com">yahoo.com</option>
                                        <option value="paran.com">paran.com</option>
                                        <option value="empas.com">empas.com</option>
                                        <option value="dreamwiz.com">dreamwiz.com</option>
                                        <option value="freechal.com">freechal.com</option>
                                        <option value="lycos.co.kr">lycos.co.kr</option>
                                        <option value="korea.com">korea.com</option>
                                        <option value="gmail.com">gmail.com</option>
                                        <option value="hanmir.com">hanmir.com</option>
                                    </select></li>
                                    <p id="memberEmail-result"></p>
                                    </ul>
                                    <ul class="icons">
                                    <i id="mnIcon-result" class="bi bi-tags-fill"></i> 전화번호<br>
                                        <li>
                                    <select id="memberMobile2" style="width: 100px" onchange="mobileNumber2()" name = "memberMobile">
                                        <option value="KT">KT</option>
                                        <option value="SKT">SKT</option>
                                        <option value="LG">LG</option>
                                    </select>
                                        </li>
                                        <li>
                                    <select id="memberMobile3" style="width: 130px" onchange="mobileNumber3()" name = "memberMobile">
                                        <option value="010">010</option>
                                        <option value="016">016</option>
                                        <option value="017">017</option>
                                        <option value="018">018</option>
                                        <option value="019">019</option>
                                    </select>
                                        </li>
                                    <li>-</li> <li><input type="text" style="width: 270px" onblur="mobileNumber()" size="60" id="memberMobile" name="memberMobile" class="from-control"  placeholder="휴대폰번호입력('-'포함)">
                                    </li>
                                        <p id="memberMobile-result"></p>
                                    </ul>

                                    <a href="/"  class="button big">처음으로</a> &nbsp;
                                    <input class="btn btn-primary" type="submit" value="가입">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>


        </div>
    </div>

    <!-- Sidebar -->
    <div id="sidebar">
        <div class="inner">

            <!-- Menu -->
            <nav id="menu">
                <header class="major">
                    <h2>Menu</h2>
                </header>
                <ul>
                    <li><a href="/">Home</a></li>
                    <li>
                        <span class="opener">Food</span>
                        <slection>
                            <ul>
                                <li><a href="/board/food-form">Food Detail</a></li>
                                <li><a href="/board/paging">Write</a></li>
                            </ul>
                        </slection>
                    </li>
                    <li><a href="#">Etiam Dolore</a></li>
                    <li><a href="#">Adipiscing</a></li>
                    <li>
                        <span class="opener">Another Submenu</span>
                        <ul>
                            <li><a href="#">Lorem Dolor</a></li>
                            <li><a href="#">Ipsum Adipiscing</a></li>
                            <li><a href="#">Tempus Magna</a></li>
                            <li><a href="#">Feugiat Veroeros</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Maximus Erat</a></li>
                    <li><a href="#">Sapien Mauris</a></li>
                    <li><a href="#">Amet Lacinia</a></li>
                </ul>
            </nav>


            <!-- Section -->
            <section>
                <header class="major">
                    <h2>Get in touch</h2>
                </header>
                <p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
                <ul class="contact">
                    <li class="icon solid fa-envelope"><a href="#">information@untitled.tld</a></li>
                    <li class="icon solid fa-phone">(000) 000-0000</li>
                    <li class="icon solid fa-home">1234 Somewhere Road #8254<br />
                        Nashville, TN 00000-0000</li>
                </ul>
            </section>

            <!-- Footer -->
            <footer id="footer">
                <p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
            </footer>

        </div>
    </div>

</div>

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
<script src="/resources/js/jquery.js"></script>
</body>
<script>
    const duplicateCheck = () => {
        const memberId = document.getElementById("memberId").value;
        const exp = /^(?=.*[a-z])(?=.*\d)[a-z\d]{6,10}$/;

        const checkResult = document.getElementById("dup-check-result");
        const idIconResult = document.getElementById("idIcon-result");
        $.ajax({
            type: "post", // http request method
            url: "/member/duplicate-check", // 요청주소 (컨트롤러 주소값)
            data: {"memberId": memberId}, // 전송하는 파라미터
            dataType: "text", // 리턴받을 데이터 형식
            success: function (result) {
                if (result == "ok" && memberId.match(exp)) {
                    // 사용 가능한 아이디
                    checkResult.innerHTML = "사용가능한 아이디 입니다.";
                    checkResult.style.color = "#2183d3";
                    idIconResult.style.color = "#2183d3";

                } else {
                    // 이미 사용중인 아이디
                    checkResult.innerHTML = "이미 사용 중이거나 올바른 아이디가 아닙니다.";
                    checkResult.style.color = "red";
                    idIconResult.style.color = "red";
                }
                // alert("ajax 성공");
            },
            error: function () {
                alert("오타체크");
            }
        });

    }

    function pw() {
        const memberPassword = document.getElementById("memberPassword").value;
        const exp = /^(?=.*[a-z])(?=.*\d)(?=.*[!#$])[A-Za-z\d-_!#$]{8,16}$/;
        const pwResult = document.getElementById("pw-result");
        const pwIconResult = document.getElementById("pwIcon-result");

        if(memberPassword.match(exp)) {
            pwResult.innerHTML = "사용 가능합니다."
            pwResult.style.color = "#2183d3";
            pwIconResult.style.color = "#2183d3";
        } else {
            pwResult.innerHTML = "올바른 형식이 아닙니다.";
            pwResult.style.color = "red";
            pwIconResult.style.color = "red";
        }
    }

    function pw2() {
        const memberPassword2 = document.getElementById("memberPassword2").value;
        const memberPassword = document.getElementById("memberPassword").value;
        const pw2Result = document.getElementById("memberPassword2-result");
        const pw2IconResult = document.getElementById("pw2Icon-result")
        if(memberPassword2.length == 0){
            pw2Result.innerHTML = "일치하지않습니다.";
            pw2Result.style.color = "red";
            pw2IconResult.style.color = "red";
        }else if(memberPassword == memberPassword2){
            pw2Result.innerHTML = "일치합니다.";
            pw2Result.style.color = "#2183d3";
            pw2IconResult.style.color = "#2183d3";

        }else {
            pw2Result.innerHTML = "비밀번호가 일치하지않습니다.";
            pw2Result.style.color = "red";
            pw2IconResult.style.color="red";
        }
    }
    function userName() {
        const memberName = document.getElementById("memberName").value;
        const unResult = document.getElementById("memberName-result");
        const nameIcon = document.getElementById("nameIcon-result");

        if(memberName.length == 0) {
            unResult.innerHTML = "필수 정보입니다.";
            unResult.style.color = "red";
            nameIcon.style.color = "red";
        } else {
            unResult.innerHTML = "사용 가능합니다.";
            unResult.style.color = "#2183d3";
            nameIcon.style.color = "#2183d3";
        }
    }
    function email() {
        const memberEmail = document.getElementById("memberEmail").value;
        const memberEmail2 = document.getElementById("memberEmail2").value;
        const emailResult = document.getElementById("memberEmail-result");
        const emailIconResult = document.getElementById("emailIcon-result");
        if(memberEmail.length == 0 ) {
            emailResult.innerHTML = "이메일 주소를 다시 확인해주세요.";
            emailResult.style.color = "red";
            emailIconResult.style.color = "red";
        } else {

        }
    }

    function email2() {
        const memberEmail2 = document.getElementById("memberEmail2").value;
        const emailResult = document.getElementById("memberEmail-result");
        const emailIconResult = document.getElementById("emailIcon-result");
        if(memberEmail2.length == 0) {
            emailResult.innerHTML = "이메일 주소를 다시 확인해주세요.";
            emailResult.style.color = "red";
            emailIconResult.style.color = "red";
        } else {
            emailResult.innerHTML = "사용가능합니다.";
            emailResult.style.color = "#2183d3";
            emailIconResult.style.color = "#2183d3";
        }
    }

    function ck() {
        const emailCk = document.getElementById("emailCk").value;
        const memberEmail2 = document.getElementById("memberEmail2");
        const emailResult = document.getElementById("memberEmail-result");
        const emailIconResult = document.getElementById("emailIcon-result");
        memberEmail2.value = emailCk;
        if(emailCk == 0){

        } else {
            emailResult.innerHTML = "사용가능합니다.";
            emailResult.style.color = "#2183d3";
            emailIconResult.style.color = "#2183d3";

        }
    }


    function mobileNumber() {
        const memberMobile = document.getElementById("memberMobile").value;
        const exp = /^(?=.*\d)(?=.*-)[\d-]{8,9}$/;
        const mNResult = document.getElementById("memberMobile-result");
        const mNIcon = document.getElementById("mnIcon-result")
        if(memberMobile.match(exp)) {
            mNResult.innerHTML = "사용 가능합니다."
            mNResult.style.color = "#2183d3";
            mNIcon.style.color = "#2183d3";
        } else {
            mNResult.innerHTML = "전화번호를 정확히 입력해 주세요.";
            mNResult.style.color = "red";
            mNIcon.style.color = "red";
        }
    }

    // function mobileNumber2() {
    //     const memberMobile2 = document.getElementById("memberMobile2").value;
    //     const memberMobileResult = document.getElementById("memberMobile-result");
    //     const mnIconResult = document.getElementById("mnIcon-result");
    //     if(memberMobile2 == 0){
    //
    //     } else {
    //         memberMobileResult.innerHTML = "사용가능합니다.";
    //         memberMobileResult.style.color = "#2183d3";
    //         mnIconResult.style.color = "#2183d3";
    //
    //     }
    // }



</script>
</html>