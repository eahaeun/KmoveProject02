<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@include file="../includes/header.jsp"%>
<%@include file="../includes/menu.jsp"%>



<div id="main_container">
	<!-- 타이틀 이미지 -->
	<div class="sub_titimg">
		<ul>
			<li class="tit_img p_r7"><img
				src="../resources/img/cert_tit_img.gif" width="70" height="68"
				alt="帳票出力" title="帳票出力"></li>
			<li class="p_t10"><img src="../resources/img/cert_tit_01.png"
				width="131" height="25" alt="帳票出力" title="帳票出力"></li>
			<li class="p_t5">社員を選択して、出力ボタンを押したら在職証明書が発行されます。</li>
		</ul>
	</div>
	<!-- end subtitimg -->

	<hr>

	<!-- 사원 목록 리스트 -->
	<div class="main_titimg">
		<div class="diligence_list">

			<ul>
				<div class="dil_w_list">
					<div id="table_dil">
						<p class="caption"></p>
						<ul>
							<li class="w_120 tit"><strong>区分</strong></li>
							<li class="w_105 tit"><strong>社員番号</strong></li>
							<li class="w_100 tit"><strong>氏名</strong></li>
							<li class="w_120 tit"><strong>部署</strong></li>
							<li class="w_120 tit"><strong>役職</strong></li>
							<li class="w_119 tit"><strong>帳票出力</strong> <span
								id="btnTipDiligenceMnt" class="anchor"><img
									src="../resources/img/icon_help_s.gif" width="15px"
									height="14px" vspace="0" hspace="0" border="0"
									align="absmiddle" alt="팁" title="팁"></span></li>
						</ul>

						<div id="disContentList" class="disContentList"
							style="width: 715px;">
							<div id="table_dil_data">
								<ul id="employeeNo0" class="anchor" style="width: 695px;">
									<c:forEach items="${shainList}" var="shain">
										<li class="w_120 c">${shain.koyo_keitai}</li>
										<li class="w_105 c">${shain.shain_no}</li>
										<li class="w_100 c">${shain.shain_nm}</li>
										<li class="w_120 c">${shain.busho_nm}</li>
										<li class="w_120 c">${shain.yakushoku_nm}</li>
										<li class="w_119 c"><span name="btnDiliMnt"
											id="btnDiliMnt" class="anchor"> <img
												src="../resources/img/btn_print.png" width="52px"
												height="19px" alt="관리" title="관리"
												onclick="btnPrintClick('${shain.shain_no}')">
										</span></li>
									</c:forEach>
								</ul>
							</div>
						</div>
						
					</div>
				</div>
			</ul>
			
		</div>
	</div>
</div>


<script>
	function btnPrintClick(shain_no) {
		console.log("selected shain_no : " + shain_no);
		
		//임시 form 생성
		const form = document.createElement("form");
		form.method = "post";
		form.action = "/shain/print";
		
		const input = document.createElement("input");
		input.type = "hidden";
		input.name = "shain_no";
		input.value = shain_no;

		form.appendChild(input);
		document.body.appendChild(form);
		
		form.submit();
	}
</script>





<%@include file="../includes/footer.jsp"%>

