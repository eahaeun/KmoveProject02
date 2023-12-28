
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="org.zerock.domain.TaishokuVO"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>社員退職処理ページ</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
input:read-only {
	background-color: silver;
}
</style>

<!-- 부츠트랩과 ajax와 jquery  -->
</head>
<body>


	<table width="100%"
		class="table table-striped table-bordered table-hover"
		id="dataTables-example">

		<thead>
			<tr>
				<th>#番号</th>
				<th>社員番号</th>
				<th>社員名</th>
				<th>在職状態</th>
				<th>部署</th>
				<th>役職</th>
				<th>入社日</th>
				<th>退社日</th>
				<th>勤続年数</th>
				<th>退職金決算</th>
			</tr>
		</thead>
		<c:forEach items="${tk}" var="tk">
			<tr class="table-row" data-shain_no="${tk.shain_no}">
				<td><c:out value="${tk.num}" /></td>
				<td><c:out value="${tk.shain_no}" /></td>
				<td><c:out value="${tk.shain_nm}" /></td>
				<td><c:out value="${tk.zaishoku_st}" /></td>
				<td><c:out value="${tk.busho_nm}" /></td>
				<td><c:out value="${tk.yakushoku_nm}" /></td>

				<td><c:out value="${tk.nyusha_ymd}" /></td>
				<td><c:out value="${tk.taishoku_ymd}" /></td>
				<td><c:out value="${tk.yearDiff}" />年</td>

				<td><c:choose>
						<c:when test="${empty tk.taishoku_pay}">X</c:when>
						<c:when test="${tk.taishoku_pay gt 0}">O</c:when>
						<c:otherwise>X</c:otherwise>
					</c:choose></td>
				<td data-zaishoku_st="${tk.zaishoku_st}" style="display: none;"></td>
			</tr>


		</c:forEach>
	</table>






	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">退職者退職処理/キャンセル</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<form id="taishokuRegisterForm">
						<table>

							<tr>
								<th></th>
								<th><input type="hidden" id="shain_no" name="shain_no"
									value="${shainNo}"></th>
							</tr>
							<tr>
								<th>退職日</th>
								<th><input type="date" id="taishoku_ymd"
									name='taishoku_ymd' pattern="yyMMdd"></th>
							</tr>
							<tr>
								<th>退職理由</th>
								<th><input type='text' id="taishoku_jiyu"
									name='taishoku_jiyu'></th>
							</tr>
							<tr>
								<th>退職後の連絡先</th>
								<th><input type='text' id="taishoku_renraku"
									name='taishoku_renraku'></th>
							</tr>
						</table>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id='insert_btn'
						name='insert_btn' value="submit">保存</button>

				</div>
			</div>
		</div>
	</div>









	<div class="modal fade" id="anotherModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">退職者退職処理/キャンセル</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<form id="cancelTaishokuForm">
						<table>
							<tr>
								<th></th>
								<th><input type="hidden" id="shain_no" name="shain_no"
									value="${shainNo}"></th>
							</tr>
							<tr>
								<th>退職日</th>
								<th><input type="text" id="taishoku_ymd"
									name='taishoku_ymd' pattern="yyMMdd" value="${taishoku_ymd}"
									readonly="readonly"></th>
							</tr>
							<tr>
								<th>退職理由</th>
								<th><input type='text' id="taishoku_jiyu"
									name='taishoku_jiyu' value="${taishoku_jiyu}"
									readonly="readonly"></th>
							</tr>
							<tr>
								<th>退職後の連絡先</th>
								<th><input type='text' id="taishoku_renraku"
									name='taishoku_renraku' value="${taishoku_renraku}"
									readonly="readonly"></th>
						</table>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" id='cancel_btn' name='cancel_btn'
						class="btn btn-primary" value="submit">退社処理キャンセル</button>

				</div>
			</div>
		</div>
	</div>
















	<script>
		$(document).ready(function() {
			$(".table-row").click(function() {
				// 클릭한 행에서 데이터 가져오기
				var zaishoku_st = $(this).find("td:eq(3)").text(); // 상태에 해당하는 열의 위치
				var shain_no = $(this).data("shain_no");
				console.log("사원번호 :" + shain_no)
				// 모달에 데이터 전달

				if (zaishoku_st === "在職") {
					// 재직 상태일 때의 모달 열기 
					$("#exampleModal").modal("show");
					$("#shain_no").val(shain_no);
				} else {
					// 퇴직 상태일 때의 모달 열기
					getTaishokuInfo(shain_no, "anotherModal");
					// 모달 열기
				}

			});
			$("#insert_btn").click(function() {
				submitTaishokuForm("exampleModal");
			});

			// 두 번째 모달에서 저장 버튼 클릭 시
			$("#cancel_btn").click(function() {
				cancelTaishokuForm("anotherModal");
			});
		});

		function cancelTaishokuForm(modalId) {
			// 폼 데이터 가져오기
			var shain_no = $('#' + modalId + ' #shain_no').val();
			console.log("cancelTaishokuForm - shain_no: " + shain_no);
			$.ajax({

				type : 'POST',
				url : '/taishoku/taishokuCancel', // 실제 저장 처리를 하는 파일의 경로
				data : {
					shain_no : shain_no,
				},
				success : function(response) {
					// 저장 성공 시의 동작
					alert('退職キャンセルが完了しました。');
					$('#' + modalId).modal('hide'); // 모달 닫기
					location.reload();
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log("AJAX Error: " + textStatus, errorThrown);
				}
			});
		}

		function getTaishokuInfo(shain_no, modalId) {
			$.ajax({
				type : 'GET',
				url : '/taishoku/taishokuInfo',
				data : {
					shain_no : shain_no
				},
				dataType : 'json', // 데이터 형식을 JSON으로 지정
				success : function(data) {
					// JSON 데이터 처리
					var shain_no = data.shain_no;
					var taishoku_ymd = data.taishoku_ymd;
					var taishoku_jiyu = data.taishoku_jiyu;
					var taishoku_renraku = data.taishoku_renraku;

					console.log("Received data from server:", data);
					// 서버에서 받아온 데이터로 모달 내용 채우기
					$("#" + modalId + " #shain_no").val(data.shain_no);
					$("#" + modalId + " #taishoku_ymd").val(data.taishoku_ymd);
					$("#" + modalId + " #taishoku_jiyu")
							.val(data.taishoku_jiyu);
					$("#" + modalId + " #taishoku_renraku").val(
							data.taishoku_renraku);

					$("#anotherModal").modal("show");
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log("AJAX Error: " + textStatus, errorThrown);
				}
			});
		}

		function submitTaishokuForm(modalId) {
			// 폼 데이터 가져오기
			var shain_no = $('#' + modalId + ' #shain_no').val();
			var taishoku_ymd = $('#' + modalId + ' #taishoku_ymd').val();
			var taishoku_jiyu = $('#' + modalId + ' #taishoku_jiyu').val();
			var taishoku_renraku = $('#' + modalId + ' #taishoku_renraku')
					.val();

			$.ajax({
				type : 'POST',
				url : '/taishoku/taishokuOn', // 실제 저장 처리를 하는 파일의 경로
				data : {
					shain_no : shain_no,
					taishoku_ymd : taishoku_ymd,
					taishoku_jiyu : taishoku_jiyu,
					taishoku_renraku : taishoku_renraku
				},
				success : function(response) {
					// 저장 성공 시의 동작
					alert('退職処理が完了しました。.');
					$('#' + modalId).modal('hide'); // 모달 닫기
					location.reload();
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log("AJAX Error: " + textStatus, errorThrown);
				}
			});

		}
	</script>
</body>
</html>