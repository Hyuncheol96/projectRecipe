<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-06-10
  Time: 오후 1:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>index.jsp</title>
    <script>
        const koreanWriteForm = () => {
            location.href = "/board/koreanWrite-form";
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
                            <li><a href="/member/login-form">로그인</a></li>
                            <li><a href="/member/save-form">회원가입</a></li>
                        </c:when>
                        <c:when test="${sessionScope.loginMemberId == 'khc4572'}">
                            <span class="glyphicon glyphicon-heart-empty" style="color: white;" aria-hidden="true"></span>
                            <span id="login_log" style="border-bottom: 1px solid white;">${sessionScope.loginMemberId} 님, 환영합니다.</span>
                            <span class="glyphicon glyphicon-heart-empty" style="color: white;" aria-hidden="true"></span>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <li><a href="/member/admin-form">관리자페이지</a></li>
                            <li><a href="/member/logout-form">로그아웃</a></li>
                            <li><a href="/member/update-form">마이페이지</a></li>
                        </c:when>
                        <c:otherwise>
                            <span class="glyphicon glyphicon-heart-empty" style="color: white;" aria-hidden="true"></span>
                            <span id="login_log" style="border-bottom: 1px solid white;">${sessionScope.loginMemberId} 님, 환영합니다.</span>
                            <span class="glyphicon glyphicon-heart-empty" style="color: white;" aria-hidden="true"></span>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <li><a href="/member/logout-form">로그아웃</a></li>
                            <li><a href="/member/update-form">마이페이지</a></li>
                        </c:otherwise>
                    </c:choose>
                    <%--        <li><a href="/board/paging">글목록</a></td>--%>
                </ul>


            </header>

            <!-- Content -->
            <section>
                <div class="content">
                    <header class="main">
                        <h2>음식</h2>
                    </header>

                    <span class="image main"><img src="\resources\img/2.jpg" alt="" /></span>

                    <h2>음식에는 두 가지 뜻이 있다.</h2>
                    <p>첫 번째는 인간이 먹음으로써 활동에 필요한 영양분을 얻을 수 있도록 만들어진 사물을 말하며, 두 번째는 인간이 먹고 마시는 행위 자체를 말한다. 그러나 두 번째 뜻은 보통 '식음'이나 '식사'라고 부르고, 일반적으로 '음식'이라고 하면 첫 번째 뜻, 즉 불이나 도구를 사용해 불필요한 부위를 제거하거나 먹기 쉽게 가공한 것을 의미한다. 먹을 수 있는 것 자체를 의미하는 식량과는 포괄하는 범위가 다르다. 생존에 직결되는 만큼 과거부터 매우 중요하게 생각됐으며 인간이 살아가는 데 있어 꼭 필요한 3요소인 의식주(衣食住) 중 하나로 꼽힌다.</p>
                    <hr class="major" />
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

</body>
</html>

