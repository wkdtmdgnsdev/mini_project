<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/registerMember.css">
</head>
<body>
<c:import url="/resources/inc/nav.jsp"/>

<div class="container">
    <div class="register-container">
        <h2>회원가입</h2>
        <form id="registerForm" method="post">
            <div class="mb-3">
                <label for="userid" class="form-label">아이디</label>
                <input type="text" class="form-control" id="userid" name="userid" required>
                <div id="useridMessage" class="form-text"></div>
            </div>

            <div class="mb-3">
                <label for="passwd" class="form-label">비밀번호</label>
                <input type="password" class="form-control" id="passwd" name="passwd" required>
                <div id="passwdMessage" class="form-text"></div>
            </div>

            <div class="mb-3">
                <label for="name" class="form-label">이름</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
<br>
            <div class="mb-3">
                <label for="age" class="form-label">나이</label>
                <input type="number" class="form-control" id="age" name="age" required>
            </div>
<br>
            <button type="submit" class="btn btn-primary">회원가입</button>
        </form>
    </div>
</div>

<script src="${pageContext.request.contextPath}/resources/js/passwdCheck.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/memberRegister.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
