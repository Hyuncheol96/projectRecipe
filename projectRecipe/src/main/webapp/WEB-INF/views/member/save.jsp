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
    <script>
        const saveForm = () => {
            location.href = "/member/save-form";
        }
        const loginForm = () => {
            location.href = "/member/login-form";
        }
        const listForm = () => {
            location.href = "/board/paging";
        }
    </script>
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


                <%--                <table>--%>
                <%--                    <th><a href="/member/save-form" class="logo"><strong>회원가입</strong></a></th>--%>
                <%--                    <th><a href="/member/login-form" class="logo"><strong>로그인</strong></a></th>--%>
                <%--                    <th><a href="/board/paging" class="logo"><strong>글목록</strong></a></th>--%>
                <%--                </table>--%>

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


                <%--                <a href="projectFront/index.html" class="logo"><strong>Editorial</strong> by HTML5 UP</a>--%>
                <%--                <ul class="icons">--%>
                <%--                    <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>--%>
                <%--                    <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>--%>
                <%--                    <li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>--%>
                <%--                    <li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>--%>
                <%--                    <li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>--%>
                <%--                </ul>--%>
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
                                    <span id="dup-check-result"></span><br>
                                    <i id="pwIcon-result" class="bi bi-tags-fill"></i> 비밀번호<br><input class="form-control mb-2" type="password" onblur="pw()" name="memberPassword" placeholder="비밀번호 입력 8-15자의 영문 대소문자, 숫자, 특수문자(-_!#$) 조합">
                                    <p id="pw-result"></p>
                                    <i id="pwcIcon-result" class="bi bi-tags-fill"></i> 비밀번호 확인<br><input class="form-control mb-2" type="password" onblur="pwC()" name="memberPassword2"  placeholder="위의 비밀번호를 다시 입력해주세요.">
                                    <p id="memberPassword2-result"></p>
                                    <i id="nameIcon-result" class="bi bi-tags-fill"></i> 이름<br><input class="form-control mb-2" type="text"  name="memberName" placeholder="이름">
                                    <p id="memberName-result"></p>
                                    <i id="emailIcon-result" class="bi bi-tags-fill"></i> Email<br><input class="form-control mb-2" type="text" name="memberEmail" placeholder="이메일">
                                    <p id="memberEmail-result"></p>
                                    <i id="mobileIcon-result" class="bi bi-tags-fill"></i> 전화번호<br><input class="form-control mb-2" type="text" name="memberMobile" placeholder="전화번호">
                                    <p id="memberMobile-result"></p>
                                    <%--            <input class="form-control mb-2" type="text" onblur="memberMobile()" name="memberMobile" placeholder="전화번호">--%>
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
</script>
</html>