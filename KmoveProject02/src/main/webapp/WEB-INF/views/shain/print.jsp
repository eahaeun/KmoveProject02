<%@ page language="java"
	contentType="application/vnd.ms-excel; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	// 파일 이름 설정
	String fileName = "shainInfo.xls";
	response.setContentType("application/vnd.ms-excel; charset=UTF-8");
	response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ";");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>

<body>
	<table width="1000" border="1" bordercolor="#adf9b3"
		bordercolorlight="#ffffff" bordercolordark="#6C717D" cellspacing="0"
		cellpadding="0">
		<thead>
			<tr align="center">
				<th scope="col" bgcolor="#CDCDCD">職員氏名</th>
				<th scope="col" bgcolor="#CDCDCD">部署名称</th>
				<th scope="col" bgcolor="#CDCDCD">役職名称</th>
			</tr>
		</thead>

		<tbody>
			<tr>
				<td style="text-align: left;">${printShainInfo.shain_nm}</td>
				<td style="text-align: left;">${printShainInfo.busho_nm}</td>
				<td style="text-align: left;">${printShainInfo.yakushoku_nm}</td>
			</tr>
		</tbody>
	</table>
</body>
</html>
