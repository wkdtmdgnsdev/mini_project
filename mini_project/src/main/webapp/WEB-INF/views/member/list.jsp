<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원 관리</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <!-- Navigation -->
    <c:import url="/resources/inc/nav.jsp"/>

    <!-- 메인 컨테이너 -->
    <div class="container py-5">
        <h2 class="text-center text-primary mb-5">회원 관리</h2>

        <!-- 검색 폼 -->
        <form id="searchForm" action="list" method="post" class="row gy-3 align-items-end mb-4">
            <input type="hidden" name="pageNo" id="pageNo" value="${pageResponse.pageNo}">

            <div class="col-md-2">
                <select class="form-select" name="size" id="size">
                    <c:forTokens items="10,30,90,100" delims="," var="size">
                        <option value="${size}" ${pageResponse.size == size ? 'selected' : ''}>${size}</option>
                    </c:forTokens>
                </select>
            </div>

            <div class="col-md-6">
                <input type="text" class="form-control" id="searchValue" name="searchValue" value="${param.searchValue}" placeholder="회원명 또는 아이디 입력">
            </div>

            <div class="col-md-2">
                <button type="submit" class="btn btn-primary w-100">검색</button>
            </div>
        </form>

        <!-- 회원 목록 테이블 -->
        <div class="table-responsive">
            <table class="table table-hover table-bordered text-center align-middle">
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
                            <td>${pageResponse.totalCount - ((pageResponse.pageNo - 1) * pageResponse.size + status.index)}</td>
                            <td>
                                <a href="detail?userid=${item.userid}" class="text-decoration-none text-primary">${item.userid}</a>
                            </td>
                            <td>${item.name}</td>
                            <td>${item.age}</td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty pageResponse.list}">
                        <tr>
                            <td colspan="4" class="text-muted">검색 결과가 없습니다.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>

        <!-- 페이지 내비게이션 -->
        <div class="my-4">
            <c:import url="/resources/inc/pageNav.jsp"/>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    <!-- 페이지 이동 스크립트 -->
    <script>
        document.querySelector("#size").addEventListener("change", () => {
            const form = document.querySelector("#searchForm");
            form.pageNo.value = 1;
            form.submit();
        });

        function pageMove(pageNo) {
            const form = document.querySelector("#searchForm");
            form.pageNo.value = pageNo;
            form.submit();
        }
    </script>
</body>
</html>
