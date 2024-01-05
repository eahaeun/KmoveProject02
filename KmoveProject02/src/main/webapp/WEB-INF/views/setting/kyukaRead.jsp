<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@include file="../includes/header.jsp"%>
<%@include file="../includes/menu.jsp"%>

<div id="main_container">
    <!-- 타이틀 이미지 -->
    <div class="sub_titimg">
      <ul>
        <li class="tit_img"><img src="../resources/img/dil_tit_img.gif" width="61" height="68"></li>
        <li class="p_t10"><img src="../resources/img/dil_tit_01.png" width="143" height="25" alt="휴가/근태 설정" title="휴가/근태 설정"></li>
        <li class="p_t5">給与と関連した休暇および勤怠項目の設定メニューです。会社の状況に合わせて設定することができます。</li>
      </ul>
    </div>

    <hr>
    
    <!-- 휴가 설정 리스트 -->
    <div class="main_titimg ">
      <div class="diligence_list">
        <ul class="p_b10"><img src="../resources/img/dil_tit_03.png" width="105" height="19" alt="휴가항목 설정" title="휴가항목 설정"></ul>
        <ul>
          <div id="table1">
            <div id="selecTable2">
              <p class="caption"></p>
              <ul>
                <li class="w_149 tit"><strong>休暇項目</strong></li>
                <li class="w_256 tit"><strong>適用期間</strong></li>
                <li class="w_170 tit"><strong>社員別休暇日数</strong> <span id="btnTipLeave" class="anchor"><img src="../resources/img/icon_help_s.gif" width="15px" height="14px" border="0" alt="팁" title="팁" align="absmiddle"></span></li>
                <li class="w_140 tit"><strong>使用有無</strong></li>
              </ul>


			   <c:forEach items="${kyukaList}" var="kyuka">
	              <ul class="kyuka-row" data-kyuka-km="${kyuka.kyuka_km}" style="cursor:pointer;">
	                <li class="w_129 p_l20 bold">${kyuka.kyuka_km}</li>
	                <li class="w_256 c">${kyuka.kaishi_ymd} ~ ${kyuka.shuryo_ymd}</li>
	                <li class="w_170 c"><input type="image" src="../resources/img/btn_admin.png" width="52px" height="19px" alt="관리" title="관리" onclick="$.layerProcCreate('leavCont');"></li>
	                <li class="w_140 c">
	                <c:if test="${kyuka.kyuka_active eq 'O'}"><img src="../resources/img/icon_o.gif" width="17" height="17"></c:if>
		            <c:if test="${kyuka.kyuka_active eq 'X'}"><img src="../resources/img/icon_x.gif" width="17" height="17"></c:if>
	                </li>
	              </ul>
	           </c:forEach>   
             </div>
          </div>
        </ul>
      </div><!-- diligence_list -->
      

      <!-- 휴가 설정 리스트_설정 -->
      <div class="diligence_set">	
      
		<form action="/setting/kyukaCreate" method="post" id="kyukaForm">
	        <ul class="aling_r">
	        <span id="btnLeaveHelpView" class="anchor"><img src="../resources/img/icon_help.gif" width="38" height="15" alt="도움말" vspace="8"></span></ul>
	        <ul>
	          <div id="table0">
	            <p class="caption"></p>
	            <ul>
	              <li class="w_120 c"><strong>休暇項目</strong></li>
	              <li class="con "><input name="kyuka_km" id="kyuka_km" type="text" value="" class="white" style="width:190px;" placeholder="休暇項目を入力してください"></li>
	            </ul>
	            <ul>
	              <li class="w_120 c"><strong>適用期間</strong></li>
	              <li class="con"><input name="kaishi_ymd" id="kaishi_ymd" type="date" class="text hasDatepicker" style="width:90px;"> ~ <input name="shuryo_ymd" id="shuryo_ymd" type="date" class="text hasDatepicker" style="width:90px;"></li>
	            </ul>
	            <ul>
	              <li class="w_120 c"><strong>使用有無</strong></li>
				  <li class="w_85 c">
				  <label class="label_radio r_on" for="frmLvItSta1">
				  <input name="kyuka_active" id="kyuka_active_O" value="O" type="radio" checked=""> 使用</label></li>
	           	  <li><label class="label_radio" for="frmLvItSta2">
	           	  <input name="kyuka_active" id="kyuka_active_X" value="X" type="radio">使用しない</label></li>
	            </ul>
	          </div>
	              
	        </ul>
	          
	          
	        <hr class="hr_5">
	          
	        <ul class="c">
	          <button type="submit" id="kyukaRegisterButton" style="display: none;">追加</button>
			　<button type="button" id="kyukaUpdateButton" style="display: none;">修整</button>
			　<button type="button" id="kyukaDeleteButton" style="display: none;">削除</button>
				
	          <input name="btnLvItIns" id="btnLvItIns" type="image" value="추가" src="../resources/img/btn_add.png" width="60px" height="27px" alt="추가">
	          <input name="btnLvItUpd" id="btnLvItUpd" type="image" value="수정" src="../resources/img/btn_m.png" width="60px" height="27px" alt="수정" class="p_l5">
	          <input name="btnLvItDel" id="btnLvItDel" type="image" value="삭제" src="../resources/img/btn_d.png" width="60px" height="27px" alt="삭제" class="p_l5">
	          <input name="btnLvItReset" id="btnLvItReset" type="image" value="추가" src="../resources/img/btn_e.png" width="91px" height="27px" alt="내용지우기" class="p_l5">
	         </ul>
        </form>
        
       </div>

      </div><!-- diligence_set -->







      <!-- 근태 설정 리스트 -->
      <div class="main_titimg p_t40">
        <div class="diligence_list">
          <ul class="p_b10"><img src="../resources/img/dil_tit_02.png" width="105" height="19" alt="근태항목 설정" title="근태항목 설정"></ul>
          <ul>
            <div id="table1">
              <div id="selecTable1">
                <p class="caption"></p>
                <ul id="">
                  <li class="w_149 tit"><strong>勤怠項目</strong></li>
                  <li class="w_100 tit"><strong>端数処理単位</strong></li>
                  <li class="w_155 tit"><strong>グループ管理</strong></li>
                  <li class="w_170 tit"><strong>休暇控除</strong></li>
                  <li class="w_140 tit"><strong>使用有無</strong></li>
                </ul>
                
                <c:forEach items="${kintaiList}" var="kintai">
                <ul class="kintai-row anchor" data-kintai-km="${kintai.kintai_km}">
                  <li class="w_129 p_l20 bold">${kintai.kintai_km}</li>
                  <li class="w_100 c">
	                  <c:if test="${kintai.kintai_tani eq 'D'}">日</c:if>
					  <c:if test="${kintai.kintai_tani eq 'H'}">時間</c:if>
                  </li>
                  <li class="w_155 c">${kintai.kintai_group}</li>
                  <li class="w_170 c">${kintai.kyuka_kojyo}</li>
                  <li class="w_140 c">
					<c:if test="${kintai.kintai_active eq 'O'}"><img src="../resources/img/icon_o.gif" width="17" height="17"></c:if>
		            <c:if test="${kintai.kintai_active eq 'X'}"><img src="../resources/img/icon_x.gif" width="17" height="17"></c:if>
                  </li>
                </ul>
               </c:forEach>
                
              </div>
            </div>
          </ul>
        </div>
        
        <!-- 근태 설정 리스트_설정 -->
        <div class="diligence_set">
		<form action="/setting/kintaiCreate" method="post" id="kintaiForm">
          <ul class="aling_r"><span id="btnDnLIHelpView" class="anchor"><img src="../resources/img/icon_help.gif" width="38" height="15" alt="도움말" vspace="8"></span></ul>
          <ul>
            <div id="table0">
              <p class="caption"></p>
              <ul>
                <li class="w_120 c"><strong>勤怠項目</strong></li>
                <li class="con "><input name="kintai_km" id="kintai_km" type="text" value="" class="white" style="width:190px;" placeholder="勤怠項目を入力してください"></li>
              </ul>
              <ul>
                <li style="width:83px; padding-left:37px;"><strong>単位</strong></li>
                <li class="con">
					<select name="kintai_tani" id="kintai_tani" style="width:200px;">
						<option value=" " selected disabled hidden>選択してください</option>
						<option value="D">日</option>
						<option value="H">時間</option>
					</select>
                </li>
              </ul>
              <ul>
                <li class="w_120 c"><strong>勤怠グループ</strong></li>
                <li class="con">
                  <select name="kintai_group" id="kintai_group" style="width:200px;">
						<option value=" " selected disabled hidden>選択してください</option>
						<option value="休暇">休暇</option>
						<option value="遅刻早退">遅刻早退</option>
						<option value="残業">残業</option>
						<option value="その他">その他</option>
					</select>
                </li>
              </ul>
              <ul>
                <li class="w_120 c"><strong>休暇控除</strong></li>
                <li class="con">
                <select name="kyuka_kojyo" id="kyuka_kojyo" style="width:200px;">
					<option value="${null}" selected>選択してください</option>
					<c:forEach items="${kyukaList}" var="kyuka">
						<option value="${kyuka.kyuka_km}">${kyuka.kyuka_km}</option>
					</c:forEach>
				</select>
                </li>
              </ul>
              
              <ul>
                <li class="w_120 c"><strong>使用有無</strong></li>
				<li class="w_85 c">
				  <label class="label_radio r_on" for="frmLvItSta1">
				  <input name="kintai_active" id="kintai_active_O" value="O" type="radio" checked=""> 使用</label></li>
	           	  <li><label class="label_radio" for="frmLvItSta2">
	           	  <input name="kintai_active" id="kintai_active_X" value="X" type="radio">使用しない</label></li>
              </ul>
           </div><!-- end table0 -->
                
         	</ul>
            
            
            <hr class="hr_5">
            
            <ul class="c">
            <button type="submit" id="kintaiRegisterButton" style="display: none;">追加</button>
			<button type="button" id="kintaiUpdateButton" style="display: none;">修整</button>
			<button type="button" id="kintaiDeleteButton" style="display: none;">削除</button>
			
            <input name="btnDlgnIns" id="btnDlgnIns" type="image" value="추가" src="../resources/img/btn_add.png" width="60px" height="27px" alt="추가" title="추가">
            <input name="btnDlgnUpd" id="btnDlgnUpd" type="image" value="추가" src="../resources/img/btn_m.png" width="60px" height="27px" alt="수정" title="수정" class="p_l5">
            <input name="btnDlgnDel" id="btnDlgnDel" type="image" src="../resources/img/btn_d.png" width="60px" height="27px" alt="삭제" title="삭제" class="p_l5">
            <input name="btnDlgnReset" id="btnDlgnReset" type="image" src="../resources/img/btn_e.png" width="91px" height="27px" alt="내용지우기" title="내용지우기" class="p_l5">
            </ul>
          </form>
         </div>
     </div>
</div><!-- end main container -->
	
	
	
	


<script>
// 폼 초기화 함수
function resetForm() {
    document.forms[0].reset(); // 인덱스 0은 첫 번째 폼입니다.
}

function resetForm2() {
    document.forms[1].reset(); // 인덱스 0은 첫 번째 폼입니다.
}


// 각 행에 대한 클릭 이벤트 핸들러
var target_km = "";


$('.kyuka-row').click(function () {
    // 선택한 행의 kyuka_km 값을 가져옴
    var kyuka_km = $(this).data('kyuka-km');
    target_km = kyuka_km;

    // AJAX 요청
    $.ajax({
        type: 'POST', // 또는 'GET' 등 요청 방식 선택
        url: '/setting/kyukaRead', // 컨트롤러의 URL
        data: {
            kyuka_km: kyuka_km
        },
        dataType: 'json',
        success: function (response) {
            // 성공적으로 응답을 받았을 때 수행할 동작
            console.log(response.kyuka_km,
                response.kaishi_ymd,
                response.shuryo_ymd,
                response.kyuka_active);

            $('#kyuka_km').val(response.kyuka_km);
            $('#kaishi_ymd').val(response.kaishi_ymd);
            $('#shuryo_ymd').val(response.shuryo_ymd);
            $('input[name=kyuka_active][value=' + response.kyuka_active + ']').prop('checked', true);
        },
        error: function (error) {
            // 에러가 발생했을 때 수행할 동작
            console.error(error);
        }
    });
});

// 휴가설정 "수정" 버튼 클릭 이벤트 핸들러
$('#kyukaUpdateButton').click(function() {
    console.log("modify button clicked!");
    event.preventDefault();
	
    // 입력된 값을 가져오기
    var kyuka_km = $('#kyuka_km').val();
    var kaishi_ymd = $('#kaishi_ymd').val();
    var shuryo_ymd = $('#shuryo_ymd').val();
    var kyuka_active = $('input[name=kyuka_active]:checked').val(); // 수정된 부분


    // AJAX 요청
    $.ajax({
        type: 'POST',
        url: '/setting/kyukaUpdate',
        data: {
            kyuka_km: kyuka_km,
            kaishi_ymd: kaishi_ymd,
            shuryo_ymd: shuryo_ymd,
            kyuka_active: kyuka_active,
            target_km: target_km
        },
        success: function (response) {
            // 성공적으로 응답을 받았을 때 수행할 동작
            console.log(response);
            location.reload();

            // 추가적인 동작이 필요하다면 여기에 작성
        },
        error: function (error) {
            // 에러가 발생했을 때 수행할 동작
            console.error(error);
        }
    });
});

$('#kyukaDeleteButton').click(function () {
	event.preventDefault();
    // 확인 다이얼로그 표시
    if (confirm("本当に削除しますか？")) {
        // 입력된 값을 가져오기
        var kyuka_km = $('#kyuka_km').val();

        console.log("delete button clicked!");

        // AJAX 요청
        $.ajax({
            type: 'POST',
            url: '/setting/kyukaDelete',
            data: {
                kyuka_km: kyuka_km
            },
            success: function (response) {
                // 성공적으로 응답을 받았을 때 수행할 동작
                console.log(response);
                location.reload(); // 또는 필요한 동작 수행

                // 추가적인 동작이 필요하다면 여기에 작성
            },
            error: function (error) {
                // 에러가 발생했을 때 수행할 동작
                console.error(error);
            }
        });
    }
});

// 각 행에 대한 클릭 이벤트 핸들러
var target_kintai_km = "";

$('.kintai-row').click(function () {
    // 선택한 행의 kintai_km 값을 가져옴
    var kintai_km = $(this).data('kintai-km');
    target_kintai_km = kintai_km;
    console.log("target : " + target_kintai_km);

    // AJAX 요청
    $.ajax({
        type: 'POST',
        url: '/setting/kintaiRead',
        data: {
            kintai_km: kintai_km
        },
        dataType: 'json',
        success: function (response) {
            // 성공적으로 응답을 받았을 때 수행할 동작
            console.log(
                response.kintai_km,
                response.kintai_tani,
                response.kintai_group,
                response.kintai_active
            );

            // 근태 항목과 관련된 필드의 ID를 수정
            $('#kintai_km').val(response.kintai_km);
            $('#kintai_tani').val(response.kintai_tani);
            $('#kintai_group').val(response.kintai_group);
            $('input[name=kintai_active][value=' + response.kintai_active + ']')
                .prop('checked', true);
        },
        error: function (error) {
            // 에러가 발생했을 때 수행할 동작
            console.error(error);
        }
    });
});

// 근태 항목 설정 "수정" 버튼 클릭 이벤트 핸들러
$('#kintaiUpdateButton').click(function () {
	event.preventDefault();
    // 입력된 값을 가져오기
    var kintai_km = $('#kintai_km').val();
    var kintai_tani = $('#kintai_tani').val();
    var kintai_group = $('#kintai_group').val();
    var kyuka_kojyo = $('#kyuka_kojyo').val();
    var kintai_active = $('input[name=kintai_active]:checked').val(); // 수정된 부분

    console.log("modify button clicked!" + kintai_km + kintai_tani + kintai_group + kintai_active + target_kintai_km);

    // AJAX 요청
    $.ajax({
        type: 'POST',
        url: '/setting/kintaiUpdate',
        data: {
            kintai_km: kintai_km,
            kintai_tani: kintai_tani,
            kintai_group: kintai_group,
            kyuka_kojyo: kyuka_kojyo,
            kintai_active: kintai_active,
            target_kintai_km: target_kintai_km
        },
        success: function (response) {
            // 성공적으로 응답을 받았을 때 수행할 동작
            console.log(response);
            location.reload();

            // 추가적인 동작이 필요하다면 여기에 작성
        },
        error: function (error) {
            // 에러가 발생했을 때 수행할 동작
            console.error(error);
        }
    });
});

$('#kintaiDeleteButton').click(function () {
	event.preventDefault();
    // 확인 다이얼로그 표시
    if (confirm("本当に削除しますか？")) {
        // 입력된 값을 가져오기
        var kintai_km = $('#kintai_km').val();

        console.log("delete button clicked!");

        // AJAX 요청
        $.ajax({
            type: 'POST',
            url: '/setting/kintaiDelete',
            data: {
                kintai_km: kintai_km
            },
            success: function (response) {
                // 성공적으로 응답을 받았을 때 수행할 동작
                console.log(response);
                location.reload(); // 또는 필요한 동작 수행

                // 추가적인 동작이 필요하다면 여기에 작성
            },
            error: function (error) {
                // 에러가 발생했을 때 수행할 동작
                console.error(error);
            }
        });
    }
});



//버튼4개
$("#btnLvItIns").click(function() {
    $("#kyukaRegisterButton").click();
  });

  $("#btnLvItUpd").click(function() {
    $("#kyukaUpdateButton").click();
  });

  $("#btnLvItDel").click(function() {
    $("#kyukaDeleteButton").click();
  });

  $("#btnLvItReset").click(function() {
	  event.preventDefault();
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
	  event.preventDefault();
    resetForm2();
  });
</script>


	
<%@include file="../includes/footer.jsp"%>
	
