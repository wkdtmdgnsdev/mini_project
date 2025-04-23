<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원 상세보기</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <!-- Navigation Bar -->
    <c:import url="/resources/inc/nav.jsp"/>

    <div class="container mt-5">
        <div class="card shadow">
            <div class="card-header bg-primary text-white text-center">
                <h3 class="mb-0">회원 상세 정보</h3>
            </div>
            <div class="card-body">
                <ul class="list-group list-group-flush mb-4">
                    <li class="list-group-item d-flex justify-content-between">
                        <strong>아이디</strong>
                        <span>${member.userid}</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between">
                        <strong>이름</strong>
                        <span>${member.name}</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between">
                        <strong>나이</strong>
                        <span>${member.age}</span>
                    </li>
                </ul>
                
                <div class="d-grid gap-2 d-md-flex justify-content-md-between">
                    <a href="/mini/member/updateForm" class="btn btn-primary">회원 정보 수정</a>
                    <a href="/mini/member/unLock?userid=${member.userid}" class="btn btn-warning">잠금 해제</a>
                    <a href="/mini/member/delete" class="btn btn-danger">탈퇴</a>
                    <a href="/mini/member/list" class="btn btn-secondary">회원 목록으로</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle (for navbar toggle) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
