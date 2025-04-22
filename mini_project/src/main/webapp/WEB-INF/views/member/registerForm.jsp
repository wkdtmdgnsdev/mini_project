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
</head>
<body>
    <div class="container">
        <h2>회원가입</h2>
        <form id="registerForm" method="post">
			<div class="mb-3">
			  <label for="userid" class="form-label">아이디</label>
			  <input type="text" class="form-control" id="userid" name="userid" required>
			</div>

			<div class="mb-3">
			  <label for="passwd" class="form-label">비밀번호</label>
			  <input type="password" class="form-control" id="passwd" name="passwd" required>
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
   		if (registerForm) {
   			registerForm.addEventListener("submit", e => {
   				e.preventDefault();
   				
   				const param = {
   					userid: registerForm.userid.value,
   					passwd: registerForm.passwd.value,
   					name: registerForm.name.value,
   					age: registerForm.age.value
   				}
   				
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
						alert("회원가입이 성공되었습니다.");
						location = "loginForm";
					}
				})
   			});
   		}
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
