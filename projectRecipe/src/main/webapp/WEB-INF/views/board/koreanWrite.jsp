<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-06-13
  Time: 오전 9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <h2 class="display-4 fw-normal">글작성 페이지</h2>
    <div class="py-5 text-center">
        <form action="/board/koreanWrite-form" method="post" enctype="multipart/form-data">
            카테고리: <input class="form-control mb-2" type="text" name="boardCategory" placeholder="카테고리"><br>
            작성자: <input class="form-control mb-2" type="text" name="boardWriter" placeholder="${sessionScope.loginMemberId}" value = "${sessionScope.loginMemberId}" readonly><br>
            제목: <input class="form-control mb-2" type="text" name="boardTitle" placeholder="제목"><br>
            내용: <textarea class="form-control" name="boardContents"cols="30" rows="10"></textarea> <br>
            <input class="btn btn-primary" type="submit" value="작성">
        </form>
    </div>
</div>
</body>
</html>
