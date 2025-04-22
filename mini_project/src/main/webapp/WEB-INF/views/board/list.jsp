<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 목록</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            padding: 30px;
            background-color: #f8f9fa;
        }
        .container {
            background: white;
            border-radius: 8px;
            padding: 25px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }
        h1 {
            margin-bottom: 30px;
        }
        table {
            margin-top: 20px;
        }
        .form-inline .form-control, .form-inline .form-select {
            margin-right: 10px;
        }
        .pagination-container {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="text-center">📋 게시물 목록</h1>

    <form name="searchForm" id="searchForm" action="list" method="post" class="row g-3 align-items-center">
        <input type="hidden" name="pageNo" id="pageNo" value="${pageResponse.pageNo}">

        <div class="col-auto">
            <label for="size" class="form-label">건수:</label>
            <select name="size" id="size" class="form-select">
                <c:forTokens items="10,30,90,100" delims="," var="size">
                    <option value="${size}" ${pageResponse.size == size ? 'selected' : ''}>${size}</option>
                </c:forTokens>
            </select>
        </div>

        <div class="col-auto">
            <label class="form-label">페이지:</label>
            <span>(${pageResponse.pageNo} / ${pageResponse.totalPage})</span>
        </div>

        <div class="col-md-4">
            <input type="text" name="searchValue" id="searchValue" class="form-control" placeholder="검색어 입력" value="${param.searchValue}">
        </div>

        <div class="col-auto">
            <button type="submit" class="btn btn-primary">검색</button>
        </div>
    </form>

    <table class="table table-bordered table-hover table-striped text-center">
        <thead class="table-dark">
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageResponse.list}" var="item" varStatus="status">
            <tr>
                <td>${item.bno }</td>
                <td class="text-start"><a href="detail?bno=${item.bno}" class="text-decoration-none">${item.title}</a></td>
                <td>${item.writer}</td>
                <td>${item.reg_date}</td>
                <td>${item.view_count}</td>
            </tr>
        </c:forEach>

        <c:if test="${empty pageResponse.list}">
            <tr>
                <td colspan="5">검색결과가 없습니다.</td>
            </tr>
        </c:if>
        </tbody>
    </table>

    <div class="pagination-container text-center">
        <c:import url="/resources/inc/pageNav.jsp" />
    </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
    const size = document.querySelector("#size");
    const searchValue = document.querySelector("#searchValue");

    size.addEventListener("change", () => {
        const url = new URL(window.location.href);
        url.searchParams.set("pageNo", 1);
        url.searchParams.set("size", size.value);
        url.searchParams.set("searchValue", searchValue.value);
        window.location.href = url.toString();
    });

    function pageMove(pageNo) {
        document.querySelector("#pageNo").value = pageNo;
        document.querySelector("#searchForm").submit();
    }
</script>
</body>
</html>
