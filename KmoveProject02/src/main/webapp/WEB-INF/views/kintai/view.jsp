<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태 이력 조회</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    $(document).ready(function() {

        var selectedMonth = getParameterByName('selectedMonth');
        if (selectedMonth) {
            $('input[name="selectedMonth"]').val(selectedMonth);
        }

        $('input[name="selectedMonth"]').change(function() {

            var selectedMonth = $(this).val();

            var baseUrl = window.location.href.split('?')[0];

            var newUrl = baseUrl + '?selectedMonth=' + selectedMonth;

            window.location.href = newUrl;
        });

        function getParameterByName(name) {
            var url = window.location.href;
            name = name.replace(/[\[\]]/g, "\\$&");
            var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, ' '));
        }
    });
</script>
</head>
<body>
	<h1>근태 이력 조회</h1>
	<form>
		<input type="month" name="selectedMonth">
		
	</form>
	<table border="1" width="100%">
		<thead>
			<tr>
				<th>구분</th>
				<th>사원번호</th>
				<th>성명</th>
				<th>부서</th>
				<th>직위</th>
				<th>합계</th>
				<th>휴가공제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="shain">
				<tr>
					<td>${shain.koyo_keitai}</td>
					<td>${shain.shain_no}</td>
					<td>${shain.shain_nm}</td>
					<td>${shain.busho_nm}</td>
					<td>${shain.yakushoku_nm}</td>
					<td><c:forEach items="${hour}" var="hour">
							<c:if test="${hour.shain_no eq shain.shain_no}">
                    			${hour.total_kintai_hour}${hour.kintai_tani}
                			</c:if>
                		</c:forEach>
					</td>

					<td><c:forEach items="${dhour}" var="dhour">
							<c:if test="${dhour.shain_no eq shain.shain_no}">
                    			${dhour.total_kintai_hour}
                			</c:if>
                		</c:forEach>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	
</body>
</html>