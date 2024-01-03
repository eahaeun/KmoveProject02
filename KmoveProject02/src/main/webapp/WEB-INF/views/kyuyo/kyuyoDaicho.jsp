<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@include file="../includes/header.jsp"%>
<%@include file="../includes/menu.jsp"%>

<div id="main_container">
	<div class="sub_titimg">
		<ul>
			<li class="tit_img p_r7">
			<img src="../resources/img/paypaper_tit_img.gif" width="72" height="68">
			</li>
			<li class="p_t10">
			<img src="../resources/img/paypaper_tit_01.png" width="97" height="25">
			</li>
			<li class="p_t5">帰属年月別の給与総額および社員別給与支給状況を一覧できます。
			</li>
		</ul>
	</div>
	
	<hr>

	
	
	<div class="main_titimg wp_100">
	  <!-- 검색 & 정렬 -->
	  <div class="e_total" style="overflow:visible">
	    <div class="border_paysearch_2 wp_100 ">
	        <ul class="bold w_70 p_t5 c">* 帰属年度 </ul>
	        <ul class="p_t1">        
	         <select name="kizoku_ym" id="kizoku_ym" style="width:100px;">
	         </select>
	         
	        </ul>
	        <ul class="p_t5 p_l10">帰属年を選択し、給与区分をクリックすると、詳細な内容を確認できます。</ul>
	    </div>
	
	  </div>
	  <hr class="hr_0">
	   <!-- 휴가조회 리스트 -->
	      <div class="e_total">
	        <div id="table1" style="width:82.4%;">
	        <p class="caption"></p>
	        <ul>
	        <li class="w_105 tit "><a href="#" class="c_linkblue"><strong>帰属年月</strong></a></li>
	        <li class="w_170 tit">精算期間</li>
	        <li class="w_120 tit">支給日</li>
	        <li class="w_92 tit">人数</li>
	        <li class="w_132 tit">支払総額</li>
	        <li class="w_132 tit">控除総額</li>
	        <li class="w_143 tit">差引総額</li>
	        <li class="w_70 tit">削除</li>
	        </ul>
	
	
	        </div>
	    </div>
	
	  </div>
	
	
	
	
	
	
	
	
	    

</div> <!-- end main container -->









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

</script>

<script>
$(document).ready(function() {
	generateYearOptions();

    // 페이지 로딩시 현재 연도 데이터 자동 로드
    var currentYear = new Date().getFullYear();
    $.ajax({
        type: 'GET',
        url: '/kyuyo/getKyuyoData',
        data: { kizoku_ym: currentYear },
        dataType: 'xml', // XML 데이터로 받기
        success: function(data) {
		
        	//컨테이너 요소 가져오기
        	var tableContainer = document.getElementById("table1");

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
				
				
				// 새로운 ul 요소 생성
	        	var newRow = document.createElement("ul");
	        	newRow.className = "anchor ulPayTotalList";
	        	
				// 각 li 요소의 내용 설정
				newRow.innerHTML = 
				    '<li class="w_105 ">' + kizoku_ym + '</li>' +
				    '<li class="w_170 ">' + year + '-' + month + '-01 ~ ' + year + '-' + month + '-' + lastDayOfMonth + '</li>' +
				    '<li class="w_120 ">' + nextYear + '-' + sikyuMonth + '-05</li>' +
				    '<li class="w_92 ">' + count + '</li>' +
				    '<li class="w_132 bold c_blue a_r">' + parseInt(sumSikyuPay, 10).toLocaleString() + ' &nbsp;&nbsp;</li>' +
				    '<li class="w_132 bold c_red a_r">' + parseInt(sumKojyoPay, 10).toLocaleString() + ' &nbsp;&nbsp;</li>' +
				    '<li class="w_143 bold a_r">' + parseInt(difference, 10).toLocaleString() + ' &nbsp;&nbsp;</li>' +
				    '<li class="w_70 c"><span class="anchor"><img value="삭제하기" src="../resources/img/btn_s_delete.png" width="43px" height="19px" class="p_l5 "></span></li>';

				// 새로운 ul 요소를 컨테이너 요소에 추가
				tableContainer.appendChild(newRow);
            });
            
          
          	//합계 출력
            var totalRow = document.createElement("ul");
            totalRow.className = "b_yellow";
            totalRow.innerHTML = 
                '<li class="w_105 bold p_t3">合計</li>' +
                '<li class="w_170 p_t3"></li>' +
                '<li class="w_120 p_t3"></li>' +
                '<li class="w_92 p_t3"></li>' +
                '<li class="w_132 bold c_blue p_t3 a_r">' + parseInt(totalSumSikyuPay, 10).toLocaleString() + ' &nbsp;&nbsp;</li>' +
                '<li class="w_132 bold c_red p_t3 a_r">' + parseInt(totalSumKojyoPay, 10).toLocaleString() + ' &nbsp;&nbsp;</li>' +
                '<li class="w_143 bold p_t3 a_r">' + parseInt((totalSumSikyuPay - totalSumKojyoPay), 10).toLocaleString() + ' &nbsp;&nbsp;</li>' +
				'<li class="w_70 c p_t3"></li>';


            // 새로운 합계 ul 요소를 컨테이너 요소에 추가
            tableContainer.appendChild(totalRow);
        },
        error: function() {
            alert('Error occurred while fetching data.');
        }
    });

    
    
    
    
  	//연도가 바뀔시 이벤트
    $('#kizoku_ym').change(function() {
        var selectedYear = $(this).val();
        console.log("selectedYear: " + selectedYear);

        $.ajax({
            type: 'GET',
            url: '/kyuyo/getKyuyoData',
            data: { kizoku_ym: selectedYear },
            dataType: 'xml', // XML 데이터로 받기
            success: function(data) {
            	
            	//컨테이너 요소 가져오기
            	var tableContainer = document.getElementById("table1");
				
            	// #table1 내의 자식 ul 요소들 제거 (첫 번째 ul은 남김)
                var childULs = tableContainer.getElementsByTagName('ul');
                for (var i = childULs.length - 1; i > 0; i--) {
                    tableContainer.removeChild(childULs[i]);
                }
            	
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
					// 새로운 ul 요소 생성
		        	var newRow = document.createElement("ul");
		        	newRow.className = "anchor ulPayTotalList";
		        	
					// 각 li 요소의 내용 설정
					newRow.innerHTML = 
					    '<li class="w_105 ">' + kizoku_ym + '</li>' +
					    '<li class="w_170 ">' + year + '-' + month + '-01 ~ ' + year + '-' + month + '-' + lastDayOfMonth + '</li>' +
					    '<li class="w_120 ">' + nextYear + '-' + sikyuMonth + '-05</li>' +
					    '<li class="w_92 ">' + count + '</li>' +
					    '<li class="w_132 bold c_blue a_r">' + sumSikyuPay + ' &nbsp;&nbsp;</li>' +
					    '<li class="w_132 bold c_red a_r">' + sumKojyoPay + ' &nbsp;&nbsp;</li>' +
					    '<li class="w_143 bold a_r">' + difference + ' &nbsp;&nbsp;</li>' +
					    '<li class="w_70 c"><span class="anchor"><img value="삭제하기" src="../resources/img/btn_s_delete.png" width="43px" height="19px" class="p_l5 "></span></li>';


					// 새로운 ul 요소를 컨테이너 요소에 추가
					tableContainer.appendChild(newRow);
                });
                
              //합계 출력
                var totalRow = document.createElement("ul");
                totalRow.className = "b_yellow";
                totalRow.innerHTML = 
                    '<li class="w_105 bold p_t3">合計</li>' +
                    '<li class="w_170 p_t3"></li>' +
                    '<li class="w_120 p_t3"></li>' +
                    '<li class="w_92 p_t3"></li>' +
                    '<li class="w_132 bold c_blue p_t3 a_r">' + totalSumSikyuPay + ' &nbsp;&nbsp;</li>' +
                    '<li class="w_132 bold c_red p_t3 a_r">' + totalSumKojyoPay + ' &nbsp;&nbsp;</li>' +
                    '<li class="w_143 bold p_t3 a_r">' + (totalSumSikyuPay - totalSumKojyoPay) + ' &nbsp;&nbsp;</li>' +
                    '<li class="w_70 c p_t3"></li>';


                // 새로운 합계 ul 요소를 컨테이너 요소에 추가
                tableContainer.appendChild(totalRow);
            },
            error: function() {
                alert('Error occurred while fetching data.');
            }
        });
    });

	
	// 테이블 행 클릭 시 이동
	$(document).on('click', '.ulPayTotalList', function() {
    var kizoku_ym = $(this).find('li:eq(0)').text(); // 클릭한 리스트의 첫 번째 열의 데이터 (年월)
    window.location.href = '/kyuyo/kyuyoDaichoYM?kizoku_ym=' + String(kizoku_ym);
	});

	// 삭제버튼 클릭 이벤트
	$(document).on('click', '.ulPayTotalList img', function(event) {
	    event.stopPropagation(); // 클릭 이벤트 전파 중지

	    var listItem = $(this).closest('ul');
	    var kizoku_ym = listItem.find('.w_105').text(); // 첫 번째 열의 데이터 (年월)

	    // 사용자에게 진짜 삭제할 것인지 물어보기
	    var confirmDelete = confirm("本当に削除しますか？");
	    
	    if (confirmDelete) {
	        // 삭제 요청을 서버에 전송
	        $.ajax({
	            type: 'POST', // 또는 DELETE, 적절한 요청 방식을 설정
	            url: '/kyuyo/deleteKyuyoData',
	            data: { kizoku_ym: kizoku_ym },
	            success: function(response) {
	                console.log('데이터 삭제 성공');
	                listItem.remove(); // 삭제 성공 시 리스트 아이템을 화면에서 제거
	            },
	            error: function() {
	                console.log('데이터 삭제 실패');
	            }
	        });
	    } else {
	        console.log('데이터 삭제 취소');
	        // 사용자가 취소한 경우에 대한 추가적인 처리를 할 수 있습니다.
	    }
	});


});


</script>

    
    
    
    
<%@include file="../includes/footer.jsp"%>