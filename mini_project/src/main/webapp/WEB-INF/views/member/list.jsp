<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 부트스트랩 CSS 추가 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 관리</title>
    <style>
        /* 커스터마이징된 스타일 */
        .container {
            margin-top: 20px;
        }
        .form-inline {
            display: flex;
            justify-content: space-between;
        }
        .pagination {
            justify-content: center;
        }
        .table th, .table td {
            vertical-align: middle;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1 class="text-center my-4">회원 관리</h1>

        <!-- 검색 폼 -->
        <form name="searchForm" id="searchForm" action="list" method="post" class="form-inline mb-4">
            <input type="hidden" name="pageNo" id="pageNo" value="${pageResponse.pageNo}">
            <div class="d-flex align-items-center">
                <label for="size" class="me-2">건수:</label>
                <select name="size" id="size" class="form-select form-select-sm me-3">
                    <c:forTokens items="10,30,90,100" delims="," var="size">
                        <option value="${size}" ${pageResponse.size == size ? 'selected' : ''}>${size}</option>
                    </c:forTokens>
                </select>
                <label for="searchValue" class="me-2">검색어:</label>
                <input type="text" name="searchValue" id="searchValue" value="${param.searchValue}" class="form-control form-control-sm me-3">
                <button type="submit" class="btn btn-primary btn-sm">검색</button>
            </div>
        </form>

        <!-- 회원 목록 테이블 -->
        <table class="table table-striped table-bordered">
            <thead class="table-light">
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
                        <td><a href="detail?userid=${item.userid}" class="text-decoration-none">${item.userid}</a></td>
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
        
        <br><br>
        <!-- 페이지 정보 -->
        <div class="text-center mb-4">
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

    <!-- 부트스트랩 JS 및 Popper.js 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
