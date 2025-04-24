<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>퀴즈 일괄 등록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<c:import url="/resources/inc/nav.jsp"/>
<div class="container mt-5">
    <h3>🧾 JSON 퀴즈 일괄 등록</h3>
    <p class="text-muted">여러 퀴즈를 JSON 형식으로 입력하면 한 번에 등록됩니다.</p>

    <form id="bulkForm">
        <textarea id="quizJson" class="form-control" rows="10" placeholder='[{"question":"", "options":["", "", "", ""], "answerIndex":1}]'></textarea>
        <button type="submit" class="btn btn-primary mt-3">등록</button>
    </form>

    <div id="result" class="mt-3"></div>
</div>

<script src="${pageContext.request.contextPath}/resources/js/quizRegister.js"></script>
</body>
</html>
