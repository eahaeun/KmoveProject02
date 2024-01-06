<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@include file="../includes/header.jsp"%>
<%@include file="../includes/menu.jsp"%>



<div id="main_container">
	<div class="sub_titimg">
		<ul>
			<li class="tit_img p_r7">
			<img src="../resources/img/pay_tit_img.gif" width="72" height="68">
			</li>
			<li class="p_t10">
			<img src="../resources/img/pay_tit_01.png" width="201" height="25">
			</li>
			<li class="p_t5">月別、社員別給与及びボーナスの情報を入力、管理するメニューです。<span class="c_red">帰属年月を確認</span>してください！
			</li>
		</ul>
	</div>
	
	<hr>


<div class="main_titimg">

<div class="e_total" style="overflow:visible; width:1300px;">
<form id='searchForm' action="/kyuyo/kyuyokanri" method='get'>
	<!-- 귀속연월 -->
      <div class="border_paysearch">
      <ul class="p_t5 bold w_70 c c_white bold">* 帰属年月</ul>
      <ul class="p_t1 ">
      	<input type="month" name='kizoku_ym' value="${param.kizoku_ym}" style="margin-top: 3px;">&nbsp;&nbsp;
      </ul>
      
      <ul class="p_t5 bold w_70 c_white bold">* 給与次数</ul>
		   <input type="text" value="一次支給" style="width: 100px; margin-top: 5px;" readonly="readonly">
      </div>
      
    <!-- 사원번호 검색 --> 
	<div class="border_paysearch_2" style="width:300px;">
	      <ul class="p_t5  w_70 c">* 社員番号</ul>
	      <input name="shain_no" type="text" value="${param.shain_no}" class="border w_100" style="position: relative; top: -5px;"> 
	      <!-- 이미지로 표시되는 검색 버튼 -->
 		  <input type="image" src="https://img.payzon.co.kr/_commonImg/btn_s_search.png" width="23px" height="23px" id="searchButton" style="position: relative; bottom: -2px;"> 
	</div> 
	</form>
</div> <!-- end etotal -->


<hr class="hr_0">

<div class="pay_list">

	<!-- 버튼들.. -->
<!--       <div class="dil_search_box" style="width:576px;">
           <ul><input name="btnPrePaymSaveLoadBottom" id="btnPrePaymSaveLoadBottom" type="image" value="급여대장 불러오기" src="/_commonImg/btn_pay_open.png" width="114px" height="23px" alt="급여대장 불러오기" title="급여대장 불러오기"></ul>
        <ul class="p_l10"><input name="btnPaymSaveEmployeeAddBottom" id="btnPaymSaveEmployeeAddBottom" type="image" value="신규추가" src="/_commonImg/btn_new_pluse.png" width="74px" height="23px" alt="신규추가" title="신규추가"></ul>
        <ul class="p_l10 right"><input name="btnPaymSaveEmployeeDeleteSelect" id="btnPaymSaveEmployeeDeleteSelect" type="image" value="선택삭제" src="/_commonImg/btn_delete_select.png" width="69px" height="23px" alt="선택삭제" title="선택삭제"> <span name="btnPaymSaveEmployeeDeleteAll" id="btnPaymSaveEmployeeDeleteAll" class="anchor" style="margin-left:61px;"><img src="/_commonImg/btn_delete_all_r.png" width="69px" height="23px" alt="전체삭제" title="전체삭제"></span></ul>
      </div> -->
        
        

      <!-- 사원표 -->
      <ul>
        <div class="pay_w_list">
          <div id="table_dil" style="width:577px;">
            <p class="caption"></p>
            <ul>
              <li class="w_88 tit" id="liSortEmplEmpl"><a href="#none" class="c_linkblue"><b>区分</b></a></li>
              <li class="w_85 tit" id="liSortEmplName"><a href="#none" class="c_linkblue"><b>氏名</b></a></li>
              <li class="w_92 tit" id="liSortDprtName"><a href="#none" class="c_linkblue"><b>部署</b></a></li>
              <li class="w_105 tit"><strong>支給総額</strong></li>
              <li class="w_100 tit"><strong>控除総額</strong></li>
              <li class="w_100 tit"><strong>差引総額</strong></li>
            </ul>
          </div>

          <div id="disContentList" class="disContentList mCustomScrollbar _mCS_1" style="width:595px;">
          <div class="mCustomScrollBox mCS-dark" id="mCSB_1" style="position:relative; height:100%; overflow:hidden; max-width:100%;">
          <div class="mCSB_container mCS_no_scrollbar" style="position:relative; top:0;">
          <!-- <div id="disContentList" class='pay_w_list_scroll disContentList'> -->
            <div id="table_dil_data" style="cursor:pointer;" class="ui-sortable">
            <ul onclick="$.fn.setEmployeeAddRecodeClick(this);" id="ulEmplIndxNo1163051" style="width:576px;" class="">
              <li class="w_88 c"><c:out value="${shainjyoho.koyo_keitai}" /></li>
              <li class="w_85 c"><c:out value="${shainjyoho.shain_nm}" /></li>
              <li class="w_92 c"><c:out value="${shainjyoho.busho_nm}"/></li>
				<li class="w_105 align_r bold">
				    <span id="disTableGiveAmount1163051" class="p_r5 c_blue clsTableGiveAmount">
				        <script>
				            var sikyuPay = parseInt('${kyuyojyoho.sikyu_pay}', 10);
				            document.write(isNaN(sikyuPay) ? 0 : sikyuPay.toLocaleString());
				        </script>
				    </span>
				</li>
				<li class="w_100 align_r bold">
				    <span id="disTableDeduAmount1163051" class="p_r5 c_red clsTableDeduAmount">
				        <script>
				            var kojyoPay = parseInt('${kyuyojyoho.kojyo_pay}', 10);
				            document.write(isNaN(kojyoPay) ? 0 : kojyoPay.toLocaleString());
				        </script>
				    </span>
				</li>
				
				<li class="w_100 align_r bold">
				    <span id="disTableRealAmount1163051" class="p_r5 clsTableRealAmount">
				        <c:set var="difference" value="${kyuyojyoho.sikyu_pay - kyuyojyoho.kojyo_pay}" />
				        <script>
				            document.write(parseInt('${difference}', 10).toLocaleString());
				        </script>
				    </span>
				</li>

            </ul>
          </div><!-- end table_dil -->
        </div>
        <div class="mCSB_scrollTools" style="position: absolute; display: none;"><a class="mCSB_buttonUp" oncontextmenu="return false;"></a><div class="mCSB_draggerContainer"><div class="mCSB_dragger" style="position: absolute; top: 0px;" oncontextmenu="return false;"><div class="mCSB_dragger_bar" style="position:relative;"></div></div><div class="mCSB_draggerRail"></div></div><a class="mCSB_buttonDown" oncontextmenu="return false;"></a></div></div></div><!-- end disContentList -->
      </div>
    </ul>
</div> <!-- end paylist -->




<!-- 급여 입력창 -->
<div class="pay_set">

<form action="/kyuyo/kyuyokanri" id="kyuyoForm" method="post">

      <ul>
        <div id="table_pay_divide"><span id="testView"></span>
          <p class="caption"></p>
          
          <!-- 지급항목 -->
          <ul class="f_left" id="sikyu_tbl">
            <div class="f_left w_260">
            <ul class=" border_rt">
              <li class="c w_259 b_blue"> <strong>支給項目</strong> <a href="#none"><img src="../resources/img/icon_m_blue.png" width="16" height="15" border="0" align="absmiddle" hspace="5"></a></li>
            </ul>
            <ul class="ulGivsItem  border_rt" id="ulGive001">
              <c:set var="sikyuTotalPay" value="0"/>
              <li class="w_127 tit"><span class="p_l10">基本給</span></li>
              <li class="w_132 con">
              	<span class="p_r7">
              		<c:set var="kihon_pay" value="${shainjyoho.kihon_pay}"/>
              			<input name="kihon_pay" value='<c:out value="${kihon_pay}"/>' id="kihon_pay" type="text" value="0" class="text frmGives" style="text-align:right;padding-right:5px;width:85%;" maxlength="11">
              		<c:set var="sikyuTotalPaySet" value="${sikyuTotalPay + shainjyoho.kihon_pay}"/>
              </span>
             　　　　</li>
             </ul>
              
              <!-- 기본급 밑 지목항목 반복 -->
				<c:forEach items="${sikyu}" var="sikyu" varStatus="loop1">
				<ul class="ulGivsItem  border_rt">
					<input type="hidden" id="sikyu_${loop.index}" value="${sikyu}" />
              		
              	<li class="w_127 tit"><span class="p_l10"><c:out value="${sikyu.sikyu_km}"/></span></li>
              	<c:set var="unitMultiplier" value="1" />
					   <c:choose>
					   <c:when test="${sikyu.sikyu_tani eq 'O'}">
					        <c:set var="unitMultiplier" value="1" />
					   </c:when>
					   <c:when test="${sikyu.sikyu_tani eq 'T'}">
					        <c:set var="unitMultiplier" value="10" />
					   </c:when>
					   <c:when test="${sikyu.sikyu_tani eq 'H'}">
					       <c:set var="unitMultiplier" value="100" />
					   </c:when>
				</c:choose>
				
				<li class="w_132 con">
              	<span class="p_r7">
              					
				<c:set var="roundedValue" value="${Math.round(sikyu.ikkatsu_pay/unitMultiplier)*unitMultiplier}" />
				   	<input name="ikkatsu_pay" value='<c:out value="${roundedValue}" />' id="sikyu_Pay_${loop1.index}" type="text" value="0" class="text frmGives" style="text-align:right; padding-right:5px; width:85%;" maxlength="11">
				   <c:set var="sikyuTotalPaySet" value="${sikyuTotalPaySet + roundedValue}"/>
				</span>
             　　　　</li>
             </ul>
			</c:forEach>
			
			<c:forEach items="${findByKintai}" var="Kintai" varStatus="loop2">
				<ul class="ulGivsItem  border_rt">
					<li class="w_127 tit"><span class="p_l10"><c:out value="${Kintai.kintai_km}"/></span></li>
					<c:set var="kintai_pay12" value="${Kintai.kintai_pay}"/>
					
					<li class="w_132 con"><span class="p_r7">
					<input name="kintai_pay" value='<c:out value="${kintai_pay12}" />' id="kintai_Pay_${loop2.index}" type="text" value="0" class="text frmGives" style="text-align:right; padding-right:5px; width:85%;" maxlength="11">
					</span></li>
					
					<c:set var="sikyuTotalPaySet" value="${sikyuTotalPaySet + Kintai.kintai_pay}"/>
				</ul>
			</c:forEach>
			
			<!-- 지급총액 -->
			<ul class="b_red  border_rt">
              <li class="w_127 tit b_blue c"><strong><a href="#none" onclick="$.fn.setPaymentItemHeightControl();">支給総額</a></strong></li>
              <li class="w_132 b_blue align_r">
				    <span id="sikyuTotalPay" class="p_r7 bold c_blue">
				        <script>
				            document.write(parseInt('${sikyuTotalPaySet}', 10).toLocaleString());
				        </script>
				    </span>
			  </li>
            </ul>
			
			<c:set var="listSize" value="${fn:length(findByKintai)}" />
			<input type="hidden" id="listSize" value="${listSize}"/>
			
     	</div> <!-- end of f_left w_260 -->
        </ul> <!-- end of f_left(지급항목) -->
        
        
        <!-- 공제항목 -->
        <ul class="f_left" id="kojyo_tbl">
        <c:set var="kojyoTotalPay" value="0"/>
          <div class=" w_259">
            <ul>
              <li class="c w_259 b_red c_red"> <strong>控除項目</strong> <a href="#none"><img src="../resources/img/icon_m_red.png" width="16" height="15" alt="" title="" border="0" align="absmiddle" hspace="5"></a> <span class="f_right"></span></li>
            </ul>
            
            <ul class="ulDedsItem">
              <li class="w_127 tit"><span class="p_l10">国民年金</span></li>
					<c:set var="kokuminNenkin" value="${Math.round(shainjyoho.kihon_pay * 0.045)}"/>
					<c:set var="kojyoTotalPay" value="${kojyoTotalPay + kokuminNenkin}"/>	
              <li class="w_132 con"><span class="p_r7"><input name="kokuminNenkin" id="kokuminNenkin" type="text" value='<c:out value="${kokuminNenkin}"/>' class="text frmDedus" style="text-align:right;padding-right:5px;width:85%;" title="" maxlength="11" data-item="国民年金"></span></li>
            </ul>
            
            <ul class="ulDedsItem">
              <li class="w_127 tit"><span class="p_l10">健康保険</span></li>
	              	<c:set var="kenkoHoken" value="${Math.round(shainjyoho.kihon_pay * 0.03545)}"/>
					<c:set var="kojyoTotalPay" value="${kojyoTotalPay + kenkoHoken}"/>
              <li class="w_132 con"><span class="p_r7"><input name="kenkoHoken" id="kenkoHoken" type="text" value='<c:out value="${kenkoHoken}"/>' class="text frmDedus" style="text-align:right;padding-right:5px;width:85%;" title="1" maxlength="11" data-item="健康保険"></span></li>
            </ul>
            
            <ul class="ulDedsItem">
              <li class="w_127 tit"><span class="p_l10">介護保険</span></li>
              		<c:set var="choukiRyouyoHoken" value="${Math.round(kenkoHoken * 0.0645)}"/>
					<c:set var="kojyoTotalPay" value="${kojyoTotalPay + choukiRyouyoHoken}"/>
              <li class="w_132 con"><span class="p_r7"><input name="choukiRyouyoHoken" id="choukiRyouyoHoken" type="text" value='<c:out value="${choukiRyouyoHoken}"/>' class="text frmDedus" style="text-align:right;padding-right:5px;width:85%;" title="1" maxlength="11" data-item="介護保険"></span></li>
            </ul>
            
            <ul class="ulDedsItem">
              <li class="w_127 tit"><span class="p_l10">雇用保険</span></li>
	              	<c:set var="koyouHoken" value="${Math.round(shainjyoho.kihon_pay * 0.009)}"/>
					<c:set var="kojyoTotalPay" value="${kojyoTotalPay + koyouHoken}"/>
              <li class="w_132 con"><span class="p_r7"><input name="koyouHoken" id="koyouHoken" type="text" value='<c:out value="${koyouHoken}"/>' class="text frmDedus" style="text-align:right;padding-right:5px;width:85%;" title="1" maxlength="11" data-item="雇用保険"></span></li>
            </ul>
            
            <ul class="ulDedsItem">
              <li class="w_127 tit"><span class="p_l10">所得税</span></li>
              <c:set var="kojyoTotalPay" value="${kojyoTotalPay + shotokuzei}"/>
              <li class="w_132 con"><span class="p_r7"><input name="shotokuzei" id="shotokuzei" type="text" value="0" class="text frmDedus" style="text-align:right;padding-right:5px;width:85%;" title="1" maxlength="11" data-item="所得税"></span></li>
            </ul>
            
            <ul class="ulDedsItem">
              <li class="w_127 tit"><span class="p_l10">地方所得税</span></li>
              <li class="w_132 con"><span class="p_r7"><input name="chihouShotokuzei" id="chihouShotokuzei" type="text" value="0" class="text frmDedus" style="text-align:right;padding-right:5px;width:85%;" title="1" maxlength="11" data-item="地方所得税"></span></li>
            </ul>
            
            <c:forEach items="${kojyo}" var="kojyo" varStatus="loop3">
            	<input type="hidden" id="kojyo_${loop3.index}" value="${kojyo}" />
            	<ul class="ulDedsItem">
		              <li class="w_127 tit"><span class="p_l10"><c:out value="${kojyo.kojyo_km}"/></span></li>
		              <c:set var="unitMultiplier" value="1" />
		              <li class="w_132 con"><span class="p_r7"><input name="frmDedu007" id="kojyo_Pay_${loop3.index}" type="text" value="0" class="text frmDedus" style="text-align:right;padding-right:5px;width:85%;" title="" maxlength="11" data-item="상조회비"></span></li>
            	</ul>
            </c:forEach>
            
            <!-- 공제총액 -->
			<ul class="disDedsItemBlank"><li class="w_127 tit"></li><li class="w_132 con"></li><li class="calc" style="display: none;"></li></ul><ul class="disDedsItemBlank"><li class="w_127 tit"></li><li class="w_132 con"></li><li class="calc" style="display: none;"></li></ul>            <ul class="b_red">
              <li class="w_127 tit c"><strong>控除総額</strong></li>
              <li class="w_132 align_r">
	              <span id="kojyoTotalPay" class="p_r7 c_red" style="font-weight:bold;">
					  	<script>
				            document.write(parseInt('${kojyoTotalPay}', 10).toLocaleString());
				        </script>
				  </span>
			  </li>
            </ul>
          </div>
        </ul>
        
        <c:set var="jisshuSokaiGaku" value="${sikyuTotalPaySet-kojyoTotalPay}"/>
        <ul class="pay_bg c font16 p_b10 p_t10 c_white wp_100" style="background-color:#2C587C;">
        <strong>差引総額 : 
        <span id="jisshuSokaiGaku" class="c_yellow">
		    <script>
			    var formattedNumber = parseInt('${jisshuSokaiGaku}', 10).toLocaleString();
			    document.write(formattedNumber + ' 円');
		    </script>
		</span>
		</strong>
      </div>
      </ul>
      
      <hr class="hr_5">
      <ul class="c">
	      	<input name="btnPaymentIns" id="btnPaymentIns" type="image" value="保存" src="../resources/img/btn_save_s2.png" width="60px" height="27px" alt="저장" title="저장">
	      	<input name="btnPaymentReset" id="btnPaymentReset" type="image" value="내용지우기" src="../resources/img/btn_e.png" width="91px" height="27px" alt="내용지우기" title="내용지우기" class="p_l5">
      </ul>
      
      <input type="hidden" name="kizoku_ym" value="${param.kizoku_ym}">
      <input type="hidden" name="shain_no" value="${param.shain_no}">
      <input type="hidden" name="sikyu_pay" value="${sikyuTotalPaySet}">
      <input type="hidden" name="kojyo_pay" value="${kojyoTotalPay}">

    </form>
    
    </div><!-- end payset -->

   </div> <!-- end maintitimg -->
</div>	<!-- end maincontainer -->











<!-- 귀속연월/사원검색 -->
<script type="text/javascript">
  $(document).ready(function() {
    var searchForm = $('#searchForm');

    $("#searchButton").on("click", function(e) {
      e.preventDefault(); // 기본 동작을 중단
		
      if (!searchForm.find("input[name='shain_no']").val()) {
        alert("키워드를 입력하세요");
        return false;
      }

      searchForm.submit();
    });
  });
</script>
		

<script>
document.addEventListener('DOMContentLoaded', function() {

	var listSize = document.getElementById('listSize').value;
	console.log("listSize:", listSize);
	
	var sikyu_pay = 0;
	var kojyo_pay = 0;
	var updateResultExecuted = false;
	
    function updateResult() {
    	updateResultExecuted = true;
        var kokuminNenkin = parseInt(document.getElementById('kokuminNenkin').value) || 0;
        var kenkoHoken = parseInt(document.getElementById('kenkoHoken').value) || 0;
        var choukiRyouyoHoken = parseInt(document.getElementById('choukiRyouyoHoken').value) || 0;
        var koyouHoken = parseInt(document.getElementById('koyouHoken').value) || 0;
        var shotokuzei = parseInt(document.getElementById('shotokuzei').value) || 0;
        var chihouShotokuzei = parseInt(document.getElementById('chihouShotokuzei').value) || 0;
        var kihon_pay = parseInt(document.getElementById('kihon_pay').value) || 0;
		
        var parentUl = document.getElementById('sikyu_tbl');
    	var rowCount1 = parentUl.querySelectorAll('li.w_127.tit').length -2;
    	
    	var parentUl2 = document.getElementById('kojyo_tbl');
    	var rowCount4 = parentUl2.querySelectorAll('li.w_127.tit').length -9;

        var rowCount2 = rowCount1 - listSize;
        var rowCount3 = rowCount1 - rowCount2;
        
        console.log('반복된 횟수:', rowCount4);
        
        var kintaiPayTotal = 0;
        for (var i = 0; i < rowCount3; i++) {
            var elementId2 = 'kintai_Pay_' + i;
            var kintaiPayValue = parseInt(document.getElementById(elementId2).value) || 0;
            kintaiPayTotal = kintaiPayTotal + kintaiPayValue;
            console.log(elementId2);
        }
        var sikyuPayTotal = 0;
        
        for(var i = 0; i < rowCount2; i++){
        	var elementId1 = 'sikyu_Pay_' + i;
        	var sikyuPayValue = parseInt(document.getElementById(elementId1).value) || 0;
        	sikyuPayTotal = sikyuPayTotal + sikyuPayValue;
        	
        	console.log(elementId1);
        }
        
		var kojyoPayTotal = 0;
        
        for(var i = 0; i < rowCount4; i++){
        	var elementId3 = 'kojyo_Pay_' + i;
        	var kojyoPayValue = parseInt(document.getElementById(elementId3).value) || 0;
        	kojyoPayTotal = kojyoPayTotal + kojyoPayValue;
        	
        	console.log(elementId3);
        }

        var sikyuTotalPay = kihon_pay + sikyuPayTotal + kintaiPayTotal;
        var kojyoTotalPay = kokuminNenkin + kenkoHoken + choukiRyouyoHoken + koyouHoken + shotokuzei + chihouShotokuzei + kojyoPayTotal;
        var jisshuSokaiGaku = sikyuTotalPay - kojyoTotalPay;
        document.getElementById("sikyuTotalPay").textContent = sikyuTotalPay;
        sikyu_pay = sikyuTotalPay;
        document.getElementById('kojyoTotalPay').textContent = kojyoTotalPay;
        kojyo_pay = kojyoTotalPay;
        document.getElementById('jisshuSokaiGaku').textContent = jisshuSokaiGaku;
        
    }

    // 입력 필드의 값이 변경될 때마다 계산 및 결과 업데이트
    document.getElementById('kokuminNenkin').addEventListener('input', updateResult);
    document.getElementById('kenkoHoken').addEventListener('input', updateResult);
    document.getElementById('choukiRyouyoHoken').addEventListener('input', updateResult);
    document.getElementById('koyouHoken').addEventListener('input', updateResult);
    document.getElementById('shotokuzei').addEventListener('input', updateResult);
    document.getElementById('chihouShotokuzei').addEventListener('input', updateResult);
    document.getElementById('kihon_pay').addEventListener('input', updateResult);

    // 'kintai_Pay' 입력 필드의 값이 변경될 때마다 계산 및 결과 업데이트
    var parentUl = document.getElementById('sikyu_tbl');
    var rowCount1 = parentUl.querySelectorAll('li.w_127.tit').length -2;
    	
    var parentUl2 = document.getElementById('kojyo_tbl');
    var rowCount4 = parentUl2.querySelectorAll('li.w_127.tit').length -9;
    
    var rowCount2 = rowCount1 - listSize;
    var rowCount3 = rowCount1 - rowCount2;
    
    for (var i = 0; i < rowCount3; i++) {
        var elementId1 = 'kintai_Pay_' + i;
        document.getElementById(elementId1).addEventListener('input', updateResult);
    }
    
    for (var i = 0; i < rowCount2; i++) {
        var elementId2 = 'sikyu_Pay_' + i;
        document.getElementById(elementId2).addEventListener('input', updateResult);
    }
    
    for (var i = 0; i < rowCount4; i++) {
        var elementId2 = 'kojyo_Pay_' + i;
        document.getElementById(elementId2).addEventListener('input', updateResult);
    }
    

var btnSave = document.getElementById("btnPaymentIns");

// 저장 버튼에 클릭 이벤트 리스너를 추가합니다.
btnSave.addEventListener("click", function(e) {
    // 폼을 찾습니다.
    var kyuyoForm = document.getElementById("kyuyoForm");

    if (updateResultExecuted) {
        var sikyuTotalPayInput = document.querySelector('input[name="sikyu_pay"]');
        if (sikyuTotalPayInput) {
            sikyuTotalPayInput.value = sikyu_pay;
        }
    }
    
    if (updateResultExecuted) {
    	var kojyoTotalPayInput = document.querySelector('input[name="kojyo_pay"]');
        if (kojyoTotalPayInput) {
        	kojyoTotalPayInput.value = kojyo_pay;
        }
    }
    
    // 폼을 제출합니다.
    kyuyoForm.submit();

    // 이벤트의 기본 동작을 취소합니다. (폼이 실제로 제출되지 않도록 합니다.)
    e.preventDefault();
});

});
</script>




<%@include file="../includes/footer.jsp"%>
