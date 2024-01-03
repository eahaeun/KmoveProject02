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
    <li class="tit_img"><img src="../resources/img/payset_tit_img.gif" width="68" height="68" alt="급여항목 설정" title="급여항목 설정"></li>
    <li class="p_t10"><img src="../resources/img/payset_tit_01.png" width="135" height="25" alt="급여항목 설정" title="급여항목 설정"></li>
    <li class="p_t5">給与に関連する支給および控除項目を設定するメニューです。企業のポリシーに合わせて設定できます。</li>
    </ul>
    </div>
    <hr>


   <!-- 지급항목 설정 리스트 -->
<div class="main_titimg">
   <div class="diligence_list">
         <ul class="p_b10"><img src="../resources/img/payset_tit_02.png" width="105" height="19" alt="지급항목 설정" title="지급항목 설정"><span style="color:#bcbcbc;font-size:11px;">(항목 수: 9개)</span></ul>
      <ul>
        <div id="table1">
          <div id="selecTable1"><!-- 테이블 셀렉터 -->
        <p class="caption"></p>
        <ul>
        <li class="w_100 tit"><strong>지급항목</strong></li>
        <li class="w_200 tit"><strong>과세여부</strong></li>
        <li class="w_105 tit"><strong>비과세한도액</strong></li>
        <li class="w_88 tit"><strong>절사단위</strong></li>
        <li class="w_150 tit"><strong>근태연결/일괄지급</strong></li>
        <li class="w_70 tit"><strong>사용여부</strong></li>
        </ul>

            <ul id="PI001" onmousedown="$.selUl(this);" class="anchor">
              <li class="w_90  bold p_l10" title="CD001">기본급</li><!-- 0 -->
              <li class="w_190 p_l10">전체과세</li>
              <li class="w_92 con_r p_r13"></li>

              <li class="w_88 c">없음</li><!-- 3 -->
              <li class="w_150 c"></li>
              <li class="w_70 c"><img src="/_commonImg/icon_o.gif" width="17" height="17" alt="1"></li>

              <li class="disHide">0</li><!-- 6-->
              <li class="disHide">Z000</li>
              <li class="disHide"></li>
              <li class="disHide">1</li><!-- 9 -->
              <li class="disHide"></li><!-- 9 -->
            </ul>
            <ul id="PI004" onmousedown="$.selUl(this);" class="anchor">
              <li class="w_90  bold p_l10" title="CD004">식비</li><!-- 0 -->
              <li class="w_190 p_l10">비과세_비과세 식사대(월 20만원 이하)</li>
              <li class="w_92 con_r p_r13">200,000</li>

              <li class="w_88 c">없음</li><!-- 3 -->
              <li class="w_150 c">일괄지급_200,000</li>
              <li class="w_70 c"><img src="/_commonImg/icon_o.gif" width="17" height="17" alt="1"></li>

              <li class="disHide">0</li><!-- 6-->
              <li class="disHide">P01</li>
              <li class="disHide">000</li>
              <li class="disHide">1</li><!-- 9 -->
              <li class="disHide"></li><!-- 9 -->
            </ul>
            <ul id="PI005" onmousedown="$.selUl(this);" class="anchor">
              <li class="w_90  bold p_l10" title="CD005">보육수당</li><!-- 0 -->
              <li class="w_190 p_l10">전체과세</li>
              <li class="w_92 con_r p_r13"></li>

              <li class="w_88 c">없음</li><!-- 3 -->
              <li class="w_150 c"></li>
              <li class="w_70 c"><img src="/_commonImg/icon_o.gif" width="17" height="17" alt="1"></li>

              <li class="disHide">0</li><!-- 6-->
              <li class="disHide">Z000</li>
              <li class="disHide"></li>
              <li class="disHide">1</li><!-- 9 -->
              <li class="disHide"></li><!-- 9 -->
            </ul>
            <ul id="PI006" onmousedown="$.selUl(this);" class="anchor">
              <li class="w_90  bold p_l10" title="CD006">직책수당</li><!-- 0 -->
              <li class="w_190 p_l10">전체과세</li>
              <li class="w_92 con_r p_r13"></li>

              <li class="w_88 c">없음</li><!-- 3 -->
              <li class="w_150 c"></li>
              <li class="w_70 c"><img src="/_commonImg/icon_o.gif" width="17" height="17" alt="1"></li>

              <li class="disHide">0</li><!-- 6-->
              <li class="disHide">Z000</li>
              <li class="disHide"></li>
              <li class="disHide">1</li><!-- 9 -->
              <li class="disHide"></li><!-- 9 -->
            </ul>
            <ul id="PI008" onmousedown="$.selUl(this);" class="anchor">
              <li class="w_90  bold p_l10" title="CD008">차량유지비</li><!-- 0 -->
              <li class="w_190 p_l10">비과세_소령§12 3(자가운전보조금)</li>
              <li class="w_92 con_r p_r13">200,000</li>

              <li class="w_88 c">없음</li><!-- 3 -->
              <li class="w_150 c"></li>
              <li class="w_70 c"><img src="/_commonImg/icon_o.gif" width="17" height="17" alt="1"></li>

              <li class="disHide">0</li><!-- 6-->
              <li class="disHide">H03</li>
              <li class="disHide"></li>
              <li class="disHide">1</li><!-- 9 -->
              <li class="disHide"></li><!-- 9 -->
            </ul>
            <ul id="PI013" onmousedown="$.selUl(this);" class="anchor">
              <li class="w_90  bold p_l10" title="CD013">근속수당</li><!-- 0 -->
              <li class="w_190 p_l10">전체과세</li>
              <li class="w_92 con_r p_r13"></li>

              <li class="w_88 c">없음</li><!-- 3 -->
              <li class="w_150 c"></li>
              <li class="w_70 c"><img src="/_commonImg/icon_o.gif" width="17" height="17" alt="1"></li>

              <li class="disHide">0</li><!-- 6-->
              <li class="disHide">Z000</li>
              <li class="disHide"></li>
              <li class="disHide">1</li><!-- 9 -->
              <li class="disHide"></li><!-- 9 -->
            </ul>
            <ul id="PI018" onmousedown="$.selUl(this);" class="anchor">
              <li class="w_90  bold p_l10" title="CD018">당직수당</li><!-- 0 -->
              <li class="w_190 p_l10">전체과세</li>
              <li class="w_92 con_r p_r13"></li>

              <li class="w_88 c">없음</li><!-- 3 -->
              <li class="w_150 c">연장근무</li>
              <li class="w_70 c"><img src="/_commonImg/icon_o.gif" width="17" height="17" alt="1"></li>

              <li class="disHide">0</li><!-- 6-->
              <li class="disHide">Z000</li>
              <li class="disHide">011</li>
              <li class="disHide">1</li><!-- 9 -->
              <li class="disHide"></li><!-- 9 -->
            </ul>
            <ul id="PI021" onmousedown="$.selUl(this);" class="anchor">
              <li class="w_90  bold p_l10" title="CD021">상여금</li><!-- 0 -->
              <li class="w_190 p_l10">전체과세</li>
              <li class="w_92 con_r p_r13"></li>

              <li class="w_88 c">없음</li><!-- 3 -->
              <li class="w_150 c"></li>
              <li class="w_70 c"><img src="/_commonImg/icon_o.gif" width="17" height="17" alt="1"></li>

              <li class="disHide">0</li><!-- 6-->
              <li class="disHide">Z000</li>
              <li class="disHide"></li>
              <li class="disHide">1</li><!-- 9 -->
              <li class="disHide"></li><!-- 9 -->
            </ul>
            <ul id="PI023" onmousedown="$.selUl(this);" class="anchor">
              <li class="w_90  bold p_l10" title="CD023">휴일수당</li><!-- 0 -->
              <li class="w_190 p_l10">전체과세</li>
              <li class="w_92 con_r p_r13"></li>

              <li class="w_88 c">없음</li><!-- 3 -->
              <li class="w_150 c">휴일근무</li>
              <li class="w_70 c"><img src="/_commonImg/icon_o.gif" width="17" height="17" alt="1"></li>

              <li class="disHide">0</li><!-- 6-->
              <li class="disHide">Z000</li>
              <li class="disHide">009</li>
              <li class="disHide">1</li><!-- 9 -->
              <li class="disHide"></li><!-- 9 -->
            </ul>
        <!-- <ul>
        <li class='w_100 c bold'>식재</li>
        <li class='w_200 c'>비과세_식대</li>
        <li class='w_105 con_r'>100,000&nbsp;&nbsp;&nbsp;</li>
        <li  class='w_88 c'>1,000원 단위</li>
        <li  class='w_150 c'>일괄_100,000</li>
        <li  class='w_70 c'><img src='/_commonImg/icon_x.gif' width='17' height='17'></li>
        </ul> -->
        </div>
        </div>
      </ul>

    </div>
   <!-- 지급항목_설정 -->
   <div class="diligence_set">
      <ul class="aling_r"><!--<a href="#none" onclick="javascript:$.disTaxTableReadOnly();"><img src='/_commonImg/icon_pay_tip01.gif' width='160' height='30' alt='비과세 및 감면 소득 코드'></a>--><span id="btnPayItemHelpView" class="anchor"><img src="https://img.payzon.co.kr/_commonImg/icon_help.gif" width="38" height="15" alt="도움말" vspace="8"></span></ul>
      <ul>
<form name="frm01Reset" id="frm01Reset" onsubmit="return false;">
<input type="hidden" name="frmMode" id="frmMode" value="" class="text" style="width:120px;">
<input type="hidden" name="frmGiveCode" id="frmGiveCode" value="" class="text" style="width:120px;">
<input type="hidden" name="frmGiveTxCd" id="frmGiveTxCd" value="Z000" class="text" style="width:120px;">
        <div id="table0">
        <p class="caption"></p>
        <ul>
        <li class="w_120 c"><strong>지급항목</strong></li>
        <li class="con "><input name="frmGiveName" id="frmGiveName" type="text" placeholder="지급 항목를 입력해주세요." class="white" style="width:190px;"></li>
        </ul>
        <ul>
        <li class="w_120 c"><strong>과세여부</strong></li>
        <div><!-- <li> -->
          <li class="w_85 c"><label class="label_radio r_on" for="frmTaxFull"><input name="frmGiveTxTy" id="frmTaxFull" type="radio" value="전체과세" checked="checked"> 전체과세</label></li>
          <li><label class="label_radio" for="frmTaxFree"><input name="frmGiveTxTy" id="frmTaxFree" type="radio" value="비과세"> 비과세</label></li>
        </div><!-- </li> -->
        </ul>
        <ul>
          <li class="w_120 c"><strong>비과세명</strong></li>
          <li class="con"><input type="text" name="frmGiveTxNm" id="frmGiveTxNm" value="" class="white" style="width:190px;" readonly="">
          </li>
        </ul>
        <ul id="disGiveTxLA">
        <li class="w_120 c"><strong>비과세 한도액</strong></li>
        <li class="con"><input name="frmGiveTxLA" id="frmGiveTxLA" type="text" value="0" class="white clsAmount" style="width:170px;text-align:right;" disabled=""> 원</li>
        </ul>
        <ul>
          <li class="w_120 c"><strong>계산방법</strong></li>
          <li class="con"><input type="text" name="frmGiveCalc" id="frmGiveCalc" placeholder="계산방법을 입력해주세요." class="white" style="width:190px;"></li>
        </ul>
        <ul>
        <li class="w_120 c"><strong>절사단위</strong></li>
        <li class="con">
          <div class="ddOutOfVision" style="height:0px;overflow:hidden;position:absolute;" id="frmGive_Cut_msddHolder"><select name="frmGive_Cut" id="frmGive_Cut" style="width:200px;">
           <!-- <option value="">선택하세요.</option> -->
           <option value="0">없음</option>
           <option value="1">1원 단위</option>
           <option value="2">10원 단위</option>
           <option value="3">100원 단위</option>
          </select></div><div id="frmGive_Cut_msdd" class="dd" style="width: 195px;"><div id="frmGive_Cut_title" class="ddTitle"><span id="frmGive_Cut_arrow" class="arrow"></span><span class="ddTitleText" id="frmGive_Cut_titletext"><span class="ddTitleText">없음</span></span></div><div id="frmGive_Cut_child" class="ddChild" style="width: 193px;"><a href="javascript:void(0);" class="selected enabled" style="[object CSSStyleDeclaration]" id="frmGive_Cut_msa_0"><span class="ddTitleText">없음</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmGive_Cut_msa_1"><span class="ddTitleText">1원 단위</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmGive_Cut_msa_2"><span class="ddTitleText">10원 단위</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmGive_Cut_msa_3"><span class="ddTitleText">100원 단위</span></a></div></div>
        </li>
        </ul>


        <ul>
        <li class="w_120 c"><strong>근태연결/일괄지급</strong></li>
        <li class="con">
          <div class="ddOutOfVision" style="height:0px;overflow:hidden;position:absolute;" id="frmGiveDnlR_msddHolder"><select name="frmGiveDnlR" id="frmGiveDnlR" style="width:200px;">
           <option value="">선택하세요.</option>
<option value="001">연차</option><option value="003">반차</option><option value="004">지각</option><option value="005">조퇴</option><option value="006">외근</option><option value="009">휴일근무</option><option value="011">연장근무</option><option value="012">포상휴가</option><option value="013">야간근무</option><option value="014">청원휴가</option>             <option value="000">일괄지급</option>
          </select></div><div id="frmGiveDnlR_msdd" class="dd" style="width: 195px;"><div id="frmGiveDnlR_title" class="ddTitle"><span id="frmGiveDnlR_arrow" class="arrow" style="background-position: 0px 0px;"></span><span class="ddTitleText" id="frmGiveDnlR_titletext"><span class="ddTitleText">선택하세요.</span></span></div><div id="frmGiveDnlR_child" class="ddChild" style="width: 193px; height: 157px;"><a href="javascript:void(0);" class="selected enabled" style="[object CSSStyleDeclaration]" id="frmGiveDnlR_msa_0"><span class="ddTitleText">선택하세요.</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmGiveDnlR_msa_1"><span class="ddTitleText">연차</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmGiveDnlR_msa_2"><span class="ddTitleText">반차</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmGiveDnlR_msa_3"><span class="ddTitleText">지각</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmGiveDnlR_msa_4"><span class="ddTitleText">조퇴</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmGiveDnlR_msa_5"><span class="ddTitleText">외근</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmGiveDnlR_msa_6"><span class="ddTitleText">휴일근무</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmGiveDnlR_msa_7"><span class="ddTitleText">연장근무</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmGiveDnlR_msa_8"><span class="ddTitleText">포상휴가</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmGiveDnlR_msa_9"><span class="ddTitleText">야간근무</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmGiveDnlR_msa_10"><span class="ddTitleText">청원휴가</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmGiveDnlR_msa_11"><span class="ddTitleText">일괄지급</span></a></div></div>
        </li>
        </ul>
        <ul id="disGiveGivt" class="disHide">
          <li class="w_120 c"><strong>일괄지급액</strong></li>
          <li class="con"><input name="frmGiveGivt" id="frmGiveGivt" type="text" value="" class="white" style="width:170px;text-align:right;"> 원</li>
        </ul>
        <ul>
        <li class="w_120 c"><strong>사용여부</strong></li>
        <!-- <li class='con'> -->
          <div>
            <li class="w_85 c"><label class="label_radio r_on" for="frmGiveSta1"><input name="frmGiveStat" id="frmGiveSta1" value="1" type="radio" checked=""> 사용</label></li>
            <li><label class="label_radio" for="frmGiveSta2"><input name="frmGiveStat" id="frmGiveSta2" value="0" type="radio">사용안함</label></li>
          </div>
        <!-- </li> -->
        </ul>

      </div></form></ul>
      <hr class="hr_5">
      <ul class="c"><input name="btnPayItemIns" id="btnPayItemIns" type="image" value="추가" src="/_commonImg/btn_add.gif" width="60px" height="27px" alt="추가"><input name="btnPayItemUpd" id="btnPayItemUpd" type="image" value="추가" src="/_commonImg/btn_m.gif" width="60px" height="27px" alt="수정" class="p_l5"><input name="btnPayItemDel" id="btnPayItemDel" type="image" value="추가" src="/_commonImg/btn_d.gif" width="60px" height="27px" alt="삭제" class="p_l5"><a href="#none" onclick="javascript:$.frmInit()"><img src="/_commonImg/btn_e.gif" width="91px" height="27px" alt="내용지우기" class="p_l5"></a></ul>
    </div>
  </div>



  <!-- 공제항목 설정 리스트 -->
<div class="main_titimg p_t50">
   <div class="diligence_list">
         <ul class="p_b10"><img src="../resources/img/payset_tit_03.png" width="105" height="19" alt="공제항목 설정" title="공제항목 설정"><span style="color:#bcbcbc;font-size:11px;">(항목 수: 8개)</span></ul>
      <ul>
        <div id="table1">
          <div id="selecTable2"><!-- 테이블 셀렉터 -->
        <p class="caption"></p>
        <ul>
          <li class="w_150 tit"><strong>공제항목</strong></li>
          <li class="w_150 tit"><strong>절사단위</strong></li>
          <li class="w_140 tit"><strong>사용여부</strong></li>
          <li class="w_275 tit"><strong>비고</strong></li>
        </ul>

        <ul id="DS001" onmousedown="$.selUl02(this);" class="anchor">
          <li class="w_140 bold p_l10" title="CD001">국민연금</li>
          <li class="w_150 c">없음</li>
          <li class="w_140 c"><img src="/_commonImg/icon_o.gif" width="17" height="17" alt="1"></li>
          <li class="w_265 p_l10">기본항목</li>
          <li class="disHide">0</li>
          <li class="disHide">1</li>
          <li class="disHide"></li>
        </ul>
        <ul id="DS002" onmousedown="$.selUl02(this);" class="anchor">
          <li class="w_140 bold p_l10" title="CD002">건강보험</li>
          <li class="w_150 c">1원 단위</li>
          <li class="w_140 c"><img src="/_commonImg/icon_o.gif" width="17" height="17" alt="1"></li>
          <li class="w_265 p_l10">기본항목</li>
          <li class="disHide">1</li>
          <li class="disHide">1</li>
          <li class="disHide"></li>
        </ul>
        <ul id="DS003" onmousedown="$.selUl02(this);" class="anchor">
          <li class="w_140 bold p_l10" title="CD003">장기요양보험</li>
          <li class="w_150 c">1원 단위</li>
          <li class="w_140 c"><img src="/_commonImg/icon_o.gif" width="17" height="17" alt="1"></li>
          <li class="w_265 p_l10">기본항목</li>
          <li class="disHide">1</li>
          <li class="disHide">1</li>
          <li class="disHide"></li>
        </ul>
        <ul id="DS004" onmousedown="$.selUl02(this);" class="anchor">
          <li class="w_140 bold p_l10" title="CD004">고용보험</li>
          <li class="w_150 c">1원 단위</li>
          <li class="w_140 c"><img src="/_commonImg/icon_o.gif" width="17" height="17" alt="1"></li>
          <li class="w_265 p_l10">기본항목</li>
          <li class="disHide">1</li>
          <li class="disHide">1</li>
          <li class="disHide"></li>
        </ul>
        <ul id="DS005" onmousedown="$.selUl02(this);" class="anchor">
          <li class="w_140 bold p_l10" title="CD005">소득세</li>
          <li class="w_150 c">1원 단위</li>
          <li class="w_140 c"><img src="/_commonImg/icon_o.gif" width="17" height="17" alt="1"></li>
          <li class="w_265 p_l10">기본항목</li>
          <li class="disHide">1</li>
          <li class="disHide">1</li>
          <li class="disHide"></li>
        </ul>
        <ul id="DS006" onmousedown="$.selUl02(this);" class="anchor">
          <li class="w_140 bold p_l10" title="CD006">지방소득세</li>
          <li class="w_150 c">1원 단위</li>
          <li class="w_140 c"><img src="/_commonImg/icon_o.gif" width="17" height="17" alt="1"></li>
          <li class="w_265 p_l10">기본항목</li>
          <li class="disHide">1</li>
          <li class="disHide">1</li>
          <li class="disHide"></li>
        </ul>
        <ul id="DS007" onmousedown="$.selUl02(this);" class="anchor">
          <li class="w_140 bold p_l10" title="CD007">상조회비</li>
          <li class="w_150 c">없음</li>
          <li class="w_140 c"><img src="/_commonImg/icon_o.gif" width="17" height="17" alt="1"></li>
          <li class="w_265 p_l10">사용자 추가항목</li>
          <li class="disHide">0</li>
          <li class="disHide">1</li>
          <li class="disHide"></li>
        </ul>
        <ul id="DS011" onmousedown="$.selUl02(this);" class="anchor">
          <li class="w_140 bold p_l10" title="CD011">연말정산</li>
          <li class="w_150 c">1원 단위</li>
          <li class="w_140 c"><img src="/_commonImg/icon_x.gif" width="17" height="17" alt="0"></li>
          <li class="w_265 p_l10">사용자 추가항목</li>
          <li class="disHide">1</li>
          <li class="disHide">0</li>
          <li class="disHide"></li>
        </ul>
        </div>
      </div></ul>

    </div>

   <!-- 공제항목 설정 리스트_설정 -->
   <div class="diligence_set">
      <ul class="aling_r"><a href="#none" onclick="javascript:$.disHelper('msgDedSItem', 659, 492);"><img src="/_commonImg/icon_pay_tip02.gif" width="133" height="30" alt="공제항목 산정기준"></a><span id="btnDedSItemHelpView" class="anchor"><img src="https://img.payzon.co.kr/_commonImg/icon_help.gif" width="38" height="15" alt="도움말" vspace="8"></span></ul>
      <ul>
<form name="frm02Reset" id="frm02Reset" onsubmit="return false;">
<input type="hidden" name="frm02Mode" id="frm02Mode" value="" class="text" style="width:120px;">
<input type="hidden" name="frmDedSCode" id="frmDedSCode" value="" class="text" style="width:120px;">
        <div id="table0">
        <p class="caption"></p>
        <ul>
          <li class="w_120 c"><strong>공제항목</strong></li>
          <li class="con"><input name="frmDedSName" id="frmDedSName" type="text" placeholder="공제항목를 입력해주세요." class="white" style="width:190px;"></li>
        </ul>
        <ul>
          <li class="w_120 c"><strong>계산방법</strong></li>
          <li class="con"><input name="frmDedSCalc" id="frmDedSCalc" type="text" placeholder="계산방법을 입력해주세요." class="white" style="width:250px;">
            <p style="display:none;"><input type="checkbox" name="frmCalcEx" id="frmCalcEx" style="vertical-align: middle;"> 예시) 간이세액표 적용</p>
          </li>
        </ul>
        <ul>
          <li class="w_120 c"><strong>절사단위</strong></li>
          <li class="con">
            <div class="ddOutOfVision" style="height:0px;overflow:hidden;position:absolute;" id="frmDedS_Cut_msddHolder"><select name="frmDedS_Cut" id="frmDedS_Cut" style="width:190px;">
              <!-- <option value="">선택하세요.</option> -->
              <option value="0">없음</option>
              <option value="1">1원 단위</option>
              <option value="2">10원 단위</option>
              <option value="3">100원 단위</option>
            </select></div><div id="frmDedS_Cut_msdd" class="dd" style="width: 185px;"><div id="frmDedS_Cut_title" class="ddTitle"><span id="frmDedS_Cut_arrow" class="arrow"></span><span class="ddTitleText" id="frmDedS_Cut_titletext"><span class="ddTitleText">없음</span></span></div><div id="frmDedS_Cut_child" class="ddChild" style="width: 183px;"><a href="javascript:void(0);" class="selected enabled" style="[object CSSStyleDeclaration]" id="frmDedS_Cut_msa_0"><span class="ddTitleText">없음</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmDedS_Cut_msa_1"><span class="ddTitleText">1원 단위</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmDedS_Cut_msa_2"><span class="ddTitleText">10원 단위</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmDedS_Cut_msa_3"><span class="ddTitleText">100원 단위</span></a></div></div>
          </li>
        </ul>
        <ul>
          <li class="w_120 c"><strong>비고</strong></li>
          <li class="con"><input name="frmDedSNote" id="frmDedSNote" type="text" value="" class="white" style="width:190px;"></li>
        </ul>
        <ul>
        <li class="w_120 c"><strong>사용여부</strong></li>
        <!-- <li class='con'> -->
          <div>
            <li class="w_85 c"><label class="label_radio r_on" for="frmDedSSta1"><input name="frmDedSStat" id="frmDedSSta1" value="1" type="radio" checked=""> 사용</label></li>
            <li><label class="label_radio" for="frmDedSSta2"><input name="frmDedSStat" id="frmDedSSta2" value="0" type="radio">사용안함</label></li>
          </div>
        <!-- </li> -->
        </ul>
        </div>
        </form></ul>
        <hr class="hr_5">
      <ul class="c p_t10"><input name="btnDedSItemIns" id="btnDedSItemIns" type="image" value="추가" src="/_commonImg/btn_add.gif" width="60px" height="27px" alt="추가"><input name="btnDedSItemUpd" id="btnDedSItemUpd" type="image" value="수정" src="/_commonImg/btn_m.gif" width="60px" height="27px" alt="수정" class="p_l5"><input name="btnDedSItemDel" id="btnDedSItemDel" type="image" value="삭제" src="/_commonImg/btn_d.gif" width="60px" height="27px" alt="삭제" class="p_l5"><a href="#none" onclick="javascript:$.frm02Init()"><img src="/_commonImg/btn_e.gif" width="91px" height="27px" alt="내용지우기" class="p_l5"></a></ul>

  </div>
</div>
<hr class="hr_50">
  </div>











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