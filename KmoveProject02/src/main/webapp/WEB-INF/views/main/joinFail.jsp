<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>


<c:if test="${not empty error}">
	<script>
		// Flash attribute에서 전달된 메시지를 alert로 표시
		alert("${error}");
        window.location.href = "/main/join";
	</script>
</c:if>

<%@include file="../includes/footer.jsp"%>