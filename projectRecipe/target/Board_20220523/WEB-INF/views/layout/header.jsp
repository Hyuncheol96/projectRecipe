<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-26
  Time: 오후 2:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="\resources\css/main.css"/>
</head>
<body class="is-preload">

<div id="main">
    <div class="inner">

        <!-- Header -->
        <div id="header">
    <div class="container mt-3"> <%-- mt-3 = 자기 기준으로 위를 3만큼 띄움 --%>
        <%--        <a href="/member/login-form">로그인</a>--%>
        <table>
            <th>

        <c:choose>
            <c:when test="${sessionScope.loginId == null}">
                <td><a href="/">Home</a></td>
                <td><a href="/member/login-form">로그인</a></td>
            <td><a href="/member/save-form">회원가입</a></td>
            </c:when>
            <c:when test="${sessionScope.loginMemberId == 'admin'}">
                <td><a href="/member/afindAll">관리자페이지</a></td>
                <td><a href="/member/logout-form">로그아웃</a></td>
                <td><a href="/member/update-form">마이페이지</a></td>
            </c:when>
            <c:otherwise>
                <td><a href="/member/logout-form">로그아웃</a></td>
                <td><a href="/member/update-form">마이페이지</a></td>
            </c:otherwise>
        </c:choose>
<%--            <td><a href="/board/paging">글목록</a></td>--%>
            </th>

        </table>
    </div>
        </div>
    </div>
</div>
</header>
</body>
</html>
