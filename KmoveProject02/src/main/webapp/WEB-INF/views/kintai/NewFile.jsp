<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@include file="../includes/header.jsp"%>
<%@include file="../includes/menu.jsp"%>



<ul class="p_t5 bold w_70 c c_white bold">* 帰属年月</ul>
      <ul class="p_t1 ">
      	<input type="month" name='kizoku_ym' style="margin-top: 3px;">&nbsp;&nbsp;
      </ul>






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



<%@include file="../includes/footer.jsp"%>
