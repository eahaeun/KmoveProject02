<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@include file="../includes/header.jsp"%>
<%@include file="../includes/menu.jsp"%>




	<div class="container">
		<div class="form-container">
			<h3>支給項目設定</h3>

			<!-- 지급 리스트와 새로운 휴가 항목 입력 폼 -->
			<form action="/setting/sikyuCreate" method="post">
				<table>
					<thead>
						<tr>
							<th>支給項目</th>
							<th>端数単位</th>
							<th>一括支給額</th>
							<th>使用可否</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${sikyuList}" var="sikyu">
							<tr class="sikyu-row" data-sikyu-km="${sikyu.sikyu_km}">
								<td><c:out value="${sikyu.sikyu_km}" /></td>
								<td><c:out value="${sikyu.sikyu_tani}" /></td>
								<td><c:out value="${sikyu.ikkatsu_pay}" /></td>
								<td><c:out value="${sikyu.sikyu_active }" /></td>

							</tr>
						</c:forEach>
					</tbody>
				</table>

				<table>
					<tbody id="sikyuTableBody">
						<tr>
							<th>支給項目</th>
							<td><input type="text" id="sikyu_km" name="sikyu_km"
								value="" /></td>
						</tr>
						<tr>
							<th>端数単位</th>
							<td><input type="text" id="sikyu_tani" name="sikyu_tani"
								value="" /></td>
						</tr>
						<tr>
							<th>一括支給額</th>
							<td><input type="text" id="ikkatsu_pay" name="ikkatsu_pay"
								value="" />ウォン</td>
						</tr>

						<tr>
							<th>使用の有無</th>
							<td><input type="radio" id="sikyu_active_O"
								name="sikyu_active" value="O" />使用 <input type="radio"
								id="sikyu_active_X" name="sikyu_active" value="X" />使用しない</td>
						</tr>

					</tbody>
				</table>
				<!-- 저장, 취소 버튼 -->
				<div class="button-container">
					<button type="submit">追加</button>
					<button type="button" id="sikyuUpdateButton">修整</button>
					<button type="button" id="sikyuDeleteButton">削除</button>
					<button type="button" onclick="resetForm()">内容消去</button>
				</div>
			</form>
			<!-- "근태 항목 설정" 섹션 추가 -->
			<h2>控除項目設定</h2>
			<form action="/setting/kojyoCreate" method="post">

				<!-- 근태 항목 목록 -->
				<table>
					<thead>
						<tr>
							<th>控除項目</th>
							<th>端数単位</th>
							<th>備考</th>
							<th>使用の有無</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${kojyoList}" var="kojyo">
							<tr class="kojyo-row" data-kojyo-km="${kojyo.kojyo_km}">
								<td><c:out value="${kojyo.kojyo_km}" /></td>
								<td><c:out value="${kojyo.hansu_tani}" /></td>
								<td><c:out value="${kojyo.biko}" /></td>
								<td><c:out value="${kojyo.kojyo_active }" /></td>

							</tr>
						</c:forEach>

					</tbody>
				</table>

				<table>
					<tbody id="kojyoTableBody">
						<tr>
							<th>控除項目</th>
							<td><input type="text" id="kojyo_km" name="kojyo_km"
								value="" /></td>
						</tr>
						<tr>
							<th>端数単位</th>
							<td><input type="text" id="hansu_tani" name="hansu_tani"
								value="" /></td>
						</tr>
						<tr>
							<th>備考</th>
							<td><input type="text" id="biko" name="biko" value="" /></td>
						</tr>
						<tr>
							<th>使用の有無</th>
							<td><input type="radio" id="kojyo_active_O"
								name="kojyo_active" value="O" />使用 <input type="radio"
								id="kojyo_active_X" name="kojyo_active" value="X" />使用しない</td>
						</tr>
					</tbody>
				</table>
				<!-- 저장, 취소 버튼 -->
				<div class="button-container">
					<button type="submit">追加</button>
					<button type="button" id="kojyoUpdateButton">修整</button>
					<button type="button" id="kojyoDeleteButton">削除</button>
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

				$('.sikyu-row')
						.click(
								function() {
									// 선택한 행의 kyuka_km 값을 가져옴
									var sikyu_km = $(this).data('sikyu-km');
									target_km = sikyu_km;

									// AJAX 요청
									$
											.ajax({
												type : 'POST', // 또는 'GET' 등 요청 방식 선택
												url : '/setting/sikyuRead', // 컨트롤러의 URL
												data : {
													sikyu_km : sikyu_km
												},
												dataType : 'json',
												success : function(response) {
													// 성공적으로 응답을 받았을 때 수행할 동작
													console
															.log(
																	response.sikyu_km,
																	response.sikyu_tani,
																	response.ikkatsu_pay,
																	response.sikyu_active);

													$('#sikyu_km').val(
															response.sikyu_km);
													$('#sikyu_tani')
															.val(
																	response.sikyu_tani);
													$('#ikkatsu_pay')
															.val(
																	response.ikkatsu_pay);
													$(
															'input[name=sikyu_active][value='
																	+ response.sikyu_active
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

				// 휴가설정"수정" 버튼 클릭 이벤트 핸들러
				$('#sikyuUpdateButton').click(
						function() {
							// 입력된 값을 가져오기
							var sikyu_km = $('#sikyu_km').val();
							var sikyu_tani = $('#sikyu_tani').val();
							var ikkatsu_pay = $('#ikkatsu_pay').val();
							var sikyu_active = $(
									'input[name=sikyu_active]:checked').val(); // 수정된 부분

							console.log("modify button clicked!");

							// AJAX 요청
							$.ajax({
								type : 'POST',
								url : '/setting/sikyuUpdate', // 수정할 엔드포인트로 변경
								data : {
									sikyu_km : sikyu_km,
									sikyu_tani : sikyu_tani,
									ikkatsu_pay : ikkatsu_pay,
									sikyu_active : sikyu_active,
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
				$('#sikyuDeleteButton').click(function() {
					// 확인 다이얼로그 표시
					if (confirm("정말로 삭제하시겠습니까?")) {
						// 입력된 값을 가져오기
						var sikyu_km = $('#sikyu_km').val();

						console.log("delete button clicked!");

						// AJAX 요청
						$.ajax({
							type : 'POST',
							url : '/setting/sikyuDelete',
							data : {
								sikyu_km : sikyu_km
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
				var target_kojyo_km = "";

				$('.kojyo-row')
						.click(
								function() {
									// 선택한 행의 kintai_km 값을 가져옴
									var kojyo_km = $(this).data('kojyo-km');
									target_kojyo_km = kojyo_km;
									console.log("target : " + target_kojyo_km);

									// AJAX 요청
									$
											.ajax({
												type : 'POST',
												url : '/setting/kojyoRead',
												data : {
													kojyo_km : kojyo_km
												},
												dataType : 'json',
												success : function(response) {
													// 성공적으로 응답을 받았을 때 수행할 동작
													console
															.log(
																	response.kojyo_km,
																	response.hansu_tani,
																	response.biko);

													// 근태 항목과 관련된 필드의 ID를 수정

													$('#kojyo_km').val(
															response.kojyo_km);
													$('#hansu_tani')
															.val(
																	response.hansu_tani);
													$('#biko').val(
															response.biko);
													$(
															'input[name=kojyo_active][value='
																	+ response.kojyo_active
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
				$('#kojyoUpdateButton').click(
						function() {
							// 입력된 값을 가져오기
							var kojyo_km = $('#kojyo_km').val();
							var hansu_tani = $('#hansu_tani').val();
							var biko = $('#biko').val();
							var kojyo_active = $(
									'input[name=kojyo_active]:checked').val();

							console.log("modify button clicked!" + kojyo_km
									+ hansu_tani + biko + kojyo_active
									+ target_kojyo_km);

							// AJAX 요청
							$.ajax({
								type : 'POST',
								url : '/setting/kojyoUpdate',
								data : {
									kojyo_km : kojyo_km,
									hansu_tani : hansu_tani,
									biko : biko,
									kojyo_active : kojyo_active,
									target_kojyo_km : target_kojyo_km

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

				$('#kojyoDeleteButton').click(function() {
					// 확인 다이얼로그 표시
					if (confirm("정말로 삭제하시겠습니까?")) {
						// 입력된 값을 가져오기
						var kojyo_km = $('#kojyo_km').val();

						console.log("delete button clicked!");

						// AJAX 요청
						$.ajax({
							type : 'POST',
							url : '/setting/kojyoDelete',
							data : {
								kojyo_km : kojyo_km
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
	
	
	
	
<%@include file="../includes/footer.jsp"%>