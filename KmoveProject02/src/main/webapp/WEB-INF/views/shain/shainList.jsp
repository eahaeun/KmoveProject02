<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<meta charset="UTF-8">
<title>社員情報</title>
</head>
<body>
	<h1>社員情報</h1>
	
	
	<button type="button" id="currentEmployeeButton">在職者</button>
	<button type="button" id="regularEmployeeButton">正社員</button>
	<button type="button" id="contractEmployeeButton">契約社員</button>
	<button type="button" id="temporaryEmployeeButton">臨時社員</button>
	<button type="button" id="dispatchedEmployeeButton">派遣社員</button>
	<button type="button" id="commissionedEmployeeButton">委託社員</button>
	<button type="button" id="partTimeEmployeeButton">パートタイム</button>
	<button type="button" id="formerEmployeeButton">退職者</button>
	<button type="button" id="allEmployeeButton">全体社員</button>



	<table id="shainTable" border="">
		<thead>
			<tr>
				<th><input type="checkbox" id="selectAllCheckbox"/></th>
				<th>雇用形態</th>
				<th>入社日</th>
				<th>社員番号</th>
				<th>名前</th>
				<th>部署名</th>
				<th>役職名</th>
				<th>生年月日</th>
				<th>連絡電話</th>
				<th>連絡メール</th>
				<th>退職日</th>
				<th>在職状態</th>
			</tr>
		</thead>
		<tbody id="shainTableBody">
			<c:forEach items="${shainList}" var="shain">
				<tr class="row-clickable">
					<td><input type="checkbox" class="shainCheckbox" value="${shain.shain_no}"/></td>
					<td>${shain.koyo_keitai}</td>
					<td>${shain.nyusha_ymd}</td>
					<td>${shain.shain_no}</td>
					<td>${shain.shain_nm}</td>
					<td>${shain.busho_nm}</td>
					<td>${shain.yakushoku_nm}</td>
					<td>${shain.birth}</td>
					<td>${shain.renraku_tel}</td>
					<td>${shain.renraku_email}</td>
					<td>${shain.taishoku_ymd}</td>
					<td>${shain.zaishoku_st}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<button type="button" id="deleteButton">削除</button>


	<script type="text/javascript">
		$(document).ready(
				function() {
					
					// 헤더 체크박스 클릭 시 모든 체크박스 선택 및 해제
					$("#selectAllCheckbox").click(function(){
					    $(".shainCheckbox").prop("checked", $(this).prop("checked"));
					});

					
					//삭제 버튼 클릭 처리
					$("#deleteButton").click(function(){
						console.log("delete button clicked!");
						
						// 체크된 체크박스를 반복하면서 shain_no를 배열에 추가
						var selectedShains = [];
				        $('.shainCheckbox:checked').each(function() {
				            selectedShains.push($(this).val());
				        });
						
						console.log(selectedShains);
						
						// 선택된 체크박스가 하나 이상인지 확인합니다.
				        if (selectedShains.length > 0) {
				        	$.ajax({
				                type: 'POST',
				                url: '/shain/shainDelete',
				                contentType: 'application/json',
				                data: JSON.stringify(selectedShains),
				                success: function(response) {
				                    // 서버로부터의 응답 처리
				                    console.log(response);
				                    alert('削除に成功しました。');
				                    location.reload();
				                },
				                error: function(error) {
				                    // 오류 처리
				                    console.error(error);
				                }
				            });
				        } else {
				            alert('削除するデータを選択してください。');
				        }
				});
					
					
					
					
					
					
					
					
					
					// 수정으로 이동
					$(document).on("click", ".row-clickable", function(event){
						if ($(event.target).is("input:checkbox")) {
					          return;
					       }
					    var shain_no = $(this).find("td:eq(1)").text();
					    window.location.href = "/shain/shainModify?shain_no=" + shain_no;
					});

					
					
					//전체사원 클릭
					document.getElementById("allEmployeeButton").addEventListener("click", function() {
								window.location.href = "/shain/shainList";
					});
					
					
					
					
					
					// 버튼별 ajax 요청()
					$("#regularEmployeeButton").click(function() {
						console.log("正社員");
						$.ajax({
							type : "POST",
							url : "/shain/shainList",
							data : JSON.stringify({
								koyo_keitai : "正社員"
							}),
							contentType : "application/json",
							dataType : "json",
							success : function(data) {
								updateTable(data);
								console.log("ajax success");
							},
							error : function(xhr, status, error) {
								console.log("Error:", xhr.responseText);
								console.log("Status:", status);
								console.log("Error thrown:", error);
							}
						});
					});

					$("#contractEmployeeButton").click(function() {
						$.ajax({
							type : "POST",
							url : "/shain/shainList",
							data : JSON.stringify({
								koyo_keitai : "契約社員"
							}),
							contentType : "application/json",
							dataType : "json",
							success : function(data) {
								updateTable(data); //요청 성공 시 실행 할 메서드
								console.log("ajax success")
							},
							error : function(xhr, status, error) {
								console.log("Error:", xhr.responseText);
								console.log("Status:", status);
								console.log("Error thrown:", error);
							}
						});
					});
					
					$("#temporaryEmployeeButton").click(function() {
					    $.ajax({
					        type : "POST",
					        url : "/shain/shainList",
					        data : JSON.stringify({
					            koyo_keitai : "臨時社員"
					        }),
					        contentType : "application/json",
					        dataType : "json",
					        success : function(data) {
					            updateTable(data); //요청 성공 시 실행 할 메서드
					            console.log("ajax success")
					        },
					        error : function(xhr, status, error) {
					            console.log("Error:", xhr.responseText);
					            console.log("Status:", status);
					            console.log("Error thrown:", error);
					        }
					    });
					});

					$("#dispatchedEmployeeButton").click(function() {
					    $.ajax({
					        type : "POST",
					        url : "/shain/shainList",
					        data : JSON.stringify({
					            koyo_keitai : "派遣社員"
					        }),
					        contentType : "application/json",
					        dataType : "json",
					        success : function(data) {
					            updateTable(data); //요청 성공 시 실행 할 메서드
					            console.log("ajax success")
					        },
					        error : function(xhr, status, error) {
					            console.log("Error:", xhr.responseText);
					            console.log("Status:", status);
					            console.log("Error thrown:", error);
					        }
					    });
					});

					$("#commissionedEmployeeButton").click(function() {
					    $.ajax({
					        type : "POST",
					        url : "/shain/shainList",
					        data : JSON.stringify({
					            koyo_keitai : "委託社員"
					        }),
					        contentType : "application/json",
					        dataType : "json",
					        success : function(data) {
					            updateTable(data); //요청 성공 시 실행 할 메서드
					            console.log("ajax success")
					        },
					        error : function(xhr, status, error) {
					            console.log("Error:", xhr.responseText);
					            console.log("Status:", status);
					            console.log("Error thrown:", error);
					        }
					    });
					});

					$("#partTimeEmployeeButton").click(function() {
					    $.ajax({
					        type : "POST",
					        url : "/shain/shainList",
					        data : JSON.stringify({
					            koyo_keitai : "パートタイム"
					        }),
					        contentType : "application/json",
					        dataType : "json",
					        success : function(data) {
					            updateTable(data); //요청 성공 시 실행 할 메서드
					            console.log("ajax success")
					        },
					        error : function(xhr, status, error) {
					            console.log("Error:", xhr.responseText);
					            console.log("Status:", status);
					            console.log("Error thrown:", error);
					        }
					    });
					});
					
					
					
					// 버튼별 ajax(재직/퇴직)
					$("#currentEmployeeButton").click(function() {
					    $.ajax({
					        type : "POST",
					        url : "/shain/shainList",
					        data : JSON.stringify({
					            zaishoku_st : "在職"
					        }),
					        contentType : "application/json",
					        dataType : "json",
					        success : function(data) {
					            updateTable(data); //요청 성공 시 실행 할 메서드
					            console.log("ajax success")
					        },
					        error : function(xhr, status, error) {
					            console.log("Error:", xhr.responseText);
					            console.log("Status:", status);
					            console.log("Error thrown:", error);
					        }
					    });
					});
					
					$("#formerEmployeeButton").click(function() {
					    $.ajax({
					        type : "POST",
					        url : "/shain/shainList",
					        data : JSON.stringify({
					        	zaishoku_st : "退職"
					        }),
					        contentType : "application/json",
					        dataType : "json",
					        success : function(data) {
					            updateTable(data); //요청 성공 시 실행 할 메서드
					            console.log("ajax success")
					        },
					        error : function(xhr, status, error) {
					            console.log("Error:", xhr.responseText);
					            console.log("Status:", status);
					            console.log("Error thrown:", error);
					        }
					    });
					});
					
					
					
					// 테이블 갱신 함수
					function updateTable(shainList) {
					    // 기존 테이블 내용 삭제
					    var tableBody = document.getElementById("shainTableBody");
					    
					    // 여기서 수정이 있어야 합니다. 기존의 while 루프 대신에 더 간단한 방법을 사용합니다.
					    tableBody.innerHTML = "";

					    console.log("original table removed...");

					    // 받아온 shainList로 테이블 새로 생성
					    shainList.forEach(function (shain) {
					        var newRow = tableBody.insertRow();

					        // 각 열 추가
					        var cell1 = newRow.insertCell(0);
					        cell1.innerHTML = '<input type="checkbox" class="shainCheckbox" value="' + shain.shain_no + '" />';

					        var cell2 = newRow.insertCell(1);
					        cell2.innerHTML = shain.koyo_keitai;

					        var cell3 = newRow.insertCell(2);
					        cell3.innerHTML = shain.nyusha_ymd;

					        var cell4 = newRow.insertCell(3);
					        cell4.innerHTML = shain.shain_no;

					        var cell5 = newRow.insertCell(4);
					        cell5.innerHTML = shain.shain_nm;

					        var cell6 = newRow.insertCell(5);
					        cell6.innerHTML = shain.busho_nm;

					        var cell7 = newRow.insertCell(6);
					        cell7.innerHTML = shain.yakushoku_nm;

					        var cell8 = newRow.insertCell(7);
					        cell8.innerHTML = shain.birth;

					        var cell9 = newRow.insertCell(8);
					        cell9.innerHTML = shain.renraku_tel;

					        var cell10 = newRow.insertCell(9);
					        cell10.innerHTML = shain.renraku_email;

					        var cell11 = newRow.insertCell(10);
					        cell11.innerHTML = shain.taishoku_ymd;

					        var cell12 = newRow.insertCell(11);
					        cell12.innerHTML = shain.zaishoku_st;

					        $(newRow).addClass("row-clickable");
					    });
					}



			});
	</script>

</body>
</html>

