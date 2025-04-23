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

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">MyWeb</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <c:if test="${empty member}">
                        <li class="nav-item">
                            <a class="nav-link" href="member/loginForm">로그인</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="member/registerForm">회원가입</a>
                        </li>
                    </c:if>
                    <c:if test="${not empty member}">
                        <li class="nav-item">
                            <a class="nav-link" href="member/detail?userid=${member.userid}">내 정보</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="member/logout">로그아웃</a>
                        </li>
                    </c:if>
                    <li class="nav-item">
                        <a class="nav-link" href="member/list">회원목록</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="board/list">게시판</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

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
                        <h5 class="card-title">🗂 게시판</h5>
                        <p class="card-text">게시글 목록을 확인하거나 작성할 수 있어요.</p>
                        <a href="board/list" class="btn btn-secondary">이동</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
