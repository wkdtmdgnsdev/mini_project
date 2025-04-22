<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시물 등록</title>
    <!-- 부트스트랩 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">📝 게시물 등록</h2>

        <form action="register" method="post">
            <!-- 제목 -->
            <div class="mb-3">
                <label for="title" class="form-label">제목</label>
                <input type="text" class="form-control" name="title" id="title" required>
            </div>

            <!-- 내용 -->
            <div class="mb-3">
                <label for="content" class="form-label">내용</label>
                <textarea class="form-control" name="content" id="content" rows="5" required></textarea>
            </div>

            <!-- 작성자 -->
            <div class="mb-3">
                <label for="writer" class="form-label">작성자</label>
                <input type="text" class="form-control" name="writer" id="writer" required>
            </div>

            <!-- 비밀번호 -->
            <div class="mb-3">
                <label for="passwd" class="form-label">비밀번호</label>
                <input type="password" class="form-control" name="passwd" id="passwd" required>
            </div>

            <!-- 등록 버튼 및 목록 버튼 -->
            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-primary">등록하기</button>
                <a href="list" class="btn btn-secondary">목록으로 돌아가기</a>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
