<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>社員別給与内訳</title>
<style>
/* 모달의 스타일 */
.modal {
	display: none; /* 기본적으로 숨김 */
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4); /* 배경에 어둡게 */
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 30%;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

/* 닫기 버튼 스타일 */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>

	<h1>社員別給与内訳</h1>

	<!-- 시작 날짜 선택 -->
<label for="start_ym">期間選択 : </label>
<input type="month" id="start_ym">

<!-- 종료 날짜 선택 -->
<label for="end_ym">~</label>
<input type="month" id="end_ym">
	
	<!-- 모달 버튼 -->
 <label>&nbsp; 社員選択: </label><input type="text" id="modalBtn" value=""/>

<div id="result">

</div>

	<!-- 모달 -->
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal()">&times;</span>
			<h3>給与内訳照会社員選択</h3>
			<input type="text" id="searchInput" onkeyup="filterTable()" placeholder="검색..." />
			<table border="1" id="shainTable">
				<tr>
					<th>社員番号</th>
					<th>氏名</th>
					<th>部署</th>
					<th>職位</th>
				</tr>
				<c:forEach var="shain" items="${shainjyoho}">

					<tr onclick="goKyuyoJyoho('${shain.shain_no}')">
						<td><c:out value="${shain.shain_no}"/></td>
						<td><c:out value="${shain.shain_nm}"/></td>
						<td><c:out value="${shain.busho_nm}"/></td>
						<td><c:out value="${shain.yakushoku_nm}"/></td>
					</tr>
				</c:forEach>
    </table>
  </div>
</div>

<div id="kyuyoJyoho">

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

function initializeTable() {
    return '<table border="1">' +
                '<thead>' +
                	
                    '<tr>' +
                        '<th colspan="4">月別給与内訳</th>' +
                        '<th colspan="4">四大保険</th>' +
                    '</tr>' +
                    '<tr>' +
                        '<th>帰属年月</th>' +
                        '<th>支給合計</th>' +
                        '<th>共済合計</th>' +
                        '<th>実支給額</th>' +
                        '<th>国民年金</th>' +
                        '<th>健康保険</th>' +
                        '<th>長期療養保険</th>' +
                        '<th>雇用保険</th>' +
                    '</tr>' +
                '</thead>' +
                '<tbody id="kyuyoList">' +
                '</tbody>' +
                '<tfoot id="kyuyoTotal">' +
                '</tfoot>' +
            '</table>';
}

// 모달 열기 함수
function openModal() {
  document.getElementById('myModal').style.display = 'block';
}

// 모달 닫기 함수
function closeModal() {
  document.getElementById('myModal').style.display = 'none';
}

//선택한 사원 정보 표시 함수 (AJAX를 이용한 데이터 요청)
function goKyuyoJyoho(shain_no) {
	
	var startYearMonth = document.getElementById('start_ym').value;
    var endYearMonth = document.getElementById('end_ym').value;
	
	$.ajax({
        url: '/kyuyo/kyuyoJyoho', // 여기에 컨트롤러의 URL을 입력하세요
        type: 'Get',
        data: { shain_no: shain_no,
            	start_ym: startYearMonth,
            	end_ym: endYearMonth
           	}, // 선택된 사원 번호, 선택 년월 기간을 전송
           dataType: 'xml', 
        success: function(data) {
            // 성공적으로 응답을 받았을 때 처리할 코드
            $('#result').html(initializeTable());
            
            var totalSikyuPay = 0;
            var totalKojyoPay = 0;
            var totalKokuminNenkin = 0;
            var totalKenkoHoken = 0;
            var totalChoukiRyouyohoken = 0;
            var totalKoyouHoken = 0;
            var kyuyoJyohoCount = 0;
            $(data).find('kyuyoJyoho').each(function() {
                    var kizoku_ym = $(this).find('kizoku_ym').text();
                    var sikyu_pay = $(this).find('sikyu_pay').text();
                    var kojyo_pay = $(this).find('kojyo_pay').text();
                    var difference = parseInt(sikyu_pay, 10) - parseInt(kojyo_pay, 10);
                    
                    var shainData = $(data).find('shainjyoho').filter(function() {
                    	
                        return $(this).find('shain_no').text() === shain_no;
                    });
                    
                    var shain_nm = shainData.find('shain_nm').text();
                    var kihon_pay = shainData.find('kihon_pay').text();
                    
                    modalBtn.value = shain_nm;
                    var kokuminNenkin = kihon_pay * 0.045;
                    var kenkoHoken = kihon_pay * 0.03545;
                    var choukiRyouyohoken = kihon_pay * 0.03545 * 0.0645;
                    var koyouHoken = kihon_pay * 0.009;
                    
                    totalKokuminNenkin += parseInt(kokuminNenkin, 10);
                    totalKenkoHoken += parseInt(kenkoHoken, 10);
                    totalChoukiRyouyohoken += parseInt(choukiRyouyohoken, 10);
                    totalKoyouHoken += parseInt(koyouHoken, 10);
                    totalSikyuPay += parseInt(sikyu_pay, 10);
                    totalKojyoPay += parseInt(kojyo_pay, 10);
                    
                    kyuyoJyohoCount = $(data).find('kyuyoJyoho').length;
                    
                    var tableRow = '<tr>' +
                    '<td>' + kizoku_ym + '</td>' +
                    '<td>' + sikyu_pay + '</td>' +
                    '<td>' + kojyo_pay + '</td>' +
                    '<td>' + difference + '</td>' +
                    '<td>' + parseInt(kokuminNenkin, 10) + '</td>' +
                    '<td>' + parseInt(kenkoHoken, 10) + '</td>' +
                    '<td>' + parseInt(choukiRyouyohoken, 10) + '</td>' +
                    '<td>' + parseInt(koyouHoken, 10) + '</td>' +
                    '</tr>';
                    
    		$('#kyuyoList').append(tableRow);
			console.log(kizoku_ym + sikyu_pay + kojyo_pay + difference);
		});
            var totalRow = '<tr>' +
				'<td><b>合計</b></td>' +
				'<td>' + totalSikyuPay + '</td>' +
				'<td>' + totalKojyoPay + '</td>' +
				'<td>' + (totalSikyuPay - totalKojyoPay) + '</td>' +
				'<td>' + totalKokuminNenkin + '</td>' +
				'<td>' + totalKenkoHoken + '</td>' +
				'<td>' + totalChoukiRyouyohoken + '</td>' +
				'<td>' + totalKoyouHoken + '</td>' +
				'</tr>';

				$('#kyuyoTotal').append(totalRow);
				
				closeModal();
        },
        error: function() {
            // 오류 발생 시 처리할 코드
            alert('오류가 발생했습니다.');
        }
    });
}

// 모달 버튼 클릭 시 모달 열기
document.getElementById('modalBtn').addEventListener('click', openModal);

function filterTable() {
	  // 입력된 검색어 가져오기
	  var input = document.getElementById('searchInput');
	  var filter = input.value.toUpperCase();

	  // 테이블과 행 가져오기
	  var table = document.getElementById('shainTable');
	  var rows = table.getElementsByTagName('tr');

	  // 각 행을 반복하며 필터링 적용
	  for (var i = 1; i < rows.length; i++) { // i=1부터 시작하여 제목 행은 건너뜁니다.
	    var cells = rows[i].getElementsByTagName('td');
	    var found = false; // 검색어 일치 여부

	    // 각 셀에 대해 검색어 일치 확인
	    for (var j = 0; j < cells.length; j++) {
	      var cell = cells[j];
	      if (cell) {
	        var txtValue = cell.textContent || cell.innerText;
	        if (txtValue.toUpperCase().indexOf(filter) > -1) {
	          found = true;
	          break;
	        }
	      }
	    }

	    // 검색어에 일치하는 경우 행을 보이게 하고, 아닌 경우 숨김 처리
	    if (found) {
	      rows[i].style.display = '';
	    } else {
	      rows[i].style.display = 'none';
	    }
	  }
	}
</script>

</body>
</html>
