<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>休暇/勤怠設定</title>
<style>
table {
	width: 50%;
	border-collapse: collapse;
	margin: 20px 0;
	font-size: 16px;
}

th, td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #f5f5f5;
}

input[type="text"] {
	width: 50%;
	padding: 8px;
	box-sizing: border-box;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


</head>
<body>
	<h2>休暇/勤怠設定</h2>
	<div class="container">
		<div class="form-container">
			<h3>休暇項目の設定</h3>

			<!-- 휴가 리스트와 새로운 휴가 항목 입력 폼 -->
			<form action="/setting/kyukaCreate" method="post">
				<table>
					<thead>
						<tr>
							<th>休暇項目</th>
							<th>開始日</th>
							<th>終了日</th>
							<th>使用の有無</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${kyukaList}" var="kyuka">
							<tr class="kyuka-row" data-kyuka-km="${kyuka.kyuka_km}">
								<td><c:out value="${kyuka.kyuka_km}" /></td>
								<td><c:out value="${kyuka.kaishi_ymd}" /></td>
								<td><c:out value="${kyuka.shuryo_ymd}" /></td>
								<td><c:out value="${kyuka.kyuka_active }" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<table>
					<tbody id="kyukaTableBody">
						<tr>
							<th>休暇項目</th>
							<td><input type="text" id="kyuka_km" name="kyuka_km"
								value="" /></td>
						</tr>
						<tr>
							<th>開始日</th>
							<td><input type="date" id="kaishi_ymd" name="kaishi_ymd"
								value="" /></td>
						</tr>
						<tr>
							<th>終了日</th>
							<td><input type="date" id="shuryo_ymd" name="shuryo_ymd"
								value="" /></td>
						</tr>
						<tr>
							<th>使用の有無</th>
							<td><input type="radio" id="kyuka_active_O"
								name="kyuka_active" value="O" />使用 <input type="radio"
								id="kyuka_active_X" name="kyuka_active" value="X" />使用しない</td>
						</tr>

					</tbody>
				</table>
				<!-- 저장, 취소 버튼 -->
				<div class="button-container">
					<button type="submit">追加</button>
					<button type="button" id="kyukaupdateButton">修整</button>
					<button type="button" id="kyukadeleteButton">削除</button>
					<button type="button" onclick="resetForm()">内容消去</button>
				</div>
			</form>
			<!-- "근태 항목 설정" 섹션 추가 -->
			<h3>勤怠項目設定</h3>
			<form action="/setting/kintaiCreate" method="post">

				<!-- 근태 항목 목록 -->
				<table>
					<thead>
						<tr>
							<th>勤怠項目</th>
							<th>勤怠単位</th>
							<th>勤怠グループ</th>
							<th>使用の有無</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${kintaiList}" var="kintai">
							<tr class="kintai-row" data-kintai-km="${kintai.kintai_km}">
								<td><c:out value="${kintai.kintai_km}" /></td>
								<td><c:out value="${kintai.kintai_tani}" /></td>
								<td><c:out value="${kintai.kintai_group}" /></td>
								<td><c:out value="${kintai.kintai_active }" /></td>

							</tr>
						</c:forEach>

					</tbody>
				</table>

				<table>
					<tbody id="kintaiTableBody">
						<tr>
							<th>勤怠項目</th>
							<td><input type="text" id="kintai_km" name="kintai_km"
								value="" /></td>
						</tr>
						<tr>
							<th>勤怠単位</th>
							<td><input type="text" id="kintai_tani" name="kintai_tani"
								value="" /></td>
						</tr>
						<tr>
							<th>勤怠グループ</th>
							<td><input type="text" id="kintai_group" name="kintai_group"
								value="" /></td>
						</tr>
						<tr>
							<th>使用の有無</th>
							<td><input type="radio" id="kintai_active_O"
								name="kintai_active" value="O" />使用 <input type="radio"
								id="kintai_active_X" name="kintai_active" value="X" />使用しない</td>
						</tr>

					</tbody>
				</table>
				<!-- 저장, 취소 버튼 -->
				<div class="button-container">
					<button type="submit">追加</button>
					<button type="button" id="kintaiupdateButton">修整</button>
					<button type="button" id="kintaideleteButton">削除</button>
					<button type="button" onclick="resetForm2()">内容消去</button>
				</div>
			</form>
			<script>
				// 폼 초기화 함수
				function resetForm() {
					document.forms[0].reset(); // 인덱스 0은 첫 번째 폼입니다.
				}

				function resetForm2() {
					document.forms[1].reset(); // 인덱스 0은 첫 번째 폼입니다.
				}
			</script>

			<script>
				// 각 행에 대한 클릭 이벤트 핸들러
				var target_km = "";

				$('.kyuka-row').click(
						function() {
							// 선택한 행의 kyuka_km 값을 가져옴
							var kyuka_km = $(this).data('kyuka-km');
							target_km = kyuka_km;

							// AJAX 요청
							$.ajax({
								type : 'POST', // 또는 'GET' 등 요청 방식 선택
								url : '/setting/kyukaRead', // 컨트롤러의 URL
								data : {
									kyuka_km : kyuka_km
								},
								dataType : 'json',
								success : function(response) {
									// 성공적으로 응답을 받았을 때 수행할 동작
									console.log(response.kyuka_km,
											response.kaishi_ymd,
											response.shuryo_ymd,
											response.kyuka_active);

									$('#kyuka_km').val(response.kyuka_km);
									$('#kaishi_ymd').val(response.kaishi_ymd);
									$('#shuryo_ymd').val(response.shuryo_ymd);
									// 라디오 버튼 선택
									$(
											'input[name=kyuka_active][value='
													+ response.kyuka_active
													+ ']')
											.prop('checked', true);
								},
								error : function(error) {
									// 에러가 발생했을 때 수행할 동작
									console.error(error);
								}
							});
						});

				// 휴가설정 "수정" 버튼 클릭 이벤트 핸들러
				$('#kyukaupdateButton').click(
						function() {
							// 입력된 값을 가져오기
							var kyuka_km = $('#kyuka_km').val();
							var kaishi_ymd = $('#kaishi_ymd').val();
							var shuryo_ymd = $('#shuryo_ymd').val();
							var kyuka_active = $(
									'input[name=kyuka_active]:checked').val(); // 수정된 부분

							console.log("modify button clicked!");

							// AJAX 요청
							$.ajax({
								type : 'POST',
								url : '/setting/kyukaUpdate',
								data : {
									kyuka_km : kyuka_km,
									kaishi_ymd : kaishi_ymd,
									shuryo_ymd : shuryo_ymd,
									kyuka_active : kyuka_active,
									target_km : target_km
								},
								success : function(response) {
									// 성공적으로 응답을 받았을 때 수행할 동작
									console.log(response);
									location.reload();

									// 추가적인 동작이 필요하다면 여기에 작성
								},
								error : function(error) {
									// 에러가 발생했을 때 수행할 동작
									console.error(error);
								}
							});
						});

				$('#kyukadeleteButton').click(function() {
					// 확인 다이얼로그 표시
					if (confirm("정말로 삭제하시겠습니까?")) {
						// 입력된 값을 가져오기
						var kyuka_km = $('#kyuka_km').val();

						console.log("delete button clicked!");

						// AJAX 요청
						$.ajax({
							type : 'POST',
							url : '/setting/kyukaDelete',
							data : {
								kyuka_km : kyuka_km
							},
							success : function(response) {
								// 성공적으로 응답을 받았을 때 수행할 동작
								console.log(response);
								location.reload(); // 또는 필요한 동작 수행

								// 추가적인 동작이 필요하다면 여기에 작성
							},
							error : function(error) {
								// 에러가 발생했을 때 수행할 동작
								console.error(error);
							}
						});
					}
				});

				// 각 행에 대한 클릭 이벤트 핸들러
				var target_kintai_km = "";

				$('.kintai-row')
						.click(
								function() {
									// 선택한 행의 kintai_km 값을 가져옴
									var kintai_km = $(this).data('kintai-km');
									target_kintai_km = kintai_km;
									console.log("target : " + target_kintai_km);

									// AJAX 요청
									$
											.ajax({
												type : 'POST',
												url : '/setting/kintaiRead',
												data : {
													kintai_km : kintai_km
												},
												dataType : 'json',
												success : function(response) {
													// 성공적으로 응답을 받았을 때 수행할 동작
													console
															.log(
																	response.kintai_km,
																	response.kintai_tani,
																	response.kintai_group,
																	response.kintai_active);

													// 근태 항목과 관련된 필드의 ID를 수정

													$('#kintai_km').val(
															response.kintai_km);
													$('#kintai_tani')
															.val(
																	response.kintai_tani);
													$('#kintai_group')
															.val(
																	response.kintai_group);
													$(
															'input[name=kintai_active][value='
																	+ response.kintai_active
																	+ ']')
															.prop('checked',
																	true);

												},
												error : function(error) {
													// 에러가 발생했을 때 수행할 동작
													console.error(error);
												}
											});
								});

				// 근태 항목 설정 "수정" 버튼 클릭 이벤트 핸들러
				$('#kintaiupdateButton').click(
						function() {
							// 입력된 값을 가져오기
							var kintai_km = $('#kintai_km').val();
							var kintai_tani = $('#kintai_tani').val();
							var kintai_group = $('#kintai_group').val();
							var kintai_active = $(
									'input[name=kintai_active]:checked').val(); // 수정된 부분

							console.log("modify button clicked!" + kintai_km
									+ kintai_tani + kintai_group
									+ kintai_active + target_kintai_km);

							// AJAX 요청
							$.ajax({
								type : 'POST',
								url : '/setting/kintaiUpdate',
								data : {
									kintai_km : kintai_km,
									kintai_tani : kintai_tani,
									kintai_group : kintai_group,
									kintai_active : kintai_active,
									target_kintai_km : target_kintai_km
								},
								success : function(response) {
									// 성공적으로 응답을 받았을 때 수행할 동작
									console.log(response);
									location.reload();

									// 추가적인 동작이 필요하다면 여기에 작성
								},
								error : function(error) {
									// 에러가 발생했을 때 수행할 동작
									console.error(error);
								}
							});
						});

				$('#kintaideleteButton').click(function() {
					// 확인 다이얼로그 표시
					if (confirm("정말로 삭제하시겠습니까?")) {
						// 입력된 값을 가져오기
						var kintai_km = $('#kintai_km').val();

						console.log("delete button clicked!");

						// AJAX 요청
						$.ajax({
							type : 'POST',
							url : '/setting/kintaiDelete',
							data : {
								kintai_km : kintai_km
							},
							success : function(response) {
								// 성공적으로 응답을 받았을 때 수행할 동작
								console.log(response);
								location.reload(); // 또는 필요한 동작 수행

								// 추가적인 동작이 필요하다면 여기에 작성
							},
							error : function(error) {
								// 에러가 발생했을 때 수행할 동작
								console.error(error);
							}
						});
					}
				});
			</script>
		</div>
	</div>
</body>
</html>


<script>
//버튼 4개
	$("#btnLvItIns").click(function() {
      	console.log("btnPayItemIns clicked");
        $("#kyukaRegisterButton").click();
      });

      $("#btnLvItUpd").click(function() {
        $("#kyukaUpdateButton").click();
      });

      $("#btnLvItDel").click(function() {
        $("#kyukaDeleteButton").click();
      });

      $("#btnLvItReset").click(function() {
        resetForm();
      });
      
      //버튼4개
      $("#btnDlgnIns").click(function() {
        $("#kintaiRegisterButton").click();
      });

      $("#btnDlgnUpd").click(function() {
        $("#kintaiUpdateButton").click();
      });

      $("#btnDlgnDel").click(function() {
        $("#kintaiDeleteButton").click();
      });

      $("#btnDlgnReset").click(function() {
        resetForm2();
      });

</script>