<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:if test="${pageResponse.prev}">
	<a href="#" onclick="pageMove(${pageResponse.startPage-1})" >이전</a>
</c:if>    
 
<c:forEach begin="${pageResponse.startPage}" end="${pageResponse.endPage}" var="pageNo">
	<a href="javascript:pageMove(${pageNo})">
		<c:choose>
			<c:when test="${pageNo == pageResponse.pageNo}"><b>${pageNo}</b></c:when>
			<c:otherwise>${pageNo}</c:otherwise>
		</c:choose>
	</a>     
	&nbsp;
</c:forEach>
<c:if test="${pageResponse.next}">
	<a href="#" onclick="pageMove(${pageResponse.endPage+1})">다음</a>
</c:if>