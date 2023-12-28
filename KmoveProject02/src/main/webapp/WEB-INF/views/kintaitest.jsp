<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="./includes/header.jsp"%>

<h2>shain Table</h2>

<form id="kintaiForm">

<table border="1">
	<thead>
		<tr>
			<!-- 체크박스 추가 -->
			<th></th>
			<th>雇用形態</th>
			<th>社員番号</th>
			<th>社員名</th>
			<th>部署</th>
			<th>役職</th>
		</tr>
	</thead>
	<tbody>
		<!-- c:forEach로 행을 반복 -->
		<c:forEach var="shain" items="${shainList}">
			<tr>
				<!-- 맨 왼쪽에 체크박스 추가 -->
				<td><input type="checkbox" name="selectedShain"
					value="${shain.shain_no}"></td>
				<td>${shain.koyo_keitai}</td>
				<td>${shain.shain_no}</td>
				<td>${shain.shain_nm}</td>
				<td>${shain.busho_nm}</td>
				<td>${shain.yakushoku_nm}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>




<br>
<br>
<br>




    <table>
    	<tr>
    		<td>입력일:</td>
    		<td>
    			<input type="date" name="nyuryoku_ymd" id="nyuryoku_ymd" readonly>
    		</td>
    	</tr>
        <tr>
            <td>근태항목:</td>
            <td>
                <select name="kintai_km">
                    <c:forEach var="kintai" items="${kintaiList}">
                        <option value="${kintai.kintai_km}" data-tani="${kintai.kintai_tani}">
        					${kintai.kintai_km}
    					</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td>기간:</td>
            <td>
                <input type="date" name="kaishi_ymd">
                ~
                <input type="date" name="shuryo_ymd">
            </td>
        </tr>
        <tr>
            <td id="kintaiDaysLabel">근태일수:</td>
            <td><input type="text" name=kintai_hour id="kintaiDays"></td>
        </tr>
        <tr>
            <td>금액:</td>
            <td><input type="text" name="kintai_pay"></td>
        </tr>
    </table>

    <input type="submit" value="저장">
</form>


<script>
$(document).ready(function () {
	// 오늘 날짜 설정
	document.getElementById('nyuryoku_ymd').valueAsDate = new Date();

    // 콤보박스 변경
    console.log("Document ready!");

    $("select[name='kintai_km']").change(function () {
        console.log("Combo box changed!");
		
        var selectedTani = $(this).find("option:selected").data("tani");
        console.log("Selected Tani: " + selectedTani);

        var kintaiDaysLabel = $("#kintaiDaysLabel");

        if (selectedTani === 'D') {
            console.log("Setting label to '근태일수'");
            kintaiDaysLabel.text("근태일수:");
            $("#kintaiDays").val("");
        } else if (selectedTani === 'H') {
            console.log("Setting label to '근태시간'");
            kintaiDaysLabel.text("근태시간:");
            $("#kintaiDays").val(""); // 빈 값을 설정하여 초기화
        }
    });

    // 시작일과 종료일이 변경될 때
    $("input[name='kaishi_ymd'], input[name='shuryo_ymd']").on("change", function () {
        var selectedTani = $("select[name='kintai_km']").find("option:selected").data("tani");

        // 선택된 tani가 'D'인 경우에만 아래 코드 실행
        if (selectedTani === 'D') {
            var startDate = $("input[name='kaishi_ymd']").val();
            var endDate = $("input[name='shuryo_ymd']").val();

            if (startDate !== "" && endDate !== "") {
                // 시작일과 종료일을 Date 객체로 변환
                var startDateObj = new Date(startDate);
                var endDateObj = new Date(endDate);

                // 날짜 차이 계산
                var diffInMillies = Math.abs(endDateObj - startDateObj);
                var diffInDays = Math.ceil(diffInMillies / (1000 * 60 * 60 * 24));

                // 결과를 kintaiDays 입력란에 표시
                $("#kintaiDays").val(diffInDays);
            }
        }
    });
    

    
    
    
    
    // 폼이 제출될 때의 이벤트 처리
    $("#kintaiForm").submit(function(event) {
        // 폼 데이터 생성
        var formData = new FormData();
        formData.append("shain_no", "");
        formData.append("nyuryoku_ymd", $("#nyuryoku_ymd").val()); // 입력일
        formData.append("kintai_km", $("select[name='kintai_km']").val()); // 근태항목
        formData.append("kaishi_ymd", $("input[name='kaishi_ymd']").val()); // 기간 시작일
        formData.append("shuryo_ymd", $("input[name='shuryo_ymd']").val()); // 기간 종료일
        formData.append("kintai_hour", $("input[name='kintai_hour']").val()); // 근태일수
        formData.append("kintai_pay", $("input[name='kintai_pay']").val()); // 금액

        // 체크된 체크박스의 값을 배열로 가져오기
        var selectedShainValues = [];
        $('input[name="selectedShain"]:checked').each(function() {
            selectedShainValues.push($(this).val());
        });
        
        console.log("selectedShain : " + selectedShainValues);

        // 선택된 직원들에 대해 반복문을 통해 각각의 shain_no 값을 formData에 추가하고 Ajax 요청 보내기
        for (var i = 0; i < selectedShainValues.length; i++) {
            // 현재 선택된 직원의 shain_no 값을 formData에 추가
            formData.set('shain_no', selectedShainValues[i]);
            
            console.log([...formData.entries()]);

            // Ajax를 통해 서버로 데이터 전송
            $.ajax({
                type: "POST",
                url: "/kintaiHistoryRegister", // 서버의 주소 또는 서블릿 매핑 주소
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    // 서버로부터의 응답을 처리
                    console.log(response);
                },
                error: function(error) {
                    // 오류 발생 시 처리
                    console.error(error);
                }
            });
        }

        // 폼 제출 중지 (기본 동작 방지)
        event.preventDefault();
    });
});

</script>



<%@include file="./includes/footer.jsp"%>
