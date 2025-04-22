<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
	<li><a href="member/loginForm">로그인</a></li>
	<li><a href="member/registerForm">회원가입</a></li>
	<li><a href="member/detail?userid=${member.userid }">회원상세보기</a></li>
	<li><a href="member/list">회원목록</a></li>
	<li><a href="member/updateForm">회원정보수정</a></li>
	<li><a href="board/list">게시물 목록</a></li>
	<li><a href="board/detail">게시물 상세보기</a></li>
	<li><a href="board/update">게시물 수정</a></li>
	<li><a href="board/registerForm">게시물 등록</a></li>
</ul>
</body>
</html>