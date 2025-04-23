<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시물 목록</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <!-- Navigation -->
    <c:import url="/resources/inc/nav.jsp"/>

    <!-- 컨텐츠 영역 -->
    <div class="container py-5">
        <h2 class="text-center text-dark mb-5">📋 게시물 목록</h2>

        <!-- 검색 폼 -->
        <form name="searchForm" id="searchForm" action="list" method="post" class="row g-3 align-items-end mb-4">
            <input type="hidden" name="pageNo" id="pageNo" value="${pageResponse.pageNo}">

            <div class="col-md-2">
                <label for="size" class="form-label">건수</label>
                <select name="size" id="size" class="form-select">
                    <c:forTokens items="10,30,90,100" delims="," var="size">
                        <option value="${size}" ${pageResponse.size == size ? 'selected' : ''}>${size}</option>
                    </c:forTokens>
                </select>
            </div>

            <div class="col-md-6">
                <label for="searchValue" class="form-label">검색어</label>
                <input type="text" name="searchValue" id="searchValue" class="form-control" value="${param.searchValue}" placeholder="제목, 작성자 등">
            </div>

            <div class="col-md-2">
                <label class="form-label d-block">&nbsp;</label>
                <button type="submit" class="btn btn-primary w-100">검색</button>
            </div>
        </form>

        <!-- 게시물 테이블 -->
        <div class="table-responsive">
            <table class="table table-bordered table-hover align-middle text-center">
                <thead class="table-dark">
                    <tr>
                        <th>번호</th>
                        <th class="text-start">제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${pageResponse.list}" var="item">
                        <tr>
                            <td>${item.bno}</td>
                            <td class="text-start">
                                <a href="detail?bno=${item.bno}" class="text-decoration-none text-primary">${item.title}</a>
                            </td>
                            <td>${item.writer}</td>
                            <td>${item.reg_date}</td>
                            <td>${item.view_count}</td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty pageResponse.list}">
                        <tr>
                            <td colspan="5" class="text-center text-muted">검색 결과가 없습니다.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>

        <!-- 페이지 네비게이션 -->
        <div class="my-4 text-center">
            <c:import url="/resources/inc/pageNav.jsp"/>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- 스크립트 -->
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
