<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@include file="../includes/modalheader.jsp"%>
<%@include file="../includes/menu.jsp"%>


<div id="main_container">
	<div class="sub_titimg">
      <ul>
        <li class="tit_img p_r7"><img src="../resources/img/resign_tit_img02.gif" width="70" height="68"></li>
        <li class="p_t10"><img src="../resources/img/resign_tit_02.png" width="201" height="25"></li>
        <li class="p_t5">退職者の退職金情報を入力し、保存し、管理するメニューです。選択した社員の退職金明細は自動的に計算されます。</li>
      </ul>
    </div>
    
    <hr>
    
    
    <div class="main_titimg">

      <!-- 사원 리스트-->
      <div class="e_total" style="overflow:visible">

        <!-- 사원 리스트 테이블 상단 메뉴  -->
        <div class="dil_search_box" style="width:100%">
          <ul class="p_t5 bold w_140 c bold">* 支給年度 : 2024年</ul>
          <ul class="p_t1">
          </ul>
          <ul class="right w_85 align_r" style="margin-right: 280px;">
            <button id="addTaishokuShainBtn" style="display:none;" data-toggle="modal" data-target="#addTaishokuShain">新規追加</button>
            <input id="btnEmployeeAdd" type="image" src="../resources/img/btn_new_pluse.png" width="74px" height="23px">
          </ul>
        </div>
        <!-- 사원 리스트 테이블 상단 메뉴//  -->

        <!-- 사원 리스트 항목 -->
        <div id="table1" style="width: 76.3%;">
          <p class="caption"></p>
          <ul>
            <li class="w_100 tit bold"><a href="#" class="c_linkblue">区分</a></li>
            <li class="w_100 tit bold"><a href="#" class="c_linkblue">氏名</a></li>
            <li class="w_100 tit bold">役職</li>
            <li class="w_100 tit bold">部署</li>
            <li class="w_200 tit bold">社員番号</li>
            <li class="w_120 tit bold">金属日数</li>
            <li class="w_150 tit bold">支給額</li>
          </ul>
        </div>
        <!-- 사원 리스트 항목// -->

        <!-- 사원 리스트 데이터 -->

        <div style="height:100px; width: 76.3%;">
          <div id="table1_retireData" style="cursor:pointer;">
			 
			    <ul id="ulRt">
			        <li class="w_100 c"></li>
			        <li class="w_100 c"></li>
			        <li class="w_100 c"></li>
			        <li class="w_100 c"></li>
			        <li class="w_200 c" id="liWorkPeriod1166593"></li>
			        <li class="w_120 con_r c_white" id="liWorkingDay1166593"></li>
			        <li class="w_150 con_r bold c_white" id="liPayAmount1166593"></li>
			    </ul>
		    
          </div>
        </div>
        <!-- 사원 리스트 데이터// -->
      </div>
      <!-- 사원 리스트// -->


	<form name="frmRetire" id="frmRetire">
	      <!-- 퇴직정보 -->
	      <div class="retire_set_box" style="background-color:#606079; width: 76%;">
	        <ul class="name">
	          <input type='hidden' id="disRtsvNumber">
	          <span class="c_yellow" name="disRtsvName" id="disRtsvName">山田太郎</span> 様の退職計算
	        </ul>
	        <ul class="p_l10 c_white bold p_t10">
	          <span class="p_l10">入社日&nbsp;&nbsp;<input name="frmRtsvSttD" id="frmRtsvSttD" type="text" value="" class="text frmCalendar hasDatepicker" style="width:70px;" maxlength="10" autocomplete="off"> ~ <a>退職日</a>&nbsp;&nbsp;<input name="frmRtsvEndD" id="frmRtsvEndD" type="text" value="" class="text frmCalendar hasDatepicker" style="width:70px;" maxlength="10" autocomplete="off"></span>
	          <span class="p_l20">勤続年数&nbsp;&nbsp;</span><span class="box" style="width:80px;"><span name="disRtsvYear" id="disRtsvYear" class="c_black bold">0</span><span class="c_black">年</span></span>
	          <span class="p_l10">勤続日数&nbsp;&nbsp;</span><span class="box" style="width:80px;"><span name="disRtsvDays" id="disRtsvDays" class="c_black bold">0</span><span class="c_black">日</span></span>
	          <span class="p_l7"><button id="btnDayCalc" type="button" class="smallBtn"><i>±</i> 勤続日数計算</button>
	        </span>
	        
	        </ul>
	      </div>
	      <!-- 퇴직정보// -->
	
	
	
	      <!-- 급여내역 & 위로금.. 정보 -->
	      <div class="retire_left">
	
	        <!-- 급여내역 정보 -->
	        <div class="height_45">
	          <li class="f_left"><img src="../resources/img/retire_tit01.png" width="65" height="19" vspace="10"></li>
	          <li class="f_left p_t15">&nbsp;(事由発生日の前最近の3ヶ月) 支給合計金額</li>
	          <li class="f_right p_t5"><a name="btnRetireInfoOk" id="btnRetireInfoOk" class="anchor"><img src="../resources/img/btn_retire_open.png" alt=" 급여내역 불러오기"></a></li>
	        </div>
	        <div id="table1">
	          <ul style="border-top:2px solid #9f9f9f;">
	            <li class="w_261  c p_t10 retire_bg bold">算定期間</li>
	            <li class="w_135  c p_t10 retire_bg bold">算定日数</li>
	            <li class="w_151  c p_t10 retire_bg bold">給与総額</li>
	          </ul>
	          
	          <ul>
	            <li class="w_261  con3"><input id="1Kikan1" type="date" class="text c frmCalendar clsGRtsvSttD hasDatepicker" style="width:100px;"> ~ <input id="1Kikan2" type="date" class="text c frmCalendar clsGRtsvEndD hasDatepicker" style="width:100px;"></li>
	            <li class="w_135  con3 b_yellow"><span id="daysDiffLabel1" class="frmDays">0</span></li>
	            <li class="w_151  con3 align_r"><input id="Kyuyosougaku1" type="text" class="text align_r frmGives" style="width:90%"></li>
	          </ul>
	          
	          <ul>
	            <li class="w_261  con3"><input id="2Kikan1" type="date" class="text c frmCalendar clsGRtsvSttD hasDatepicker" style="width:100px;"> ~ <input id="2Kikan2" type="date" class="text c frmCalendar clsGRtsvEndD hasDatepicker" style="width:100px;"></li>
	            <li class="w_135  con3 b_yellow"><span id="daysDiffLabel2" class="frmDays">0</span></li>
	            <li class="w_151  con3 align_r"><input id="Kyuyosougaku2" type="text" class="text align_r frmGives" style="width:90%"></li>
	          </ul>
	          
	          <ul>
	            <li class="w_261  con3"><input id="3Kikan1" type="date" class="text c frmCalendar clsGRtsvSttD hasDatepicker" style="width:100px;"> ~ <input id="3Kikan2" type="date" class="text c frmCalendar clsGRtsvEndD hasDatepicker" style="width:100px;"></li>
	            <li class="w_135  con3 b_yellow"><span id="daysDiffLabel3" class="frmDays">0</span></li>
	            <li class="w_151  con3 align_r"><input id="Kyuyosougaku3" type="text" class="text align_r frmGives" style="width:90%"></li>
	          </ul>
	          
	          <ul>
	            <li class="w_261  con3"><input id="4Kikan1" type="date" class="text c frmCalendar clsGRtsvSttD hasDatepicker" style="width:100px;"> ~ <input id="4Kikan2" type="date" class="text c frmCalendar clsGRtsvEndD hasDatepicker" style="width:100px;"></li>
	            <li class="w_135  con3 b_yellow"><span id="daysDiffLabel4" class="frmDays">0</span></li>
	            <li class="w_151  con3 align_r"><input id="Kyuyosougaku4" type="text" class="text align_r frmGives" style="width:90%"></li>
	          </ul>
	          
	          <ul class="b_yellow bold">
	            <li class="w_261 c p_t10">総計</li>
	            <li class="w_135 c p_t10"><span id="daysDiffLabelTotal">0</span></li>
	            <li class="w_151 align_r p_t10"><span id="total3MSikyuPay">0</span>&nbsp;&nbsp;&nbsp;</li>
	          </ul>
			 <ul style="display:inline-block; vertical-align:middle; height:22px; padding-top:5px; color:#cc6666;font-size:11px; border-left:0px;  border-bottom:0px;">ただし、途中の日付の計算の場合、該当月の支給合計金額から日数で割った値が基本として表示されます。</ul>
	        
	        <ul>
	        <!-- 급여내역 정보// -->
	        </ul>
	        </div>
	        <!-- 위로금.. 정보// -->
	
	      </div>
	      <!-- 급여내역 & 위로금.. 정보// -->
	
	      <!-- 기타 과세소득 입력 -->
	     
	
	
	      <div style="display:inline-block; vertical-align:middle; height:70px; padding-top:10px; width:100%;">
	        <p class="c" style="float: left; margin-left: 432px;"><a href="#퇴직금 계산하기"><img id="keisan" src="../resources/img/btn_retire.png" alt="퇴직금 계산하기" title="퇴직금 계산하기"></a></p>
	      </div>
	
	</form>
	
	      <!-- 퇴직금 계산 -->
	      <div class="e_total">
	
	        <!-- 퇴직금 항목 정보 -->
	        <div id="table1">
	          <p class="caption_retire_green"></p>
	          <ul>
	            <li class="c p_t10 retire_bg bold" style="width:16%;">3か月の合計</li>
	            <li class="c p_t10 retire_bg bold" style="width:16%;">1日平均給与</li>
	            <li class="c p_t10 retire_bg bold" style="width:16.4%;">1日通常給与</li>
	            <li class="c p_t10  retire_bg bold" style="width:17%;">退職所得</li>
	            <li class="c p_t10 retire_bg bold" style="width:17%;">退職年度</li>
	            <li class="c p_t10  retire_bg bold" style="width:17%;">計算税額</li><!-- 2016.01.01 이후  -->
	          </ul>
	          <ul>
	            <li class="p_t10 con_r b_yellow" style="width:16%;"><span name="disSPR3MTotal" id="one" class="SPResult">0</span>&nbsp;&nbsp;&nbsp;</li>
	            <li class="p_t10 con_r b_yellow" style="width:16%;"><span name="disSPR1DAverage" id="two" class="SPResult">0</span><span name="disSPR1MAverage" id="disSPR1MAverage" class="SPResult" style="display:none">0</span>&nbsp;&nbsp;&nbsp;</li>
	            <li class="p_t10 con_r b_yellow" style="width:16.4%;"><input type="text" name="frmSPR1MOrdinary" id="three" value="0" maxlength="12" class="text align_r clsAmount frmEtcMoney"></li>
	            <li class="p_t10 con_r b_yellow" style="width:17%;"><input name="frmSPRIncome" id="four" type="text" value="0" class="text align_r clsAmount frmEtcMoney" maxlength="12"><span name="disSPRIncome" id="disSPRIncome" class="SPResult">0</span></li>
	            <li class="p_t10 con_c b_yellow " style="width:17%;"><span name="disRtIfRtYY" id="five" class="SPResult"></span>&nbsp;&nbsp;&nbsp;</li>
	            <li class="p_t10 con_r b_yellow" style="width:17%;"><input type="text" name="frmSPR1MOrdinary" id="six" value="0" maxlength="12" class="text align_r clsAmount frmEtcMoney"></li>
	          </ul>
	         <ul>
	            <li class="c p_t10 retire_bg bold" style="width:16%;">退職所得税</li>
	            <li class="c p_t10 retire_bg bold" style="width:16%;">地方所得税</li>
	            <li class="c p_t10  retire_bg bold" style="width:16.4%;">繰延退職所得税</li>
	            <li class="c p_t10 retire_bg bold" style="width:17%;">繰延地方所得税</li>
	            <li class="c p_t10 retire_bg bold" style="width:17%;">特別交付税</li>
	            <li class="c p_t10  retire_bg bold" style="width:17%;">その他の控除</li>
	          </ul>
	          <ul>
	            <li class="p_t10 con_r b_yellow " style="width:16%;"><input name="frmSPRIncomeTax" id="seven" type="text" value="0" class="text align_r clsAmount" maxlength="12">&nbsp;&nbsp;&nbsp;</li>
	            <li class="p_t10 con_r b_yellow " style="width:16%;"><input name="frmSPRAreaTax" id="eight" type="text" value="0" class="text align_r clsAmount" maxlength="12">&nbsp;&nbsp;&nbsp;</li>
	            <li class="p_t10 con_r b_yellow " style="width:16.4%;"><input name="frmSPRAreaTax" id="nine" type="text" value="0" class="text align_r clsAmount" maxlength="12">&nbsp;&nbsp;&nbsp;</li>
	            <li class="p_t10 con_r b_yellow " style="width:17%;"><input name="frmSPRAreaTax" id="ten" type="text" value="0" class="text align_r clsAmount" maxlength="12">&nbsp;&nbsp;&nbsp;</li>
	            <li class="p_t10 con_r  " style="width:17%;"><input name="frmRtIfTxFF" id="eleven" type="text" value="0" class="text align_r clsAmount frmEtcMoney SPResult" maxlength="12"></li>
	            <li class="p_t10 con_r  " style="width:17%;"><input name="frmSPRDeduEtc" id="twelve" type="text" value="0" class="text align_r clsAmount SPResult" maxlength="12">&nbsp;&nbsp;&nbsp;</li>
	          </ul>
	        </div>
	        <!-- 퇴직금 항목 정보// -->
	        <p style="color: #cc6666; font-size:11px; padding-top:5px; clear:both">* 通常給与を入力すると、通常給与が優先して退職手当が計算されます。</p>
	
	
	        <hr class="hr_0">
	
	        <!-- 지급 정보 -->
	        <div id="table1">
	          <ul>
	            <li class="c c_white bold b_black " style="width:20%">退職金</li>
	            <li class="c c_white bold b_black" style="width:20%">源泉徴収税額</li>
	            <li class="c c_white bold b_black" style="width:20%">受取額</li>
	            <li class="c c_white bold b_black" style="width:24%">支給方法</li>
	            <li class="c c_white bold b_black" style="width:15.5%">支給日</li>
	          </ul>
	          <ul>
	            <li class="b_yellow bold con_r cell " style="width:20%"><span name="disRtIfRtPm" id="total1" class="c_red font16 SPResult">0</span> 円 &nbsp;&nbsp;&nbsp;</li>
	            <li class="b_yellow  con_r  cell" style="width:20%"><span name="disRtIfMnTx" id="total2" class="c_red font16 SPResult">0</span> 円 &nbsp;&nbsp;&nbsp;</li>
	            <li class="b_yellow   con_r cell" style="width:20%"><span name="disSPRRealTotal" id="total3" class="c_red font16 SPResult">0</span> 円 &nbsp;&nbsp;&nbsp;</li>
	            <li class=" c cell" style="width:24%"><input name="frmRtsvWays" id="frmRtsvWays" type="text" value="" class="text" maxlength="26"></li>
	            <li class=" c cell" style="width:15.4%"><input name="frmRtsvPayD" id="frmRtsvPayD" type="date" class="text frmCalendar c hasDatepicker" maxlength="10"></li>
	          </ul>
	        </div>
	        <!-- 지급 정보// -->
	
	        <hr class="hr_0">
	
	        <!-- 하단버튼(저장/취소) -->
	        <div>
	          <p class="c p_t20">
	            <input name="btnSaveOk" id="btnSaveOk" type="image" value="저장하기" src="../resources/img/btn_img_save_s.png" alt="저장하기" title="저장하기">
	            <input name="btnSaveCancel" id="btnSaveCancel" type="image" value="취소하기" src="../resources/img/btn_img_cancle_s.png" hspace="15" alt="취소하기" title="취소하기">
	          </p>
	        </div>
	        <!-- 하단버튼(저장/취소)// -->
	
	      </div>
	      <!-- 퇴직금 계산// -->
	
			<br>	
	    </div>

</div>






<!-- 퇴직급여계산할 사원선택 모달 불러오기. -->
<div class="modal" id="addTaishokuShain">
	<div class='modal-content' style="width:43%;">
		<div id="pop01" class="w_660">
		    <ul class="tit">
		      <li>퇴직급여지급 사원선택</li>
		    </ul>
		    <ul class="part">
		      <div class="pop_table w_600">
		        <p class="caption"></p>
			        <ul>
			          <li class="w_24  tit">☑</li>
			          <li class="w_100   tit"><strong>区分</strong></li>
			          <li class="w_100  tit"><strong>社員番号</strong></li>
			          <li class="w_88  tit"><strong>氏名</strong></li>
			          <li class="w_92  tit"><strong>部署</strong></li>
			          <li class="w_88  tit"><strong>役職</strong></li>
			          <li class="w_100  tit"><strong>在職状態</strong></li>
			        </ul>
		      </div>
		      
		      <div id="disContentList" class="holiday disContentList mCustomScrollbar _mCS_1" style="width:630px;">
		        <div id="table_dil_data" class="pop_table w_600">
			          <ul id="ulEmployee" style="cursor:pointer;">
			            <li class="w_24  c"><input type="checkbox" name="selectedShain"></li>
			            <li class="w_100  c">${shain.koyo_keitai}</li>
			            <li class="w_100  c">${shain.shain_no}</li>
			            <li class="w_88  c">${shain.shain_nm}</li>
			            <li class="w_92  c">${shain.busho_nm}</li>
			            <li class="w_88  c">${shain.yakushoku_nm}</li>
			            <li class="w_100  c">${shain.zaishoku_st}</li>
			          </ul>
		        </div>
		      </div>
		    </ul>
		    
		    <ul>
		      <li class="footer c">
		      	<input id="btnSelectOk" type="image" src="../resources/img/btn_select.png" width="97px" height="30px" class="p_l10 p_t10">
		      	<input id="btnSelectCancel" type="image" src="../resources/img/btn_selectcancle.png" width="97x" height="30px" class="p_l10">
		      </li>
		    </ul>
		    
		  </div>
	</div>
</div>




<script>
$(document).ready(function() {
	
	var kyuyoTotalFor3Months = 0;
	
	function formatDate(date) {
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var day = date.getDate();
        return year + "-" + (month < 10 ? "0" : "") + month + "-" + (day < 10 ? "0" : "") + day;
    }
	
	function openTaishokuModal() {
	   document.getElementById('addTaishokuShain').style.display = 'block';
	}
	
	function closeTaishokuModal() {
	   document.getElementById('addTaishokuShain').style.display = 'none';
	}//모달 열고닫힘.
	
	/* 모달 체크박스관련  */
	$("#btnSelectCancel").click(function() {
		closeTaishokuModal();
	});
	
	// 신규추가 버튼
	$("#btnEmployeeAdd").click(function() {
	    $("#addTaishokuShainBtn").click();
	});
	
	/* 신규 추가를 불렀을때 사원을 고르는 모달을 불러오기위한 스크립트 */
	$("#addTaishokuShainBtn").click(function() {
	
		// Ajax 호출
		$.ajax({
			type : "GET",
			url : "/taishoku/shainList",
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
				console.error('Error fetching employee data:', error);
			}
		});
	
	}); 
 
 
	// 받아온 데이터를 테이블에 추가하는 함수
	function renderShainTable(data) {
		$("#addTaishokuShain" + " #ulEmployee").empty(); // 기존 내용 비우기
		
		// 컨트롤러에서 받은 데이터를 'data' 변수에 저장했다고 가정합니다.
		$.each(data, function (index, shain) {
			
		    // 직원 데이터를 포함한 새로운 목록 항목을 만듭니다.
		    var listItem = $('<ul>' +
		        '<li class="w_24  c"><input type="checkbox" name="selectedShain"></li>' +
		        '<li class="w_100  c">' + shain.koyo_keitai + '</li>' +
		        '<li class="w_100  c">' + shain.shain_no + '</li>' +
		        '<li class="w_88  c">' + shain.shain_nm + '</li>' +
		        '<li class="w_92  c">' + shain.busho_nm + '</li>' +
		        '<li class="w_88  c">' + shain.yakushoku_nm + '</li>' +
		        '<li class="w_100  c">' + shain.zaishoku_st + '</li>' +
		        '</ul>');

		    // 만든 목록 항목을 'ulEmployee'에 추가합니다.
		    $("#table_dil_data #ulEmployee").append(listItem);
		});
	}
	
	
	
	
	
	// "社員選択" 버튼 클릭 시
	$("#btnSelectOk").click(function() {
		// 선택된 체크박스의 데이터를 가져와서 처리하는 로직
		var selectedShainNos = [];
		
		$("#table_dil_data #ulEmployee input[type='checkbox']:checked").each(function() {
			var shainNo = $(this).closest('ul').find('li:eq(2)').text();
            if (shainNo) { // null 또는 빈 문자열이 아닌 경우에만 추가
                selectedShainNos.push(shainNo);
            }
            console.log(selectedShainNos);
        });
       
		 // Ajax 호출하여 사원번호로 데이터 가져오기
		$.ajax({
				type : "GET",
				url : "/taishoku/getShainData",
				data : {
					selectedShainNos : selectedShainNos.join(",") 
				},
				dataType : 'json',
				success : function(data) {
					// 서버에서 받은 데이터를 처리하여 표에 추가하는 로직
					updateShainTable(data);
					console.log(data);
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
	});
	
	
	// 받아온 데이터를 테이블에 추가하는 함수
  	function updateShainTable(data) {
  		$("#table1_retireData" + " #ulRt").empty(); // 기존 내용 비우기
  		
  		// 컨트롤러에서 받은 데이터를 'data' 변수에 저장했다고 가정합니다.
  		$.each(data, function (index, shain) {
  			
  			var row = '<ul id="ulEmp">' +
  		    '<li class="w_100 c">' + shain.koyo_keitai + '</li>' +
  		    '<li class="w_100 c">' + shain.shain_nm + '</li>' +
  		    '<li class="w_100 c">' + shain.yakushoku_nm + '</li>' +
  		    '<li class="w_100 c">' + shain.busho_nm + '</li>' +
  		    '<li class="w_200 c" id="liWorkPeriod">' + shain.shain_no + '</li>' +
  		    '<li class="w_120 con_r c_white" id="liWorkingDay"></li>' +
  		    '<li class="w_150 con_r bold c_white" id="liPayAmount"></li>' +
  		    '</ul>';

  		    // 만든 목록 항목을 'ulEmployee'에 추가합니다.
  		    $("#table1_retireData #ulRt").append(row);
  		});
  	}
	
	// 사원 행 클릭
  	$("#table1_retireData #ulRt").on("click", 'ul', function () {
  	    var shainNo = $(this).find("#liWorkPeriod").text();
  	    console.log("selected shain_no : " + shainNo);
  	    
	  	  $.ajax({
	  	    type: "GET",
	  	    url: "/taishoku/getShainDataByNo",
	  	    data: {
	  	        shainNo: shainNo
	  	    },
	  	    dataType: 'json',
	  	    success: function (data) {
	  	        // 받아온 데이터를 사용하여 retirementInfo 섹션에 채워넣는 로직
	
	  	        // Convert date strings to Date objects
	  	        var nyushaDate = new Date(data.nyusha_ymd);
	  	        var taishokuDate = data.taishoku_ymd ? new Date(data.taishoku_ymd) : new Date(); // 퇴직일이 null이면 오늘 날짜로 설정
				
	  	        console.log("퇴직일 : " + data.taishoku_ymd);
	  	        // Calculate years of work (퇴사일과 입사일의 년수 차이)
	  	        var yearsOfWork = taishokuDate.getFullYear() - nyushaDate.getFullYear();
	
	  	        // Calculate days of work (퇴사일과 입사일의 일수 차이)
	  	        var millisecondsPerDay = 24 * 60 * 60 * 1000;
	  	        var daysOfWork = Math.round((taishokuDate - nyushaDate) / millisecondsPerDay);
	
	  	        // Update retirementInfo section with the received data
	  	        $("#disRtsvName").text(data.shain_nm);
	  	        $("#disRtsvNumber").val(shainNo);
	  	        $("#frmRtsvSttD").val(data.nyusha_ymd);
	  	        $("#frmRtsvEndD").val(data.taishoku_ymd);
	  	        $("#disRtsvYear").text(yearsOfWork);
	  	        $("#disRtsvDays").text(daysOfWork);
	  	    },
	  	    error: function (error) {
	  	        console.error('Error fetching employee data:', error.responseText || error.statusText || error.message || error);
	  	    }
	  	});

  	});
	

	//급여 목록 불러오기
  	$("#btnRetireInfoOk").click(function () {
  		console.log("btnRetireInfoOk clicked");
  		
  	    var taishokuDateStr = $("#frmRtsvEndD").val();
  	    var shainNo = $("#disRtsvNumber").val();
  	    var monthpay = 0;

  	    // 퇴직일 가져오기
  	    var taishokuDate = new Date(taishokuDateStr);
  	    var startDate = new Date(taishokuDate);

  	    startDate.setMonth(startDate.getMonth() - 3);

  	    console.log("1-1 맨처음날짜 : " + startDate);
  	    console.log("4-2 마지막날짜 : " + taishokuDate);

  	    for (var i = 1; i <= 4; i++) { // for문
  	        var date1 = new Date(startDate);
  	        var date2 = new Date(startDate);

  	        date1.setMonth(date1.getMonth() + i - 1);
  	        date2.setMonth(date2.getMonth() + i);
  	        date1.setDate(1);
  	        date2.setDate(0); // 말일로 설정

  	        $("#" + i + "Kikan1").val(formatDate(date1));
  	        $("#" + i + "Kikan2").val(formatDate(date2));
  	    } // for문종료

  	    taishokuDate.setDate(taishokuDate.getDate() - 1);
  	    $("#1Kikan1").val(formatDate(startDate)); // 시작일은 무조건 0-1
  	    $("#4Kikan2").val(formatDate(taishokuDate)); // 퇴직일은 무조건 3-2로 가야하기때문에

  	    var daysDiff1 = Math.round((new Date($("#1Kikan2").val()) - new Date($("#1Kikan1").val())) / (1000 * 60 * 60 * 24)) + 1;
  	    var daysDiff2 = Math.round((new Date($("#2Kikan2").val()) - new Date($("#2Kikan1").val())) / (1000 * 60 * 60 * 24)) + 1;
  	    var daysDiff3 = Math.round((new Date($("#3Kikan2").val()) - new Date($("#3Kikan1").val())) / (1000 * 60 * 60 * 24)) + 1;
  	    var daysDiff4 = Math.round((new Date($("#4Kikan2").val()) - new Date($("#4Kikan1").val())) / (1000 * 60 * 60 * 24)) + 1;
  	    var daystotal = daysDiff1 + daysDiff2 + daysDiff3 + daysDiff4;

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
  	                var daysDiffNumber = parseInt(daysDiff); // int
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

  	          	$("#total3MSikyuPay").text(total3MSikyuPay.toLocaleString());
  	            
  	          	kyuyoTotalFor3Months = total3MSikyuPay;
  	            
  	        },
  	        error: function (error) {
  	            console.error('Error fetching employee data:', error);
  	        }
  	    });
  	});

	
	
	// 퇴직금 계산 버튼 클릭
  	$("#keisan").click(function () {
  		console.log("퇴직금 계산");
  	    var kyuyoTotal = kyuyoTotalFor3Months;
  	    var daysDiffTotal = parseInt($("#daysDiffLabelTotal").text());
  	    var taishokuDateStr = $("#frmRtsvEndD").val();
  	    var taishokuDate = new Date(taishokuDateStr);
  	    var taishokuNendo = taishokuDate.getFullYear();
  	    var totalPer1DayAvr = Math.round(kyuyoTotal / daysDiffTotal);
		var daysOfWorkValue = $("#disRtsvDays").text();
		var daysOfWork = !isNaN(daysOfWorkValue) ? parseInt(daysOfWorkValue) : 0;
		var taishokuShodoku = Math.round(totalPer1DayAvr * 30 * (daysOfWork / 365));

  	    $.ajax({
  	        type: "GET",
  	        url: "/taishoku/getKoza",
  	        data: {
  	            shainNo: $("#disRtsvNumber").val()
  	        },
  	        dataType: "json",
  	        success: function (data) {
  	            var koza = data.koza_num;
  	            var ginko_nm = data.ginko_nm;
  	            
  	            taishoku_total3 = kyuyoTotal;
  	            
  	            $("#one").text(kyuyoTotal);
  	            $("#total1").text(kyuyoTotal.toLocaleString());
  	            $("#two").text(totalPer1DayAvr);
  	            $("#three, #six, #seven, #eight, #nine, #ten, #eleven, #twelve").val(0);
  	            $("#four").val(taishokuShodoku);
  	            $("#five").text(taishokuNendo);
  	            $("#total2").text(0);
  	            var total2 = parseInt($("#total2").val());
  	            var total3 = parseInt(taishokuShodoku) - parseInt(total2);
  	            $("#total3").text(kyuyoTotal.toLocaleString());  // 수정된 부분
  	            $("#frmRtsvWays").val(ginko_nm + " " + koza);
  	        },
  	        error: function (xhr, status, errorThrown) {
  	            console.error('Error fetching employee data:', errorThrown || status || xhr.statusText);
  	        }
  	    });
  	});
	
	
	
	
	//저장버튼
  	$("#btnSaveOk").click(function () {
  		console.log("저장 버튼 클릭");
 	   var shain_no = $("#disRtsvNumber").val();
 	   var sikyu_ymd = new Date($("#frmRtsvPayD").val());
        var taishoku_pay = kyuyoTotalFor3Months;
        console.log("taishoku_pay" + taishoku_pay);
     	   
 	  $.ajax({
           type: "GET",
           url: "/taishoku/saveTaishoku",
           data: {
         	  shain_no: shain_no,
         	  sikyu_ymd: formatDate(sikyu_ymd),
         	  taishoku_pay: parseInt(taishoku_pay)
           },
           success: function (data) {
         	  alert('保存に成功しました。');  // 알림창 띄우기
            
           },
           error: function (xhr, status, errorThrown) {
               console.error('Error saving taishoku data:', errorThrown || status || xhr.statusText);
               alert('保存に失敗しました。');  // 실패 시 알림창 띄우기
           }
       });
   });
	
  	var addTaishokuShain = document.getElementById('addTaishokuShain');

  	window.addEventListener('click', function(event) {
  		if (event.target === addTaishokuShain) {
  			closeTaishokuModal();
  		}
  	});
	
	
});//end document ready 


</script>
<%@include file="../includes/footer.jsp"%>