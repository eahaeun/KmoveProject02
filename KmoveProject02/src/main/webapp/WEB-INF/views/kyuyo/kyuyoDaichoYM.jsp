<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@include file="../includes/header.jsp"%>
<%@include file="../includes/menu.jsp"%>

<style>
.topItem { width:433px;} /* contents2.width: +20 */
.disTop{overflow:auto;}  /*overflow-x:hidden;overflow-y:hidden;*/
.leftItem {width:470px; }
.disLeft{float:left;width:470px;height:451px;overflow:hidden;}  /*overflow-x:hidden;overflow-y:hidden;*/
.contents2 {width:2049px;background:#CCC;}
.disContentList2{/* width:1050px; */height:470px;overflow-x:hidden; -webkit-border-radius:3px; -moz-border-radius:3px; border-radius:3px;}

.e_total ul:after{content:"";display:block;width:100%;clear:both;}
.table1_2021#table1{width:1450px;height:480px;overflow:hidden;overflow-y:scroll;}
.table1_2021#table1:after{content:"";display:block;width:100%;clear:both;}
.table1_2021 .disContentList2{height:auto;min-height:470px;overflow:hidden;overflow-x:auto;}
/* .topItem li{border-bottom:1px solid #cccccc;} */
</style>

<div id="main_container_wide">
	<div class="sub_titimg">
		<ul>
			<li class="tit_img p_r7">
			<img src="../resources/img/paypaper_tit_img.gif" width="72" height="68">
			</li>
			<li class="p_t10">
			<img src="../resources/img/paypaper_tit_01.png" width="97" height="25">
			</li>
			<li class="p_t5">帰属年月別の給与総額および社員別給与支給状況を一覧できます。
			</li>
		</ul>
	</div>
	
	<hr>
	
	
	<!-- 귀속연월표시창 -->
	<div class="main_titimg wp_100">
	<div class="e_total" style="overflow:visible">
		<div class="border_paysearch_2" style="width:1155px;">
          <ul class="bold w_88 p_t5 c">* 帰属年月 </ul>
          <ul class="p_t1"><input type="text" value="<c:out value='${param.kizoku_ym}'/>" class="border w_88 height_22 c" readonly=""></ul>
        </div>
    </div>
	
	<hr class="hr_0">
	
	<!-- 급여대장 -->
	<div class="e_total">
  	<ul>
	<!-- 이전 -->
    <div id="table1" style="clear:both; width: 44.1%;">
      <p class="caption"></p>

      <div style="float:left;/* width:400px; */height:30px;">
        <div class="topLeft">
          <ul class="b_gray2 ">
            <li class="w_85 c ">区分</li>
            <li class='w_70 c '>社員番号</li>
            <li class="w_70 c ">氏名</li>
            <li class="w_80 c ">入社日</li>
            <li class="w_80 c ">部署</li>
            <li class="w_80 c ">職位</li>
          </ul>
        </div>
      </div>

<!-- Top(TOP.RIGHT) -->
      <div id="disTop" class="disTop e_total">
        <div class="topItem">
          <ul class="">
			<li class="w_140 c  b_darkblue c_white bold">支払総額</li>
			<li class="w_140 c  b_red01  c_white bold">控除総額</li>
            <li class="w_150 c  b_black c_white bold">差引総額</li>
          </ul>
        </div>
      </div>

<!-- Left(MIDDLE.LEFT) -->
      <div id="disLeft" class="disLeft">
        <div class="leftItem">
        
        <c:forEach var="shainjyoho" items="${shainjyoho}">
          <ul>
            <li class="w_85 c"><c:out value="${shainjyoho.koyo_keitai}" /></li>
            <li class='w_70 c '><c:out value="${shainjyoho.shain_no}" /></li>
            <li class="w_70 c"><c:out value="${shainjyoho.shain_nm}" /></li>
            <li class="w_80 c"><c:out value="${shainjyoho.nyusha_ymd}" /></li>
            <li class="w_80 c "><c:out value="${shainjyoho.busho_nm}" /></li>
            <li class="w_80 c "><c:out value="${shainjyoho.yakushoku_nm}" /></li>
          </ul>
		</c:forEach>
		
          <ul class="w_470 ">
            <li class="w_470 c b_yellow bold ">合計</li>
          </ul>
        </div>
      </div>
      
<!-- Main(MIDDLE.RIGHT) -->
      <div id="disContentList2" class="disContentList2">
        <div class="contents2">
		<c:set var="totalSikyu_pay" value="0" />
		<c:set var="totalkojyo_pay" value="0" />
		<c:set var="totaldifference" value="0" />
		<c:forEach var="kyuyojyoho" items="${kyuyojyoho}">       
          <ul>
			<!-- 지급총액 -->
            <li class="w_140 a_r b_blue bold c_blue"><c:out value="${kyuyojyoho.sikyu_pay}" />&nbsp;&nbsp;</li>
            <!-- 공제총액 -->
            <li class="w_140 a_r b_red c_red bold"><c:out value="${kyuyojyoho.kojyo_pay}" />&nbsp;&nbsp;</li>
            <!-- 실지급액 -->
			<c:set var="difference" value="${kyuyojyoho.sikyu_pay - kyuyojyoho.kojyo_pay}" />
            <li class="w_150 a_r bold b_gray2"><c:out value="${difference}" />&nbsp;&nbsp;</li>
			<c:set var="totalSikyu_pay" value="${totalSikyu_pay + kyuyojyoho.sikyu_pay}" />
			<c:set var="totalkojyo_pay" value="${totalkojyo_pay + kyuyojyoho.kojyo_pay}" />
			<c:set var="totaldifference" value="${totaldifference + difference}" />          
          </ul>
		</c:forEach>
		
          <ul class="b_yellow">
			<!-- 지급총액 총계 -->
            <li class="w_140 a_r bold"><c:out value="${totalSikyu_pay}" />&nbsp;&nbsp;</li>
			<!-- 공제총액 총계 -->
            <li class="w_140 a_r bold"><c:out value="${totalkojyo_pay}" />&nbsp;&nbsp;</li>
            <!-- 실지금액 총계 -->
            <li class="w_150 a_r bold "><c:out value="${totaldifference}" />&nbsp;&nbsp;</li>
          </ul>
		
        </div>
      </div>

    </div>

</ul>
</div>
</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<h1>給与台帳</h1>
	帰属年月 :
	<c:out value="${param.kizoku_ym}" />
	<table> <!-- 가장 밖 테이블 -->
		<tbody>
			<tr>
				<td>
					<table border="1"> <!-- 안 테이블 1 -->
						<tr>
							<th>区分</th>
							<th>社員番号</th>
							<th>氏名</th>
							<th>入社日</th>
							<th>部署</th>
							<th>職位</th>
						</tr>
						<c:forEach var="shainjyoho" items="${shainjyoho}">
							<tr>
								<td><c:out value="${shainjyoho.koyo_keitai}" /></td>
								<td><c:out value="${shainjyoho.shain_no}" /></td>
								<td><c:out value="${shainjyoho.shain_nm}" /></td>
								<td><c:out value="${shainjyoho.nyusha_ymd}" /></td>
								<td><c:out value="${shainjyoho.busho_nm}" /></td>
								<td><c:out value="${shainjyoho.yakushoku_nm}" /></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="6">合計</td>
						</tr>
					</table> <!-- 안 테이블 1 끝-->
				</td>
				<td>
					<table border="1"> <!-- 안 테이블 2 -->  
						<tr>
							<th>支払総額</th>
							<th>控除総額</th>
							<th>実支給額</th>
						</tr>
						<!-- 합계를 구하기 위한 변수 선언 -->
						<c:set var="totalSikyu_pay" value="0" />
						<c:set var="totalkojyo_pay" value="0" />
						<c:set var="totaldifference" value="0" />
						<c:forEach var="kyuyojyoho" items="${kyuyojyoho}">
							<tr>
								<td><c:out value="${kyuyojyoho.sikyu_pay}" /></td>
								<td><c:out value="${kyuyojyoho.kojyo_pay}" /></td>
								<c:set var="difference" value="${kyuyojyoho.sikyu_pay - kyuyojyoho.kojyo_pay}" />
								<td><c:out value="${difference}" /></td>
								<!-- 합계를 계산하기 위한 반복 -->
								<c:set var="totalSikyu_pay" value="${totalSikyu_pay + kyuyojyoho.sikyu_pay}" />
								<c:set var="totalkojyo_pay" value="${totalkojyo_pay + kyuyojyoho.kojyo_pay}" />
								<c:set var="totaldifference" value="${totaldifference + difference}" />
							</tr>
						</c:forEach>
						<!-- 합계 출력 -->
						<tr>
							<td><c:out value="${totalSikyu_pay}" /></td>
							<td><c:out value="${totalkojyo_pay}" /></td>
							<td><c:out value="${totaldifference}" /></td>
						</tr>
					</table> <!-- 안 테이블 2 끝 -->
				</td>
			</tr>
		</tbody>
	</table> <!-- 밖 테이블 끝 -->
</div>

<%@include file="../includes/footer.jsp"%>
