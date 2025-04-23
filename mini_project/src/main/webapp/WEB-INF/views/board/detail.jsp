<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<c:import url="/resources/inc/nav.jsp"/>
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
                <!-- 수정 버튼 (모달로 비밀번호 입력을 요청) -->
                <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#passwordModal" data-action="update">수정</button>
                
                <!-- 삭제 버튼 (모달로 비밀번호 입력을 요청) -->
                <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#passwordModal" data-action="delete">삭제</button>

                <!-- 목록으로 돌아가기 버튼 -->
                <a href="list" class="btn btn-secondary">목록으로 돌아가기</a>
            </div>
        </div>
    </div>

    <!-- 비밀번호 입력을 위한 모달 -->
    <div class="modal fade" id="passwordModal" tabindex="-1" aria-labelledby="passwordModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="passwordModalLabel">비밀번호 입력</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="actionForm" action="" method="post">
                        <div class="mb-3">
                            <label for="password" class="form-label">비밀번호</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                            <input type="hidden" id="bno" name="bno" value="${board.bno}">
                            <input type="hidden" id="action" name="action">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                            <button type="button" id="confirmActionButton" class="btn btn-primary">확인</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // 모달의 행동에 따라 처리할 폼 action 변경
        var passwordModal = document.getElementById('passwordModal');
        passwordModal.addEventListener('show.bs.modal', function (event) {
            var button = event.relatedTarget;
            var action = button.getAttribute('data-action');
            
            var actionForm = document.getElementById('actionForm');
            var actionInput = document.getElementById('action');
            
            actionInput.value = action;

            if (action === 'update') {
                actionForm.action = 'updateForm';
            } else if (action === 'delete') {
                actionForm.action = 'delete';
            }
        });

        // 비밀번호 확인 버튼 클릭
        document.getElementById('confirmActionButton').addEventListener('click', function() {
            var password = document.getElementById('password').value;
            var bno = document.getElementById('bno').value;
            var action = document.getElementById('action').value;

            const param = {
                bno: bno,
                passwd: password
            };

            fetch('passwdCheck', {
                method: 'post',
                headers: {
                    'Content-Type': 'application/json;charset=utf-8',
                },
                body: JSON.stringify(param)
            })
            .then(response => response.json())
            .then(data => {
                if (data.succ) {
                    // 모달 닫기 (Bootstrap 5 방식)
                    const modalElement = document.getElementById('passwordModal');
                    let modalInstance = bootstrap.Modal.getInstance(modalElement);
                    if (!modalInstance) {
                        modalInstance = new bootstrap.Modal(modalElement);
                    }
                    modalInstance.hide();

                    // 액션 수행
                    if (action === 'update') {
                        window.location.href = 'updateForm?bno=' + bno;
                    } else if (action === 'delete') {
                        window.location.href = 'delete?bno=' + bno;
                    }
                } else {
                    alert('비밀번호가 틀렸습니다.');
                }
            })
            .catch(error => {
                alert('서버와의 통신에 실패했습니다.');
            });
        });
    </script>
</body>
</html>
