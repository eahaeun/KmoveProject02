<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>給与台帳</title>
    
</head>
<body>
    <h1>給与台帳</h1>
    <form id="kyuyoForm">
        <label for="kizoku_ym">帰属年度:</label>
        <select id="kizoku_ym" name="kizoku_ym">
            <!-- 연도 선택 옵션들이 자동으로 생성될 공간 -->
        </select>
    </form>

    <div id="result">
        <!-- 초기에 비어 있는 테이블 -->
    </div>

    <script>
    
    //<select>의 연도를 자동으로 발생시킴
    function generateYearOptions() {
        var select = document.getElementById('kizoku_ym');
        //현재 연도
        var currentYear = new Date().getFullYear();
        //과거 연도
        var previousYears = 10;
        //미래연도
        var futureYears = 5;
	
        //과거연도를 만드는 과정
        for (var i = currentYear - previousYears; i < currentYear; i++) {
            var option = document.createElement('option');
            option.value = i;
            option.textContent = i + '年';
            select.appendChild(option);
        }

        //현재 연도를 자동으로 먼저 선택하게 하는 과정
        var currentOption = document.createElement('option');
        currentOption.value = currentYear;
        currentOption.textContent = currentYear + '年';
        currentOption.selected = true;
        select.appendChild(currentOption);

        //미래연도를 만드는 과정
        for (var j = currentYear + 1; j <= currentYear + futureYears; j++) {
            var option = document.createElement('option');
            option.value = j;
            option.textContent = j + '年';
            select.appendChild(option);
        }
    }

    $(document).ready(function() {
        generateYearOptions();
        	
        // 테이블 초기화 함수
        function initializeTable() {
            return '<table border="1">' +
                        '<thead>' +
                            '<tr>' +
                                '<th>帰属年月</th>' +
                                '<th>精算期間</th>' +
                                '<th>支給日</th>' +
                                '<th>人員</th>' +
                                '<th>支払総額</th>' +
                                '<th>控除総額</th>' +
                                '<th>実支給額</th>' +
                                '<th>削除</th>' +
                            '</tr>' +
                        '</thead>' +
                        '<tbody id="kyuyoList">' +
                        '</tbody>' +
                        '<tfoot id="kyuyoTotal">' +
                        '</tfoot>' +
                    '</table>';
        }

        // 페이지 로딩시 현재 연도 데이터 자동 로드
        var currentYear = new Date().getFullYear();
        $.ajax({
            type: 'GET',
            url: '/kyuyo/getKyuyoData',
            data: { kizoku_ym: currentYear },
            dataType: 'xml', // XML 데이터로 받기
            success: function(data) {
                $('#result').html(initializeTable()); // 테이블 초기화
			
              //합계를 구하기 위한 변수 선언
                var totalSumSikyuPay = 0;
                var totalSumKojyoPay = 0;
              //데이터를 받아서 사용할 수 있게 변수에 넣음
                $(data).find('item').each(function() {
                    var kizoku_ym = $(this).find('kizoku_ym').text();
                    var count = $(this).find('count').text();
                    var sumSikyuPay = $(this).find('sumSikyuPay').text();
                    var sumKojyoPay = $(this).find('sumKojyoPay').text();
                    var difference = parseInt(sumSikyuPay, 10) - parseInt(sumKojyoPay, 10);
                  
                    //합계 구하기
                    totalSumSikyuPay += parseInt(sumSikyuPay, 10);
                    totalSumKojyoPay += parseInt(sumKojyoPay, 10);
                    
                    //날짜 변환
                    function getLastDayOfMonth(year, month) {
                    	  // month에 1을 더해야 합니다. JavaScript의 getMonth()는 0부터 시작합니다.
                    	  const date = new Date(year, month, 0);
                    	  return date.getDate(); // 해당 월의 마지막 날짜 반환
                    	}
                    //월을 1월이면 01로 바꿔줌.
                    function formatMonth(month) {
                    	  // padStart() 함수를 사용하여 월을 두 자리 숫자로 변환합니다.
                    	  return String(month).padStart(2, '0');
                    	}
                    
                    var dateString = kizoku_ym; // 예시로 문자열 형식의 날짜

                    var dateObject = new Date(dateString);
					var year = dateObject.getFullYear();
					//월은 0부터 시작하기 때문에 + 1을 해줌
					var month = formatMonth(dateObject.getMonth() + 1);
					//지급월은 다음달이기 때문에 + 2를 해줌
					var sikyuMonth = formatMonth(dateObject.getMonth() + 2);
					//지급 월이 12월이 넘어갈경우 다음年도 1월로
					if (sikyuMonth > 12) {
						   var nextYear = year + 1;
						  sikyuMonth = formatMonth(sikyuMonth - 12);
						}else{
							nextYear = year;
						}
					//마지막 일
					var lastDayOfMonth = getLastDayOfMonth(year, month);
					
					//급여대장 내용출력
                    var tableRow = '<tr>' +
                                    '<td>' + kizoku_ym + '</td>' +
                                    '<td>' + year +'-'+ month + '-01 ~ ' + year + '-' + month + '-' + lastDayOfMonth + '</td>' +
                                    '<td>' + nextYear +'-'+ sikyuMonth + '-05' + '</td>' +
                                    '<td>' + count + '</td>' +
                                    '<td>' + sumSikyuPay + '</td>' +
                                    '<td>' + sumKojyoPay + '</td>' +
                                    '<td>' + difference + '</td>' +
                                    '<td><button class="deleteBtn">削除</button></td>' +
                                    '</tr>';
                                    
                    $('#kyuyoList').append(tableRow);
                });
                
              //합계 출력
                var totalRow = '<tr>' +
              					'<td colspan="4"><b>Total:</b></td>' +
               					'<td>' + totalSumSikyuPay + '</td>' +
               					'<td>' + totalSumKojyoPay + '</td>' +
               					'<td>' + (totalSumSikyuPay - totalSumKojyoPay) + '</td>' +
               					'<td></td>' +
             					'</tr>';

				$('#kyuyoTotal').append(totalRow);
            },
            error: function() {
                alert('Error occurred while fetching data.');
            }
        });
        
        //연도가 바뀔시 이벤트
        $('#kizoku_ym').change(function() {
            var selectedYear = $(this).val();

            $.ajax({
                type: 'GET',
                url: '/kyuyo/getKyuyoData',
                data: { kizoku_ym: selectedYear },
                dataType: 'xml', // XML 데이터로 받기
                success: function(data) {
                    $('#result').html(initializeTable()); // 테이블 초기화
					
                    //합계를 구하기 위한 변수 선언
                    var totalSumSikyuPay = 0;
                    var totalSumKojyoPay = 0;
                    //데이터를 받아서 사용할 수 있게 변수에 넣음
                    $(data).find('item').each(function() {
                        var kizoku_ym = $(this).find('kizoku_ym').text();
                        var count = $(this).find('count').text();
                        var sumSikyuPay = $(this).find('sumSikyuPay').text();
                        var sumKojyoPay = $(this).find('sumKojyoPay').text();
                        var difference = parseInt(sumSikyuPay, 10) - parseInt(sumKojyoPay, 10);
                        
                        //합계 구하기
                        totalSumSikyuPay += parseInt(sumSikyuPay, 10);
                        totalSumKojyoPay += parseInt(sumKojyoPay, 10);
                        
                      //날짜 변환
                        function getLastDayOfMonth(year, month) {
                        	  // month에 1을 더해야 합니다. JavaScript의 getMonth()는 0부터 시작합니다.
                        	  const date = new Date(year, month + 1, 0);
                        	  return date.getDate(); // 해당 월의 마지막 날짜 반환
                        	}
                        //월을 1월이면 01로 바꿔줌.
                        function formatMonth(month) {
                        	  // padStart() 함수를 사용하여 월을 두 자리 숫자로 변환합니다.
                        	  return String(month).padStart(2, '0');
                        	}
                        
                        var dateString = kizoku_ym; // 예시로 문자열 형식의 날짜

                        var dateObject = new Date(dateString);
    					var year = dateObject.getFullYear();
    					//월은 0부터 시작하기 때문에 + 1을 해줌
    					var month = formatMonth(dateObject.getMonth() + 1);
    					//지급월은 다음달이기 때문에 + 2를 해줌
    					var sikyuMonth = formatMonth(dateObject.getMonth() + 2);
    					//지급 월이 12월이 넘어갈경우 다음년도 1월로
    					if (sikyuMonth > 12) {
 						   var nextYear = year + 1;
 						  sikyuMonth = formatMonth(sikyuMonth - 12);
 						}else{
 							nextYear = year;
 						}
    					//마지막 일
    					var lastDayOfMonth = getLastDayOfMonth(year, month);
    					//급여대장 내용출력
                        var tableRow = '<tr>' +
                                        '<td>' + kizoku_ym + '</td>' +
                                        '<td>' + year +'-'+ month + '-01 ~ ' + year + '-' + month + '-' + lastDayOfMonth + '</td>' +
                                        '<td>' + nextYear +'-'+ sikyuMonth + '-05' + '</td>' +
                                        '<td>' + count + '</td>' +
                                        '<td>' + sumSikyuPay + '</td>' +
                                        '<td>' + sumKojyoPay + '</td>' +
                                        '<td>' + difference + '</td>' +
                                        '<td><button class="deleteBtn">削除</button></td>' +
                                        '</tr>';
                        $('#kyuyoList').append(tableRow);
                    });
                    
                  //합계 출력
                    var totalRow = '<tr>' +
                  					'<td colspan="4"><b>Total:</b></td>' +
                   					'<td>' + totalSumSikyuPay + '</td>' +
                   					'<td>' + totalSumKojyoPay + '</td>' +
                   					'<td>' + (totalSumSikyuPay - totalSumKojyoPay) + '</td>' +
                   					'<td></td>' +
                 					'</tr>';

    				$('#kyuyoTotal').append(totalRow);
                },
                error: function() {
                    alert('Error occurred while fetching data.');
                }
            });
        });


        // 테이블 행 클릭 시 이동
        $(document).on('click', '#kyuyoList tr', function() {
            var kizoku_ym = $(this).find('td:eq(0)').text(); // 첫 번째 열의 데이터 (年월)
            window.location.href = '/kyuyo/kyuyoDaichoYM?kizoku_ym=' + String(kizoku_ym) ;
        });
        
        $(document).on('click', '.deleteBtn', function(event) {
            event.stopPropagation();

            var row = $(this).closest('tr');
            var kizoku_ym = row.find('td:eq(0)').text(); // 첫 번째 열의 데이터 (年월)

            $.ajax({
                type: 'POST', // 또는 DELETE, 요청 방식에 따라 적절히 설정
                url: '/kyuyo/deleteKyuyoData',
                data: { kizoku_ym: kizoku_ym },
                success: function(response) {
                    // 서버로부터 응답을 받았을 때의 동작 (예: 성공 메시지 출력)
                    console.log('데이터 삭제 성공');
                    row.remove(); // 삭제 성공 시 행을 화면에서 제거
                },
                error: function() {
                    // 에러가 발생했을 때의 동작 (예: 실패 메시지 출력)
                    console.log('데이터 삭제 실패');
                }
            });
        });
    });
    </script>
</body>
</html>
