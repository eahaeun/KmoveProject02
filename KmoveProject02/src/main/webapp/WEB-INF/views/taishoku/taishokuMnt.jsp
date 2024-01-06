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
            <input name="btnEmployeeAdd" id="btnEmployeeAdd" type="image" src="../resources/img/btn_new_pluse.png" width="74px" height="23px">
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
            <li class="w_200 tit bold">算定期間</li>
            <li class="w_120 tit bold">金属日数</li>
            <li class="w_150 tit bold">支給額</li>
          </ul>
        </div>
        <!-- 사원 리스트 항목// -->

        <!-- 사원 리스트 데이터 -->

        <div style="height:100px; width: 76.3%;">
          <div id="table1_retireData" style="cursor:pointer;">
	        <c:forEach items="${gsl}" var="shain">
			    <ul id="ulRt" class="sell_bg">
			        <li class="w_100 c c_white">${shain.koyo_keitai}</li>
			        <li class="w_100 c c_white">${shain.shain_nm}</li>
			        <li class="w_100 c c_white">${shain.busho_nm}</li>
			        <li class="w_100 c c_white">${shain.yakushoku_nm}</li>
			        <li class="w_200 c c_white" id="liWorkPeriod1166593"></li>
			        <li class="w_120 con_r c_white" id="liWorkingDay1166593"></li>
			        <li class="w_150 con_r bold c_white" id="liPayAmount1166593"></li>
			    </ul>
			 </c:forEach>
			 
			    <ul id="ulRt">
			        <li class="w_100 c">正社員</li>
			        <li class="w_100 c">山田太郎</li>
			        <li class="w_100 c">主任</li>
			        <li class="w_100 c">営業部</li>
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
	          <span class="c_yellow" name="disRtsvName" id="disRtsvName">山田太郎</span> <span name="disRtsvPstn" id="disRtsvPstn">主任</span> 退職計算
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
	            <li class="w_261  con3"><input name="frmRtsvSttD1" id="frmRtsvSttD1" type="text" value="" class="text c frmCalendar clsGRtsvSttD hasDatepicker" style="width:100px;" maxlength="10"> ~ <input name="frmRtsvEndD1" id="frmRtsvEndD1" type="text" value="" class="text c frmCalendar clsGRtsvEndD hasDatepicker" style="width:100px;" maxlength="10"></li>
	            <li class="w_135  con3 b_yellow"><span name="disRtpsDays1" id="disRtpsDays1" class="frmDays">0</span></li>
	            <li class="w_151  con3 align_r"><input name="frmRtpsPays1" id="frmRtpsPays1" type="text" value="" class="text align_r frmGives" maxlength="10" style="width:90%"></li>
	          </ul>
	          <ul>
	            <li class="w_261  con3"><input name="frmRtsvSttD2" id="frmRtsvSttD2" type="text" value="" class="text c frmCalendar clsGRtsvSttD hasDatepicker" style="width:100px;" maxlength="10"> ~ <input name="frmRtsvEndD2" id="frmRtsvEndD2" type="text" value="" class="text c frmCalendar clsGRtsvEndD hasDatepicker" style="width:100px;" maxlength="10"></li>
	            <li class="w_135  con3 b_yellow"><span name="disRtpsDays2" id="disRtpsDays2" class="frmDays">0</span></li>
	            <li class="w_151  con3 align_r"><input name="frmRtpsPays2" id="frmRtpsPays2" type="text" value="" class="text align_r frmGives" maxlength="10" style="width:90%"></li>
	          </ul>
	          <ul>
	            <li class="w_261  con3"><input name="frmRtsvSttD3" id="frmRtsvSttD3" type="text" value="" class="text c frmCalendar clsGRtsvSttD hasDatepicker" style="width:100px;" maxlength="10"> ~ <input name="frmRtsvEndD3" id="frmRtsvEndD3" type="text" value="" class="text c frmCalendar clsGRtsvEndD hasDatepicker" style="width:100px;" maxlength="10"></li>
	            <li class="w_135  con3 b_yellow"><span name="disRtpsDays3" id="disRtpsDays3" class="frmDays">0</span></li>
	            <li class="w_151  con3 align_r p_r7"><input name="frmRtpsPays3" id="frmRtpsPays3" type="text" value="" class="text align_r frmGives" maxlength="10" style="width:90%"></li>
	          </ul>
	          <ul>
	            <li class="w_261  con3"><input name="frmRtsvSttD4" id="frmRtsvSttD4" type="text" value="" class="text c frmCalendar clsGRtsvSttD hasDatepicker" style="width:100px;" maxlength="10"> ~ <input name="frmRtsvEndD4" id="frmRtsvEndD4" type="text" value="" class="text c frmCalendar clsGRtsvEndD hasDatepicker" style="width:100px;" maxlength="10"></li>
	            <li class="w_135  con3 b_yellow"><span name="disRtpsDays4" id="disRtpsDays4" class="frmDays">0</span></li>
	            <li class="w_151  con3 align_r"><input name="frmRtpsPays4" id="frmRtpsPays4" type="text" value="" class="text align_r frmGives" maxlength="10" style="width:90%"></li>
	          </ul>
	          <ul class="b_yellow bold">
	            <li class="w_261 c p_t10">총 합계</li>
	            <li class="w_135 c p_t10"><span name="disRtpsDayT" id="disRtpsDayT">0</span></li>
	            <li class="w_151 align_r p_t10"><span name="disRtpsPayT" id="disRtpsPayT">0</span>&nbsp;&nbsp;&nbsp;</li>
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
	        <p class="c" style="float: left; margin-left: 432px;"><a href="#퇴직금 계산하기"><img src="../resources/img/btn_retire.png" alt="퇴직금 계산하기" title="퇴직금 계산하기"></a></p>
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
	            <li class="p_t10 con_r b_yellow" style="width:16%;"><span name="disSPR3MTotal" id="disSPR3MTotal" class="SPResult">0</span>&nbsp;&nbsp;&nbsp;</li>
	            <li class="p_t10 con_r b_yellow" style="width:16%;"><span name="disSPR1DAverage" id="disSPR1DAverage" class="SPResult">0</span><span name="disSPR1MAverage" id="disSPR1MAverage" class="SPResult" style="display:none">0</span>&nbsp;&nbsp;&nbsp;</li>
	            <li class="p_t10 con_r b_yellow" style="width:16.4%;"><input type="text" name="frmSPR1MOrdinary" id="frmSPR1MOrdinary" value="0" maxlength="12" class="text align_r clsAmount frmEtcMoney"></li>
	            <li class="p_t10 con_r b_yellow" style="width:17%;"><input name="frmSPRIncome" id="frmSPRIncome" type="text" value="0" class="text align_r clsAmount frmEtcMoney" maxlength="12"><span name="disSPRIncome" id="disSPRIncome" class="SPResult">0</span></li>
	            <li class="disHide"><input name="frmSPRIncomeCmp" id="frmSPRIncomeCmp" type="text" value="0" maxlength="12" class="align_r"></li>
	            <li class="p_t10 con_c b_yellow " style="width:17%;"><span name="disRtIfRtYY" id="disRtIfRtYY" class="SPResult"></span>&nbsp;&nbsp;&nbsp;</li>
	            <!-- <li class="p_t10 con_r b_yellow " style='width:17%;'><span name="disRtIfTx15" id="disRtIfTx15" class="SPResult">0</span>&nbsp;&nbsp;&nbsp;</li> -->
	            <li class="p_t10 con_r b_yellow " style="width:17%;"><span name="disRtIfTx15" id="disRtIfTx15" class="SPResult" style="display:none">0</span><span name="disRtIfTx16" id="disRtIfTx16" class="SPResult">0</span>&nbsp;&nbsp;&nbsp;</li>
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
	            <li class="p_t10 con_r b_yellow " style="width:16%;"><input name="frmSPRIncomeTax" id="frmSPRIncomeTax" type="text" value="0" class="text align_r clsAmount" maxlength="12">&nbsp;&nbsp;&nbsp;</li>
	            <li class="p_t10 con_r b_yellow " style="width:16%;"><input name="frmSPRAreaTax" id="frmSPRAreaTax" type="text" value="0" class="text align_r clsAmount" maxlength="12">&nbsp;&nbsp;&nbsp;</li>
	            <li class="p_t10 con_r b_yellow" style="width:16.4%;"><span name="disRtIfDpIc" id="disRtIfDpIc" class="SPResult">0</span>&nbsp;&nbsp;&nbsp;</li>
	            <li class="p_t10 con_r b_yellow " style="width:17%;"><span name="disRtIfDpAI" id="disRtIfDpAI" class="SPResult">0</span>&nbsp;&nbsp;&nbsp;</li>
	            <li class="p_t10 con_r  " style="width:17%;"><input name="frmRtIfTxFF" id="frmRtIfTxFF" type="text" value="0" class="text align_r clsAmount frmEtcMoney SPResult" maxlength="12"></li>
	            <li class="p_t10 con_r  " style="width:17%;"><input name="frmSPRDeduEtc" id="frmSPRDeduEtc" type="text" value="0" class="text align_r clsAmount SPResult" maxlength="12">&nbsp;&nbsp;&nbsp;</li>
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
	            <li class="b_yellow bold con_r cell " style="width:20%"><span name="disRtIfRtPm" id="disRtIfRtPm" class="c_red font16 SPResult">0</span> 원 &nbsp;&nbsp;&nbsp;</li>
	            <li class="b_yellow  con_r  cell" style="width:20%"><span name="disRtIfMnTx" id="disRtIfMnTx" class="c_red font16 SPResult">0</span> 원 &nbsp;&nbsp;&nbsp;</li>
	            <li class="b_yellow   con_r cell" style="width:20%"><span name="disSPRRealTotal" id="disSPRRealTotal" class="c_red font16 SPResult">0</span> 원 &nbsp;&nbsp;&nbsp;</li>
	            <li class=" c cell" style="width:24%"><input name="frmRtsvWays" id="frmRtsvWays" type="text" value="" class="text" maxlength="26"></li>
	            <li class=" c cell" style="width:15.4%"><input name="frmRtsvPayD" id="frmRtsvPayD" type="text" value="" class="text frmCalendar c hasDatepicker" maxlength="10"></li>
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


<%@include file="../includes/footer.jsp"%>