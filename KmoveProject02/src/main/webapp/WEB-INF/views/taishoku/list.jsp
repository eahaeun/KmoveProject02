<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@include file="../includes/modalheader.jsp"%>
<%@include file="../includes/menu.jsp"%>

<div id="main_container">
	<div class="sub_titimg">
		<ul>
			<li class="tit_img p_r7"><img
				src="../resources/img/resign_tit_img.gif" width="70" height="68"=></li>
			<li class="p_t10"><img src="../resources/img/resign_tit_01.png"
				width="156" height="25"></li>
			<li class="p_t5">退職対象の社員を選択し、退職処理に関する情報を入力できます。退職者を分類して全体の退職者を見ることができます。</li>
		</ul>
	</div>
	
	<hr>

	<div class="main_titimg wp_85">
		<div class="e_total">
	        <div id="table1">
	        <p class="caption"></p>
	        <!-- 헤더 -->
	        <ul class="">
	          <li class="w_50 tit ">番号</li>
	          <li class="w_106 tit ">状態</li>
	          <li class="w_102 tit "><a href="" class="c_linkblue"><u><strong>社員番号</strong></u></a></li>
	          <li class="w_100 tit"><a href="" class="c_linkblue"><u><strong>氏名</strong></u></a></li>
	          <li class="w_120 tit"><a href="" class="c_linkblue"><u><strong>部署</strong></u></a></li>
	          <li class="w_120 tit"><a href="" class="c_linkblue"><u><strong>役職</strong></u></a></li>
	          <li class="w_120 tit"><a href="" class="c_linkblue"><u><strong>入社日</strong></u></a></li>
	          <li class="w_120 tit"><a href="" class="c_linkblue"><u><strong>退職日</strong></u></a></li>
	          <li class="w_100 tit">金属年数</li>
	          <li class="w_100 tit">退職金精算</li>
	        </ul>
	        
	        <!-- 내용 -->
	        <c:forEach items="${tk}" var="tk">
		        <ul data-shain_no="${tk.shain_no}" class="anchor">
		          <li class="w_50 "><c:out value="${tk.num}" /></li>
		          <li class="w_106 "><c:out value="${tk.zaishoku_st}" /></li>
		          <li class="w_102 "><c:out value="${tk.shain_no}" /></li>
		          <li class="w_100 "><c:out value="${tk.shain_nm}" /></li>
		          <li class="w_120 "><c:out value="${tk.busho_nm}" /></li>
		          <li class="w_120 "><c:out value="${tk.yakushoku_nm}" /></li>
		          <li class="w_120 "><c:out value="${tk.nyusha_ymd}" /></li>
		          <li class="w_120 "><c:out value="${tk.taishoku_ymd}" /></li>
		          <li class="w_100 "><c:out value="${tk.yearDiff}" />年</li>
		          <li class="w_100 ">
		          	<c:choose>
						<c:when test="${empty tk.taishoku_pay}"><img src="../resources/img/icon_x.gif" width="17" height="17"></c:when>
						<c:when test="${tk.taishoku_pay gt 0}"><img src="\../resources/img/icon_o.gif" width="17" height="17"></c:when>
						<c:otherwise><img src="\../resources/img/icon_x.gif" width="17" height="17"></c:otherwise>
					</c:choose>
		          </li>
		        </ul>
	        </c:forEach>
	        </div>
	    </div>
	</div>
</div>


<!-- 퇴직처리모달 -->
<div id="taishokuModal" class="modal">
	<div class="modal-content">
		<div id="pop01" class="w_400 ">
			<input type="hidden" id="shain_no" name="shain_no" value="${shainNo}">
			
			<ul class="tit">
				<li>退職処理</li>
			</ul>
			
		<form id="taishokuRegisterForm">
			<ul class="part">
		      <div class="pop_resign">
		      <ul>
		        <div id="table0">
		        <p class="caption"></p>
		        <ul>
		          <li class="w_120 c"><strong>退職日</strong></li>
		          <li class="con"><input name="taishoku_ymd" id="taishoku_ymd" type="date" pattern="yyMMdd" class="text" style="width:170px;" maxlength="10"></li>
		        </ul>
		        <ul>
		          <li class="w_120 c"><strong>退職自由</strong></li>
		          <li class="con"><input name="taishoku_jiyu" id="taishoku_jiyu" type="text" value="" class="text" style="width:170px;" maxlength="20"></li>
		        </ul>
		        <ul>
		          <li class="w_120 c"><strong>退職後連絡先</strong></li>
		          <li class="con"><input name="taishoku_renraku" id="taishoku_renraku" type="text" value="" class="text" style="width:170px;" maxlength="13"></li>
		        </ul>
		      	</div>
		    	</ul>
		       </div>
			</ul>
		</form>
		
		<ul>
			<button type="submit" id='insert_btn' name='insert_btn' value="submit" style="display:none;">保存</button>
      		<li class="footer c"><input name="btnRetireSet" id="btnRetireSet" type="image" value="저장" src="../resources/img/btn_save3.png" width="71px" height="30px" class="p_l10 p_t10"></li>
    	</ul>
		
		</div>
	</div>
</div>




<!-- 취소처리 모달 -->
<div id="cancelModal" class="modal">
	<div class="modal-content">
		<div id="pop01" class="w_400 ">
			<input type="hidden" id="shain_no" name="shain_no" value="${shainNo}">
			
			<ul class="tit">
				<li>退職処理取消</li>
			</ul>
			
		<form id="cancelTaishokuForm">
			<ul class="part">
		      <div class="pop_resign">
		      <ul>
		        <div id="table0">
		        <p class="caption"></p>
		        <ul>
		          <li class="w_120 c"><strong>退職日</strong></li>
		          <li class="con"><input value="${taishoku_ymd}" name="taishoku_ymd" id="taishoku_ymd" type="date" pattern="yyMMdd" class="text" style="width:170px;" maxlength="10"></li>
		        </ul>
		        <ul>
		          <li class="w_120 c"><strong>退職自由</strong></li>
		          <li class="con"><input value="${taishoku_jiyu}" name="taishoku_jiyu" id="taishoku_jiyu" type="text" value="" class="text" style="width:170px;" maxlength="20"></li>
		        </ul>
		        <ul>
		          <li class="w_120 c"><strong>退職後連絡先</strong></li>
		          <li class="con"><input value="${taishoku_renraku}" name="taishoku_renraku" id="taishoku_renraku" type="text" value="" class="text" style="width:170px;" maxlength="13"></li>
		        </ul>
		      	</div>
		    	</ul>
		       </div>
			</ul>
		</form>
		
		<ul>
			<button type="submit" id='cancel_btn' name='cancel_btn' value="submit" style="display:none;">キャンセル</button>
      		<li class="footer c"><input name="btnRetireCancel" id="btnRetireCancel" type="image" src="../resources/img/btn_resigncancle.png" width="120px" height="30px" class="p_l10 p_t10"></li>
    	</ul>
		
		</div>
	</div>
</div>


<script>
	$(document).ready(function() {

		// 퇴직처리 모달 오픈/클로즈 함수
		function openTaishokuModal() {
			document.getElementById('taishokuModal').style.display = 'block';
		}

		function closeTaishokuModal() {
			document.getElementById('taishokuModal').style.display = 'none';
		}

		// 취소처리 모달 오픈/클로즈 함수
		function openCancelModal() {
			document.getElementById('cancelModal').style.display = 'block';
		}

		function closeCancelModal() {
			document.getElementById('cancelModal').style.display = 'none';
		}
		
		
		// 이미지 버튼 대체
		document.getElementById('btnRetireSet').addEventListener('click', function() {
		    document.getElementById('insert_btn').click();
		});
		
		// 이미지 버튼 대체
		document.getElementById('btnRetireCancel').addEventListener('click', function() {
		    document.getElementById('cancel_btn').click();
		});

		// 테이블 행 클릭 이벤트
		$(".anchor").click(function() {
			// 클릭한 행에서 데이터 가져오기
			var zaishoku_st = $(this).find("li:eq(1)").text(); // 상태에 해당하는 열의 위치
			var shain_no = $(this).data("shain_no");
			console.log("사원번호 :" + shain_no)
			// 모달에 데이터 전달

			if (zaishoku_st === "在職") {
				// 재직 상태일 때의 모달 열기 
				console.log("open taishoku modal");
				openTaishokuModal();
				$("#shain_no").val(shain_no);
			} else {
				// 퇴직 상태일 때의 모달 열기
				getTaishokuInfo(shain_no, "cancelModal");
				// 모달 열기
			}

		});
		
		// 퇴직처리 모달에서 저장 버튼 클릭 시
		$("#insert_btn").click(function() {
			submitTaishokuForm("taishokuModal");
		});

		// 취소처리 모달에서 저장 버튼 클릭 시
		$("#cancel_btn").click(function() {
			cancelTaishokuForm("cancelModal");
		});
	
		// 모달 외부를 클릭했을 때 닫기
		var taishokuModal = document.getElementById('taishokuModal');
		var cancelModal = document.getElementById('cancelModal');

		window.addEventListener('click', function(event) {
		    if (event.target === taishokuModal || event.target === cancelModal) {
		    	closeTaishokuModal();
		    	closeCancelModal();
		    }
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
				closeCancelModal();
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
				$("#" + modalId + " #taishoku_jiyu").val(data.taishoku_jiyu);
				$("#" + modalId + " #taishoku_renraku").val(data.taishoku_renraku);

				openCancelModal();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log("AJAX Error: " + textStatus, errorThrown);
			}
		});
	}

	function submitTaishokuForm(modalId) {
		console.log("submit Form action");
		
		// 폼 데이터 가져오기
		var shain_no = $('#' + modalId + ' #shain_no').val();
		var taishoku_ymd = $('#' + modalId + ' #taishoku_ymd').val();
		var taishoku_jiyu = $('#' + modalId + ' #taishoku_jiyu').val();
		var taishoku_renraku = $('#' + modalId + ' #taishoku_renraku').val();

		console.log(shain_no, taishoku_ymd, taishoku_jiyu, taishoku_renraku);
		
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
				alert('退職処理が完了しました。');
				closeTaishokuModal();
				location.reload();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log("AJAX Error: " + textStatus, errorThrown);
			}
		});

	}
	
});
</script>



<%@include file="../includes/footer.jsp"%>