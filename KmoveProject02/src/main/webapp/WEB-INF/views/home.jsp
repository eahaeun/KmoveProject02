<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>MAIN PAGE</h1>

	<div>
		<c:if test="${not empty kaisha}">
			<table border="1">
				<tr>
					<th>Kaisha Name</th>
					<th>Daihyosha</th>
					<th>Jigyosha No</th>
					<th>Hojin No</th>
					<th>Setsuritsu YMD</th>
					<th>Homepage</th>
					<th>Address</th>
					<th>Renraku Tel</th>
					<th>Renraku Fax</th>
					<th>Jitai</th>
					<th>Jishu</th>
				</tr>
				<tr>
					<td>${kaisha.kaisha_nm}</td>
					<td>${kaisha.daihyosha}</td>
					<td>${kaisha.jigyosha_no}</td>
					<td>${kaisha.hojin_no}</td>
					<td>${kaisha.setsuritsu_ymd}</td>
					<td>${kaisha.homepage}</td>
					<td>${kaisha.address}</td>
					<td>${kaisha.renraku_tel}</td>
					<td>${kaisha.renraku_fax}</td>
					<td>${kaisha.jitai}</td>
					<td>${kaisha.jishu}</td>
				</tr>
			</table>
		</c:if>
	</div>

	<div>
		<table border="1">
			<tr>
				<th>정사원</th>
				<th>계약직</th>
				<th>임시직</th>
				<th>총원</th>
			</tr>
			<tr>
				<td>${regular}</td>
				<td>${contract}</td>
				<td>${temporary}</td>
				<td>${regular+contract+temporary}</td>
			</tr>
		</table>
	</div>
</body>
</html>
