<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: khc_9--%>
<%--  Date: 2022-06-11--%>
<%--  Time: 오후 8:42--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>index.jsp</title>--%>
<%--    <script>--%>
<%--        const saveForm = () => {--%>
<%--            location.href = "/member/save-form";--%>
<%--        }--%>

<%--    </script>--%>
<%--    <meta charset="utf-8" />--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />--%>
<%--    <link rel="stylesheet" href="\resources\css/main.css"/>--%>
<%--    &lt;%&ndash;  <link rel="stylesheet" href="/resources/css/bootstrap.min.css">&ndash;%&gt;--%>
<%--    <style>--%>
<%--        .container {--%>
<%--            max-width: 800px;--%>
<%--            float: none;--%>
<%--            margin: 0 auto;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>

<%--<body class="is-preload">--%>

<%--<!-- Wrapper -->--%>
<%--<div id="wrapper">--%>

<%--    <!-- Main -->--%>
<%--    <div id="main">--%>
<%--        <div class="inner">--%>

<%--            <!-- Header -->--%>
<%--            <header id="header">--%>

<%--                <ul class="icons">--%>
<%--                    <c:choose>--%>
<%--                        <c:when test="${sessionScope.loginId == null}">--%>
<%--                            &lt;%&ndash;        <li><a href="/">Home</a></td>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;        <li><a href="/member/login-form">로그인</a></td>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;        <li><a href="/member/save-form">회원가입</a></td>&ndash;%&gt;--%>
<%--                        </c:when>--%>
<%--                        <c:when test="${sessionScope.loginMemberId == 'admin'}">--%>
<%--                            <li><a href="/member/findAll">관리자페이지</a></li>--%>
<%--                            <li><a href="/member/logout-form">로그아웃</a></li>--%>
<%--                            <li><a href="/member/update-form">마이페이지</a></li>--%>
<%--                        </c:when>--%>
<%--                        <c:otherwise>--%>
<%--                            <li><a href="/member/logout-form">로그아웃</a></li>--%>
<%--                            <li><a href="/member/update-form">마이페이지</a></li>--%>
<%--                        </c:otherwise>--%>
<%--                    </c:choose>--%>
<%--                    &lt;%&ndash;        <li><a href="/board/paging">글목록</a></td>&ndash;%&gt;--%>
<%--                </ul>--%>

<%--            </header>--%>

<%--            <!-- Banner -->--%>
<%--            <section id="banner">--%>
<%--                <div class="content">--%>
<%--                    <header>--%>

<%--                    </header>--%>
<%--                    <div class="container">--%>
<%--                        <h2 class="display-4 fw-normal">글쓰기</h2>--%>
<%--                        <div class="py-5 text-center">--%>
<%--                            <form action="/board/dessertWrite-form" method="post" enctype="multipart/form-data">--%>
<%--                                카테고리: <input class="form-control mb-2" type="text" name="boardCategory" placeholder="카테고리"><br>--%>
<%--                                작성자: <input class="form-control mb-2" type="text" name="boardWriter" placeholder="${sessionScope.loginMemberId}" value = "${sessionScope.loginMemberId}" readonly><br>--%>
<%--                                제목: <input class="form-control mb-2" type="text" name="boardTitle" placeholder="제목"><br>--%>
<%--                                내용: <textarea class="form-control" name="boardContents"cols="30" rows="10"></textarea> <br>--%>
<%--                                <input class="btn btn-primary" type="submit" value="작성">--%>
<%--                                <a href="/board/dessertPaging" class="button big">글목록</a>--%>
<%--                            </form>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--            </section>--%>


<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Sidebar -->--%>
<%--    <div id="sidebar">--%>
<%--        <div class="inner">--%>

<%--            <!-- Menu -->--%>
<%--            <nav id="menu">--%>
<%--                <header class="major">--%>
<%--                    <h2>Menu</h2>--%>
<%--                </header>--%>
<%--                <ul>--%>
<%--                    <li><a href="/">Home</a></li>--%>
<%--                    <li><a href="/board/food-form">Food</a></li>--%>
<%--                    <li>--%>
<%--                        <span class="opener">Food recipe</span>--%>
<%--                        <slection>--%>
<%--                            <ul>--%>
<%--                                <li><a href="/board/koreanPaging">Korean</a></li>--%>
<%--                                <li><a href="/board/westernPaging">Western</a></li>--%>
<%--                                <li><a href="/board/dessertPaging">Dessert</a></li>--%>
<%--                            </ul>--%>
<%--                        </slection>--%>
<%--                    </li>--%>
<%--                    <li><a href="#">Etiam Dolore</a></li>--%>
<%--                    <li><a href="#">Adipiscing</a></li>--%>
<%--                    <li>--%>
<%--                        <span class="opener">Another Submenu</span>--%>
<%--                        <ul>--%>
<%--                            <li><a href="#">Lorem Dolor</a></li>--%>
<%--                            <li><a href="#">Ipsum Adipiscing</a></li>--%>
<%--                            <li><a href="#">Tempus Magna</a></li>--%>
<%--                            <li><a href="#">Feugiat Veroeros</a></li>--%>
<%--                        </ul>--%>
<%--                    </li>--%>
<%--                    <li><a href="#">Maximus Erat</a></li>--%>
<%--                    <li><a href="#">Sapien Mauris</a></li>--%>
<%--                    <li><a href="#">Amet Lacinia</a></li>--%>
<%--                </ul>--%>
<%--            </nav>--%>


<%--            <!-- Section -->--%>
<%--            <section>--%>
<%--                <header class="major">--%>
<%--                    <h2>Get in touch</h2>--%>
<%--                </header>--%>
<%--                <p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>--%>
<%--                <ul class="contact">--%>
<%--                    <li class="icon solid fa-envelope"><a href="#">information@untitled.tld</a></li>--%>
<%--                    <li class="icon solid fa-phone">(000) 000-0000</li>--%>
<%--                    <li class="icon solid fa-home">1234 Somewhere Road #8254<br />--%>
<%--                        Nashville, TN 00000-0000</li>--%>
<%--                </ul>--%>
<%--            </section>--%>

<%--            <!-- Footer -->--%>
<%--            <footer id="footer">--%>
<%--                <p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>--%>
<%--            </footer>--%>

<%--        </div>--%>
<%--    </div>--%>

<%--</div>--%>

<%--<!-- Scripts -->--%>
<%--<script src="assets/js/jquery.min.js"></script>--%>
<%--<script src="assets/js/browser.min.js"></script>--%>
<%--<script src="assets/js/breakpoints.min.js"></script>--%>
<%--<script src="assets/js/util.js"></script>--%>
<%--<script src="assets/js/main.js"></script>--%>

<%--</body>--%>
<%--</html>--%>