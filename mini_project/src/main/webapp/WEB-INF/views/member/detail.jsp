<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 상세보기</title>
    <!-- 부트스트랩 CSS 추가 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">회원 상세 정보</h2>
        <div class="card">
            <div class="card-body">
                <ul class="list-group">
                    <li class="list-group-item">
                        <strong>아이디:</strong> 
                        <span id="userid" name="userid">${member.userid }</span>
                    </li>
                    <li class="list-group-item">
                        <strong>이름:</strong> 
                        <span id="name" name="name">${member.name }</span>
                    </li>
                    <li class="list-group-item">
                        <strong>나이:</strong> 
                        <span id="age" name="age">${member.age }</span>
                    </li>
                </ul>
                <div class="d-flex justify-content-between mt-3">
                    <a href="/mini/member/updateForm" class="btn btn-primary">회원 정보 수정</a>
                    <a href="list.html" class="btn btn-secondary">회원 목록으로 돌아가기</a>
                </div>
            </div>
        </div>
    </div>

    <!-- 부트스트랩 JS 및 Popper.js 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>