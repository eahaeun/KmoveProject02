<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="./includes/header.jsp"%>



<label for="monthInput">帰属年月: </label>
<input type="month" id="monthInput" name="kizoku_ym">

<br>
<br>
<br>

<table border="1">
	<thead>
		<tr>
			<th>雇用形態</th>
			<th>社員名</th>
			<th>部署</th>
			<th>支給総額</th>
			<th>控除総額</th>
		</tr>
	</thead>
	<tbody>
		<!-- c:forEach로 행을 반복 -->
		<c:forEach var="shain" items="${shainList}">
			<tr>
				<td>${shain.koyo_keitai}</td>
				<td>${shain.shain_nm}</td>
				<td>${shain.busho_nm}</td>
				<td>${kyuyo.sikyu_pay}</td>
				<td>${kyuyo.kojyo_pay}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>


<script>
    // <input type='month'> 요소를 찾습니다.
    const monthInput = document.getElementById('monthInput');

    // <input> 요소의 값이 변경될 때마다 이벤트를 처리하는 함수를 등록합니다.
    monthInput.addEventListener('input', function() {
        // 변경된 값 가져오기
        const newValue = monthInput.value;

        console.log(newValue); //yyyy-MM형태 문자열 확인
        
        // Ajax를 사용하여 서버에 값 전송
        $.ajax({
            type: 'POST',
            url: '/kyuyotest',
            data: { kizoku_ym: newValue },
            success: function(response) {
                // 성공적으로 서버에 전송된 경우 추가 작업 수행
                console.log("ajax success");
                $('table tbody').html($(response).find('tbody').html());
            },
            error: function(error) {
                console.error(error);
            }
        }); 
    });

/* 	// 행 클릭 이벤트처리
    $(document).on('click', 'table tbody tr', function() {
        // 클릭된 행에서 데이터를 가져와서 원하는 작업을 수행합니다.
        var koyoKeitai = $(this).find('td:eq(0)').text();
        var shainName = $(this).find('td:eq(1)').text();
        var bushoName = $(this).find('td:eq(2)').text();
        var shainNo = $(this).find('td:eq(3)').text();
        var kihonPay = $(this).find('td:eq(4)').text();

        // 가져온 데이터를 콘솔에 출력합니다.
        console.log("클릭된 행 정보:");
        console.log("雇用形態: " + koyoKeitai);
        console.log("社員名: " + shainName);
        console.log("部署: " + bushoName);
        console.log("社員番号: " + shainNo);
        console.log("基本給与: " + kihonPay);
    }); */
</script>

<%@include file="./includes/footer.jsp"%>