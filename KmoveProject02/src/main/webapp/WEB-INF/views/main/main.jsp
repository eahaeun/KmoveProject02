<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/menu.jsp"%>


<section>
<br>

<!-- 기본문구 -->
<div class="main_titimg">
    <ul class="f_left">
    <li class="font16 p_t10 p_b10 height_30"><span class="bold f_000">${kanrisha.kanrisha_nm} </span>様, 現在の接続IPは${ip_address}です。</li>
    <li>
      <div class="b_info_detail">
      <ul><li class="cell">管理者名</li><li class="p_l10">${kanrisha.kanrisha_nm} <span class="c_blue">(TEL : "${kanrisha.renraku_tel}")</span></li></ul>
      </div>
      <div class="b_info_detail">
      <ul><li class="cell">利用期限</li><li class="w_300 p_l10">${today}まで <span class="c_red">(残り0日)</span>&nbsp;&nbsp;<a href="/pzServiceGuide/memberPayment.php"><img src="${pageContext.request.contextPath}/resources/img/btn_extend.png" align="absmiddle" alt="延長" title="延長"></a></li>
      <li class="cell">通知トーク残額</li><li class="p_l10">0円 &nbsp;&nbsp;&nbsp;
      <a href="/pzMyPage/sendMessage.php"><img src="${pageContext.request.contextPath}/resources/img/btn_history.png" align="absmiddle" alt="使用履歴" title="使用履歴" border="0"></a>
      <a href="/pzServiceGuide/memberPayment.php?addGoods=05"><img src="${pageContext.request.contextPath}/resources/img/btn_charge.png" align="absmiddle" alt="チャージ" title="チャージ"></a></li></ul>
      </div>
    </li>
    </ul>
    </div>
    
    <div class="today">
    	<ul class="f_left">
    		<li class="font16 p_t10 p_b10 height_30"><span class="bold f_000">${today}</span>
    		</li>
    	</ul>
	</div>
    
<hr>










<!-- 회사 정보 -->
<div class="main_titimg">

    <div class="m_info p_t10 p_b20"><span id="disLogoImageStatus" class="disHide">[完了]</span>
      <ul class="w_615"><img src="${pageContext.request.contextPath}/resources/img/tit_bi.png" width="92" height="20" hspace="10">
      </ul>
      
      <ul class="tb_main">
        <div id="table1">
          <p class="caption"></p>
          <ul>
          <li class="w_100 tit"><strong>会社名</strong></li>
          <li class="w_170 con">${kaisha.kaisha_nm}</li>
          <li class="w_100 tit"><strong>代表者</strong></li>
          <li class="w_169 con">${kaisha.daihyosha}</li>
          </ul>
          <ul>
          <li class="w_100 tit">事業者番号 </li>
          <li class="w_448 con">${kaisha.jigyosha_no}</li>
          </ul>
          <ul>
          <li class="w_100 tit">電話</li>
          <li class="w_170 con">${kaisha.renraku_tel}</li>
          <li class="w_100 tit">ファックス</li>
          <li class="w_169 con">${kaisha.renraku_fax}</li>
          </ul>
<!--           <ul>
          <li class="w_100 tit">test</li>
          <li class="w_170 con"><span id="disCmpnOper">test</span></li>
          <li class="w_100 tit">test</li>
          <li class="w_169 con">test</li>
          </ul> -->
          <ul>
          <li class="w_100 tit">ホームページ</li>
          <li class="w_448 con">${kaisha.homepage}</li>
          </ul>
        </div>
      </ul>
        <ul class="tb_main top-10 aling_r"><input name="btnMemberInfoGo" id="btnMemberInfoGo" type="button" value="修正" class="btn"></ul>  
    </div>
	
	
	<!-- 사원 현황 -->
    <div class="e_total p_t10 p_b20" style="width: 400px;">
      <ul class="w_400"><img src="${pageContext.request.contextPath}/resources/img/tit_e_total.png" width="64" height="20" hspace="10"></ul>  
      <ul class="p_t10 ">
        <div id="table1">
        <p class="caption"></p>
        <ul>
        <li class="w_180 tit">正社員</li>
        <li class="w_210 con">7</li>
        </ul>
        <ul>
        <li class="w_180 tit">契約社員</li>
        <li class="w_210 con">1</li>
        </ul>
        <ul>
        <li class="w_180 tit">パートタイム</li>
        <li class="w_210 con">1</li>
        </ul>
<!--         <ul>
        <li class="w_180 tit">�Ͽ���</li>
        <li class="w_210 con">3</li>
        </ul> -->
        <ul>
        <li class="w_180 tit_total">総計</li>
        <li class="w_210 con b_yellow bold">12</li>
        </ul>
        </div>
      </ul>
      <ul class="top-10" style="float:right;"><input name="btnEmployeeMntGo" id="btnEmployeeMntGo" type="button" value="修正" class="btn"></ul>
    </div>
    
</div>

<hr>

<!-- <div class="main_titimg">
    <div class="p_total_tit p_t10">
      <ul class="p_b10" style="width:1080px"><img src="./�޿����� ������ - HOME_files/tit_p_total.gif" width="63" height="17" hspace="10"></ul>
      <ul class="btn1">  
         <div class="ddOutOfVision" style="height:0px;overflow:hidden;position:absolute;" id="frmPmttYear_msddHolder"><select name="frmPmttYear" id="frmPmttYear">
          <option value="">����</option>
	<option value="2015">2015 ��</option>
	<option value="2016">2016 ��</option>
	<option value="2017">2017 ��</option>
	<option value="2018">2018 ��</option>
	<option value="2019">2019 ��</option>
	<option value="2020">2020 ��</option>
	<option value="2021">2021 ��</option>
	<option value="2022">2022 ��</option>
	<option value="2023" selected="">2023 ��</option>
	<option value="2024">2024 ��</option>
        </select></div><div id="frmPmttYear_msdd" class="dd" style="width: 67.4px;"><div id="frmPmttYear_title" class="ddTitle"><span id="frmPmttYear_arrow" class="arrow"></span><span class="ddTitleText" id="frmPmttYear_titletext"><span class="ddTitleText">2023 ��</span></span></div><div id="frmPmttYear_child" class="ddChild" style="width: 65.4px; height: 157px;"><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmPmttYear_msa_0"><span class="ddTitleText">����</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmPmttYear_msa_1"><span class="ddTitleText">2015 ��</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmPmttYear_msa_2"><span class="ddTitleText">2016 ��</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmPmttYear_msa_3"><span class="ddTitleText">2017 ��</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmPmttYear_msa_4"><span class="ddTitleText">2018 ��</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmPmttYear_msa_5"><span class="ddTitleText">2019 ��</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmPmttYear_msa_6"><span class="ddTitleText">2020 ��</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmPmttYear_msa_7"><span class="ddTitleText">2021 ��</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmPmttYear_msa_8"><span class="ddTitleText">2022 ��</span></a><a href="javascript:void(0);" class="selected enabled" style="[object CSSStyleDeclaration]" id="frmPmttYear_msa_9"><span class="ddTitleText">2023 ��</span></a><a href="javascript:void(0);" class="enabled" style="[object CSSStyleDeclaration]" id="frmPmttYear_msa_10"><span class="ddTitleText">2024 ��</span></a></div></div>
          </ul>
    </div>
    <div class="p_total p_b20">  
      <ul>
        <div id="table1">
        <p class="caption"></p>
        <ul>
        <li class="w_100 tit">�ͼӿ���</li>
        <li class="w_100 tit">�޿�����</li>
        <li class="w_200 tit">����Ⱓ</li>
        <li class="w_100 tit">������</li>
        <li class="w_100 tit">�ο�</li>
        <li class="w_180 tit">�����Ѿ�</li>
        <li class="w_180 tit">�����Ѿ�</li>
        <li class="w_181 tit">�����޾�</li>
         </ul>

        <ul class="overColorSet" title="20230101">
        <li class="w_100 c ">2023-01</li>
        <li class="w_100 c">�޿�-1��</li>
        <li class="w_200 c">2023-01-01 ~ 2023-01-31</li>
        <li class="w_100 c">2023-02-05</li>
        <li class="w_100 c">8</li>
        <li class="w_155 con_r p_r25 bold c_blue">26,300,000</li>
        <li class="w_155 con_r p_r25 bold c_red">3,144,830</li>
        <li class="w_156 con_r p_r25 bold c_black ">23,155,170</li>
        </ul>
        <ul class="overColorSet" title="20230201">
        <li class="w_100 c ">2023-02</li>
        <li class="w_100 c">�޿�-1��</li>
        <li class="w_200 c">2023-02-01 ~ 2023-02-28</li>
        <li class="w_100 c">2023-03-05</li>
        <li class="w_100 c">8</li>
        <li class="w_155 con_r p_r25 bold c_blue">26,300,000</li>
        <li class="w_155 con_r p_r25 bold c_red">3,144,830</li>
        <li class="w_156 con_r p_r25 bold c_black ">23,155,170</li>
        </ul>
        <ul class="overColorSet" title="20230301">
        <li class="w_100 c ">2023-03</li>
        <li class="w_100 c">�޿�-1��</li>
        <li class="w_200 c">2023-03-01 ~ 2023-03-31</li>
        <li class="w_100 c">2023-04-05</li>
        <li class="w_100 c">8</li>
        <li class="w_155 con_r p_r25 bold c_blue">26,300,000</li>
        <li class="w_155 con_r p_r25 bold c_red">3,144,830</li>
        <li class="w_156 con_r p_r25 bold c_black ">23,155,170</li>
        </ul>
        <ul class="overColorSet" title="20230401">
        <li class="w_100 c ">2023-04</li>
        <li class="w_100 c">�޿�-1��</li>
        <li class="w_200 c">2023-04-01 ~ 2023-04-30</li>
        <li class="w_100 c">2023-05-05</li>
        <li class="w_100 c">8</li>
        <li class="w_155 con_r p_r25 bold c_blue">26,300,000</li>
        <li class="w_155 con_r p_r25 bold c_red">3,144,830</li>
        <li class="w_156 con_r p_r25 bold c_black ">23,155,170</li>
        </ul>
        <ul class="overColorSet" title="20230501">
        <li class="w_100 c ">2023-05</li>
        <li class="w_100 c">�޿�-1��</li>
        <li class="w_200 c">2023-05-01 ~ 2023-05-31</li>
        <li class="w_100 c">2023-06-05</li>
        <li class="w_100 c">8</li>
        <li class="w_155 con_r p_r25 bold c_blue">26,300,000</li>
        <li class="w_155 con_r p_r25 bold c_red">3,144,830</li>
        <li class="w_156 con_r p_r25 bold c_black ">23,155,170</li>
        </ul>
        <ul class="overColorSet" title="20230601">
        <li class="w_100 c ">2023-06</li>
        <li class="w_100 c">�޿�-1��</li>
        <li class="w_200 c">2023-06-01 ~ 2023-06-30</li>
        <li class="w_100 c">2023-07-05</li>
        <li class="w_100 c">8</li>
        <li class="w_155 con_r p_r25 bold c_blue">26,300,000</li>
        <li class="w_155 con_r p_r25 bold c_red">3,144,830</li>
        <li class="w_156 con_r p_r25 bold c_black ">23,155,170</li>
        </ul>
        <ul class="overColorSet" title="20230701">
        <li class="w_100 c ">2023-07</li>
        <li class="w_100 c">�޿�-1��</li>
        <li class="w_200 c">2023-07-01 ~ 2023-07-31</li>
        <li class="w_100 c">2023-08-05</li>
        <li class="w_100 c">8</li>
        <li class="w_155 con_r p_r25 bold c_blue">26,300,000</li>
        <li class="w_155 con_r p_r25 bold c_red">3,144,830</li>
        <li class="w_156 con_r p_r25 bold c_black ">23,155,170</li>
        </ul>
        <ul class="overColorSet" title="20230801">
        <li class="w_100 c ">2023-08</li>
        <li class="w_100 c">�޿�-1��</li>
        <li class="w_200 c">2023-08-01 ~ 2023-08-31</li>
        <li class="w_100 c">2023-09-05</li>
        <li class="w_100 c">8</li>
        <li class="w_155 con_r p_r25 bold c_blue">26,300,000</li>
        <li class="w_155 con_r p_r25 bold c_red">3,144,830</li>
        <li class="w_156 con_r p_r25 bold c_black ">23,155,170</li>
        </ul>
        <ul class="overColorSet" title="20230901">
        <li class="w_100 c ">2023-09</li>
        <li class="w_100 c">�޿�-1��</li>
        <li class="w_200 c">2023-09-01 ~ 2023-09-30</li>
        <li class="w_100 c">2023-10-05</li>
        <li class="w_100 c">8</li>
        <li class="w_155 con_r p_r25 bold c_blue">26,300,000</li>
        <li class="w_155 con_r p_r25 bold c_red">3,144,830</li>
        <li class="w_156 con_r p_r25 bold c_black ">23,155,170</li>
        </ul>
        <ul class="overColorSet" title="20231001">
        <li class="w_100 c ">2023-10</li>
        <li class="w_100 c">�޿�-1��</li>
        <li class="w_200 c">2023-10-01 ~ 2023-10-31</li>
        <li class="w_100 c">2023-11-05</li>
        <li class="w_100 c">8</li>
        <li class="w_155 con_r p_r25 bold c_blue">26,300,000</li>
        <li class="w_155 con_r p_r25 bold c_red">3,144,830</li>
        <li class="w_156 con_r p_r25 bold c_black ">23,155,170</li>
        </ul>
        <ul class="overColorSet" title="20231101">
        <li class="w_100 c ">2023-11</li>
        <li class="w_100 c">�޿�-1��</li>
        <li class="w_200 c">2023-11-01 ~ 2023-11-30</li>
        <li class="w_100 c">2023-12-05</li>
        <li class="w_100 c">8</li>
        <li class="w_155 con_r p_r25 bold c_blue">26,300,000</li>
        <li class="w_155 con_r p_r25 bold c_red">3,144,830</li>
        <li class="w_156 con_r p_r25 bold c_black ">23,155,170</li>
        </ul>
        <ul class="overColorSet" title="20231201">
        <li class="w_100 c ">2023-12</li>
        <li class="w_100 c">�޿�-1��</li>
        <li class="w_200 c">2023-12-01 ~ 2023-12-31</li>
        <li class="w_100 c">2024-01-05</li>
        <li class="w_100 c">8</li>
        <li class="w_155 con_r p_r25 bold c_blue">26,300,000</li>
        <li class="w_155 con_r p_r25 bold c_red">3,144,830</li>
        <li class="w_156 con_r p_r25 bold c_black ">23,155,170</li>
        </ul>

        <ul class="total_last">
        <li class="w_100 c c_black ">���հ�</li>
        <li class="w_100 c "></li>
        <li class="w_200 c "></li>
        <li class="w_100 c "></li>
        <li class="w_100 c "></li>
        <li class="w_155 con_r p_r25 c_blue ">315,600,000</li>
        <li class="w_155 con_r p_r25 c_red ">37,737,960</li>
        <li class="w_156 con_r p_r25 c_black ">277,862,040</li>
        </ul>
        </div>
      </ul>
    </div> -->

  </div>  
  </section>




<%@include file="../includes/footer.jsp"%>
