<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>


<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Main Page</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<title>Insert title here</title>
</head>

<style>
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
	width: 70%;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}
</style>

<body>

	<!-- 퇴직급여계산할 사원선택 모달 불러오기. -->
	<div class="modal" id="addTaishokuShain">
		<div class='modal-content'>
			<h5 class="modal-title" id="exampleModalLabel">退職者退職処理/キャンセル</h5>

			<form id="SelectShain">
				<table>
					<thead>
						<tr>
							<th><input type='checkbox' name='selectShain'></th>
							<th>区分</th>
							<th>社員番号</th>
							<th>氏名</th>
							<th>部署</th>
							<th>職位</th>
							<th>状態</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${gsl}" var="shain">
							<tr class="table-row" data-shain_no="${shain.shain_no}">
								<td><input type="checkbox" name="selectedShain"></td>
								<td><c:out value="${shain.koyo_keitai}" /></td>
								<td><c:out value="${shain.shain_no}" /></td>
								<td><c:out value="${shain.shain_nm}" /></td>
								<td><c:out value="${shain.busho_nm}" /></td>
								<td><c:out value="${shain.yakushoku_nm}" /></td>
								<td><c:out value="${shain.zaishoku_st}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</form>
			<button type="button" class="btn btn-primary" id='insert_btn'
				name='insert_btn' value="submit">社員選択</button>
			<button type="button" class="btn btn-primary" id='cancel_btn'
				name='cancel_btn' value="cancel">選択せず</button>

		</div>
	</div>



	<!-- Bootstrap 그리드 시스템을 사용하기 위한 컨테이너 추가 -->
	<div class="container">
		<div style='width: 90px; float: right;'>

			<!-- 사원고르기 불러오는 모달 버튼 -->
			<button id="addTaishokuShainBtn" class="btn btn-primary"
				data-toggle="modal" data-target="#addTaishokuShain">新規追加</button>


		</div>
		<form>
		<table class="table" id="getShainList">

			<thead>
				<tr bgcolor="#A9E2F3">
					<th>支給日</th>
					<th>社員番号</th>
					<th>氏名</th>
					<th>職位</th>
					<th>部署</th>
					<th>算定期間</th>
					<th>勤続日数</th>
					<th>実支給額</th>
					<th>支払方法</th>
				</tr>
			</thead>
			<tbody>
			</tbody>

		</table>
			</form>
	</div>


 <div id="retirementInfo">
        <h2><span id="shain_nm"></span><input type='hidden' id="shain_no">님 퇴직계산</h2>
        
        <p>입사일: <input type="date" id="nyusha_ymd" ></p>
    <p>퇴직일: <input type="date" id="taishoku_ymd" ></p>
      <p>근속년수: <input type="text" id="yearsOfWork" readonly style="background-color: yellow;"></p>
    <p>근속일수: <input type="text" id="daysOfWork" readonly style="background-color: yellow;"></p>
    <p>제외일수: <input type="text" id="exceptOfWork" readonly style="background-color: yellow;"></p>
</div>
 <button type='button' id='loadPay'>웃음벨</button>

<!-- 급여내역 테이블 -->

<table id="kyuyoNaiyaku">
					<thead>
						<tr>
							<th>산정기간</th>
							<th>산정일수</th>
							<th>급여총액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th><input type="date" id="1Kikan1">~<input type="date" id="1Kikan2"></th>
							<th id="daysDiffLabel1"></th>
							<th><input type="text" id="Kyuyosougaku1"></th>
						</tr><tr>
							<th><input type="date" id="2Kikan1">~<input type="date" id="2Kikan2"></th>
							<th id="daysDiffLabel2"></th>
							<th><input type="text" id="Kyuyosougaku2"></th>
						</tr><tr>
							<th><input type="date" id="3Kikan1">~<input type="date" id="3Kikan2"></th>
							<th id="daysDiffLabel3"></th>
							<th><input type="text" id="Kyuyosougaku3"></th>
						</tr><tr>
							<th><input type="date" id="4Kikan1">~<input type="date" id="4Kikan2"></th>
							<th id="daysDiffLabel4"></th>
							<th><input type="text" id="Kyuyosougaku4"></th>
						</tr>
					</tbody>
					<tfoot>
					<tr>
							<th>총 합계</th>
							<th id="daysDiffLabelTotal"></th>
							<th id="total3MSikyuPay"></th>
						</tr>
					</tfoot>

				</table>


 <button type='button' id='keisan'>퇴직금계산</button>

<table class="table" id="payKeisan">
<tbody>
<tr bgcolor="red">
<th>3개월 총계</th>
<th>1일 평균임금</th>
<th>1일 통상임금</th>
<th>퇴직소득</th>
<th>퇴직일이 속한 년도</th>
<th>산출세액</th>
</tr>
<tr>
<th id ='one'></th>
<th id ='two'></th>
<th><input type='text' id="three"></th>
<th><input type='text' id="four"></th>
<th id='five'></th>
<th><input type='text' id='six'></th>
</tr>
<tr bgcolor="green">
<th>퇴직소득세</th>
<th>지방소득세</th>
<th>이연 퇴직소득세</th>
<th>이연 지방소득세</th>
<th>농어촌특별세</th>
<th>기타공제</th>
</tr>
<tr>
<th><input type='text' id='seven'></th>
<th><input type='text' id='eight'></th>
<th><input type='text' id='nine'></th>
<th><input type='text' id='ten'></th>
<th><input type='text' id="eleven"></th>
<th><input type='text' id="twelve"></th>
</tr>
</tbody>
</table>




<!-- 최종 -->
<table id=payTotal>
<tbody>
<tr bgcolor="black" style="color:white">
<th>과세대상 퇴직급여</th>
<th>차감원천징수세액</th>
<th>실수령액</th>
<th>지급방법</th>
<th>지급일</th>
</tr>
<tr align='right'>
<th id='total1'></th>
<th id='total2'></th>
<th id='total3'></th>
<th><input type='text' id=koza readonly style="background-color: yellow;"></th>
<th><input type='date' id=sikyu_ymd></th>
</tr>
</tbody>
</table>

 <button type='button' id='saveAll'>저장</button>



















<script>
	$(document).ready(function() {
/* 신규 추가를 불렀을때 사원을 고르는 모달을 불러오기위한 스크립트 */
$("#addTaishokuShainBtn").click(function() {

	// Ajax 호출
	$.ajax({
		type : "GET",
		url : "/taishoku/shainList", // 수정 필요: 실제 요청할 URL
		dataType : 'json',
		success : function(
				data) {
			// 서버에서 받은 데이터를 처리하여 표에 추가하는 로직
			renderShainTable(data);
			// 모달 열기
			$(
					"#addTaishokuShain")
					openTaishokuModal();
		},
		error : function(error) {
			console.error('Error fetching employee data:',error.responseText　|| error.statusText　|| error.message　|| error);
		}
	});

});

	// 받아온 데이터를 테이블에 추가하는 함수
	function renderShainTable(data) {
		// 수정 필요: 받아온 데이터를 이용하여 테이블에 행을 추가하는 로직
		var table = $("#addTaishokuShain table tbody");
		table.empty(); // 기존 내용 비우기
		// 예시: 간단한 반복문을 통해 테이블에 데이터 추가
		$.each(data,function(index, shain) {
			var row = "<tr><td><input type='checkbox' name='selectedShain'></td><td>"
					+ shain.koyo_keitai
					+ "</td><td>"
					+ shain.shain_no
					+ "</td><td>"
					+ shain.shain_nm
					+ "</td><td>"
					+ shain.busho_nm
					+ "</td><td>"
					+ shain.yakushoku_nm
					+ "</td><td>"
					+ shain.zaishoku_st
					+ "</td></tr>";
			table.append(row);
		});
	}
});
</script>

<script>
		$(document).ready(function() {
			// thead에 있는 체크박스 클릭 시
			$("#addTaishokuShain table thead input[type='checkbox']").click(function() {
				// tbody에 있는 모든 체크박스 상태를 변경
				$("#addTaishokuShain table tbody input[type='checkbox']").prop('checked',$(this).prop('checked'));
			});

			// 각각의 체크박스가 클릭될 때
			$("#addTaishokuShain table tbody input[type='checkbox']").click(function() {
				// 모든 체크박스가 체크되어 있는지 확인
				var allChecked = $("#addTaishokuShain table tbody input[type='checkbox']:checked").length === $("#addTaishokuShain table tbody input[type='checkbox']").length;

				// thead의 체크박스 상태 변경
				$("#addTaishokuShain table thead input[type='checkbox']").prop('checked',allChecked);
			});
		});

		
		
		
		
		/* 모달 체크박스관련  */
		$("#cancel_btn").click(function() {
			$("#addTaishokuShain")
			closeTaishokuModal();
		});

		$(document).ready(function() {
			// "社員選択" 버튼 클릭 시
			$("#insert_btn").click(function() {
				// 선택된 체크박스의 데이터를 가져와서 처리하는 로직
				var selectedShainNos = [];
				
		        $("#addTaishokuShain table tbody input[type='checkbox']:checked").each(function() {
		            var shainNo = $(this).closest('tr').find('td:eq(2)').text();
		            if (shainNo) { // null 또는 빈 문자열이 아닌 경우에만 추가
		                selectedShainNos.push(shainNo);
		            }
		        });
		       
				// Ajax 호출하여 사원번호로 데이터 가져오기
				$.ajax({
							type : "GET",
							url : "/taishoku/getShainData", // 수정 필요: 실제 요청할 URL
							data : {
								selectedShainNos : selectedShainNos.join(",") 
							},
							dataType : 'json',
							success : function(
									data) {
								// 서버에서 받은 데이터를 처리하여 표에 추가하는 로직
								renderShainData(data);
							},
							error : function(error) {
								console.error('Error fetching employee data:',
												error.responseText
														|| error.statusText
														|| error.message
														|| error);
							}
						});
									

				// 모달 닫기
				closeTaishokuModal();
			});//닫기 버튼 클릭하면 모달 닫힘
		});
		
		
		function openTaishokuModal() {
	         document.getElementById('addTaishokuShain').style.display = 'block';
	      }

	      function closeTaishokuModal() {
	         document.getElementById('addTaishokuShain').style.display = 'none';
	      }//모달 열고닫힘.
	      
	      
	  	function renderShainData(data) {
		
	  		 var tableBody = document.getElementById("getShainList").getElementsByTagName('tbody')[0];
	  		 data.forEach(function(shain) {
								var row = "<tr><td>0000-00-00</td><td>"
										+ shain.shain_no
										+ "</td><td>"
										+ shain.shain_nm
										+ "</td><td>"
										+ shain.yakushoku_nm
										+ "</td><td>"
										+ shain.busho_nm
										+ "</td><td></td><td></td><td></td><td></td></tr>";
										tableBody.innerHTML += row;
						        console.log(row);
							});
		}
	      
	      
	      
	      
	      
	      
	      
	      
	  	$(document).ready(function () {
	      //테이블에서 클릭하면 텍스트박스 채우는 로직
	    
	  	 $("#getShainList tbody").on("click", "tr", function () {
	         $(this).toggleClass("clicked");
	         //다른 사람을 누르면 다른거 전체 초기화
	             $("#payKeisan tbody input[type='text']").val('');
	             $("#payKeisan tbody input[type='date']").val('');
	             $("#payTotal tbody input[type='text']").val('');
	             $("#payTotal tbody input[type='date']").val('');
	             $("#kyuyoNaiyaku tbody input[type='text']").val('');
	             $("#kyuyoNaiyaku tbody input[type='date']").val('');
	             $("#one").text('');
	             $("#two").text('');
	             $("#five").text('');
	             $("#daysDiffLabelTotal").text('');
	             $("#total3MSikyuPay").text('');
	             $("#daysDiffLabel1").text('');
	             $("#daysDiffLabel2").text('');
	             $("#daysDiffLabel3").text('');
	             $("#daysDiffLabel4").text('');
	             $("#total1").text('');
	             $("#total2").text('');
	             $("#total3").text('');
	             
	             
	         // 클릭된 행의 사원번호 컬럼 값을 가져와서 데이터를 받아오는 로직
	         var shainNo = $(this).find("td:eq(1)").text();
	         // Ajax 호출하여 사원번호로 데이터 가져오기
	         $.ajax({
	             type: "GET",
	             url: "/taishoku/getShainDataByNo",
	             data: {
	                 shainNo: shainNo
	             },
	             dataType: 'json',
	             success: function (data) {
	                 // 받아온 데이터를 사용하여 retirementInfo 섹션에 채워넣는 로직
	               
	                var nyushaDate = new Date(data.nyusha_ymd);
                var taishokuDate = data.taishoku_ymd ? new Date(data.taishoku_ymd) : new Date(); // 퇴직일이 null이면 오늘 날짜로 설정

                // yearsOfWork계산 (퇴사일과 입사일의 년수 차이)
                var yearsOfWork = taishokuDate.getFullYear() - nyushaDate.getFullYear();

                // daysOfWork계산 (퇴사일과 입사일의 일수 차이)
                var millisecondsPerDay = 24 * 60 * 60 * 1000;
                var daysOfWork = Math.round((taishokuDate - nyushaDate) / millisecondsPerDay);

                $("#shain_nm").text(data.shain_nm);
                $("#shain_no").val(shainNo);
                console.log("사원번호" + $("#shain_no").val());
                $("#nyusha_ymd").val(data.nyusha_ymd);
                $("#taishoku_ymd").val(data.taishoku_ymd);
                $("#yearsOfWork").val(yearsOfWork);
                $("#daysOfWork").val(daysOfWork);
                $("#exceptOfWork").val(0); // exceptOfWork를 0으로 설정
	             },
	             error: function (error) {
	                 console.error('Error fetching employee data:', error.responseText || error.statusText || error.message || error);
	             }
	         });
	     });
	 });
	      
	      
	      
	       //급여목록을 불러오는 테이블
	  $(document).ready(function () {
    	$("#loadPay").click(function () {
    	var taishokuDateStr = $("#taishoku_ymd").val();
    	 if (!taishokuDateStr) {
    	        alert("퇴직일을 선택해주세요.");
    	        return;
    	    }
    	  var taishokuDateStr = $("#taishoku_ymd").val();
    	  var shainNo = $("#shain_no").val();
          var monthpay = 0;
          
    	 
    	 $("#kyuyoNaiyaku tbody text").empty();
        // 퇴직일 가져오기
         var taishokuDate = new Date(taishokuDateStr);
        var startDate = new Date(taishokuDate);
 
        startDate.setMonth(startDate.getMonth() - 3);
        
        console.log("1-1 맨처음날짜 : "+ startDate);
        console.log("4-2 마지막날짜 : "+ taishokuDate);
        
        
        for (var i = 1; i <= 4; i++) {//for문
        	var date1 = new Date(startDate);
        	var date2 = new Date(startDate);
        	
        	date1.setMonth(date1.getMonth() + i -1);
        	date2.setMonth(date2.getMonth() + i );
        	date1.setDate(1);
            date2.setDate(0); // 말일로 설정
            
            $("#"+ i +"Kikan1").val(formatDate(date1));
            $("#"+ i +"Kikan2").val(formatDate(date2));
       
            
            
         }//for문종료
       
         taishokuDate.setDate(taishokuDate.getDate() - 1);
          $("#1Kikan1").val(formatDate(startDate))//시작일은 무조건 0-1
         $("#4Kikan2").val(formatDate(taishokuDate));//퇴직일은 무조건 3-2로 가야하기때문에

         
         var daysDiff1 = Math.round((new Date($("#1Kikan2").val()) - new Date($("#1Kikan1").val())) / (1000 * 60 * 60 * 24)) + 1;
         var daysDiff2 = Math.round((new Date($("#2Kikan2").val()) - new Date($("#2Kikan1").val())) / (1000 * 60 * 60 * 24)) + 1;
         var daysDiff3 = Math.round((new Date($("#3Kikan2").val()) - new Date($("#3Kikan1").val())) / (1000 * 60 * 60 * 24)) + 1;
         var daysDiff4 = Math.round((new Date($("#4Kikan2").val()) - new Date($("#4Kikan1").val())) / (1000 * 60 * 60 * 24)) + 1;
         var daystotal = daysDiff1+daysDiff2+daysDiff3+daysDiff4;
	
         $("#daysDiffLabel1").text(daysDiff1);
         $("#daysDiffLabel2").text(daysDiff2);
         $("#daysDiffLabel3").text(daysDiff3);
         $("#daysDiffLabel4").text(daysDiff4);
         $("#daysDiffLabelTotal").text(daystotal);

         
         if (taishokuDate.getDate() === 1) {
             // 만약 taishokuDateStr의 일이 1일이면 4번칸 모두 공백으로 처리
             $("#4Kikan1").val('');
             $("#4Kikan2").val('');
             $("#daysDiffLabel4").text("");
         }
         
             $.ajax({
                 type: "GET",
                 url: "/taishoku/readSikyuWithShainNo",
                 data: {
                     shainNo: shainNo
                 },
                 dataType: "json",
                 success: function (data) {
                	 
                	    var monthpay = data.kihon_pay;
                	    
                	 
             for (var i = 1; i <= 4; i++) {
            	 var daysDiff = $("#daysDiffLabel" + i).text();
            	 var daysDiffNumber = parseInt(daysDiff);//int
            		 var endDate = $("#" + i + "Kikan2").val();
            		 var endDateNumber = new Date(endDate);
            		 endDateNumber.setMonth(endDateNumber.getMonth() + 1);
            		 endDateNumber.setDate(0);
            		var lastDate = endDateNumber.getDate();
            	 var kyuyosougaku = Math.round(monthpay * daysDiffNumber / lastDate);
            	 $("#Kyuyosougaku" + i).val(kyuyosougaku);
            	 
            		
          }          
             var total3MSikyuPay = parseInt($("#Kyuyosougaku1").val(), 10) +
             parseInt($("#Kyuyosougaku2").val(), 10) +
             parseInt($("#Kyuyosougaku3").val(), 10) +
             parseInt($("#Kyuyosougaku4").val(), 10);


             $("#total3MSikyuPay").text(total3MSikyuPay);
             console.log(total3MSikyuPay);	
       },
              error: function (error) {
                  console.error('Error fetching employee data:',error);

              }
   		 });
	  });
       
	       

	    function formatDate(date) {
	        var year = date.getFullYear();
	        var month = date.getMonth() + 1;
	        var day = date.getDate();
	        return year + "-" + (month < 10 ? "0" : "") + month + "-" + (day < 10 ? "0" : "") + day;
	    }
	});
	       
	       
	       
	  //퇴직금계산버튼
	  $(document).ready(function () {
	    $("#keisan").click(function () {
	        var kyuyoTotal = parseInt($("#total3MSikyuPay").text());
	        var daysDiffTotal = parseInt($("#daysDiffLabelTotal").text());
	        var taishokuDateStr = $("#taishoku_ymd").val();
	        var taishokuDate = new Date(taishokuDateStr);
	        var taishokuNendo = taishokuDate.getFullYear();
	        var totalPer1DayAvr = Math.round(kyuyoTotal / daysDiffTotal);
	        var taishokuShodoku = Math.round(totalPer1DayAvr * 30 * (parseInt($("#daysOfWork").val()) / 365));


        $.ajax({
            type: "GET",
            url: "/taishoku/getKoza",
            data: {
                shainNo: $("#shain_no").val()
            },
            dataType: "json",
            success: function (data) {
                var koza = data.koza_num;
                var ginko_nm = data.ginko_nm;
                $("#one, #total1").text(kyuyoTotal);
                $("#two").text(totalPer1DayAvr);
                $("#three, #six, #seven, #eight, #nine, #ten, #eleven, #twelve").val(0);
                $("#four, #total1, #total3").val(taishokuShodoku);
                $("#five").text(taishokuNendo);
                $("#total2").text(0);
                var total2 = parseInt($("#total2").val());
                var total3 = parseInt(taishokuShodoku) - parseInt(total2);
                $("#total3").text(kyuyoTotal);  // 수정된 부분
                
                $("#koza").val(ginko_nm +" " + koza);
            },
            error: function (xhr, status, errorThrown) {
                console.error('Error fetching employee data:', errorThrown || status || xhr.statusText);
            }
        });
    });
});
	      
	  
	  
//저장
$(document).ready(function () {
    $("#saveAll").click(function () {
    	   var shain_no = $("#shain_no").val();
    	   var sikyu_ymd = $("#sikyu_ymd").val();
           var taishoku_pay = $("#total3").text();
           if(!sikyu_ymd){
        	   alert("지급일을 선택해주세요.");
        	   return;
        	}
        	   
    	  $.ajax({
              type: "GET",
              url: "/taishoku/saveTaishoku",
              data: {
            	  shain_no: shain_no,
            	  sikyu_ymd: formatDate(sikyu_ymd),
            	  taishoku_pay: parseInt(taishoku_pay)
              },
              success: function (data) {
            	  alert('저장 성공');  // 알림창 띄우기
               
              },
                  error: function (xhr, status, errorThrown) {
                      console.error('Error saving taishoku data:', errorThrown || status || xhr.statusText);
                      alert('저장 실패');  // 실패 시 알림창 띄우기
                  }
              });
          });
      });
      
      function formatDate(inputDate) {
     	 var date = new Date(inputDate);
     	    var year = date.getFullYear();
     	    var month = (date.getMonth() + 1).toString().padStart(2, '0');
     	    var day = date.getDate().toString().padStart(2, '0');
     	    return year.toString().substr(2, 2) + month + day;
      }
    
	</script>




</body>
</html>