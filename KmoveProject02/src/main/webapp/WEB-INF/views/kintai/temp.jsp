<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>勤怠履歴</title>
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
   width: 27%;
   box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
      rgba(0, 0, 0, 0.19);
}
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>

function resetForm() {
    document.getElementById("kintai").reset();
    location.reload(); // 페이지 새로고침
}


$(document).ready(function () {
	// 오늘 날짜 설정
	document.getElementById('nyuryoku_ymd').valueAsDate = new Date();
	
	$("button[name='3']").hide();

    // 콤보박스 변경
    console.log("Document ready!");

    $("select[name='kintai_km']").change(function () {
        console.log("Combo box changed!");
		
        var selectedTani = $(this).find("option:selected").data("tani");
        console.log("Selected Tani: " + selectedTani);

        var kintaiDaysLabel = $("#kintaiDaysLabel");
        var kintaiDaysELabel = $("#kintaiDaysELabel");

        if (selectedTani === 'D') {
            console.log("Setting label to '勤怠日数'");
            kintaiDaysLabel.text("勤怠日数");
            kintaiDaysELabel.text("日");
            $("#kintaiDays").val("");
        } else if (selectedTani === 'H') {
            console.log("Setting label to '勤怠時間'");
            kintaiDaysLabel.text("勤怠時間");
            kintaiDaysELabel.text("時間");
            $("#kintaiDays").val(""); // 빈 값을 설정하여 초기화
        } else {
            console.log("Setting label to '勤怠'");
            kintaiDaysLabel.text("勤怠");
            kintaiDaysELabel.text("");
            $("#kintaiDays").val("");
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
    $("#kintai").submit(function(event) {
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
        
        
     // 입력란이 비어있는지 확인
        var isEmpty = false;

        // 각 입력란의 값을 확인
        $("form input").each(function() {
            if ($(this).val().trim() === "") {
                isEmpty = true;
                return false; // 반복문 중단
            }
        });

        // 공란이 있으면 경고창 표시
        if (isEmpty) {
            alert("すべての項目を記入してください。");
            return false; // 폼 제출 중지
        }
        
        
        console.log("selectedShain : " + selectedShainValues);

        // 선택된 직원들에 대해 반복문을 통해 각각의 shain_no 값을 formData에 추가하고 Ajax 요청 보내기
        for (var i = 0; i < selectedShainValues.length; i++) {
            // 현재 선택된 직원의 shain_no 값을 formData에 추가
            formData.set('shain_no', selectedShainValues[i]);
            
            console.log([formData.entries()]);

            // Ajax를 통해 서버로 데이터 전송
            $.ajax({
                type: "POST",
                url: "/kintaihistory/list", // 서버의 주소 또는 서블릿 매핑 주소
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    // 서버로부터의 응답을 처리
                    console.log(response);
                    alert("データが正常に登録されました。"); // 등록 성공 시 알림창 표시
                    location.reload(); // 페이지 새로고침 또는 초기 페이지로 이동
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
/* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! */
	$(document).on('click', 'button[name="asmr"]', function () {
    	var shain_no = $(this).closest("tr").find("td:eq(2)").text();
    	
    	$(this).closest("tr").find('input[name="selectedShain"]').prop("checked", true);
    	
    	sendShainNoToServer(shain_no);
    	console.log(shain_no);
    });
    
    function openkyukaModal() {
        document.getElementById('kyukaModal').style.display = 'block';
    }

    $(document).on('click', '#openModalBtn', function() {
        openkyukaModal();
    });
    
    function closekyukaModal() {
        document.getElementById('kyukaModal').style.display = 'none';
    }
    
    $('#kyukaModal').on('shown.bs.modal', function () {
        updateTable(response);
    });
    
    function updateTable(data) {
    	console.log("받아온 데이터:", data);
        // 테이블의 tbody를 가져옴
        var tbody = document.getElementById("modalBody");

        // 기존의 테이블 내용 제거
        tbody.innerHTML = "";

        // 받아온 데이터를 이용하여 새로운 행 추가
        for (var i = 0; i < data.length; i++) {
            var row = tbody.insertRow(i);

            // 각 셀에 데이터 추가
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            var cell5 = row.insertCell(4);
            var cell6 = row.insertCell(5);
            var cell7 = row.insertCell(6);
            var cell8 = row.insertCell(7);

            cell1.innerHTML = data[i].nyuryoku_ymd;
            cell2.innerHTML = data[i].kintai_km;
            cell3.innerHTML = data[i].kaishi_ymd;
            cell4.innerHTML = data[i].shuryo_ymd;
            cell5.innerHTML = data[i].kintai_hour;
            cell6.innerHTML = data[i].kintai_pay;
            
            var updateButton = document.createElement("button");
            updateButton.type = "button";
            updateButton.name = "updateButton";
            updateButton.innerHTML = "수정";
            updateButton.onclick = function() {
                // 수정 동작 구현
                // 여기에 수정 버튼이 클릭되었을 때의 동작을 추가하세요.
                console.log("수정 버튼이 클릭되었습니다.");
            };
            cell7.appendChild(updateButton);
            
            
            var deleteButton = document.createElement("button");
            deleteButton.type = "button";
            deleteButton.name = "deleteButton";
            deleteButton.innerHTML = "삭제";
            deleteButton.onclick = function(index) {
                return function() {
                    var kintai_no = data[index].kintai_no;
                    sendDeleteRequest(kintai_no);
                };
            }(i);
            cell8.appendChild(deleteButton);
        }
    }

    function sendShainNoToServer(shain_no) {

        $.ajax({
            type: "POST",
            url: "/kintaihistory/list",
            data: { shain_no: shain_no },
            dataType: "json",
            success: function(response) {
                console.log("서버 응답:", response);
                updateTable(response);
                openkyukaModal();
            },
            error: function(error) {

                console.error("서버 통신 에러:", error);
            }
        });
    }
    
    function sendDeleteRequest(kintai_no) {

        $.ajax({
            type: "POST",
            url: "/kintaihistory/list",
            data: { kintai_no: kintai_no },
            dataType: "json",
            success: function(response) {
                console.log("서버 응답:", response);
                closekyukaModal();
            },
            error: function(error) {
                console.error("서버 통신 에러:", error);
                closekyukaModal();
            }
        });
    }
    
    function sendUpdateRequest(kintai_no) {

        $.ajax({
            type: "POST",
            url: "/kintaihistory/list",
            data: { kintai_no: kintai_no },
            dataType: "json",
            success: function(response) {
                console.log("서버 응답:", response);

            },
            error: function(error) {
                console.error("서버 통신 에러:", error);

            }
        });
    }
    
    $(document).on('click', 'button[name="updateButton"]', function () {

        var row = $(this).closest("tr");
        var kintai_km = row.find("td:eq(1)").text();
        var kaishi_ymd = row.find("td:eq(2)").text();
        var shuryo_ymd = row.find("td:eq(3)").text();
        var kintai_hour = row.find("td:eq(4)").text();
        var kintai_pay = row.find("td:eq(5)").text();
        
        $("button[name='1']").hide();
        $("button[name='2']").hide();

        $("button[name='3']").show();
        $("button[name='4']").show();

        $("select[name='kintai_km']").val(kintai_km);
        $("input[name='kaishi_ymd']").val(kaishi_ymd);
        $("input[name='shuryo_ymd']").val(shuryo_ymd);
        $("input[name='kintai_hour']").val(kintai_hour);
        $("input[name='kintai_pay']").val(kintai_pay);
        
        $('button[name="deleteButton"]', row).click();
        
        closekyukaModal();

    });
    

    window.onclick = function(event) {
        var modal = document.getElementById('kyukaModal');
        if (event.target === modal) {
            modal.style.display = "none";
        }
    }
 
});
</script>


</head>
<body>
	<h1>勤怠記録·管理</h1>
	<form id="kintai">
		<table border="1" width="50%">
			<thead>
				<tr>
					<th>チェック</th>
					<th>区分</th>
					<th>社員番号</th>
					<th>社員名</th>
					<th>部署</th>
					<th>職位</th>
					<th>근태기록</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="shain">
					<tr>
						<td><input type="checkbox" name="selectedShain"
							value="${shain.shain_no}"></td>
						<td>${shain.koyo_keitai}</td>
						<td>${shain.shain_no}</td>
						<td>${shain.shain_nm}</td>
						<td>${shain.busho_nm}</td>
						<td>${shain.yakushoku_nm}</td>
						<td><button type="button" name="asmr">관리</button></td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
		<table>
			<tr>
				<td>入力日</td>
				<td><input type="date" name="nyuryoku_ymd" id="nyuryoku_ymd" readonly></td>
			</tr>
			<tr>
				<td>勤怠項目</td>
				<td><select name="kintai_km">
				<option></option>
						<c:forEach var="kintai" items="${save}">
							<option value="${kintai.kintai_km}"
								data-tani="${kintai.kintai_tani}">${kintai.kintai_km}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td>期間</td>
				<td><input type="date" name="kaishi_ymd"> ~ <br><input
					type="date" name="shuryo_ymd"></td>
			</tr>
			<tr>
				<td id="kintaiDaysLabel">勤怠</td>
				<td><input type="text" name=kintai_hour id="kintaiDays"></td>
				<td id="kintaiDaysELabel"></td>
			</tr>
			<tr>
				<td>手当て</td>
				<td><input type="text" name="kintai_pay"></td>
			</tr>
		</table>
		<button type="submit" class="btn btn-default" name="1">貯蔵</button>
		<button type="reset" class="btn btn-default" name="2" onclick="resetForm()">内容消去</button>
		<button type="submit" class="btn btn-default" name="3">황우진</button>
	</form>
	
	
	<div id="kyukaModal" class="modal">
		<div class="modal-content">		
			<table border="1" width="100%">
    	        <thead>
        	        <tr>
            	        <th>입력날자</th>
                    	<th>근태항목</th>
                    	<th>시작</th>
                    	<th>종료</th>
                    	<th>일수</th>
                    	<th>금액</th>
                    	<th>수정</th>
                    	<th>삭제</th>
	                </tr>
    	        </thead>
        	    <tbody id="modalBody">
             	</tbody>
     	   </table>
		</div>
	</div>
	
	
</body>
</html>



<!-- 모달 -->
<div id="kyukaModal" class="modal">
		<div class="modal-content" style="width:52.8%;">
		<div id="pop01" style="width:790px;">
			  <ul class="tit">
			    <li>社員別勤怠記録</li>
			  </ul>
			  <ul class="part p_t10">
			    <div class="w_720 height_27 p_l15 p_t10 p_b10">
			      <li class="bold font12 ">
			        <span class="c_999">•氏名 :</span> 山田太郎 (S0001)
			        &nbsp;&nbsp;&nbsp;
			        <span class="c_999"> •部署 :</span> 営業部        &nbsp;&nbsp;&nbsp;
			        <span class="c_999">•役職 :</span> 主任        <span name="spnEmplIndxCode" id="spnEmplIndxCode" class="disHide">1166491^031</span>
			        
			        <span name="spnChkBoxValue" id="spnChkBoxValue" class="disHide">1166491</span>
			          <div class="f_right">
			            <select name="frmDlsvYYYY" id="frmDlsvYYYY" style="width:80px;">
			              <option value="">選択</option>
							<option value="2024" selected="">2024 年</option>
			            </select>
			          </div>
			        </li>
			      </div>
			      
			      <div class="pop_table w_720">
			        <p class="caption"></p>
			        <ul>
			          <li id="nyuryoku_ymd" class="w_85  tit"><strong>入力日</strong></li>
			          <li id="kintai_km" class="w_85  tit"><strong>勤怠項目</strong></li>
			          <li id="kintai_day" class="w_190  tit"><strong>勤怠期間</strong></li>
			          <li id="kintai_hour" class="w_60  tit"><strong>勤怠日数</strong></li>
			          <li id="kintai_pay" class="w_85  tit"><strong>金額</strong></li>
			          <li class="w_106  tit"><strong>備考</strong></li>
			          <li class="w_100  tit"><strong>修正・削除</strong></li>
			          </ul>
			          </div>
			          
			          <div class="holiday">
			            <div id="disContentList" class="disContentList pop_table" style="width: 720px;">
			            
			                <ul id="ulDL" class="clspass" title="">
			                  <li class="w_85  c">2024-01-01</li>
			                  <li class="w_85  c" title="011">有給休暇</li>
			                  <li class="w_190  c">2024-01-01 ~ 2024-01-02</li>
			                  <li class="w_60  c">2</li>
			                  <li class="w_85  c bold "></li>
			                  <li class="w_106  c "></li>
			                  <li class="w_100  c ">
			                  	<span id="btnDlgnSaveUpd" class="anchor">
			                  		<img src="../resources/img/btn_s_modify.png" width="43px" height="19px">
			                  	</span>
			                  	<span id="btnDlgnSaveDel" class="anchor">
			                  		<img src="../resources/img/btn_s_delete.png" width="43px" height="19px" class="p_l5 ">
			                  	</span>
			                  </li>
			                </ul>
			                
			  			</div>
			          </div><!-- end holiday -->
			
			    </ul>
			
			    <ul>
			    <li>.</li>
			    </ul>
			    
			</div>
		</div>
	</div>
			<option value="正社員" ${'正社員' eq shain.koyo_keitai ? 'selected' : ''}>正社員</option>
			<option value="契約社員" ${'契約社員' eq shain.koyo_keitai ? 'selected' : ''}>契約社員</option>
			<option value="臨時社員" ${'臨時社員' eq shain.koyo_keitai ? 'selected' : ''}>臨時社員</option>
			<option value="派遣社員" ${'派遣社員' eq shain.koyo_keitai ? 'selected' : ''}>派遣社員</option>
			<option value="委託社員" ${'委託社員' eq shain.koyo_keitai ? 'selected' : ''}>委託社員</option>
			<option value="パートタイム" ${'パートタイム' eq shain.koyo_keitai ? 'selected' : ''}>パートタイム</option>


<c:forEach var="kintai" items="${save}">
	<option value="${kintai.kintai_km}" ${kintai.kintai_km eq selectedKintai.kintai_km ? 'selected' : ''} data-tani="${kintai.kintai_tani}">${kintai.kintai_km}</option>
</c:forEach>