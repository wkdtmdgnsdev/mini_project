<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <!-- 부트스트랩 CSS 추가 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
    <h2 class="text-center">로그인</h2>
    <div class="card">
        <div class="card-body">
            <form action="login" method="POST" id="loginForm">
                <div class="mb-3">
                    <label for="username" class="form-label">아이디</label>
                    <input type="text" class="form-control" id="userid" name="userid" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">비밀번호</label>
                    <input type="password" class="form-control" id="passwd" name="passwd" required>
                </div>

                <!-- 버튼 + 메시지 라인 -->
                <div class="d-flex justify-content-between align-items-center">
                    <!-- 로그인 버튼 -->
                    <button type="submit" class="btn btn-primary">로그인</button>

                    <!-- 에러 메시지: 로그인 버튼과 회원가입 버튼 사이에 위치 -->
                    <div id="errorMessage" class="text-danger text-center mx-3" style="display: none;"></div>

                    <!-- 회원가입 버튼: 오른쪽 끝 -->
                    <a href="register.html" class="btn btn-primary">회원가입</a>
                </div>
            </form>
        </div>
    </div>
</div>

    <!-- 부트스트랩 JS 및 Popper.js 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
		const loginForm = document.querySelector("#loginForm");
		
		if (loginForm) {
	 		loginForm.addEventListener("submit", e => {
				e.preventDefault();

				const param = {
					userid : userid.value,   	
					passwd : passwd.value   	
				}
				
				fetch("login", { 
					  method: 'post', 
					  headers: {
					    'Content-Type': 'application/json;charset=utf-8'
					  },
					  body: JSON.stringify(param)
					})
					  .then(response => response.json())
					  .then(json => {
						  if (json.status == "error") {
							  const errorMessage = document.querySelector("#errorMessage");
                              errorMessage.style.display = "block";
                              errorMessage.textContent = json.errorMessage;
                              
							  userid.value = "";
							  passwd.value = "";
							  userid.focus();
						  } else {
							  location = "${pageContext.request.contextPath}/";
						  }
				})	 			

					  
		//		registerForm.submit();
	 		})
	 	}
    </script>
</body>
</html>