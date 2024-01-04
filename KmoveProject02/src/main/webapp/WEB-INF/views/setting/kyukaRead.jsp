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

              <ul id="LI444381" onmousedown="$.selUlLvIt(this);" style="cursor:pointer;">
                <li class="w_129 p_l20 bold">2014_연차</li>
                <li class="w_256 c">2014-01-01 ~ 2014-12-31</li>
                <li class="w_170 c"><input type="image" src="../resources/img/btn_admin.png" width="52px" height="19px" alt="관리" title="관리" onclick="$.layerProcCreate('leavCont');"></li>
                <li class="w_140 c"><img src="../resources/img/icon_x.gif" width="17" height="17" alt="0"></li>
              </ul>
              
            </div>
          </div>
        </ul>
      </div><!-- diligence_list -->
      

      <!-- 휴가 설정 리스트_설정 -->
      <div class="diligence_set">
<form name="frmResetLvIt" id="frmResetLvIt" onsubmit="return false;">
<input type="hidden" name="frmModeLvIt" id="frmModeLvIt" value="" class="text" style="width:120px;">
<input type="hidden" name="frmLvItCodeLeav" id="frmLvItCodeLeav" value="" class="text" style="width:120px;">
        <ul class="aling_r"><!--<span class="anchor" onclick="javascript:$.fn.disLeaveTable();"><img src='../resources/img/icon_pay_tip03.gif' width='118' height='30' alt='연차휴가 계산법'></span>--> <span id="btnLeaveHelpView" class="anchor"><img src="../resources/img/icon_help.gif" width="38" height="15" alt="도움말" vspace="8"></span></ul>
        <ul>
          <div id="table0">
            <p class="caption"></p>
            <ul>
              <li class="w_120 c"><strong>休暇項目</strong></li>
              <li class="con "><input name="frmLvItName" id="frmLvItName" type="text" value="" class="white" style="width:190px;" placeholder="휴가항목을 입력해주세요"></li>
            </ul>
            <ul>
              <li class="w_120 c"><strong>適用期間</strong></li>
              <li class="con"><input name="frmLvItDatS" id="frmLvItDatS" type="text" value="2024-01-01" class="text hasDatepicker" maxlength="10" style="width:90px;"> ~ <input name="frmLvItDatE" id="frmLvItDatE" type="text" value="2024-12-31" class="text hasDatepicker" maxlength="10" style="width:90px;"> <!-- <input type="image" value='그룹관리' src='../resources/img/icon_cal.gif'  width='15px' height='16px' alt='달력'  title='달력'> --></li>
            </ul>
            <ul>
              <li class="w_120 c"><strong>使用有無</strong></li>
              <li>
                <div>
                  </div></li><li class="w_85 c"><label class="label_radio r_on" for="frmLvItSta1"><input name="frmLvItStat" id="frmLvItSta1" value="1" type="radio" checked=""> 사용</label></li>
                  <li><label class="label_radio" for="frmLvItSta2"><input name="frmLvItStat" id="frmLvItSta2" value="0" type="radio">사용안함</label>
                </li></ul></div>
              
            </ul>
          
          
          <hr class="hr_5">
          
          <ul class="c">
          <input name="btnLvItIns" id="btnLvItIns" type="image" value="추가" src="../resources/img/btn_add.png" width="60px" height="27px" alt="추가">
          <input name="btnLvItUpd" id="btnLvItUpd" type="image" value="수정" src="../resources/img/btn_m.png" width="60px" height="27px" alt="수정" class="p_l5">
          <input name="btnLvItDel" id="btnLvItDel" type="image" value="삭제" src="../resources/img/btn_d.png" width="60px" height="27px" alt="삭제" class="p_l5">
          <input name="btnLvItReset" id="btnLvItReset" type="image" value="추가" src="../resources/img/btn_e.png" width="91px" height="27px" alt="내용지우기" class="p_l5"></ul>
        </form></div>

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
                  <li class="w_170 tit"><strong>休暇控除(수정要)</strong></li>
                  <li class="w_140 tit"><strong>使用有無</strong></li>
                </ul>
                <ul id="DL001" onmousedown="$.selUl(this);" class="anchor">
                  <li class="w_129 p_l20 bold">연차</li>
                  <li class="w_100 c">일</li>
                  <li class="w_155 c" groupcode="360794">휴가</li>
                  <li class="w_170 c" lvitcode="444386">2017_연차</li>
                  <li class="w_140 c"><img src="../resources/img/icon_o.gif" width="17" height="17" alt="1"></li>
                  <li class="disHide"></li>
                </ul>
                
              </div>
            </div>
          </ul>
        </div>
        
        <!-- 근태 설정 리스트_설정 -->
        <div class="diligence_set">
		<form name="frmReset" id="frmReset" onsubmit="return false;">
		<input type="hidden" name="frmMode" id="frmMode" value="" class="text" style="width:120px;">
		<input type="hidden" name="frmDlgnCode" id="frmDlgnCode" value="" class="text" style="width:120px;">
          <ul class="aling_r"><span id="btnDnLIHelpView" class="anchor"><img src="../resources/img/icon_help.gif" width="38" height="15" alt="도움말" vspace="8"></span></ul>
          <ul>
            <div id="table0">
              <p class="caption"></p>
              <ul>
                <li class="w_120 c"><strong>근태항목</strong></li>
                <li class="con "><input name="frmDlgnName" id="frmDlgnName" type="text" value="" class="white" style="width:190px;" placeholder="근태항목를 입력해주세요"></li>
              </ul>
              <ul>
                <li style="width:83px; padding-left:37px;"><strong>단위</strong></li>
                <li class="con">
                  <div class="ddOutOfVision" style="height:0px;overflow:hidden;position:absolute;" id="frmDlgnUnit_msddHolder"><select name="frmDlgnUnit" id="frmDlgnUnit" style="width:190px;">
                    <option value="">선택하세요.</option>
                    <option value="일">일</option>
                    <option value="시간">시간</option>
                  </select></div><div id="frmDlgnUnit_msdd" class="dd" style="width: 185px;"><div id="frmDlgnUnit_title" class="ddTitle"><span id="frmDlgnUnit_arrow" class="arrow"></span><span class="ddTitleText" id="frmDlgnUnit_titletext"><span class="ddTitleText">선택하세요.</span></span></div><div id="frmDlgnUnit_child" class="ddChild" style="width: 183px;"><a href="javascript:void(0);" class="selected enabled" style="[object CSSStyleDeclaration]" id="frmDlgnUnit_msa_0"><span class="ddTitleText">선택하세요.</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmDlgnUnit_msa_1"><span class="ddTitleText">일</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmDlgnUnit_msa_2"><span class="ddTitleText">시간</span></a></div></div>
                </li>
              </ul>
              <ul>
                <li class="w_120 c"><strong>근태그룹</strong></li>
                <li class="con">
                  <div class="ddOutOfVision" style="height:0px;overflow:hidden;position:absolute;" id="frmDnLIGrou_msddHolder"><select name="frmDnLIGrou" id="frmDnLIGrou" style="width:190px;">
                    <option value="">선택하세요.</option>
						<option value="360794">휴가</option>
						<option value="360797">연장근무</option>
						<option value="360795">지각조퇴</option>
						<option value="360798">특근</option>
						<option value="360796">기타</option>
                  </select></div><div id="frmDnLIGrou_msdd" class="dd" style="width: 185px;"><div id="frmDnLIGrou_title" class="ddTitle"><span id="frmDnLIGrou_arrow" class="arrow"></span><span class="ddTitleText" id="frmDnLIGrou_titletext"><span class="ddTitleText">선택하세요.</span></span></div><div id="frmDnLIGrou_child" class="ddChild" style="width: 183px;"><a href="javascript:void(0);" class="selected enabled" style="[object CSSStyleDeclaration]" id="frmDnLIGrou_msa_0"><span class="ddTitleText">선택하세요.</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmDnLIGrou_msa_1"><span class="ddTitleText">휴가</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmDnLIGrou_msa_2"><span class="ddTitleText">연장근무</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmDnLIGrou_msa_3"><span class="ddTitleText">지각조퇴</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmDnLIGrou_msa_4"><span class="ddTitleText">특근</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmDnLIGrou_msa_5"><span class="ddTitleText">기타</span></a></div></div>
                  <div class="img"><input name="btnGroupManage" id="btnGroupManage" type="image" value="그룹관리" src="../resources/img/btn_settingadmin.png" width="42px" height="20px" alt="그룹관리" title="그룹관리"></div>
                </li>
              </ul>
              <ul>
                <li class="w_120 c"><strong>휴가공제</strong></li>
                <li class="con">
                  <div class="ddOutOfVision" style="height:0px;overflow:hidden;position:absolute;" id="frmLvItCode_msddHolder"><select name="frmLvItCode" id="frmLvItCode" style="width:190px;">
                    <option value="">선택하세요.</option>
						<option value="444381">2014_연차</option>
						<option value="444382">2015_포상휴가</option>
						<option value="444383">2015_연차</option>
						<option value="444384">2016_연차</option>
						<option value="444385">2016_포상휴가</option>
						<option value="444386">2017_연차</option>
						<option value="444387">2017_포상휴가</option>
                  </select></div><div id="frmLvItCode_msdd" class="dd" style="width: 185px;"><div id="frmLvItCode_title" class="ddTitle"><span id="frmLvItCode_arrow" class="arrow"></span><span class="ddTitleText" id="frmLvItCode_titletext"><span class="ddTitleText">선택하세요.</span></span></div><div id="frmLvItCode_child" class="ddChild" style="width: 183px; height: 157px;"><a href="javascript:void(0);" class="selected enabled" style="[object CSSStyleDeclaration]" id="frmLvItCode_msa_0"><span class="ddTitleText">선택하세요.</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmLvItCode_msa_1"><span class="ddTitleText">2014_연차</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmLvItCode_msa_2"><span class="ddTitleText">2015_포상휴가</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmLvItCode_msa_3"><span class="ddTitleText">2015_연차</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmLvItCode_msa_4"><span class="ddTitleText">2016_연차</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmLvItCode_msa_5"><span class="ddTitleText">2016_포상휴가</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmLvItCode_msa_6"><span class="ddTitleText">2017_연차</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmLvItCode_msa_7"><span class="ddTitleText">2017_포상휴가</span></a></div></div>
                </li>
              </ul>
              <ul>
                <li class="w_120 c"><strong>근로시간연계</strong></li>
                <li class="con">
                  <div class="ddOutOfVision" style="height:0px;overflow:hidden;position:absolute;" id="frmDlgnWorkingHours_msddHolder"><select name="frmDlgnWorkingHours" id="frmDlgnWorkingHours" style="width:190px;">
                    <option value="">선택하세요.</option>
                    <option value="소정">소정근로</option>
                    <option value="연장">연장근로</option>
                    <option value="야간">야간근로</option>
                    <option value="휴일">휴일근로</option>
                  </select></div><div id="frmDlgnWorkingHours_msdd" class="dd" style="width: 185px;"><div id="frmDlgnWorkingHours_title" class="ddTitle"><span id="frmDlgnWorkingHours_arrow" class="arrow"></span><span class="ddTitleText" id="frmDlgnWorkingHours_titletext"><span class="ddTitleText">선택하세요.</span></span></div><div id="frmDlgnWorkingHours_child" class="ddChild" style="width: 183px;"><a href="javascript:void(0);" class="selected enabled" style="[object CSSStyleDeclaration]" id="frmDlgnWorkingHours_msa_0"><span class="ddTitleText">선택하세요.</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmDlgnWorkingHours_msa_1"><span class="ddTitleText">소정근로</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmDlgnWorkingHours_msa_2"><span class="ddTitleText">연장근로</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmDlgnWorkingHours_msa_3"><span class="ddTitleText">야간근로</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmDlgnWorkingHours_msa_4"><span class="ddTitleText">휴일근로</span></a></div></div>
                </li>
              </ul>
              <ul>
                <li class="w_120 c"><strong>사용여부</strong></li>
                <li><!--  class='con' -->
                  <div>
                    </div></li><li class="w_85 c"><label class="label_radio r_on" for="frmDlgnSta1"><input name="frmDlgnStat" id="frmDlgnSta1" value="1" type="radio" checked=""> 사용</label></li>
                    <li><label class="label_radio" for="frmDlgnSta2"><input name="frmDlgnStat" id="frmDlgnSta2" value="0" type="radio">사용안함</label></li>
                  </ul></div>
                
              </ul>
            
            
            <hr class="hr_5">
            
            <ul class="c">
            <input name="btnDlgnIns" id="btnDlgnIns" type="image" value="추가" src="../resources/img/btn_add.png" width="60px" height="27px" alt="추가" title="추가">
            <input name="btnDlgnUpd" id="btnDlgnUpd" type="image" value="추가" src="../resources/img/btn_m.png" width="60px" height="27px" alt="수정" title="수정" class="p_l5">
            <input name="btnDlgnDel" id="btnDlgnDel" type="image" src="../resources/img/btn_d.png" width="60px" height="27px" alt="삭제" title="삭제" class="p_l5">
            <input name="btnDlgnReset" id="btnDlgnReset" type="image" src="../resources/img/btn_e.png" width="91px" height="27px" alt="내용지우기" title="내용지우기" class="p_l5">
            </ul>
          </form></div>

        </div>
<div id="msgLeaveTable" title="연차휴가 계산법" class="disHide"><!-- 연차휴가 계산법-->
<div id="pop_tip00" class="pop_tip_border" style="height:443px;">
  <li class="tit"><span class="title"><img src="../resources/img/tit_pop_pay03.gif" hspace="5"></span><span class="close"><span class="close anchor" onclick="javasrcipt:$.layerHelperDelete('msgLeaveTable');"><img src="../resources/img/pop_close.gif"></span></span></li>
  <div class="tip00_con height_410">
    <table summary="연차휴가 계산법" width="99%">
    <tbody><tr>
      <td class="align_l">
        <ul class="p_b20 p_l10 p_t20">
          <div class="w_530 f_left">
            <ul class="p_b10"><img src="../resources/img/dil_tip01.gif" width="194" height="23" alt="주 40시간제 적용 사업장" title="주 40시간제 적용 사업장"></ul>
            <ul class="p5 bold c_black">연차휴가는 1년에 15일을 기본으로 하며, 3년 이상 계속 근로 시 최초 1년을 초과하는 계속 근로연수 2년에 대하여 1일의 가산연차 휴가 발생(최대 연차휴가 부여일수는 25일)</ul>
            <ul class="p5"><strong>1) 입사 1년 미만자인 경우</strong><br>
              &nbsp;&nbsp;&nbsp; 연차휴가 = 기준일(15)*(근무일수/365) = 소수 첫 자리 까지(소수 두번째 자리에서 반올림)<br>
              &nbsp;&nbsp;&nbsp;  <span class="blue">예) 2012년 2월 14일 ~ 2012년 12월 31일 만근시 : 근무일수는 322일</span><br>
              <span class="p_l30 blue">사용기간 : 2013년 1월 1일 ~ 2013년 12월 31일</span><br>
              <span class="p_l30 blue">2013년 1월 1일 연차계산시 : 13.2일 (15*(322/365))</span><br> 
            </ul>
            <ul class="p5">
              <strong>2) 입사 1년 이상자인 경우</strong><br>
              &nbsp;&nbsp;&nbsp; - 근무연도 &gt; 2 (3년 이상인 경우)<br>
              <span class="p_l20">연차휴가 = 기준일(15) + (근무 연도/2) (소수점 버림 계산)</span><br>
              <span class="p_l20 blue">예) 2009년 2월 14일 입사한 직원의 2013년 1월 1일 연차계산시 : 16일 (15+(2/2))</span><br><br>
              &nbsp;&nbsp;&nbsp; - 근무연도 &lt; 3 (3년 미만인 경우)<br>
              <span class="p_l20">연차휴가 = 기준일(15)</span>
            </ul>
            <ul class="p_b10 p_T10"><img src="../resources/img/dil_tip02.gif" width="194" height="23" alt="주 44시간제 적용 사업장" title="주 44시간제 적용 사업장" class="p_t10"></ul>
            <ul class="p5 bold c_black">연차휴가는 1년에 10일을 기본으로 하며, 2년 이상 계속 근로 시 최초 1년을 초과하는 계속 근로연수 2년에 대하여 1일의 가산연차 휴가 발생</ul>
            <ul class="p5"><strong>1) 입사 1년 미만자인 경우</strong><br>
              &nbsp;&nbsp;&nbsp;        연차휴가 = 기준일(10)*(근무일수/365) = 소수 첫 자리 까지(소수 두번째 자리에서 반올림)<br>
              &nbsp;&nbsp;&nbsp;  <span class="blue">예) 2012년 2월 14일 ~ 2012년 12월 31일 만근시 : 근무일수는 322일</span><br>
              <span class="p_l30 blue">사용기간 : 2013년 1월 1일 ~ 2013년 12월 31일</span><br>
              <span class="p_l30 blue">2013년 1월 1일 연차계산시 : 8.8일 (10*(322/365))</span><br>
            </ul>
            <ul class="p5">
              <strong>2) 입사 1년 이상자인 경우</strong><br>
              &nbsp;&nbsp;&nbsp; - 근무연도 &gt; 2 (3년 이상인 경우)<br>
              <span class="p_l20">연차휴가 = 기준일(10) + (근무 연도)</span><br>
              <span class="p_l20 blue">예) 2009년 2월 14일 입사한 직원의 2013년 1월 1일 연차계산시 : 12일 (10+2))</span><br><br>
              &nbsp;&nbsp;&nbsp; - 근무연도 &lt; 3 (3년 미만인 경우)<br>
              <span class="p_l20">연차휴가 = 기준일(10)</span>
            </ul>
          </div>
        </ul>
      </td>
    </tr>
    </tbody></table>
  </div>
</div></div>        </div>
	
	
<%@include file="../includes/footer.jsp"%>
	
