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
    <li class="tit_img p_r7"><img src="../resources/img/dils_tit_img.gif" width="61" height="68" alt="근태조회" title="근태조회"></li>
    <li class="p_t10"><img src="../resources/img/dils_tit_01.png" width="201" height="25" alt="근태조회" title="근태조회"></li>
    <li class="p_t5">社員ごとの勤怠状況を一括で確認できます。詳細な勤怠履歴も確認できます。</li>
    </ul>
    </div>
    
    <hr>


   <!-- 사원관리 -->
	<div class="main_titimg wp_100">

	  <!-- search -->
		<div class="e_total" style="overflow:visible; width:1300px;">
		<form id='searchForm' action="/kyuyo/kyuyokanri" method='get'>
		      <div class="border_paysearch">
		      <ul class="p_t5 bold w_70 c c_white bold">* 帰属年月</ul>
		      <ul class="p_t1 ">
		      	<input type="month" name='selectedMonth' style="margin-top: 3px;">&nbsp;&nbsp;
		      </ul>
		      
		      </div>
			</form>
		</div> <!-- end search -->

	
	<hr class="hr_0">
	
	   <!-- 휴가조회 리스트 -->
	      <div class="e_total" style="float:left;">
	        <div id="table1" style="width: 71.4%;">
	        <p class="caption"></p>
	        <ul class="height_53">
	        <li class="w_88 tit_53_col">雇用形態</li>
	        <li class="w_88 tit_53_col "><a href="" class="c_linkblue"><strong>社員番号</strong></a></li>
	        <li class="w_70 tit_53_col"><a href="" class="c_linkblue"><strong>氏名</strong></a></li>
	        <li class="w_92 tit_53_col"><a href="" class="c_linkblue"><strong>部署</strong></a></li>
	        <li class="w_199 tit_53_col"><a href="" class="c_linkblue"><strong>役職</strong></a></li>
	        <li class="w_199 tit_53_col ">合計 (D:日/H:時間)</li>
	        <li class="w_100 tit_53_col">休暇控除</li>
	        </ul>
	
			<c:forEach items="${list}" var="shain">
		        <ul class="anchor ulDiligenceList">
			        <li class="w_88 con53_col"><span class="top-10">${shain.koyo_keitai}</span></li>
			        <li class="w_88 con53_col">${shain.shain_no}</li>
			        <li class="w_70 con53_col">${shain.shain_nm}</li>
			        <li class="w_92 con53_col">${shain.busho_nm}</li>
			        <li class="w_199 con53_col">${shain.yakushoku_nm}</li>
			        <li class="w_199 con48_col a_l ">
			        	<c:forEach items="${hour}" var="hour">
							<c:if test="${hour.shain_no eq shain.shain_no}">
                    			${hour.total_kintai_hour}${hour.kintai_tani}
                			</c:if>
                		</c:forEach>
			        </li>
			        <li class="w_100 con53_col bold">
			        	<c:forEach items="${dhour}" var="dhour">
							<c:if test="${dhour.shain_no eq shain.shain_no}">
                    			${dhour.total_kintai_hour}
                			</c:if>
                		</c:forEach>
			        </li>
		        </ul>
			</c:forEach>
	
	        </div>
	    </div>
	  
	    
	    <div class="btn c">
	    <li>
	    <input name="btnGetPrint" id="btnGetPrint" type="image" value="인쇄하기" src="/_commonImg/btn_print_s.png" alt="인쇄하기" title="인쇄하기">
	    <input name="btnGetExcel" id="btnGetExcel" type="image" value="엑셀로 다운로드" src="/_commonImg/btn_xls_down_s.png" hspace="15" alt="엑셀로 다운로드" title="엑셀로 다운로드">
	    </li>
	    </div>
	
	  </div>
</div>












	<form>
		<input type="month" name="selectedMonth">
	</form>
	
	<table border="1" width="100%">
		<thead>
			<tr>
				<th>구분</th>
				<th>사원번호</th>
				<th>성명</th>
				<th>부서</th>
				<th>직위</th>
				<th>합계</th>
				<th>휴가공제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="shain">
				<tr>
					<td>${shain.koyo_keitai}</td>
					<td>${shain.shain_no}</td>
					<td>${shain.shain_nm}</td>
					<td>${shain.busho_nm}</td>
					<td>${shain.yakushoku_nm}</td>
					<td><c:forEach items="${hour}" var="hour">
							<c:if test="${hour.shain_no eq shain.shain_no}">
                    			${hour.total_kintai_hour}${hour.kintai_tani}
                			</c:if>
                		</c:forEach>
					</td>

					<td><c:forEach items="${dhour}" var="dhour">
							<c:if test="${dhour.shain_no eq shain.shain_no}">
                    			${dhour.total_kintai_hour}
                			</c:if>
                		</c:forEach>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	
	
	<script>
    $(document).ready(function() {

        var selectedMonth = getParameterByName('selectedMonth');
        if (selectedMonth) {
            $('input[name="selectedMonth"]').val(selectedMonth);
        }

        $('input[name="selectedMonth"]').change(function() {

            var selectedMonth = $(this).val();

            var baseUrl = window.location.href.split('?')[0];

            var newUrl = baseUrl + '?selectedMonth=' + selectedMonth;

            window.location.href = newUrl;
        });

        function getParameterByName(name) {
            var url = window.location.href;
            name = name.replace(/[\[\]]/g, "\\$&");
            var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, ' '));
        }
    });
</script>



<%@include file="../includes/footer.jsp"%>
