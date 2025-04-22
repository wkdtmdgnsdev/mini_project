<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시물 상세보기</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">📄 게시물 상세보기</h2>

        <div class="card shadow-sm">
            <div class="card-header">
                <h4>게시물 제목: <span>${board.title}</span></h4>
            </div>
            <div class="card-body">
                <div class="mb-3">
                    <strong>내용:</strong>
                    <div class="mt-2 border rounded p-3 bg-light" style="white-space: pre-wrap;">
                        ${board.content}
                    </div>
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
                <!-- 수정, 삭제 버튼(수정 버튼은 게시물 번호와 함께 전달) -->
                <a href="updateForm?bno=${board.bno}" class="btn btn-warning">수정</a>
                <a href="list" class="btn btn-secondary">목록으로 돌아가기</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
