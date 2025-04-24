<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시물 상세보기</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
/* 모달 본문 영역 최소 높이 설정 */


/* 에러 메시지 공간 고정 */
#passwordError {
    position: absolute;
    bottom: 50px;  /* 메시지가 항상 모달 하단에 위치하도록 설정 */
    left: 130px;
    width: 100%;
    text-align: left;
    font-size: 14px;
}
	@keyframes shake {
	    0% { transform: translateX(0); }
	    25% { transform: translateX(-10px); }
	    50% { transform: translateX(10px); }
	    75% { transform: translateX(-10px); }
	    100% { transform: translateX(0); }
	}
	
	/* 모달을 흔들 때 적용할 클래스 */
	.shake {
	    animation: shake 0.5s ease-in-out;
	}
</style>
</head>
<body>
	<c:import url="/resources/inc/nav.jsp" />
	<div class="container mt-5">
		<h2 class="text-center mb-4">📄 게시물 상세보기</h2>

		<div class="card shadow-sm">
			<div class="card-header">
				<h4>
					게시물 제목: <span>${board.title}</span>
				</h4>
			</div>
			<div class="card-body">
				<div class="mb-3">
					<strong>내용:</strong>
					<div class="mt-2 border rounded p-3 bg-light"
						style="white-space: pre-wrap;">${board.content}</div>
				</div>

				<div class="mb-3">
					<strong>작성자:</strong> <span>${board.writer}</span>
				</div>

				<div class="mb-3">
					<strong>작성일:</strong> <span>${board.reg_date}</span>
				</div>

				<div class="mb-3">
					<strong>조회수:</strong> <span>${board.view_count}</span>
				</div>
			</div>

			<div class="card-footer text-end">
				<!-- 수정 버튼 (모달로 비밀번호 입력을 요청) -->
				<button class="btn btn-warning" data-bs-toggle="modal"
					data-bs-target="#passwordModal" data-action="update">수정</button>

				<!-- 삭제 버튼 (모달로 비밀번호 입력을 요청) -->
				<button class="btn btn-danger" data-bs-toggle="modal"
					data-bs-target="#passwordModal" data-action="delete">삭제</button>

				<!-- 목록으로 돌아가기 버튼 -->
				<a href="list" class="btn btn-secondary">목록으로 돌아가기</a>
			</div>
		</div>
	</div>

	<!-- 비밀번호 입력 창 -->
	<div class="modal fade" id="passwordModal" tabindex="-1"
		aria-labelledby="passwordModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="passwordModalLabel">비밀번호 입력</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="actionForm" action="" method="post">
						<div class="mb-3">
							<label for="password" class="form-label">비밀번호</label> <input
								type="password" class="form-control" id="password"
								name="password" required>
							<div id="passwordError" class="text-danger mt-2"
								style="display: none;"></div>
							<input type="hidden" id="bno" name="bno" value="${board.bno}">
							<input type="hidden" id="action" name="action">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">취소</button>
							<button type="button" id="confirmActionButton"
								class="btn btn-primary">확인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/js/boardDetail.js"></script>
</body>
</html>
