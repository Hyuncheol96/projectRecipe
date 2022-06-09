
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
</head>
<body>
<button class="btn btn-outline-success" onclick="saveForm()">회원가입</button>
<button class="btn btn-outline-success" onclick="loginForm()">로그인</button>
<button class="btn btn-outline-success" onclick="listForm()">글목록</button>


</body>
</html>
