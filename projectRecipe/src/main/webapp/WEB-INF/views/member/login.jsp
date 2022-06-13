<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-06-09
  Time: 오전 9:22
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
  <link rel="stylesheet" href="\resources\css/main.css"/>
<%--  <link rel="stylesheet" href="/resources/css/bootstrap.min.css">--%>
  <style>
    .container {
      max-width: 500px;
      float: none;
      margin: 0 auto;
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
          <header>
<%--            <h2>모든 레시피를 무제한으로.<br />--%>
<%--              월 단돈 5천원!!!</h2>--%>
<%--            <p>맛있는 음식의 레시피를 볼 준비가 되셨나요?!<br/>--%>
<%--              하단 회원가입 고고씽~</p>--%>
          </header>
          <div class="container mt-3">
            <h2 class="display-4">로그인</h2>
            <div class="py-5 text-center">
          <form action="/member/login" method="post">
            <input class="form-control mb-2" type="text" name="memberId" placeholder="아이디"><br>
            <input class="form-control mb-2" type="password" name="memberPassword" placeholder="비밀번호"><br>
            <td><a href="/member/save-form" class="button big">회원가입</a></td>
            <td><input class="btn btn-primary" type="submit" value="로그인"></td>

          </form>
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
          <li><a href="/board/food-form">Food</a></li>
          <li>
            <span class="opener">Food recipe</span>
            <slection>
              <ul>
                <li><a href="/board/koreanPaging">Korean</a></li>
                <li><a href="/board/westernPaging">Western</a></li>
                <li><a href="/board/dessertPaging">Dessert</a></li>
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