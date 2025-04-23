<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시물 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<c:import url="/resources/inc/nav.jsp"/>
    <div class="container mt-5">
        <h2 class="text-center mb-4">게시물 수정</h2>
        <form action="update" method="post">
            <!-- 게시물 번호는 hidden으로 보이지 않도록 처리 -->
            <input type="hidden" name="bno" value="${board.bno}">

            <!-- 제목 -->
            <div class="mb-3">
                <label for="title" class="form-label">제목</label>
                <input type="text" class="form-control" name="title" value="${board.title}" required>
            </div>

            <!-- 내용 -->
            <div class="mb-3">
                <label for="content" class="form-label">내용</label>
                <textarea class="form-control" name="content" rows="5" required>${board.content}</textarea>
            </div>

            <!-- 작성자 -->
            <div class="mb-3">
                <label for="writer" class="form-label">작성자</label>
                <input type="text" class="form-control" name="writer" value="${board.writer}" required>
            </div>

            <!-- 비밀번호 -->
            <div class="mb-3">
                <label for="passwd" class="form-label">비밀번호</label>
                <input type="password" class="form-control" name="passwd" value="${board.passwd}" required>
            </div>

            <!-- 버튼 -->
            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-primary">수정하기</button>
                <a href="detail?bno=${board.bno}" class="btn btn-secondary">뒤로 가기</a>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
