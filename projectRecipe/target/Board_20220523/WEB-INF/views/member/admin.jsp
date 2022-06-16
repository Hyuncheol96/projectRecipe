
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
    <script src="/resources/js/jquery.js"></script>

    <style>

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
                        <c:when test="${sessionScope.loginMemberId == 'khc4572'}">
                            <li><a href="/member/admin-form">관리자페이지</a></li>
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
                <div class="row side_nav">
                    <ul class="nav nav-pills nav-stacked">
                        <li class="li_btns"><a href="/product/orderedList">주문 현황</a></li>
                        <li class="li_btns active"><a href="/member/memberList-form">회원 관리</a></li>
                        <li class="li_btns"><a href="/product/insert-form">상품 등록</a></li>
                        <li class="li_btns"><a href="/product/list-form">상품 조회</a></li>
                        <li class="li_btns"><a href="/product/update-form">상품 정보 수정</a></li>
                        <li class="li_btns"><a href="/product/delete-form">상품 삭제</a></li>
                    </ul>
                </div>

                <div class="container admin_container">
                    <div class="row">
                        <h1 class="jumbotron" style="text-align: center; margin: 50px 0;">상품 리스트</h1>
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>상품ID</th>
                                <th>상품명</th>
                                <th>상품가격</th>
                                <th>재고</th>
                                <th>상품분류</th>
                                <th>상품정보</th>
                                <th>상품 등록일</th>
                                <th>최종 수정일</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${productList}" var="dto">
                                <tr>
                                    <td>${dto.productId}</td>
                                    <td>${dto.productName}</td>
                                    <td>${dto.price}</td>
                                    <td>${dto.stock}</td>
                                    <td>${dto.productDist}</td>
                                    <td>${dto.productInfo}</td>
                                    <td><fmt:formatDate value="${dto.regDate}" type="date" pattern="yyyy-MM-dd"/> </td>
                                    <td><fmt:formatDate value="${dto.updateDate}" type="date" pattern="yyyy-MM-dd"/></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- class = row -->
                </div>
                [출처] [Spring] 쇼핑몰 만들기 5. 관리자 기능 구현(1)|작성자 워니
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

