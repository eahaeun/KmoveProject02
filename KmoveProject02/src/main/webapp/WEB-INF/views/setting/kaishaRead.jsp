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
    <li class="tit_img"><img src="../resources/img/setting_tit_img.gif" width="70" height="68"></li>
    <li class="p_t10"><img src="../resources/img/setting_tit_01.png" width="108" height="24" alt="사용자 정보" title="사용자 정보"><span style="color:#FFFFFF;">(94336)</span></li>
    <li class="p_t5"> <span class="tit_h">＊は必須入力項目</span>です。必須入力項目未入力の場合、サービスの利用ができません。</li>
    </ul>
    </div>
    <hr>
    
    
<form action="/setting/allUpdate" method="post" id="myForm">
   <!-- 회사정보 -->
   <div class="main_titimg">
    
    <div class="c_info">
      <ul class="p_b10"><img src="../resources/img/setting_tit_02.png" width="63" height="19" alt="회사정보"></ul>
      <ul>
        <div id="table1">
        <p class="caption"></p>
        <ul>
        <li class="w_105 titLeft p_l15"><font class="c_red">*</font> 会社名</li>
        <li class="w_260 con2"><input id="kaisha_nm" name="kaisha_nm" type="text" value="${kaisha.kaisha_nm}" class="white"></li>
        <li class="w_120 titLeft p_l15"><font class="c_red">*</font> 代表者</li>
        <li class="w_246 con2"><input name="daihyosha" id="daihyosha" type="text" value="${kaisha.daihyosha}" style="width:105px;" class="white_ext"></li>
        </ul>
        <ul>
        <li class="w_105 titLeft p_l15"><font class="c_red">*</font> 事業者番号</li>
        <li class="w_260 con2"><input name="jigyosha_no" id="jigyosha_no" type="text" value="${kaisha.jigyosha_no}" class="white"></li>
        <li class="w_107 titLeft p_l28">法人番号</li>
        <li class="w_246 con2"><input name="hojin_no" id="hojin_no" type="text" value="${kaisha.hojin_no}" class="white"></li>
        </ul>
        <ul>
        <li class="w_92 titLeft p_l28">設立日</li>
        <li class="w_260 con2">
          <input name="setsuritsu_ymd" id="setsuritsu_ymd" class="white hasDatepicker" style="" value="${kaisha.setsuritsu_ymd}">
        </li>
        <li class="w_107 titLeft p_l28">ホームページ</li>
        <li class="w_246 con2"><input name="homepage" id="homepage" type="text" class="white" value="${kaisha.homepage}"></li>
        </ul>
        <ul>
        <li class="w_105 titLeft p_l15"><font class="c_red">*</font> 住所</li>
        <li class="w_660 con2">
		<input id="address" name="address" type="text" value="${kaisha.address}" class="postcodify_address white" style="width:500px;">
        </li>
        </ul>
        <ul>
        <li class="w_105 titLeft p_l15"><font class="c_red">*</font> 連絡先</li>
        <li class="w_260 con2">
		<input id="kaisha_tel" name="kaisha_tel" type="text" value="${kaisha.kaisha_tel}" class="postcodify_address white" style="width:500px;">
        </li>
        <li class="w_107 titLeft p_l28">FAX</li>
        <li class="w_246 con2">
		<input id="renraku_fax" name="renraku_fax" type="text" value="${kaisha.renraku_fax}" class="postcodify_address white" style="width:500px;">
        </li>
        </ul>
        <ul>
        <li class="w_92 titLeft p_l28">業態</li>
        <li class="w_260 con2"><input id="jitai" name="jitai" type="text" value="${kaisha.jitai}" class="white"></li>
        <li class="w_107 titLeft p_l28">業種</li>
        <li class="w_246 con2"><input id="jishu" name="jishu" type="text" value="${kaisha.jishu}" class="white"></li>
        </ul>
        </div>
      </ul>      
    </div><!-- end company_info -->


	<br><br><br>

  <!-- 담당자 정보 -->
    <div class="staff_info">
      <ul class="p_b10"><img src="../resources/img/setting_tit_03.png" width="78" height="19" alt="담당자 정보"><span style="font-size:10px;color:#FFFFFF;"></span></ul>  
      <ul>
        <div id="table1">
        <p class="caption"></p>
        <ul>
        <li class="w_85 titLeft p_l15"><font class="c_red">*</font> 氏名</li>
        <li class="w_200 con2">
        	<input name="kanrisha_nm" id="kanrisha_nm" type="text" value="${kanrisha.kanrisha_nm}" class="white">
        </li>
        </ul>
        
        <ul>
        <li class="titLeft p_l28" style="width:72px;">管理者ID</li>
        <li class="w_200 con2">  
        	<input name="kanrisha_uid" id="kanrisha_uid" type="text" value="${kanrisha.kanrisha_uid}" class="white">
        </li>
        </ul>
        
        <ul>
        <li class="titLeft p_l28" style="width:72px;">パスワード</li>
        <li class="w_200 con2">
        	<input name="kanrisha_pw" id="kanrisha_pw" type="password" value="${kanrisha.kanrisha_pw}" class="white">
        </li>
        </ul>
        
        <ul>
        <li class="titLeft p_l28" style="width:72px;">電話番号</li>
        <li class="w_200 con2">
        	<input name="renraku_tel" id="renraku_tel" type="text" value="${kanrisha.renraku_tel}" class="white">
        </li>
        </ul>
        
        <ul>
        <li class="titLeft p_l28" style="width:72px;">メール</li>
        <li class="w_200 con2">
        	<input name="renraku_email" id="renraku_email" type="text" value="${kanrisha.renraku_email}" class="white">
        </li>
        </ul>
        
        </div>
      </ul>
    </div>

</div>



  <!-- 메인 버튼 -->
    <div class="btn">
    <input id="btnAllSave" name="btnAllSave" type="image" value="저장하기" src="../resources/img/btn_img_save_s.png" alt="저장하기" title="저장하기" onclick="submitForm()">
    <span class="p_l10">
	  <span id="btnSaveReset" name="btnSaveReset" class="anchor" onclick="moveToKaishaRead()">
	    <img src="../resources/img/btn_img_cancle_s.png" hspace="5" alt="취소하기" title="취소하기">
	  </span>
	</span>
    </div>


  </form>
  </div>

<script>
function submitForm() {
    var myForm = document.getElementById("myForm"); 
    myForm.submit();
}

function moveToKaishaRead() {
    window.location.href = "/setting/kaishaRead";
}
</script>




<%@include file="../includes/footer.jsp"%>