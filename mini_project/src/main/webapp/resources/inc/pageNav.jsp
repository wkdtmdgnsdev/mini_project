<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav aria-label="Page navigation" class="d-flex justify-content-center mt-3">
    <ul class="pagination">

        <!-- 이전 버튼 -->
        <c:if test="${pageResponse.prev}">
            <li class="page-item">
                <a class="page-link" href="javascript:pageMove(${pageResponse.startPage - 1})" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
        </c:if>

        <!-- 페이지 번호 -->
        <c:forEach begin="${pageResponse.startPage}" end="${pageResponse.endPage}" var="pageNo">
            <li class="page-item ${pageNo == pageResponse.pageNo ? 'active' : ''}">
                <a class="page-link" href="javascript:pageMove(${pageNo})">${pageNo}</a>
            </li>
        </c:forEach>

        <!-- 다음 버튼 -->
        <c:if test="${pageResponse.next}">
            <li class="page-item">
                <a class="page-link" href="javascript:pageMove(${pageResponse.endPage + 1})" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </c:if>

    </ul>
</nav>

<!-- 현재 페이지 정보 -->
<div class="text-center mt-3">
    <p class="text-muted">
        <span class="fw-bold">현재 페이지:</span> 
        <span class="fs-5 text-primary">${pageResponse.pageNo}</span> / 
        <span class="fs-5 text-primary">${pageResponse.totalPage}</span>
    </p>
</div>
