<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-06-12
  Time: 오후 8:44
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

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

    <style>
        #comment-write {
            max-width: 600px;
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

            </header>

            <!-- Banner -->
            <section id="banner">
                <div class="content">
                    <header>
                    </header>
                    <div class="container">

                        글번호: ${board.id} <br>
                        제목: ${board.boardTitle} <br>
                        작성자: ${board.boardWriter} <br>
                        내용: ${board.boardContents} <br>
                        조회수: ${board.boardHits} <br>
                        작성일자: ${board.boardCreatedDate} <br>
                        <br><c:if test="${sessionScope.loginMemberId eq board.boardWriter}"><button class="btn btn-primary" onclick="dessertUpdate()">수정</button></c:if>&nbsp;
                        <%-- 삭제처리 --%>
                        <c:if test="${sessionScope.loginMemberId eq board.boardWriter or sessionScope.loginMemberId == 'admin'}"><a href="/board/delete?id=${board.id}"role="button" class="button big">삭제</a></c:if>&nbsp;
                        <a href="/board/dessertPaging" class="button big">글목록</a>
                    </div><br>
                    <div class="container mb-5">
                        <div id="comment-write" class="input-group mb-3">
                            <table>
                                <th>
                                <td><div class="form-floating">
                                <input type="text" id="commentWriter" class="form-control" value="${sessionScope.loginMemberId}" readonly>
                                <%--                <label for="commentWriter">작성자</label>--%>
                            </div></td>
                            <td><div class="form-floating" size="50">
                                <input type="text" id="commentContents" class="form-control" placeholder="내용">
<%--                                <label for="commentContents">내용</label><br>--%>
                            </div></td><br>
                            <td><button id="comment-write-btn" class="">댓글작성</button></td>
                                </th>
                            </table>
                        </div>

                        <div id="comment-list">
                            <table class="table">
                                <tr>
                                    <th>댓글번호</th>
                                    <th>작성자</th>
                                    <th>내용</th>
                                    <th>작성시간</th>
                                </tr>
                                <c:forEach items="${commentList}" var="comment">
                                    <tr>
                                        <td>${comment.id}</td>
                                        <td>${comment.commentWriter}</td>
                                        <td>${comment.commentContents}</td>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${comment.commentCreatedDate}"></fmt:formatDate></td>  <%-- 초 까지만 나옴. --%>
                                    </tr>
                                </c:forEach>
                            </table>

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
<script>
    $("#comment-write-btn").click(function (){
        // alert("나 눌렀어?");
        // 댓글 작성자, 내용을 가져오고
        // ajax 문법을 활용하여 /comment/save 주소로 post 방식으로 작성자, 내용, 글번호 이렇게
        // 세개의 값을 보내는 코드를 작성하십시오.
        const commentWriter = document.getElementById("commentWriter").value;
        const commentContents = $("#commentContents").val();    // 제이쿼리 형식
        const boardId = '${board.id}';
        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {
                "commentWriter": commentWriter,
                "commentContents": commentContents,
                "boardId": boardId
            },
            dataType: "json",
            success: function (result) {
                console.log(result);
                let output = "<table class='table'>";
                output += "<tr><th>댓글번호</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th></tr>";
                for(let i in result){
                    output += "<tr>";
                    output += "<td>"+result[i].id+"</td>";
                    output += "<td>"+result[i].commentWriter+"</td>";
                    output += "<td>"+result[i].commentContents+"</td>";
                    output += "<td>"+moment(result[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss")+"</td>";
                    output += "</tr>";
                }
                output += "</table>";
                document.getElementById('comment-list').innerHTML = output;
                document.getElementById('commentContents').value='';
            },
            error: function (result) {
                alert("어디가 틀렸을까");
            }
        });
    });

    const dessertUpdate = () => {
        console.log("함수호출")
        // 수정을 위한 화면(update.jsp)을 출력하고, 비밀번호를 입력받아서
        // 비밀번호 일치하면 수정처리, 일치하지 않으면 alert(회원 수정이랑 프로세스 같음.)
        location.href = "/board/dessertUpdate?id=${board.id}";
    }

    <%--const boardDelete = () => {--%>
    <%--    // 비밀번호 체크를 위한 화면(passwordCheck.jsp)을 출력하고, 비밀번호 입력받아서--%>
    <%--    // 비밀번호 일치하면 삭제처리 후 목록 출력, 일치하지 않으면 alert 띄우고 상세화면으로--%>
    <%--    location.href = "/board/passwordCheck?id=${board.id}";--%>
    <%--}--%>

    const dessertWritePaging = () => {
        location.href = "/board/dessertWritePaging?page=${page}"; // 직전에 있었던 페이지 값을 컨트롤러로 요청
    }
</script>
</html>
