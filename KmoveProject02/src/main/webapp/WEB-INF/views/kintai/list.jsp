<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/modalheader.jsp"%>
<%@include file="../includes/menu.jsp"%>


<div id="main_container">
<div class="sub_titimg">
<ul>
	<li class="tit_img">
	<img src="../resources/img/dilw_tit_img.gif" width="61" height="68">
	</li>
	
	<li class="p_t10">
	<img src="../resources/img/dilw_tit_01.png" width="201" height="25" alt="勤怠記録 &amp; 管理" title="勤怠記録 &amp; 管理"></li>
	<li class="p_t5">給与と関連する勤怠記録を管理するメニューです。社員の勤怠履歴を管理できます。</li>
</ul>
</div>
<hr>

<!-- 근태 설정 리스트 -->
<div class="main_titimg">
    <div class="diligence_list">
      <div class="dil_search_box">

	<form name="frmSrchEmployee" id="frmSrchEmployee" onsubmit="return $.fn.frmSrchCheck();">
		<input type="hidden" name="frmStatNum" id="frmStatNum" value="1">
        <ul><input name="srchKwrd" id="srchKwrd" type="text" value="검색어 입력" class="border w_170 height_22 p_l5" onfocus="this.value = (this.value == '검색어 입력')?'':this.value;"></ul><ul class="p_t1">
        <input type="image" value="검색어 입력" src="../resources/img/btn_s_search.png" width="23px" height="23px" alt="검색어 입력" title="검색어 입력" class="p_l5 "></ul>
	</form>
        <ul class="p_t1"><input name="btnSrchInit" id="btnSrchInit" type="image" value="전체보기" src="../resources/img/btn_list_all01.png" width="74px" height="23px" alt="전체보기" title="전체보기" class="p_l5"></ul>
        <ul class="p_t5 p_l10 c_red">* 複数選択時、勤怠記録を一括適用できます。</ul>
     </div>
      
      
      
      <ul>
        <div class="dil_w_list">
          <div id="table_dil">
            <p class="caption"></p>
            <ul>
              <li class="w_24 tit">
<!--               <label class="label_check" for="chkBoxGrpEmployeeInfo">
              <img src="/_commonImg/1px.png" width="1px;" height="1px">
              <input id="chkBoxGrpEmployeeInfo" type="checkbox">
              </label> -->
              <strong>☑</strong>
              </li>
              <li class="w_100 tit"><strong>区分</strong></li>
              <li class="w_105 tit"><strong>社員番号</strong></li>
              <li class="w_100 tit"><strong>氏名</strong></li>
              <li class="w_120 tit"><strong>部署</strong></li>
              <li class="w_120 tit"><strong>役職</strong></li>
              <li class="w_119 tit"><strong>勤怠記録</strong> <span id="btnTipDiligenceMnt" class="anchor"><img src="../resources/img/icon_help_s.gif" width="15px" height="14px" vspace="0" hspace="0" border="0" align="absmiddle" alt="팁" title="팁"></span></li>
            </ul>
            
		<div id="disContentList" class="disContentList" style="width:715px;">
		<div id="table_dil_data">
		<ul id="employeeNo0" class="anchor" style="width:695px;">
			<c:forEach items="${list}" var="shain">
			  <li class="w_24 c">
              <input type="checkbox" name="selectedShain" value="${shain.shain_no}">
              </li>
              <li class="w_100 c">${shain.koyo_keitai}</li>
              <li class="w_105 c">${shain.shain_no}</li>
              <li class="w_100 c">${shain.shain_nm}</li>
              <li class="w_120 c">${shain.busho_nm}</li>
              <li class="w_120 c">${shain.yakushoku_nm}</li>
              <li class="w_119 c">
              	<span name="btnDiliMnt" id="btnDiliMnt" class="anchor">
				    <img src="../resources/img/btn_admin.png" width="52px" height="19px" alt="관리" title="관리" onclick="btnDiliMntCilck('${shain.shain_no}')" >
				</span>
              </li>
			</c:forEach>
         </ul>
            
		</div>
			
			
			</div>
			</div>
        </div>
      </ul>
    </div>





    <!-- 근태 설정 리스트_설정 -->
    <div class="diligence_set">
	<form id="kintai">
	<input type="hidden" name="frmLeavItemChecking" id="frmLeavItemChecking" value="">
	<input type="hidden" name="frmCurrentId" id="frmCurrentId" value="">
	<input type="hidden" name="frmDlsvIndx" id="frmDlsvIndx" value="">
	<input type="hidden" name="frmMode" id="frmMode" value="ins">
      <ul class="aling_r"><span id="btnDiligenceHelpView" class="anchor"><img src="https://img.payzon.co.kr/_commonImg/icon_help.gif" width="38" height="15" alt="도움말" vspace="8"></span></ul>
      <ul>
        <div id="table0">
          <p class="caption"></p>
          <ul>
            <li class="w_135 c"><strong>入力日</strong></li>
            <li class="con"><input name="nyuryoku_ymd" id="nyuryoku_ymd" type="date" class="white hasDatepicker" style="width:190px;" readonly></li>
          </ul>
          
          <ul>
            <li class="w_135 c"><strong>勤怠項目</strong></li>
            <li class="con">
              <select name="kintai_km" id="frmDlgnCode" style="width:190px;">
				<c:forEach var="kintai" items="${save}">
					<option value="${kintai.kintai_km}" data-tani="${kintai.kintai_tani}">${kintai.kintai_km}</option>
				</c:forEach>
              </select>
            </li>
          </ul>
          
<!--           <ul id="disLeavItemExpire" class="disHide">
            <li class="w_135 c" style="color:#eb4e5d;"><strong>適用期間</strong></li>
            <li class="con">
            <input name="kaishi_ymd" id="frmDlsvSttDExpire" type="date" value="" class="white" style="width:80px;color:#eb4e5d;" readonly=""> ~ <input name="shuryo_ymd" id="frmDlsvEndDExpire" type="date" value="" class="white" style="width:80px;color:#eb4e5d;" readonly=""></li>
          </ul> -->
          
          <ul>
            <li class="w_135 c"><strong>適用期間</strong></li>
            <li class="con"><input name="kaishi_ymd" id="kaishi_ymd" type="date" placeholder="시작일" class="text hasDatepicker" style="width:80px;" maxlength="10"> ~ <input name="shuryo_ymd" id="frmDlsvEndD" type="date" placeholder="종료일" class="text hasDatepicker" style="width:80px;" maxlength="10"></li>
          </ul>
          
          <ul>
            <li class="w_135 c"><strong id="kintaiDaysLabel"><span id="disDlgnDays">勤怠</span></strong></li>
            <li class="con">
            <input name="kintai_hour" id="kintaiDays" type="text" placeholder="日数/時間" class="text" style="width:80px;" maxlength="5">
            <strong id="kintaiDaysELabel"></strong>
            </li>
          </ul>
          
          <ul>
            <li class="w_135 c"><strong>手当て</strong></li>
            <li class="con"><input name="kintai_pay" id="kintai_pay" type="text" class="white clsAmount" style="width:210px;color:#eb4e5d;text-align:right;" placeholder="勤務分類が支給手当に該当する場合"></li>
          </ul>
          
<!--           <ul>
            <li class="w_135 c"><strong>적요</strong></li>
            <li class="con"><input name="frmDlsvEtcs" id="frmDlsvEtcs" type="text" value="* 적요가 있으신 경우 입력해주세요." class="white" style="width:190px;" placeholder="* 적요가 있으신 경우 입력해주세요."></li>
          </ul> -->
          
        </div>
        </ul>
        <hr class="hr_5">

        <ul class="c">
        <span id="grpBtn01">
        <button type="submit" id="saveButton" class="btn btn-default" style="display: none;">保存</button>
        	<span name="btnDlgnSaveIns" id="btnDlgnSaveIns" class="anchor" onclick="simulateSaveClick()">
        		<img src="../resources/img/btn_save_s2.png" width="60px" height="27px">
	        </span>
	      <img src="../resources/img/btn_e.png" width="91px" height="27px" class="p_l5" onclick="resetForm()">
        </span>


        </ul>
      </form></div>

    </div>
 </div>



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
			          <li class="w_85  tit"><strong>入力日</strong></li>
			          <li class="w_85  tit"><strong>勤怠項目</strong></li>
			          <li class="w_190  tit"><strong>勤怠期間</strong></li>
			          <li class="w_60  tit"><strong>勤怠日数</strong></li>
			          <li class="w_85  tit"><strong>金額</strong></li>
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
			                
			                <ul id="ulDL" class="clspass" title="">
			                  <li class="w_85  c">2024-01-04</li>
			                  <li class="w_85  c" title="011">遅刻</li>
			                  <li class="w_190  c">2024-01-04</li>
			                  <li class="w_60  c">1</li>
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
			                
			                <ul id="ulDL" class="clspass" title="">
			                  <li class="w_85  c">2024-01-06</li>
			                  <li class="w_85  c" title="011">休日勤務</li>
			                  <li class="w_190  c">2024-01-06</li>
			                  <li class="w_60  c">1</li>
			                  <li class="w_85  c bold ">3,000</li>
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
			          </div>
			
			    </ul>
			
			    <ul>
			    <li>.</li>
			    </ul>
			</div>
		</div>
	</div>

	
	
<script>

// 저장 기능을 하는 버튼을 클릭하는 시뮬레이션
function simulateSaveClick() {
    console.log("save button clicked!")
    document.getElementById('saveButton').click();
}

// 페이지 내의 모든 form 요소를 찾아 초기 상태로 리셋
function resetForm() {
    var forms = document.getElementsByTagName('form');
    for (var i = 0; i < forms.length; i++) {
        forms[i].reset();
    }
    location.reload(); // 페이지 새로고침
}



$(document).ready(function () {
	// 오늘 날짜 설정
	document.getElementById('nyuryoku_ymd').valueAsDate = new Date();
	
	

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
        // formData.append("kintai_pay", $("input[name='kintai_pay']").val()); // 금액

     	// "kintai_pay"에 입력값이 없으면 null로 설정
        var kintaiPayValue = $("input[name='kintai_pay']").val();
        console.log("kintai pay is: " + kintaiPayValue);
        formData.append("kintai_pay", kintaiPayValue !== "" ? kintaiPayValue : "0"); // 금액
        
        // 체크된 체크박스의 값을 배열로 가져오기
        var selectedShainValues = [];
        $('input[name="selectedShain"]:checked').each(function() {
            selectedShainValues.push($(this).val());
        });
        
        console.log("selectedShain : " + selectedShainValues);
		
        formData.forEach(function(value, key) {
            console.log(key, value);
        });
        
        // 선택된 직원들에 대해 반복문을 통해 각각의 shain_no 값을 formData에 추가하고 Ajax 요청 보내기
        for (var i = 0; i < selectedShainValues.length; i++) {
            // 현재 선택된 직원의 shain_no 값을 formData에 추가
            formData.set('shain_no', selectedShainValues[i]);
            
            console.log([formData.entries()]);

            // Ajax를 통해 서버로 데이터 전송
            $.ajax({
                type: "POST",
                url: "/kintai/list", // 서버의 주소 또는 서블릿 매핑 주소
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    // 서버로부터의 응답을 처리
                    console.log(response);
                    location.reload(); // 페이지 새로고침 또는 초기 페이지로 이동
                },
                error: function(xhr, status, error) {
                    console.error(xhr);
                    console.error(status);
                    console.error(error);
                }
            });
        }

        //alert("データが正常に登録されました。"); // 등록 성공 시 알림창 표시
        // 폼 제출 중지 (기본 동작 방지)
        event.preventDefault();
    });
});






// !!!!!!!!!!!!!!! 관리 버튼 기능 추가!!!!!!!!!!!!!!!!
function btnDiliMntCilck(shain_no) {
    console.log(shain_no);
    openkyukaModal();
}


function openkyukaModal() {
    document.getElementById('kyukaModal').style.display = 'block';
}

</script>

<%@include file="../includes/footer.jsp"%>