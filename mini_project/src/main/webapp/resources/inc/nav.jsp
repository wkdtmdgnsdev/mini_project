<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="/mini">MyWeb</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <c:if test="${empty member}">
                    <li class="nav-item">
                        <a class="nav-link" href="/mini/member/loginForm">로그인</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/mini/member/registerForm">회원가입</a>
                    </li>
                </c:if>
                <c:if test="${not empty member}">
                    <li class="nav-item">
                        <a class="nav-link" href="/mini/member/detail?userid=${member.userid}">내 정보</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/mini/member/logout">로그아웃</a>
                    </li>
                </c:if>
                <c:if test="${isAdmin}">
                    <li class="nav-item">
                        <a class="nav-link" href="/mini/member/list">회원목록</a>
                    </li>
                </c:if>
                <li class="nav-item">
                    <a class="nav-link" href="/mini/board/list">게시판</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
