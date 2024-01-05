<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@include file="../includes/header.jsp"%>
<%@include file="../includes/menu.jsp"%>



<div id="main_container">
  <!-- 타이틀 이미지 -->
    <div class="sub_titimg">
    <ul>
    <li class="tit_img"><img src="../resources/img/payset_tit_img.gif" width="68" height="68" alt="급여항목 설정" title="급여항목 설정"></li>
    <li class="p_t10"><img src="../resources/img/payset_tit_01.png" width="135" height="25" alt="급여항목 설정" title="급여항목 설정"></li>
    <li class="p_t5">給与に関連する支給および控除項目を設定するメニューです。企業のポリシーに合わせて設定できます。</li>
    </ul>
    </div>
    <hr>


   <!-- 지급항목 설정 리스트 -->
<div class="main_titimg">
   <div class="diligence_list">
         <ul class="p_b10"><img src="../resources/img/payset_tit_02.png" width="105" height="19" alt="지급항목 설정" title="지급항목 설정"><span style="color:#bcbcbc;font-size:11px;">(항목 수: ${sikyuCount}개)</span></ul>
      <ul>
        <div id="table1">
          <div id="selecTable1"><!-- 테이블 셀렉터 -->
	        <p class="caption"></p>
	        <ul>
	        <li class="w_100 tit"><strong>支給項目</strong></li>
	        <li class="w_200 tit"><strong>課税有無</strong></li>
	        <li class="w_105 tit"><strong>非課税限度額</strong></li>
	        <li class="w_88 tit"><strong>端数単位</strong></li>
	        <li class="w_150 tit"><strong>一括支給額</strong></li>
	        <li class="w_70 tit"><strong>使用有無</strong></li>
	        </ul>
			
			<c:forEach items="${sikyuList}" var="sikyu">
	            <ul class="sikyu-row anchor" data-sikyu-km="${sikyu.sikyu_km}">
	              <li class="w_90  bold p_l10" title="CD001">${sikyu.sikyu_km}</li><!-- 0 -->
	              <li class="w_190 p_l10">
		              	<c:if test="${sikyu.kazei_active eq 'O'}">전체과세</c:if>
					    <c:if test="${sikyu.kazei_active eq 'X'}">비과세_${sikyu.hikazei_nm}</c:if>
	              </li>
	              <li class="w_92 con_r p_r13">
	              		<script>
			            	document.write(parseInt('${sikyu.hikazei_limit}', 10).toLocaleString());
			        	</script>
	              </li>
	              <li class="w_88 c">
		              <c:if test="${sikyu.sikyu_tani eq 'X'}">無し</c:if>
		              <c:if test="${sikyu.sikyu_tani eq 'O'}">1円単位</c:if>
		              <c:if test="${sikyu.sikyu_tani eq 'T'}">10円単位</c:if>
		              <c:if test="${sikyu.sikyu_tani eq 'H'}">100円単位</c:if>
	              </li>
	              <li class="w_150 c">
		                <script>
			            	document.write(parseInt('${sikyu.ikkatsu_pay}', 10).toLocaleString());
			        	</script>
	              </li>
	              <li class="w_70 c">
	              	<c:if test="${sikyu.sikyu_active eq 'O'}"><img src="../resources/img/icon_o.gif" width="17" height="17"></c:if>
	              	<c:if test="${sikyu.sikyu_active eq 'X'}"><img src="../resources/img/icon_x.gif" width="17" height="17"></c:if>
	              </li>
	            </ul>
            </c:forEach>
            
            
        	</div>
        </div>
      </ul>

    </div>
    
    
   <!-- 지급항목_설정 -->
   <div class="diligence_set">
      <ul class="aling_r">
      	<span id="btnPayItemHelpView" class="anchor"><img src="https://img.payzon.co.kr/_commonImg/icon_help.gif" width="38" height="15" alt="도움말" vspace="8"></span>
      </ul>
      
      <ul>
		<form action="/setting/sikyuCreate" method="post" id="sikyuForm">
	        <div id="table0">
	        <p class="caption"></p>
	        <ul>
	        <li class="w_120 c"><strong>支給項目</strong></li>
	        <li class="con "><input name="sikyu_km" id="sikyu_km" type="text" placeholder="支給項目を入力してください。" class="white" style="width:190px;"></li>
	        </ul>
	        
	        <ul>
	        <li class="w_120 c"><strong>課税有無</strong></li>
	        <div>
	          <li class="w_85 c">
	          <label class="label_radio r_on" for="frmTaxFull">
	          <input name="kazei_active" id="kazei_active_O" type="radio" value="O" checked="checked"> 課税</label></li>
	          <li><label class="label_radio" for="frmTaxFree">
	          <input name="kazei_active" id="kazei_active_X" type="radio" value="X"> 非課税</label></li>
	        </div>
	        </ul>
	        
	        <ul>
	          <li class="w_120 c"><strong>非課税名</strong></li>
	          <li class="con"><input type="text" name="hikazei_nm" id="hikazei_nm" value="" class="white" style="width:190px;">
	          </li>
	        </ul>
	        
	        <ul id="disGiveTxLA">
	        <li class="w_120 c"><strong>非課税限度額</strong></li>
	        <li class="con"><input name="hikazei_limit" id="hikazei_limit" type="text" value="0" class="white clsAmount" style="width:170px;text-align:right;"> 円</li>
	        </ul>
	        
	        <!-- <ul>
	          <li class="w_120 c"><strong>계산방법</strong></li>
	          <li class="con"><input type="text" name="frmGiveCalc" id="frmGiveCalc" placeholder="계산방법을 입력해주세요." class="white" style="width:190px;"></li>
	        </ul> -->
	        
	        <ul>
	        <li class="w_120 c"><strong>端数処理単位</strong></li>
	        <li class="con">
	          <select name="sikyu_tani" id="sikyu_tani" style="width:200px;">
	           <option value="X">無し</option>
	           <option value="O">1円単位</option>
	           <option value="T">10円単位</option>
	           <option value="H">100円単位</option>
	          </select>
	        </li>
	        </ul>
	        
	        <ul>
	          <li class="w_120 c"><strong>一括支給額</strong></li>
	          <li class="con"><input name="ikkatsu_pay" id="ikkatsu_pay" type="text" value="0" class="white" style="width:170px;text-align:right;"> 円</li>
	        </ul>
	        
	        <ul>
	        <li class="w_120 c"><strong>使用有無</strong></li>
	          <div>
	            <li class="w_85 c">
	            <label class="label_radio r_on" for="frmGiveSta1">
	            <input name="sikyu_active" id="sikyu_active_O" value="O" type="radio" checked=""> 使用</label></li>
	            <li><label class="label_radio" for="frmGiveSta2">
	            <input name="sikyu_active" id="sikyu_active_X" value="X" type="radio">使用しない</label></li>
	          </div>
	        </ul>
	
	      </div>
	      
	    </ul>
      <hr class="hr_5">
      <ul class="c">
      
      		<button type="submit" id="sikyuRegisterButton" style="display: none;">追加</button>
			<button type="button" id="sikyuUpdateButton" style="display: none;">修整</button>
			<button type="button" id="sikyuDeleteButton" style="display: none;">削除</button>
      		
      		
	      <input name="btnPayItemIns" id="btnPayItemIns" type="image" value="추가" src="../resources/img/btn_add.png" width="60px" height="27px" alt="추가">
	      <input name="btnPayItemUpd" id="btnPayItemUpd" type="image" value="추가" src="../resources/img/btn_m.png" width="60px" height="27px" alt="수정" class="p_l5">
	      <input name="btnPayItemDel" id="btnPayItemDel" type="image" value="추가" src="../resources/img/btn_d.png" width="60px" height="27px" alt="삭제" class="p_l5">
	      <a href="#none"><img id="btnPayItemClear" src="../resources/img/btn_e.png" width="91px" height="27px" alt="내용지우기" class="p_l5"></a>
	  </ul>
	  
	  </form>
    </div>
  </div>



  <!-- 공제항목 설정 리스트 -->
<div class="main_titimg p_t50">
   <div class="diligence_list">
         <ul class="p_b10"><img src="../resources/img/payset_tit_03.png" width="105" height="19" alt="공제항목 설정" title="공제항목 설정"><span style="color:#bcbcbc;font-size:11px;">(항목 수: ${kojyoCount}개)</span></ul>
      <ul>
        <div id="table1">
          <div id="selecTable2"><!-- 테이블 셀렉터 -->
        <p class="caption"></p>
        <ul>
          <li class="w_150 tit"><strong>控除項目</strong></li>
          <li class="w_150 tit"><strong>端数処理単位</strong></li>
          <li class="w_140 tit"><strong>使用有無</strong></li>
          <li class="w_275 tit"><strong>備考</strong></li>
        </ul>
		
		<c:forEach items="${kojyoList}" var="kojyo">
	        <ul class="kojyo-row anchor" data-kojyo-km="${kojyo.kojyo_km}">
	          <li class="w_140 bold p_l10" title="CD001">${kojyo.kojyo_km}</li>
	          <li class="w_150 c">
          		  <c:if test="${kojyo.hansu_tani eq 'X'}">無し</c:if>
	              <c:if test="${kojyo.hansu_tani eq 'O'}">1円単位</c:if>
	              <c:if test="${kojyo.hansu_tani eq 'T'}">10円単位</c:if>
	              <c:if test="${kojyo.hansu_tani eq 'H'}">100円単位</c:if>
	          </li>
	          <li class="w_140 c">
	          	<c:if test="${kojyo.kojyo_active eq 'O'}"><img src="../resources/img/icon_o.gif" width="17" height="17"></c:if>
	            <c:if test="${kojyo.kojyo_active eq 'X'}"><img src="../resources/img/icon_x.gif" width="17" height="17"></c:if>
	          </li>
	          <li class="w_265 p_l10">${kojyo.biko}</li>
	        </ul>
        </c:forEach>
        </div>
      </div></ul>

    </div>

   <!-- 공제항목 설정 리스트_설정 -->
   <div class="diligence_set">
      <ul class="aling_r">
      <span id="btnDedSItemHelpView" class="anchor"><img src="https://img.payzon.co.kr/_commonImg/icon_help.gif" width="38" height="15" alt="도움말" vspace="8"></span></ul>
      <ul>
      
	<form action="/setting/kojyoCreate" method="post">
        <div id="table0">
        <p class="caption"></p>
        <ul>
          <li class="w_120 c"><strong>控除項目</strong></li>
          <li class="con"><input name="kojyo_km" id="kojyo_km" type="text" placeholder="控除項目を入力してください" class="white" style="width:190px;"></li>
        </ul>
        
        <ul>
          <li class="w_120 c"><strong>端数処理単位</strong></li>
          <li class="con">
          <select name="hansu_tani" id="hansu_tani" style="width:200px;">
	           <option value="X">無し</option>
	           <option value="O">1円単位</option>
	           <option value="T">10円単位</option>
	           <option value="H">100円単位</option>
	      </select>
          </li>
        </ul>
        
        <ul>
          <li class="w_120 c"><strong>備考</strong></li>
          <li class="con"><input name="biko" id="biko" type="text" value="" class="white" style="width:190px;"></li>
        </ul>
        
        <ul>
        <li class="w_120 c"><strong>使用有無</strong></li>
        	<div>
	            <li class="w_85 c">
	            <label class="label_radio r_on" for="frmGiveSta1">
	            <input name="kojyo_active" id="kojyo_active_O" value="O" type="radio" checked=""> 使用</label></li>
	            <li><label class="label_radio" for="frmGiveSta2">
	            <input name="kojyo_active" id="kojyo_active_X" value="X" type="radio">使用しない</label></li>
	        </div>
        </ul>
        
        <hr class="hr_5">
        
      <ul class="c" style="border-bottom: 0px;">
      
		<button type="submit" id="kojyoRegisterButton" style="display: none;">追加</button>
		<button type="button" id="kojyoUpdateButton" style="display: none;">修整</button>
		<button type="button" id="kojyoDeleteButton" style="display: none;">削除</button>
		<button type="button" onclick="resetForm2()" style="display: none;">内容消去</button>

      
      
      <input name="btnDedSItemIns" id="btnDedSItemIns" type="image" value="추가" src="../resources/img/btn_add.png" width="60px" height="27px" alt="추가">
      <input name="btnDedSItemUpd" id="btnDedSItemUpd" type="image" value="수정" src="../resources/img/btn_m.png" width="60px" height="27px" alt="수정" class="p_l5">
      <input name="btnDedSItemDel" id="btnDedSItemDel" type="image" value="삭제" src="../resources/img/btn_d.png" width="60px" height="27px" alt="삭제" class="p_l5">
      <a href="#none"><img id="btnDedSItemClear" src="../resources/img/btn_e.png" width="91px" height="27px" alt="내용지우기" class="p_l5"></a></ul>


			</form>
		  </div>
		</div>

<hr class="hr_50">
</div>
</div>












<script>
// 폼 초기화 함수
function resetForm() {
	document.forms[0].reset();
}

function resetForm2() {
	document.forms[1].reset();
}



// 각 행에 대한 클릭 이벤트 핸들러
var target_km = "";

$('.sikyu-row').click(
		function() {
			// 선택한 행의 kyuka_km 값을 가져옴
			var sikyu_km = $(this).data('sikyu-km');
			target_km = sikyu_km;

			// AJAX 요청
			$.ajax({
				type : 'POST', // 또는 'GET' 등 요청 방식 선택
				url : '/setting/sikyuRead', // 컨트롤러의 URL
				data : {
					sikyu_km : sikyu_km
				},
				dataType : 'json',
				success : function(response) {

					$('#sikyu_km').val(response.sikyu_km);
					$('input[name=kazei_active][value=' + response.kazei_active + ']').prop('checked', true);
					$('#hikazei_nm').val(response.hikazei_nm);
					$('#hikazei_limit').val(response.hikazei_limit);
					$('#sikyu_tani').val(response.sikyu_tani);
					$('#ikkatsu_pay').val(response.ikkatsu_pay);
					$('input[name=sikyu_active][value=' + response.sikyu_active + ']').prop('checked', true);
				},
				error : function(error) {
					// 에러가 발생했을 때 수행할 동작
					console.error(error);
				}
			});
		});

	// 휴가설정"수정" 버튼 클릭 이벤트 핸들러
	$('#sikyuUpdateButton').click(function() {
		event.preventDefault();
		// 입력된 값을 가져오기
		var sikyu_km = $('#sikyu_km').val();
		var kazei_active = $('input[name=kazei_active]:checked').val(); // 수정된 부분
		var hikazei_nm = $('#hikazei_nm').val();
		var hikazei_limit = $('#hikazei_limit').val();
		var sikyu_tani = $('#sikyu_tani').val();
		var ikkatsu_pay = $('#ikkatsu_pay').val();
		var sikyu_active = $('input[name=sikyu_active]:checked').val(); // 수정된 부분

		console.log("modify button clicked! " + sikyu_km + kazei_active +
				hikazei_nm + hikazei_limit + sikyu_tani + ikkatsu_pay + sikyu_active);

		// AJAX 요청
		$.ajax({
			type : 'POST',
			url : '/setting/sikyuUpdate', // 수정할 엔드포인트로 변경
			data : {
				sikyu_km : sikyu_km,
				kazei_active : kazei_active,
				hikazei_nm : hikazei_nm,
				hikazei_limit : hikazei_limit,
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
		event.preventDefault();
		// 확인 다이얼로그 표시
		if (confirm("本当に削除しますか？")) {
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

	$('.kojyo-row').click(
			function() {
				// 선택한 행의 kintai_km 값을 가져옴
				var kojyo_km = $(this).data('kojyo-km');
				target_kojyo_km = kojyo_km;
				console.log("target : " + target_kojyo_km);

				// AJAX 요청
				$.ajax({
					type : 'POST',
					url : '/setting/kojyoRead',
					data : {
						kojyo_km : kojyo_km
					},
					dataType : 'json',
					success : function(response) {
						// 성공적으로 응답을 받았을 때 수행할 동작
						console.log(response.kojyo_km, response.hansu_tani,
								response.biko);

						// 근태 항목과 관련된 필드의 ID를 수정

						$('#kojyo_km').val(response.kojyo_km);
						$('#hansu_tani').val(response.hansu_tani);
						$('#biko').val(response.biko);
						$(
								'input[name=kojyo_active][value='
										+ response.kojyo_active + ']').prop(
								'checked', true);
					},
					error : function(error) {
						// 에러가 발생했을 때 수행할 동작
						console.error(error);
					}
				});
			});

	// 근태 항목 설정 "수정" 버튼 클릭 이벤트 핸들러
	$('#kojyoUpdateButton').click(function() {
		event.preventDefault();
		// 입력된 값을 가져오기
		var kojyo_km = $('#kojyo_km').val();
		var hansu_tani = $('#hansu_tani').val();
		var biko = $('#biko').val();
		var kojyo_active = $('input[name=kojyo_active]:checked').val();

		console.log("modify button clicked!" + kojyo_km + hansu_tani
				+ biko + kojyo_active + target_kojyo_km);

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
		event.preventDefault();
		
		if (confirm("本当に削除しますか？")) {
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
	
	
	
	
	//버튼 4개
	$("#btnPayItemIns").click(function() {
      	console.log("btnPayItemIns clicked");
        $("#sikyuRegisterButton").click();
      });

      $("#btnPayItemUpd").click(function() {
        $("#sikyuUpdateButton").click();
      });

      $("#btnPayItemDel").click(function() {
        $("#sikyuDeleteButton").click();
      });

      $("#btnPayItemClear").click(function() {
    	  event.preventDefault();
        resetForm();
      });
      
      //버튼4개
      $("#btnDedSItemIns").click(function() {
        $("#kojyoRegisterButton").click();
      });

      $("#btnDedSItemUpd").click(function() {
        $("#kojyoUpdateButton").click();
      });

      $("#btnDedSItemDel").click(function() {
        $("#kojyoDeleteButton").click();
      });

      $("#btnDedSItemClear").click(function() {
    	  event.preventDefault();
        resetForm2();
      });


</script>


	
<%@include file="../includes/footer.jsp"%>