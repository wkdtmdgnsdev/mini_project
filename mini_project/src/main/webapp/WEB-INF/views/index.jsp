<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>메인 페이지</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <c:import url="/resources/inc/nav.jsp"/>
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
                            <a href="member/detail?userid=${member.userid}" class="btn btn-info">이동</a>
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
                <!-- 퀴즈 만들기 카드 (관리자만 접근 가능) -->
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
            <!-- 퀴즈 카드 -->
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

        <!-- 모달 구조 -->
        <div class="modal fade" id="quizModal" tabindex="-1" aria-labelledby="quizModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="quizModalLabel">퀴즈 문제</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
                    </div>
                    <div class="modal-body" id="quizContent">
                        <!-- 여기에 문제와 보기 내용이 들어갑니다 -->
                        <p>로딩 중...</p>
                    </div>
                </div>
            </div>
        </div>

        <script>
        document.addEventListener("DOMContentLoaded", () => {
            const startBtn = document.getElementById("startQuizBtn");
            const quizModal = new bootstrap.Modal(document.getElementById("quizModal"));
            const quizContent = document.getElementById("quizContent");

            startBtn.addEventListener("click", () => {
                quizContent.innerHTML = "<p>문제를 불러오는 중...</p>";
                quizModal.show();

                fetch("quiz/randomQuestion")
                    .then(res => res.json())
                    .then(data => {
                        const optionsHtml = data.options.map((opt, idx) => `
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="quizOption" id="opt${idx}" value="${opt}">
                                <label class="form-check-label" for="opt${idx}">
                                    ${opt}
                                </label>
                            </div>
                        `).join("");

                        quizContent.innerHTML = `
                            <h5>${data.question}</h5>
                            <form id="quizForm" class="mt-3">
                                ${optionsHtml}
                                <button type="submit" class="btn btn-primary mt-3">정답 확인</button>
                            </form>
                            <div id="quizFeedback" class="mt-2"></div>
                        `;

                        // 정답 제출 이벤트
                        document.getElementById("quizForm").addEventListener("submit", function(e) {
                            e.preventDefault();
                            const selected = document.querySelector('input[name="quizOption"]:checked');
                            const feedback = document.getElementById("quizFeedback");

                            if (!selected) {
                                feedback.innerHTML = `<p class="text-danger">답안을 선택해주세요.</p>`;
                                return;
                            }

                            if (selected.value === data.answer) {
                                feedback.innerHTML = `<p class="text-success">🎉 정답입니다!</p>`;
                            } else {
                                feedback.innerHTML = `<p class="text-danger">❌ 오답입니다. 정답은 <strong>${data.answer}</strong>입니다.</p>`;
                            }
                        });
                    })
                    .catch(() => {
                        quizContent.innerHTML = "<p class='text-danger'>퀴즈를 불러오는 데 실패했습니다.</p>";
                    });
            });
        });
        </script>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </div>
</body>
</html>
