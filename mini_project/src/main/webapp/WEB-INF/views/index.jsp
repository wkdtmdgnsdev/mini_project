<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
	.custom-modal-content {
	        min-height: 460px;       /* 기본 높이 */
	        max-height: 80vh;        /* 최대 높이: 뷰포트의 80% */
	        overflow-y: auto;        /* 내용이 넘치면 내부 스크롤 */
	    }
</style>
</head>
<body class="bg-light">
	<c:import url="/resources/inc/nav.jsp" />
	<div class="container text-center mt-5">
		<h1 class="mb-4">👋 환영합니다!</h1>
		<p class="lead">아래 메뉴를 통해 원하는 기능을 이용해보세요.</p>

		<div class="row justify-content-center mt-4">
			<c:if test="${empty member}">
				<div class="col-md-4">
					<div class="card shadow-sm mb-4">
						<div class="card-body">
							<h5 class="card-title">🔐 로그인</h5>
							<p class="card-text">회원 로그인 페이지로 이동합니다.</p>
							<a href="member/loginForm" class="btn btn-primary">이동</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card shadow-sm mb-4">
						<div class="card-body">
							<h5 class="card-title">📝 회원가입</h5>
							<p class="card-text">새 계정을 만들어보세요.</p>
							<a href="member/registerForm" class="btn btn-success">이동</a>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${not empty member}">
				<div class="col-md-4">
					<div class="card shadow-sm mb-4">
						<div class="card-body">
							<h5 class="card-title">👤 내 정보</h5>
							<p class="card-text">나의 회원 정보를 확인합니다.</p>
							<a href="member/detail?userid=${member.userid}"
								class="btn btn-info">이동</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card shadow-sm mb-4">
						<div class="card-body">
							<h5 class="card-title">🚪 로그아웃</h5>
							<p class="card-text">로그아웃하고 메인 페이지로 돌아갑니다.</p>
							<a href="member/logout" class="btn btn-danger">로그아웃</a>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${isAdmin}">
				<div class="col-md-4">
					<div class="card shadow-sm mb-4">
						<div class="card-body">
							<h5 class="card-title">📋 회원목록</h5>
							<p class="card-text">등록된 회원들을 조회할 수 있어요.</p>
							<a href="member/list" class="btn btn-warning">이동</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card shadow-sm mb-4">
						<div class="card-body">
							<h5 class="card-title">📝 퀴즈 만들기</h5>
							<p class="card-text">새 퀴즈 문제를 만들어보세요.</p>
							<a href="quiz/registerForm" class="btn btn-primary">이동</a>
						</div>
					</div>
				</div>
			</c:if>
			<div class="col-md-4">
				<div class="card shadow-sm mb-4">
					<div class="card-body">
						<h5 class="card-title">🗂 게시판</h5>
						<p class="card-text">게시글 목록을 확인하거나 작성할 수 있어요.</p>
						<a href="board/list" class="btn btn-secondary">이동</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card shadow-sm mb-4">
					<div class="card-body">
						<h5 class="card-title">🧠 퀴즈</h5>
						<p class="card-text">퀴즈를 풀고 지식을 확인해보세요!</p>
						<button id="startQuizBtn" class="btn btn-secondary">퀴즈 시작</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 모달 -->
		<div class="modal fade" id="quizModal" tabindex="-1"
			aria-labelledby="quizModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content custom-modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="quizModalLabel">퀴즈 문제</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="닫기"></button>
					</div>
					<div class="modal-body" id="quizContent">
						<p>로딩 중...</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<c:import url="/resources/inc/footer.jsp" />
	
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/quiz.js"></script>

</body>
</html>
