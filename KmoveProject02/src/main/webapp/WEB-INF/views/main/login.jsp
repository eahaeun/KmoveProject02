<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<c:if test="${not empty error}">
	<script>
		// Flash attribute에서 전달된 메시지를 alert로 표시
		alert("${error}");
	</script>
</c:if>

<form action="/login" method="post">
ID : <input type="text" name="kanrisha_uid">
PW : <input type="text" name="kanrisha_pw">
<input type="submit" value="login">
</form>

<%@include file="../includes/footer.jsp"%>
