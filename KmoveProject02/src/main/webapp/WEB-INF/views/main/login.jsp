<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/loginheader.jsp"%>
<%@include file="../includes/loginmenu.jsp"%>



<div class="visualWrap">
	<div class="visual visColor01_2">
		<div class="parttern">
			<div class="visContent">
				<img src="../resources/img/main_visual_02.png">
				
				<!-- 회원가입 -->
				<span class="join"><a href="/main/join">
				<img src="../resources/img/visual_join_btn.png">
				</a></span>
				
				<!-- 로그인 -->
				<span class="trial" id="loginButton">
				    <img src="../resources/img/visual_trial_btn.png">
				</span>

			</div>
			<div class="visContentBg"></div>
		</div>
	</div>
</div>



<!-- 로그인 모달 -->
<div id="loginModal" class="modal">
	<div class="modal-content">
		
		
		   <div class="logLayer">
		      <h1><img src="../resources/img/login_layer_tit.png"></h1>
			<form name="loginForm" id="loginForm" method="post">
			<input id="frmReturnUri" name="frmReturnUri" type="hidden" value="/pzDiligence/diligenceMnt.php">
		      <div class="loginWrap">
		        <div class="login">
		          <input name="kanrisha_uid" id="kanrisha_uid" type="text" class="idInput" placeholder="ID" maxlength="12" style="ime-mode:disabled;">
		          <input name="kanrisha_pw" id="kanrisha_pw" type="password" class="pwInput" placeholder="PASSWORD" maxlength="16">
		          <div class="clear"></div>
		          
		          <!-- <input type="checkbox" name="chkPZIdSave" id="chkPZIdSave" value="ok" class="checkbox"><span><label for="chkPZIdSave"><img src="https://img.payzon.co.kr/_guideImg/common/save_id.gif" alt="아이디 저장" class="anchor"></label></span>
		          <input type="checkbox" name="chkSecuCon" id="chkSecuCon" class="checkbox"><span><label for="chkSecuCon"><img src="https://img.payzon.co.kr/_guideImg/common/security_log.gif" alt="보안접속" class="anchor"></label></span> -->
		        
		        </div>
		        
		        <!-- 로그인버튼 -->
		        <span name="loginBtn" id="loginBtn" class="anchor"><img src="../resources/img/login_layer_btn.png"></span>
		        <div class="clear"></div>
		    </div><!-- loginWrap -->
		</form>
		
		    <div class="bottom">
		    
<!-- 		      <div class="section">
		        <img src="https://img.payzon.co.kr/_guideImg/common/login_layer_img_01.gif" alt="">
		          <div>
		            <img src="https://img.payzon.co.kr/_guideImg/common/login_layer_txt_01.gif" alt="비밀번호를 잊으셨나요?">
		            <a href="/pzServiceGuide/memberFinder.php" target="_parent"><img src="https://img.payzon.co.kr/_guideImg/common/login_layer_find_btn.gif" alt="아이디/비밀번호 찾기"></a>
		          </div>
		      </div> -->
		      
		      <div class="section" style="margin-left:40px;">
		        <img src="../resources/img/login_layer_img_02.gif">
		          <div>
		            <img src="../resources/img/login_layer_txt_02.png">
		            <a href="/main/join" target="_parent">
		            <img src="../resources/img/login_layer_join_btn.png" alt="회원가입">
		            </a>
		          </div>
		      </div>
		      
		      
		    </div><!-- bottom -->
		    <span class="anchor"><img src="https://img.payzon.co.kr/_guideImg/common/layer_close_btn.gif" class="close" alt="닫기"></span>
		   </div>
		 
		 <iframe name="iFrmLog2" id="iFrmLog2" src="about:blank" tabindex="-1" width="0px" height="0px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" class="disHide"></iframe>
		
		
	</div>
</div>











<script>
// 모달 오픈/클로즈 함수
function openLoginModal() {
	document.getElementById('loginModal').style.display = 'block';
}

function closeLoginModal() {
	document.getElementById('loginModal').style.display = 'none';
}
</script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        // 로그인 버튼에 클릭 이벤트 리스너 추가
        document.getElementById('loginButton').addEventListener('click', openLoginModal);

        // openLoginModal 함수 정의
        function openLoginModal() {
            document.getElementById('loginModal').style.display = 'block';
        }
    });
    
    
 	// 로그인 버튼에 클릭 이벤트 리스너 추가
    document.getElementById('loginBtn').addEventListener('click', function () {
        // 폼 요소에 대한 참조 가져오기
        var loginForm = document.getElementById('loginForm');

        // 폼 요소가 존재한다면
        if (loginForm) {
            // 액션 속성 설정 (post 요청을 보낼 주소)
            loginForm.action = '/main/login';

            // 폼 제출
            loginForm.submit();
        }
    });
</script>

<c:if test="${not empty error}">
	<script>
		// Flash attribute에서 전달된 메시지를 alert로 표시
		alert("${error}");
	</script>
</c:if>

<%@include file="../includes/footer.jsp"%>
