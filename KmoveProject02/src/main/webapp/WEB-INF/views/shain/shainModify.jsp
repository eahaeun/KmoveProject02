<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@include file="../includes/modalheader.jsp"%>
<%@include file="../includes/menu.jsp"%>

<script>
function triggerFileInput() {
	console.log("사진 등록");
	document.getElementById('fileInput').click();
}
</script>

<div id="main_container">
    <div class="sub_titimg">
	  <ul>
	    <li class="tit_img p_r7"><img src="../resources/img/eadmin_tit_img.gif" width="70" height="68"></li>
	    <li class="p_t10  "><img src="../resources/img/emreg_tit_01.png" width="108" height="24" alt="사원등록" title="사원등록"></li>
	    <li class="p_t5 ">社員情報を登録するメニューです。該当する項目のみ入力してください。<span class="tit_h">（*は必須入力事項）</span>   </li>
	  </ul>
	  </div><!-- end subtitimg -->
    
    <hr>
    
    
    
    <!-- 사진... -->
    <div class="emreg_lt">
    <form action="/shain/shainModify" method="post" enctype="multipart/form-data">
          <ul class="em_photo w_120">
            <li class="border_box b_gray ph">
            	<img id="previewImage" src="/shain/display?shain_no=${shain.shain_no}" style="width:93px;" vspace="10">
            </li>
            
            <li class="p_t10 c">
           		<input type="file" id="fileInput" name="uploadFile" multiple style="opacity: 0; position: absolute; top: 0; left: 0;">
            	<input name="btnEmplPhotoIns" id="btnEmplPhotoIns" type="button" value="등록" class="btn" onclick="triggerFileInput()">
            	<input name="btnEmplPhotoDel" id="btnEmplPhotoDel" type="button" value="삭제" class="btn">
            </li>
          </ul>
    </div>
    
    
    
    <div class="emreg_rt">
    <!-- //폼.입력.기본정보 -->
    <ul id="lblBsic"><img src="../resources/img/emreg_tit_02.png" width="63px" height="19px" vspace="8" hspace="5" border="0" alt="기본정보" title="기본정보"></ul>
    
    <ul>
      <div id="table1"><!-- //divBsic -->
      <p class="caption"></p>
      <ul>
        <li class="titLeft p_l28" style="width:77px;"><strong>社員番号</strong></li>
        <li class="w_275 con2"><input name="shain_no" id="shain_no" value="${shain.shain_no}" type="text" class="white"></li>
        <li class="titLeft p_l15" style="width:90px;"><font class="c_red">*</font> 雇用形態</li>
        <li class="w_276 con2">
          <select name="koyo_keitai" id="koyo_keitai">
			<option value="正社員" ${'正社員' eq shain.koyo_keitai ? 'selected' : ''}>正社員</option>
			<option value="契約社員" ${'契約社員' eq shain.koyo_keitai ? 'selected' : ''}>契約社員</option>
			<option value="臨時社員" ${'臨時社員' eq shain.koyo_keitai ? 'selected' : ''}>臨時社員</option>
			<option value="派遣社員" ${'派遣社員' eq shain.koyo_keitai ? 'selected' : ''}>派遣社員</option>
			<option value="委託社員" ${'委託社員' eq shain.koyo_keitai ? 'selected' : ''}>委託社員</option>
			<option value="パートタイム" ${'パートタイム' eq shain.koyo_keitai ? 'selected' : ''}>パートタイム</option>
          </select>
        </li>
      </ul>
      
      <ul>
        <li class="titLeft p_l15" style="width:90px;"><font class="c_red">*</font> 氏名</li>
        <li class="w_275 con2"><input name="shain_nm" id="shain_nm" type="text" value="${shain.shain_nm}" class="white"></li>
        <li class="titLeft p_l28" style="width:77px;">生年月日</li>
        <li class="w_276 con2"><input name="birth" id="birth" type="date" value="${shain.birth}" class="white"></li>
      </ul>
      
      <ul>
        <li class="titLeft p_l15" style="width:90px;"><font class="c_red">*</font> 入社日</li>
        <li class="w_275 con2"><input id="nyusha_ymd" name="nyusha_ymd" type="date" value="${shain.nyusha_ymd}" class="white frmCalendar hasDatepicker" style="width:200px;"></li>
        <li class="titLeft p_l28" style="width:77px;">退職日</li>
        <li class="w_276 con2"><input type="text" value="" class="white" style="width:200px;" readonly=""></li>
      </ul>
      
      <ul>
        <li class="titLeft p_l28" style="width:77px;">部署</li>
        <li class="w_275 con2">
          <select name="busho_nm" id="busho_nm" style="float: left;">
			<option value=" " selected disabled hidden>選択してください</option>
			<c:forEach var="busho" items="${bushoList}">
				<option value="${busho.busho_nm}" ${busho.busho_nm eq shain.busho_nm ? 'selected' : ''}>${busho.busho_nm}</option>
			</c:forEach>
          </select>
          <div class="img">
          	<span class="anchor">
          		<img src="../resources/img/btn_settingadmin.png" width="42px" height="20px" onclick="toggleModal('myModal1')">
            </span>
          </div>
        </li>
        
        <li class="titLeft p_l28" style="width:77px;">役職</li>
        <li class="w_276 con2">
        <select id="yakushoku_nm" name="yakushoku_nm" style="float: left;">
			<option value=" " selected disabled hidden>選択してください</option>
			<c:forEach var="yakushoku" items="${yakushokuList}">
				<option value="${yakushoku.yakushoku_nm}" ${yakushoku.yakushoku_nm eq shain.yakushoku_nm ? 'selected' : ''}>${yakushoku.yakushoku_nm}</option>
			</c:forEach>
		</select>
		<div class="img"><span class="anchor"><img name="idCmpnPstnSet" id="idCmpnPstnSet" src="../resources/img/btn_settingadmin.png" width="42px" height="20px"></span></div>
        </li>
      </ul>
      
      <ul class="caption_01"></ul>
      <ul>
        <li class="tit_s p_l28" style="width:77px;">住所</li>
        <li class="w_670 con2">
	        <input name="address" id="address" type="text" value="${shain.address}" class="postcodify_postcode5 white">
        </li>
      </ul>
      
      <ul>
        <li class="tit_s p_l28" style="width:77px;">連絡先</li>
        <li class="w_275 con2">
        	<input name="renraku_tel" id="renraku_tel" type="text" value="${shain.renraku_tel}" class="white">
        </li>
        <li class="tit_s p_l28" style="width:77px;">E-Mail</li>
        <li class="w_276 con2">
        	<input name="renraku_email" id="renraku_email" type="text" value="${shain.renraku_email}" class="white">
        </li>
      </ul>
      
      <ul>
        <li class="tit_s p_l28" style="width:77px; height:60px;">備考</li>
        <li class="w_670 con2" style="height:60px;"><textarea style="width:660px;min-height:50px;padding:4px;font-family: 'Nanum Gothic', 돋움, Dotum; font-size: 12px;" maxlength="150"></textarea></li>
      </ul>
      </div><!-- //divBsic// -->
    </ul>
    <!-- //폼.입력.기본정보// -->



    <!-- 부가서비스 바 -->
    <hr class="hr_5">
    <ul><img src="../resources/img/emreg_addinfo_tit01_01.png" width="800px" height="27px" alt="사원정보 1" title="사원정보 1"></ul>

    <a name="aTagMenu01"></a>
    <!-- //폼.입력.급여/4대보험-->
    <!-- //급여: G1 -->
    <ul id="lblPayN4" style="height:50px;"><img src="https://img.payzon.co.kr/_commonImg/emreg_tit_03.gif" width="112px" height="19px" vspace="8" hspace="5" border="0" alt="급여/4대보험" title="급여/4대보험"><span id="btnTipPayN4" class="anchor"><img src="https://img.payzon.co.kr/_commonImg/icon_help_s.gif" width="15px" height="14px" vspace="10" hspace="0" border="0" alt="팁" title="팁"></span></ul>
    <ul class="p_b5 c_blue"><strong><span class="c_red b">+</span> 給与</strong></ul>

     <ul>
      <div id="table1">
      <p class="caption"></p>
      <ul>
        <li class="titLeft p_l5" style="width:145px;"><font class="c_red">*</font> <strong>社会保険</strong></li>
        <li class="con2" style="width:630px;">
          <label class="label_check c_on" for="frmEmp4Insu1" style="float:left;margin-top:6px;margin-right:40px;"><input name="frmEmp4Insu1" id="frmEmp4Insu1" value="1" type="checkbox" checked="" class="G1"> 国民年金</label>
          <label class="label_check c_on" for="frmEmp4Insu2" style="float:left;margin-top:6px;margin-right:40px;"><input name="frmEmp4Insu2" id="frmEmp4Insu2" value="2" type="checkbox" checked="" class="G1"> 健康保険</label>
          <label class="label_check c_on" for="frmEmp4Insu4" style="float:left;margin-top:6px;margin-right:40px;"><input name="frmEmp4Insu4" id="frmEmp4Insu4" value="32" type="checkbox" checked="" class="G1">　介護保険</label>
          <label class="label_check c_on" for="frmEmp4Insu3" style="float:left;margin-top:6px;margin-right:40px;"><input name="frmEmp4Insu3" id="frmEmp4Insu3" value="4" type="checkbox" checked="" class="G1"> 雇用保険</label>
        </li>
      </ul>
      
      
      
      <ul>
        <li class="titLeft p_l5" style="width:145px;"><font class="c_red">*</font> 基本給</li>
        <li class="con2" style="width:250px;"><input name="kihon_pay" id="kihon_pay" value="${shain.kihon_pay}" type="text" class="money G1" style="width:80%;"> 円</li>
        <li class="con2 " style="width:362px;"><div class="p_t5">社員の月給基本額を入力してください。</div></li>
      </ul>
      
      <ul>
        <li class="titLeft p_l15" style="width:135px;">給与口座</li>
        <li class="con2" style="width:630px;">
          <select name="ginko_nm" id="ginko_nm" class="G1">
			<option value=" " selected disabled hidden>選択</option>
  			  <option value="みずほ" ${'みずほ' eq shain.ginko_nm ? 'selected' : ''}>みずほ</option>
			  <option value="三井住友" ${'三井住友' eq shain.ginko_nm ? 'selected' : ''}>三井住友</option>
			  <option value="三菱UFJ" ${'三菱UFJ' eq shain.ginko_nm ? 'selected' : ''}>三菱UFJ</option>
			  <option value="りそな" ${'りそな' eq shain.ginko_nm ? 'selected' : ''}>りそな</option>
			  <option value="住信SBI" ${'住信SBI' eq shain.ginko_nm ? 'selected' : ''}>住信SBI</option>
			  <option value="住友信託" ${'住友信託' eq shain.ginko_nm ? 'selected' : ''}>住友信託</option>
			  <option value="三菱UFJニコス" ${'三菱UFJニコス' eq shain.ginko_nm ? 'selected' : ''}>三菱UFJニコス</option>
			  <option value="ゆうちょ" ${'ゆうちょ' eq shain.ginko_nm ? 'selected' : ''}>ゆうちょ</option>
          </select>
          
          <input name="koza_num" id="koza_num" type="text" value="${shain.koza_num}" class="text G1" maxlength="25" style="width:190px;" placeholder="口座番号">
        </li>
      </ul>
      </div>
    </ul>

    <hr class="hr_5">

    <a name="aTagMenu03"></a>
    <!-- //학력: G4-->
    <ul id="lblAcdm"><img src="../resources/img/emreg_tit_05.png" width="65px" height="19px" vspace="8" hspace="5" border="0" alt="학력" title="학력">
	</ul>    
	
    <ul>
      <div id="table1">
      <p class="caption"></p>
      <ul>
        <li class="w_109 tit ">区分</li>
        <li class="w_110 tit ">入学年月</li>
        <li class="w_110 tit">卒業年月 </li>
        <li class="tit" style="width:253px">学校名</li>
        <li class="w_140 tit">専攻</li>
        <li class="w_70 tit">状態</li>
      </ul>

	<ul class="clsDragItemSort ui-sortable" style="border: 0px; cursor: pointer;">
	<ul id="grpEmacIdx0" class="grpEmac">
        <li class="con3" style="padding-left:7px; width:102.1px">
          <select name="shainEduList[0].gakureki_kb" id="shainEduList[0].gakureki_kb" class="G4">
			<option value="小学校" ${shainEduList[0].gakureki_kb eq '小学校' ? 'selected' : ''}>小学校</option>
			<option value="中学校"${shainEduList[0].gakureki_kb eq '中学校' ? 'selected' : ''}>中学校</option>
			<option value="高等学校"${shainEduList[0].gakureki_kb eq '高等学校' ? 'selected' : ''}>高等学校</option>
			<option value="大学校"${shainEduList[0].gakureki_kb eq '大学校' ? 'selected' : ''}>大学校</option>
			<option value="修士">${shainEduList[0].gakureki_kb eq '修士' ? 'selected' : ''}>修士</option>
			<option value="博士"${shainEduList[0].gakureki_kb eq '博士' ? 'selected' : ''}>博士</option>
          </select>
        </li>
        <li class="w_110 con3"><input value="${shainEduList[0].nyugaku_ym}" name="shainEduList[0].nyugaku_ym" type="month" class="white G4"></li>
        <li class="w_110 con3"><input value="${shainEduList[0].sotsugyo_ym}" name="shainEduList[0].sotsugyo_ym" type="month" class="white G4"></li>
        <li class="con3" style="width:253px;"><input value="${shainEduList[0].gakko_nm}" name="shainEduList[0].gakko_nm" id="shainEduList[0].gakko_nm" type="text" value="" class="white G4" style="width:240px;"></li>
        <li class="w_140 con3"><input value="${shainEduList[0].senko}" name="shainEduList[0].senko" id="shainEduList[0].senko" type="text" value="" class="white G4" style="width:120px;"></li>
        <li class="con3" style="padding-left:7px; width:63px">
          <select name="shainEduList[0].jyotai" id="shainEduList[0].jyotai" class="G4">
			<option value="卒業"
				${shainEduList[0].jyotai eq '卒業' ? 'selected' : ''}>卒業</option>
			<option value="修了"
				${shainEduList[0].jyotai eq '修了' ? 'selected' : ''}>修了</option>
			<option value="自退"
				${shainEduList[0].jyotai eq '自退' ? 'selected' : ''}>自退</option>
			<option value="在学中"
				${shainEduList[0].jyotai eq '在学中' ? 'selected' : ''}>在学中</option>
          </select>
        </li>
    </ul><!-- 열 하나 끝 -->
    
    
    	<ul class="clsDragItemSort ui-sortable" style="border: 0px; cursor: pointer;">
		<ul id="grpEmacIdx0" class="grpEmac">
        <li class="con3" style="padding-left:7px; width:102.1px">
          <select name="shainEduList[1].gakureki_kb" id="shainEduList[1].gakureki_kb" class="G4">
			<option value="小学校" ${shainEduList[1].gakureki_kb eq '小学校' ? 'selected' : ''}>小学校</option>
			<option value="中学校"${shainEduList[1].gakureki_kb eq '中学校' ? 'selected' : ''}>中学校</option>
			<option value="高等学校"${shainEduList[1].gakureki_kb eq '高等学校' ? 'selected' : ''}>高等学校</option>
			<option value="大学校"${shainEduList[1].gakureki_kb eq '大学校' ? 'selected' : ''}>大学校</option>
			<option value="修士">${shainEduList[1].gakureki_kb eq '修士' ? 'selected' : ''}>修士</option>
			<option value="博士"${shainEduList[1].gakureki_kb eq '博士' ? 'selected' : ''}>博士</option>
          </select>
        </li>
        <li class="w_110 con3"><input value="${shainEduList[1].nyugaku_ym}" name="shainEduList[1].nyugaku_ym" type="month" class="white G4"></li>
        <li class="w_110 con3"><input value="${shainEduList[1].sotsugyo_ym}" name="shainEduList[1].sotsugyo_ym" type="month" class="white G4"></li>
        <li class="con3" style="width:253px;"><input value="${shainEduList[1].gakko_nm}" name="shainEduList[1].gakko_nm" id="shainEduList[1].gakko_nm" type="text" value="" class="white G4" style="width:240px;"></li>
        <li class="w_140 con3"><input value="${shainEduList[1].senko}" name="shainEduList[1].senko" id="shainEduList[1].senko" type="text" value="" class="white G4" style="width:120px;"></li>
        <li class="con3" style="padding-left:7px; width:63px">
          <select name="shainEduList[1].jyotai" id="shainEduList[1].jyotai" class="G4">
			<option value="卒業"
				${shainEduList[1].jyotai eq '卒業' ? 'selected' : ''}>卒業</option>
			<option value="修了"
				${shainEduList[1].jyotai eq '修了' ? 'selected' : ''}>修了</option>
			<option value="自退"
				${shainEduList[1].jyotai eq '自退' ? 'selected' : ''}>自退</option>
			<option value="在学中"
				${shainEduList[1].jyotai eq '在学中' ? 'selected' : ''}>在学中</option>
          </select>
        </li>
    </ul><!-- 열 하나 끝 -->
    
    
    	<ul class="clsDragItemSort ui-sortable" style="border: 0px; cursor: pointer;">
	<ul id="grpEmacIdx0" class="grpEmac">
        <li class="con3" style="padding-left:7px; width:102.1px">
          <select name="shainEduList[2].gakureki_kb" id="shainEduList[2].gakureki_kb" class="G4">
			<option value="小学校" ${shainEduList[2].gakureki_kb eq '小学校' ? 'selected' : ''}>小学校</option>
			<option value="中学校"${shainEduList[2].gakureki_kb eq '中学校' ? 'selected' : ''}>中学校</option>
			<option value="高等学校"${shainEduList[2].gakureki_kb eq '高等学校' ? 'selected' : ''}>高等学校</option>
			<option value="大学校"${shainEduList[2].gakureki_kb eq '大学校' ? 'selected' : ''}>大学校</option>
			<option value="修士">${shainEduList[2].gakureki_kb eq '修士' ? 'selected' : ''}>修士</option>
			<option value="博士"${shainEduList[2].gakureki_kb eq '博士' ? 'selected' : ''}>博士</option>
          </select>
        </li>
        <li class="w_110 con3"><input value="${shainEduList[2].nyugaku_ym}" name="shainEduList[2].nyugaku_ym" type="month" class="white G4"></li>
        <li class="w_110 con3"><input value="${shainEduList[2].sotsugyo_ym}" name="shainEduList[2].sotsugyo_ym" type="month" class="white G4"></li>
        <li class="con3" style="width:253px;"><input value="${shainEduList[2].gakko_nm}" name="shainEduList[2].gakko_nm" id="shainEduList[2].gakko_nm" type="text" value="" class="white G4" style="width:240px;"></li>
        <li class="w_140 con3"><input value="${shainEduList[2].senko}" name="shainEduList[2].senko" id="shainEduList[2].senko" type="text" value="" class="white G4" style="width:120px;"></li>
        <li class="con3" style="padding-left:7px; width:63px">
          <select name="shainEduList[2].jyotai" id="shainEduList[2].jyotai" class="G4">
			<option value="卒業"
				${shainEduList[2].jyotai eq '卒業' ? 'selected' : ''}>卒業</option>
			<option value="修了"
				${shainEduList[2].jyotai eq '修了' ? 'selected' : ''}>修了</option>
			<option value="自退"
				${shainEduList[2].jyotai eq '自退' ? 'selected' : ''}>自退</option>
			<option value="在学中"
				${shainEduList[2].jyotai eq '在学中' ? 'selected' : ''}>在学中</option>
          </select>
        </li>
    </ul><!-- 열 하나 끝 -->
      
      
      
		</ul>
      </div>
    </ul>
    <!-- //학력: G4// -->




    <hr class="hr_5">
    
    
    

    <a name="aTagMenu04"></a>
    <!-- //경력: G5 -->
    <ul id="lblCrer"><img src="../resources/img/emreg_tit_06.png" width="65px" height="19px" vspace="8" hspace="5" border="0" alt="경력" title="경력">
    </ul> 
    <ul>
      <div id="table1">
      <p class="caption"></p>
      <ul>
        <li class="w_160 tit ">会社名</li>
        <li class="w_146 tit ">入社日</li>
        <li class="w_146 tit">退職日</li>
        <li class="w_158 tit">最終役職</li>
        <li class="w_180 tit">退職事由</li>
      </ul>

	<ul class="clsDragItemSort ui-sortable" style="border: 0px; cursor: pointer;">  
	  <ul id="grpCrerIdx0" class="grpCrer"><!-- ### G5 0 ### -->
        <li class="w_160 con3"><input name="shainCareerList[0].kaisha_nm" type="text" value="${shainCareerList[0].kaisha_nm}" class="white G5" style="width:90%;"></li>
        <li class="w_146 con3"><input name="shainCareerList[0].nyusha_ymd2" type="date" value="${shainCareerList[0].nyusha_ymd2}" class="white G5 frmCalendar c hasDatepicker" style="width:90%;" maxlength="10"></li>
        <li class="w_146 con3"><input name="shainCareerList[0].taishoku_ymd2" type="date" value="${shainCareerList[0].taishoku_ymd2}" class="white G5 frmCalendar c hasDatepicker" style="width:90%;" maxlength="10"></li>
        <li class="w_158 con3"><input name="shainCareerList[0].saishu_yakushoku" type="text" value="${shainCareerList[0].saishu_yakushoku}" class="white G5" style="width:90%;"></li>
        <li class="w_180 con3"><input name="shainCareerList[0].taishoku_jiyu" type="text" value="${shainCareerList[0].taishoku_jiyu}" class="white G5" style="width:90%;"></li>
      </ul>
	</ul>
	
	<ul class="clsDragItemSort ui-sortable" style="border: 0px; cursor: pointer;">  
	  <ul id="grpCrerIdx0" class="grpCrer"><!-- ### G5 0 ### -->
        <li class="w_160 con3"><input name="shainCareerList[1].kaisha_nm" type="text" value="${shainCareerList[1].kaisha_nm}" class="white G5" style="width:90%;"></li>
        <li class="w_146 con3"><input name="shainCareerList[1].nyusha_ymd2" type="date" value="${shainCareerList[1].nyusha_ymd2}" class="white G5 frmCalendar c hasDatepicker" style="width:90%;" maxlength="10"></li>
        <li class="w_146 con3"><input name="shainCareerList[1].taishoku_ymd2" type="date" value="${shainCareerList[1].taishoku_ymd2}" class="white G5 frmCalendar c hasDatepicker" style="width:90%;" maxlength="10"></li>
        <li class="w_158 con3"><input name="shainCareerList[1].saishu_yakushoku" type="text" value="${shainCareerList[1].saishu_yakushoku}" class="white G5" style="width:90%;"></li>
        <li class="w_180 con3"><input name="shainCareerList[1].taishoku_jiyu" type="text" value="${shainCareerList[1].taishoku_jiyu}" class="white G5" style="width:90%;"></li>
      </ul>
	</ul>
	
	<ul class="clsDragItemSort ui-sortable" style="border: 0px; cursor: pointer;">  
	  <ul id="grpCrerIdx0" class="grpCrer"><!-- ### G5 0 ### -->
        <li class="w_160 con3"><input name="shainCareerList[2].kaisha_nm" type="text" value="${shainCareerList[2].kaisha_nm}" class="white G5" style="width:90%;"></li>
        <li class="w_146 con3"><input name="shainCareerList[2].nyusha_ymd2" type="date" value="${shainCareerList[2].nyusha_ymd2}" class="white G5 frmCalendar c hasDatepicker" style="width:90%;" maxlength="10"></li>
        <li class="w_146 con3"><input name="shainCareerList[2].taishoku_ymd2" type="date" value="${shainCareerList[2].taishoku_ymd2}" class="white G5 frmCalendar c hasDatepicker" style="width:90%;" maxlength="10"></li>
        <li class="w_158 con3"><input name="shainCareerList[2].saishu_yakushoku" type="text" value="${shainCareerList[2].saishu_yakushoku}" class="white G5" style="width:90%;"></li>
        <li class="w_180 con3"><input name="shainCareerList[2].taishoku_jiyu" type="text" value="${shainCareerList[2].taishoku_jiyu}" class="white G5" style="width:90%;"></li>
      </ul>
	</ul>
	

	
	</div> <!-- end table -->
	</ul>
    <!-- //경력: G5// -->

 
    <hr class="hr_5">
    <hr class="hr_5">
      <ul class="emreg_btn c">
        <input name="btnEmplSave" id="btnEmplSave" type="image" value="저장하기" src="https://img.payzon.co.kr/_commonImg/btn_img_save_s.png" hspace="5" alt="저장하기" title="저장하기">
        <input name="btnEmplSaveCancel" id="btnEmplSaveCancel" type="image" value="취소하기" src="https://img.payzon.co.kr/_commonImg/btn_img_cancle_s.png" hspace="5" alt="취소하기" title="취소하기">
        <input name="btnLinkList" id="btnLinkList" type="image" value="리스트" src="https://img.payzon.co.kr/_commonImg/btn_img_list_s.png" hspace="5" alt="리스트" title="리스트">
      </ul>
	</form>
	</div>
</div>   
    









    
<script type="text/javascript">
$(document).ready(function(e) {
    const fileInput = document.getElementById('fileInput');
    const imagePreview = document.getElementById('imagePreview');
    const defaultImageSrc = '../resources/img/setting_photo.png'; // 기본 이미지 경로

    fileInput.addEventListener('change', function(event) {
        const uploadedImage = event.target.files[0];

        if (uploadedImage) {
            const reader = new FileReader();

            reader.onload = function(e) {
                // 새로운 이미지를 미리보기에 표시
                imagePreview.src = e.target.result;
            };

            reader.readAsDataURL(uploadedImage);
        } else {
            // 파일이 선택되지 않았을 때 기본 이미지로 복원
            imagePreview.src = defaultImageSrc;
        }
    });

    // 삭제 버튼 클릭 시 기본 이미지로 변경
    $('#btnEmplPhotoDel').on('click', function() {
        imagePreview.src = defaultImageSrc;
        // 선택된 파일 초기화
        fileInput.value = '';
    });
});
</script>




<script>
	// 폼 제출 함수
	function submitForm() {
	  var form = document.querySelector('form'); // 폼 선택
	  var formData = new FormData(form); // 폼 데이터 객체 생성
	
	  // 폼 데이터에 파일이 있는지 확인
	  if (formData.get('uploadFile')) {
	    // 폼을 서버로 전송
	    fetch('/shain/shainModify', {
	      method: 'POST',
	      body: formData
	    })
	    .then(response => {
	      // 서버 응답 처리
	      if (response.ok) {
	        // 성공 시 동작
	        console.log('업로드 성공!');
	        window.location.href = 'shainList';
	      } else {
	        // 실패 시 동작
	        console.error('업로드 실패');
	      }
	    })
	    .catch(error => {
	      console.error('업로드 중 에러 발생:', error);
	    });
	  } else {
	    console.log('파일을 선택하세요.');
	  }
	}
	
	document.getElementById('btnEmplSave').addEventListener('click', function(event) {
	    event.preventDefault(); // 기본 제출 동작 막기
	    console.log("저장버튼 클릭됨");
	    submitForm(); // 폼 제출 함수 호출
	});
	
	const fileInput = document.getElementById('fileInput');
	const previewImage = document.getElementById('previewImage');
	
	fileInput.addEventListener('change', function(event) {
	    const file = event.target.files[0];
	
	    if (file) {
	        const reader = new FileReader();
	
	        reader.onload = function(e) {
	            const imageUrl = e.target.result; // 이미지 URL 설정
	            previewImage.src = imageUrl; // 이미지 대체
	        };
	
	        reader.readAsDataURL(file); // 파일을 읽어서 이미지 URL로 변환
	    }
	});
	
	document.getElementById('btnEmplSaveCancel').addEventListener('click', function(event) {
	    event.preventDefault(); // 기본 동작 막기
	    window.location.href = '/shain/shainRegister'; // 페이지 이동
	});

	document.getElementById('btnLinkList').addEventListener('click', function(event) {
	    event.preventDefault(); // 기본 동작 막기
	    window.location.href = '/shain/shainList'; // 페이지 이동
	});
	
	

</script>
  

	


<%@include file="../includes/footer.jsp"%>