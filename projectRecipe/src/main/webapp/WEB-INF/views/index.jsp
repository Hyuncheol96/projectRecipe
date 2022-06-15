
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
    <link rel="stylesheet" href="\resources\css/main.css"/>
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
                    <header>
                        <h2>모든 레시피를 무제한으로.<br />
                            월 단돈 5천원!!!</h2>
                        <p>맛있는 음식의 레시피를 볼 준비가 되셨나요?!<br/>
                            하단 회원가입 고고씽~</p>
                    </header>
                    <ul class="actions">
                        <li><c:choose>
                            <c:when test="${sessionScope.loginId == null}">
                                <td><a href="/member/save-form" class="button big">시작하기</a></td>
                                <td><a href="/member/login-form" class="button big">로그인</a></td>
                            </c:when>
                            <c:otherwise>

                            </c:otherwise>
                        </c:choose></li>
                    </ul>
                </div>
                <span class="image object">
										<img src="\resources\img/3.jpg" alt="" />
									</span>
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

</body>
</html>
