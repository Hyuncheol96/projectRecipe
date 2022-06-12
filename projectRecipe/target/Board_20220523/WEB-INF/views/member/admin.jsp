
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <style>
        .table {
            border: 1px solid;
            width: 1100px;
        }
        thead {
            border-bottom: 1px solid gray;
        }
        .member {
            border: 1px solid;
        }
        .member:hover {
            transition: all 0.3s;
            background: #DED369;
        }
        #search {
            border: 1px solid lightgray;
        }
        /*.container {*/
        /*    display: flex;*/
        /*    justify-content: center;*/
        /*}*/
        /*.memberCenter {*/
        /*    text-align: center;*/
        /*}*/
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
                    <header>
                        <div class="container mt-3"></div> <%-- mt-3 = 자기 기준으로 위를 3만큼 띄움 --%>
                        <div id="comment-list">
                            <table class="table">
                                <tr>
                                    <th>번호</th>
                                    <th>아이디</th>
                                    <th>이름</th>
                                    <th>이메일</th>
                                    <th>전화번호</th>
                                    <th>삭제</th>

                                </tr>
                                <c:forEach items="${memberList}" var="member">
                                    <tr>
                                        <td>${member.id}</td>
                                        <td>${member.memberId}</td>
                                        <td>${member.memberName}</td>
                                        <td>${member.memberEmail}</td>
                                        <td>${member.memberMobile}</td>

                                        <td><a href="/member/delete?id=${member.id}">삭제</a></td>
                                            <%--                <td><a href="/delete?id=${member.id}">삭제</a></td>--%>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
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
                    <li><a href="/board/food-form">Food</a></li>
                    <li>
                        <span class="opener">Food recipe</span>
                        <slection>
                            <ul>
                                <li><a href="/board/korean-form">Korean</a></li>
                                <li><a href="/board/western-form">Western</a></li>
                                <li><a href="/board/dessert-form">Dessert</a></li>
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
