<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>회원가입</title>
    <style>
        #useridMessage, #passwdMessage {
            min-height: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>회원가입</h2>
        <form id="registerForm" method="post">
			<div class="mb-3">
			  <label for="userid" class="form-label">아이디</label>
			  <input type="text" class="form-control" id="userid" name="userid" required>
			  <div id="useridMessage" class="form-text text-muted"></div>
			</div>

			<div class="mb-3">
			  <label for="passwd" class="form-label">비밀번호</label>
			  <input type="password" class="form-control" id="passwd" name="passwd" required>
			  <div id="passwdMessage" class="form-text text-muted"></div>
			</div>

			<div class="mb-3">
			  <label for="name" class="form-label">이름</label>
			  <input type="text" class="form-control" id="name" name="name" required>
			</div>

			<div class="mb-3">
			  <label for="age" class="form-label">나이</label>
			  <input type="number" class="form-control" id="age" name="age" required>
			</div>

            <button type="submit" class="btn btn-primary">회원가입</button>
        </form>
    </div>

    <script type="text/javascript">
		let registerForm = document.querySelector("#registerForm");
		let isUserIdValid = false;

		if (registerForm) {
			// 아이디 유효성 검사
			document.querySelector("#userid").addEventListener("input", function () {
				let useridMessage = document.querySelector("#useridMessage");
				let userid = this.value;
				if (userid.length < 8) {
					useridMessage.textContent = "아이디는 최소 8글자 이상이어야 합니다.";
					useridMessage.style.color = "red";
					isUserIdValid = false;
				} else {
					useridMessage.textContent = "사용할 수 있는 아이디입니다.";
					useridMessage.style.color = "green";
					isUserIdValid = true; // 일단 길이만 통과 (중복은 blur에서 체크됨)
				}
			});

			// 아이디 중복 검사 (blur 이벤트)
			document.querySelector("#userid").addEventListener("blur", function () {
				let userid = this.value;
				if (userid.length >= 8) {
					fetch("isExistUserId", {
						method: 'post',
						headers: {
							'Content-Type': 'application/json;charset=utf-8'
						},
						body: JSON.stringify({ userid: userid })
					})
						.then(response => response.json())
						.then(json => {
							let useridMessage = document.querySelector("#useridMessage");
							if (json.existUserId) {
								useridMessage.textContent = userid +` 아이디는 이미 사용 중입니다.`;
								useridMessage.style.color = "red";
								isUserIdValid = false;
							} else {
								useridMessage.textContent = userid +` 아이디는 사용 가능합니다.`;
								useridMessage.style.color = "green";
								isUserIdValid = true;
							}
						})
						.catch(error => {
							console.error("중복 확인 중 오류 발생:", error);
						});
				}
			});

			// 비밀번호 패턴 검사
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

			// 폼 제출 처리
			registerForm.addEventListener("submit", e => {
				e.preventDefault();

				// 클라이언트 유효성 검사
				if (!isUserIdValid) {
					alert("아이디를 다시 확인해주세요.");
					return;
				}

				const param = {
					userid: registerForm.userid.value,
					passwd: registerForm.passwd.value,
					name: registerForm.name.value,
					age: registerForm.age.value
				};

				fetch("register", {
					method: 'post',
					headers: {
						'Content-Type': 'application/json;charset=utf-8'
					},
					body: JSON.stringify(param)
				})
					.then(response => response.json())
					.then(json => {
						if (json.status == "error") {
							alert(json.errorMessage);
						} else {
							location = "loginForm";
						}
					});
			});
		}
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
