<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>給与管理</title>
</head>
<body>
	<h1>給与台帳</h1>
	帰属年月 :
	<c:out value="${param.kizoku_ym}" />
	<table> <!-- 가장 밖 테이블 -->
		<tbody>
			<tr>
				<td>
					<table border="1"> <!-- 안 테이블 1 -->
						<tr>
							<th>氏名</th>
							<th>入社日</th>
							<th>部署</th>
							<th>職位</th>
						</tr>
						<c:forEach var="shainjyoho" items="${shainjyoho}">
							<tr>
								<td><c:out value="${shainjyoho.shain_nm}" /></td>
								<td><c:out value="${shainjyoho.nyusha_ymd}" /></td>
								<td><c:out value="${shainjyoho.busho_nm}" /></td>
								<td><c:out value="${shainjyoho.yakushoku_nm}" /></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="4">合計</td>
						</tr>
					</table> <!-- 안 테이블 1 끝-->
				</td>
				<td>
					<table border="1"> <!-- 안 테이블 2 -->  
						<tr>
							<th>支払総額</th>
							<th>控除総額</th>
							<th>実支給額</th>
						</tr>
						<!-- 합계를 구하기 위한 변수 선언 -->
						<c:set var="totalSikyu_pay" value="0" />
						<c:set var="totalkojyo_pay" value="0" />
						<c:set var="totaldifference" value="0" />
						<c:forEach var="kyuyojyoho" items="${kyuyojyoho}">
							<tr>
								<td><c:out value="${kyuyojyoho.sikyu_pay}" /></td>
								<td><c:out value="${kyuyojyoho.kojyo_pay}" /></td>
								<c:set var="difference" value="${kyuyojyoho.sikyu_pay - kyuyojyoho.kojyo_pay}" />
								<td><c:out value="${difference}" /></td>
								<!-- 합계를 계산하기 위한 반복 -->
								<c:set var="totalSikyu_pay" value="${totalSikyu_pay + kyuyojyoho.sikyu_pay}" />
								<c:set var="totalkojyo_pay" value="${totalkojyo_pay + kyuyojyoho.kojyo_pay}" />
								<c:set var="totaldifference" value="${totaldifference + difference}" />
							</tr>
						</c:forEach>
						<!-- 합계 출력 -->
						<tr>
							<td><c:out value="${totalSikyu_pay}" /></td>
							<td><c:out value="${totalkojyo_pay}" /></td>
							<td><c:out value="${totaldifference}" /></td>
						</tr>
					</table> <!-- 안 테이블 2 끝 -->
				</td>
			</tr>
		</tbody>
	</table> <!-- 밖 테이블 끝 -->
</body>
</html>
