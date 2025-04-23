<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
    	#passwdMessage {
            min-height: 25px;
        }
    </style>
</head>
<body>
<c:import url="/resources/inc/nav.jsp"/>
    <div class="container mt-5">
        <h2 class="text-center">회원 정보 수정</h2>
        <form action="update" method="post">
            <div class="mb-3">
                <label for="id" class="form-label">아이디:</label>
                <input type="text" class="form-control" name="userid" id="userid" value="${member.userid}" readonly>
            </div>
             <div class="mb-3">
                <label for="passwd" class="form-label">비밀번호:</label>
                <input type="password" class="form-control" name="passwd" id="passwd" required>
                <div id="passwdMessage" class="form-text"></div>
            </div>
            
            <div class="mb-3">
                <label for="name" class="form-label">이름:</label>
                <input type="text" class="form-control" name="name" id="name" value="${member.name}" required>
            </div>
            <div class="mb-3">
                <label for="age" class="form-label">나이:</label>
                <input type="number" class="form-control" name="age" id="age" value="${member.age}" required>
            </div>
            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-primary">수정하기</button>
                <a href="detail?userid=${member.userid}" class="btn btn-secondary">뒤로 가기</a>
            </div>
        </form>
    </div>

	<script type="text/javascript">
		document.querySelector("#passwd").addEventListener("input", function () {
		let passwdMessage = document.querySelector("#passwdMessage");
		let passwd = this.value;
		const passwdPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]).{8,}$/;

		if (!passwdPattern.test(passwd)) {
			passwdMessage.textContent = "비밀번호는 영문자, 숫자, 특수문자를 포함해 최소 8자 이상이어야 합니다.";
			passwdMessage.style.color = "red";
		} else {
			passwdMessage.textContent = "안전한 비밀번호입니다.";
			passwdMessage.style.color = "green";
		}
	});
	</script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
