<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 상세보기</title>
    <style>
        /* 전체적인 스타일 */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f6f9;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 50px auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #4a90e2;
            margin-bottom: 20px;
        }

        .card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 30px;
        }

        .list-group {
            list-style-type: none;
            padding: 0;
        }

        .list-group-item {
            padding: 15px;
            border: 1px solid #ddd;
            margin-bottom: 10px;
            border-radius: 4px;
            background-color: #f9f9f9;
        }

        .list-group-item strong {
            color: #333;
            font-size: 16px;
        }

        .list-group-item span {
            color: #555;
            font-size: 14px;
        }

        /* 버튼을 한 줄로 배치 */
        .d-flex {
            display: flex;
            justify-content: space-between;  /* 버튼들 사이에 일정 간격을 둠 */
            gap: 20px; /* 버튼 간격 */
            margin-top: 20px;
        }

        .btn {
            padding: 12px 25px;
            border-radius: 8px;
            font-size: 16px;
            text-decoration: none;
            cursor: pointer;
            display: inline-block;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background-color: #4a90e2;
            color: white;
            border: none;
        }

        .btn-primary:hover {
            background-color: #357ab7;
            transform: translateY(-2px);
        }

        .btn-secondary {
            background-color: #888;
            color: white;
            border: none;
        }

        .btn-secondary:hover {
            background-color: #666;
            transform: translateY(-2px);
        }

        .btn:focus {
            outline: none;
        }

        /* 모바일 친화적인 스타일 */
        @media (max-width: 768px) {
            .container {
                width: 90%;
            }

            /* 버튼들이 한 줄로 배치되도록 */
            .d-flex {
                flex-direction: column;
                align-items: center;
                gap: 10px; /* 세로 정렬 시 간격 */
            }

            .btn {
                width: 100%; /* 모바일에서 버튼이 전체 너비를 차지 */
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>회원 상세 정보</h2>
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
                <div class="d-flex">
                    <a href="/mini/member/updateForm" class="btn btn-primary">회원 정보 수정</a>
                    <a href="/mini/member/unLock" class="btn btn-primary">잠금해제</a>
                    <a href="/mini/member/delete" class="btn btn-primary">탈퇴</a>
                    <a href="list.html" class="btn btn-secondary">회원 목록으로 돌아가기</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
