<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 관리</title>
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
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #4a90e2;
            margin-bottom: 20px;
        }

        /* 폼 스타일 */
        form {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 20px;
        }

        .form-group {
            flex: 1;
            min-width: 200px;
        }

        label {
            font-size: 14px;
            color: #666;
            margin-bottom: 5px;
            display: block;
        }

        input[type="text"], select {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            background-color: #4a90e2;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 14px;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #357ab7;
        }

        /* 테이블 스타일 */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f4f6f9;
            color: #333;
        }

        td {
            background-color: #fff;
            color: #666;
        }

        tr:nth-child(even) td {
            background-color: #f9f9f9;
        }

        a {
            color: #4a90e2;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        /* 페이지 내비게이션 스타일 */
        .pagination {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }

        .pagination a {
            padding: 8px 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
            color: #4a90e2;
            text-decoration: none;
        }

        .pagination a:hover {
            background-color: #f4f6f9;
        }

        .pagination .active {
            background-color: #4a90e2;
            color: white;
        }

        /* 페이지 정보 스타일 */
        .page-info {
            text-align: center;
            margin-top: 20px;
            color: #666;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>회원 관리</h1>

        <!-- 검색 폼 -->
        <form name="searchForm" id="searchForm" action="list" method="post">
            <input type="hidden" name="pageNo" id="pageNo" value="${pageResponse.pageNo}">
            <div class="form-group">
                <label for="size">건수:</label>
                <select name="size" id="size">
                    <c:forTokens items="10,30,90,100" delims="," var="size">
                        <option value="${size}" ${pageResponse.size == size ? 'selected' : ''}>${size}</option>
                    </c:forTokens>
                </select>
            </div>
            <div class="form-group">
                <label for="searchValue">검색어:</label>
                <input type="text" name="searchValue" id="searchValue" value="${param.searchValue}">
            </div>
            <button type="submit">검색</button>
        </form>

        <!-- 회원 목록 테이블 -->
        <table>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>나이</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${pageResponse.list}" var="item" varStatus="status">
                    <tr>
                        <td>${pageResponse.totalCount - (status.count + (pageResponse.pageNo - 1) * pageResponse.size) + 1}</td>
                        <td><a href="detail?userid=${item.userid}">${item.userid}</a></td>
                        <td>${item.name}</td>
                        <td>${item.age}</td>
                    </tr>
                </c:forEach>
                <c:if test="${empty pageResponse.list}">
                    <tr>
                        <td colspan="4" class="text-center text-muted">검색결과가 없습니다</td>
                    </tr>
                </c:if>
            </tbody>
        </table>

        <!-- 페이지 내비게이션 -->
        <c:import url="/resources/inc/pageNav.jsp"/>

        <!-- 페이지 정보 -->
        <div class="page-info">
            <span>현재 페이지: ${pageResponse.pageNo} / ${pageResponse.totalPage}</span>
        </div>

        <!-- 페이지 이동 스크립트 -->
        <script type="text/javascript">
            const size = document.querySelector("#size");
            const searchValue = document.querySelector("#searchValue");

            size.addEventListener("change", e => {
                location = "list?pageNo=1&size=" + size.value + "&searchValue=" + searchValue.value;    
            });

            function pageMove(pageNo) {
                const searchForm = document.querySelector("#searchForm");
                searchForm.pageNo.value = pageNo; 
                searchForm.submit();
            }
        </script>
    </div>

</body>
</html>
