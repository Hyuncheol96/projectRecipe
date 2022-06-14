<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: khc_9--%>
<%--  Date: 2022-06-11--%>
<%--  Time: 오후 7:51--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>

<%--<html>--%>
<%--<head>--%>
<%--    <title>index.jsp</title>--%>
<%--    <script>--%>
<%--        const dessertWriteForm = () => {--%>
<%--            location.href = "/board/dessertWrite-form";--%>
<%--        }--%>
<%--    </script>--%>
<%--    <meta charset="utf-8" />--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />--%>
<%--    <link rel="stylesheet" href="\resources\css/main.css"/>--%>
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
<%--                            <li><a href="/member/login-form">로그인</a></li>--%>
<%--                            <li><a href="/member/save-form">회원가입</a></li>--%>
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

<%--            <!-- Content -->--%>
<%--            <section>--%>
<%--                <header class="main">--%>
<%--                    <h3>DESSERT</h3>--%>
<%--                </header>--%>

<%--                <div class="container mt-3">--%>
<%--                    <table class="table">--%>
<%--                        <tr>--%>
<%--                            <th>--%>
<%--                                <form action="/board/dessertSearch" size="10" method="get">--%>
<%--                                    <table>--%>
<%--                                        <th>--%>
<%--                                        <td><select name="searchType">--%>
<%--                                            <option value="boardTitle">제목</option>--%>
<%--                                            <option value="boardWriter">작성자</option>--%>
<%--                                        </select></td>--%>
<%--                                        <td><input type="text" name="q" placeholder="검색어입력.."></td>--%>
<%--                                        <td><input type="submit" value="검색"></td>--%>
<%--                                        </th>--%>
<%--                                    </table>--%>
<%--                                </form>--%>
<%--                            </th>--%>
<%--                            <th></th>--%>
<%--                            <th></th>--%>
<%--                            <th></th>--%>
<%--                            &lt;%&ndash; 로그인시 글쓰기 작성 버튼 생성 &ndash;%&gt;--%>
<%--                            <th><c:if test="${sessionScope.loginMemberId!=null}"><button class="btn btn-primary" onclick="dessertWriteForm()">글 작성</button></c:if></th>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <th>분야</th>--%>
<%--                            <th>제목</th>--%>
<%--                            <th>작성자</th>--%>
<%--                            <th>작성시간</th>--%>
<%--                            <th>조회수</th>--%>
<%--                        </tr>--%>
<%--                        <c:forEach items="${dessertBoardList}" var="board">--%>
<%--                            <c:if test="${board.boardCategory eq 'dessert'}">--%>
<%--                            <tr>--%>
<%--                                <td>${board.boardCategory}</td>--%>
<%--                                <td><a href="/board/dessertDetail?page${paging.page}&id=${board.id}">${board.boardTitle}</a></td>--%>
<%--                                <td>${board.boardWriter}</td>--%>
<%--                                <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"--%>
<%--                                                    value="${board.boardCreatedDate}"></fmt:formatDate></td>--%>
<%--                                <td>${board.boardHits}</td>--%>
<%--                            </tr>--%>
<%--                        </c:if>--%>
<%--                        </c:forEach>--%>
<%--                    </table>--%>
<%--                </div>--%>
<%--                <div class="container align-center">--%>
<%--                    <ul class="pagination justify-content-center">--%>
<%--                        &lt;%&ndash; c:choose c:when 등을 쓰려면 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 태그를 써야함 &ndash;%&gt;--%>
<%--                        <c:choose> &lt;%&ndash; else if문과 같음 &ndash;%&gt;--%>
<%--                            &lt;%&ndash; 현재 페이지가 1페이지면 이전 글자만 보여줌 &ndash;%&gt;--%>
<%--                            <c:when test="${paging.page<=1}">--%>
<%--                                <li class="page-item disabled">--%>
<%--                                    <a class="page-link">[이전]</a>--%>
<%--                                </li>--%>
<%--                            </c:when>--%>
<%--                            &lt;%&ndash; 1페이지가 아닌 경우에는 [이전]을 클릭하면 현재페이지보다 1 작은 페이지 요청 &ndash;%&gt;--%>
<%--                            <c:otherwise>--%>
<%--                                <li class="page-item">--%>
<%--                                    <a class="page-link" href="/board/dessertPaging?page=${paging.page-1}">[이전]</a>--%>
<%--                                </li>--%>
<%--                            </c:otherwise>--%>
<%--                        </c:choose>--%>

<%--                        &lt;%&ndash; for(int i = startPage; i <= endPage; i++)  &ndash;%&gt;--%>
<%--                        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">--%>
<%--                            <c:choose>--%>
<%--                                &lt;%&ndash; 요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게 &ndash;%&gt;--%>
<%--                                <c:when test="${i eq paging.page}">--%>
<%--                                    <li class="page-item active">--%>
<%--                                        <a class="page-link">${i}</a>--%>
<%--                                    </li>--%>
<%--                                </c:when>--%>
<%--                                &lt;%&ndash; 번호블럭에 마우스 올리면 커서 모양이 바뀜 &ndash;%&gt;--%>
<%--                                <c:otherwise>--%>
<%--                                    <li class="page-item">--%>
<%--                                        <a class="page-link" href="/board/dessertPaging?page=${i}">${i}</a>--%>
<%--                                    </li>--%>
<%--                                </c:otherwise>--%>
<%--                            </c:choose>--%>
<%--                        </c:forEach>--%>
<%--                        <c:choose>--%>
<%--                            &lt;%&ndash; 현재 페이지가 마지막페이지면 다음 글자만 보여줌 &ndash;%&gt;--%>
<%--                            <c:when test="${paging.page>=paging.maxPage}">--%>
<%--                                <li class="page-item disabled">--%>
<%--                                    <a class="page-link">[다음]</a>--%>
<%--                                </li>--%>
<%--                            </c:when>--%>
<%--                            &lt;%&ndash; 마지막페이지가 아닌 경우에는 [다음]을 클릭하면 현재페이지보다 1 큰 페이지 요청 &ndash;%&gt;--%>
<%--                            <c:otherwise>--%>
<%--                                <li class="page-item">--%>
<%--                                    <a class="page-link" href="/board/dessertPaging?page=${paging.page+1}">[다음]</a>--%>
<%--                                </li>--%>
<%--                            </c:otherwise>--%>
<%--                        </c:choose>--%>
<%--                    </ul>--%>
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