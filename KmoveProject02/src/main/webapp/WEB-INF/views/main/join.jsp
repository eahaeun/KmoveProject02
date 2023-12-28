<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/joinheader.jsp"%>


<!-- 헤더 이미지 -->
<div class="visualWrap">
    <div class="visual visColor05">
      <div class="parttern">
        <div class="visContent">
          <img src="${pageContext.request.contextPath}/resources/img/visual_05.png" alt="회원님의 개인정보는 안전하게 보호되고 있습니다.">
          <div class="visContentBg"></div>
        </div>
      </div>
    </div>
    <div class="visualListWrap other">
      <div class="Smanag per"><a href="/pzPersonnel/employeeMnt.php"><span class="hidden">인사관리</span><span class="morph"><span class="livicon child" data-name="users" data-size="30" data-color="#fff" data-hovercolor="#fff" data-animate="true" data-eventtype="hover" data-onparent="true" data-loop="false" data-iteration="1" id="livicon-8" style="width: 30px; height: 30px;"><svg height="30" version="1.1" width="30" xmlns="http://www.w3.org/2000/svg" style="overflow: hidden; position: relative; left: -0.599976px; top: -0.400009px;" id="canvas-for-livicon-8"><desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Rapha챘l 2.1.0</desc><defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs><path fill="#ffffff" stroke="none" d="M8.672,21.086C8.573,20.894,8.524000000000001,20.755,8.524000000000001,20.755S8.092,21.009999999999998,8.092,20.291S8.524000000000001,20.755,8.956000000000001,17.979C8.956000000000001,17.979,10.154000000000002,17.619999999999997,9.914000000000001,14.639H9.627C9.627,14.639,9.770000000000001,14.007,9.864,13.210999999999999C9.860000000000001,12.880999999999998,9.870000000000001,12.529999999999998,9.901000000000002,12.144999999999998L9.939000000000002,11.688999999999998C9.918000000000001,11.161999999999999,9.832000000000003,10.683999999999997,9.627000000000002,10.375999999999998C8.907000000000002,9.297999999999998,8.619000000000003,8.578999999999997,7.036000000000002,8.063999999999998C5.453,7.55,6.028,7.652,4.878,7.705C3.726,7.757,2.766,8.423,2.766,8.785C2.766,8.785,2.0460000000000003,8.837,1.758,9.145C1.487,9.434999999999999,1.053,10.709999999999999,1.001,11.163V11.464C1.0479999999999998,12.163,1.259,14.086,1.4699999999999998,14.540000000000001L1.1839999999999997,14.643C0.9459999999999997,17.623,2.143,17.984,2.143,17.984C2.5749999999999997,20.756,3.0069999999999997,19.575000000000003,3.0069999999999997,20.294C3.0069999999999997,21.014,2.5749999999999997,20.757,2.5749999999999997,20.757S2.1919999999999997,21.889000000000003,1.2319999999999998,22.299000000000003C1.171,22.322,1.093,22.356,1,22.395V27.999H1.575C1.546,26.631999999999998,1.652,24.865,2.3209999999999997,24.151C2.677,23.771,3.844,23.146,8.672,21.086Z" opacity="1" stroke-width="0" transform="matrix(0.9375,0,0,0.9375,0,0)" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 1;"></path><path fill="#ffffff" stroke="none" d="M31,11.389C30.959,10.984,30.873,10.623,30.707,10.376C29.988,9.296999999999999,29.699,8.578999999999999,28.118000000000002,8.064C26.534000000000002,7.55,27.110000000000003,7.652,25.958000000000002,7.704C24.808000000000003,7.755999999999999,23.847,8.422,23.847,8.783999999999999C23.847,8.783999999999999,23.128,8.835999999999999,22.839000000000002,9.143999999999998C22.568,9.435999999999998,22.130000000000003,10.719999999999999,22.081000000000003,11.168999999999999H22.114000000000004L22.194000000000003,12.145999999999999C22.214000000000002,12.393999999999998,22.215000000000003,12.613,22.221000000000004,12.837C22.311000000000003,13.549999999999999,22.430000000000003,14.282,22.551000000000002,14.539L22.264000000000003,14.642C22.026000000000003,17.622,23.225,17.983,23.225,17.983C23.657,20.755,24.088,19.574,24.088,20.293C24.088,21.012999999999998,23.654,20.756,23.654,20.756S23.601,20.908,23.492,21.118C28.262,23.151999999999997,29.419,23.773,29.77,24.153C30.44,24.866999999999997,30.544999999999998,26.631999999999998,30.516,28.000999999999998H30.996V22.319999999999997C30.977999999999998,22.312999999999995,30.956999999999997,22.302999999999997,30.942999999999998,22.298C29.983999999999998,21.886999999999997,29.598999999999997,20.755999999999997,29.598999999999997,20.755999999999997S29.166999999999998,21.012999999999998,29.166999999999998,20.292999999999996C29.166999999999998,19.573999999999995,29.598999999999997,20.755999999999997,30.029999999999998,17.982999999999997C30.029999999999998,17.982999999999997,30.834999999999997,17.735999999999997,30.993,16.009999999999998V14.696999999999997C30.993,14.677999999999997,30.993,14.660999999999998,30.991,14.641999999999998H30.701999999999998C30.701999999999998,14.641999999999998,30.916999999999998,13.687999999999997,30.993,12.648999999999997V11.389999999999997H31Z" opacity="1" stroke-width="0" transform="matrix(0.9375,0,0,0.9375,0,0)" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 1;"></path><path fill="#ffffff" stroke="none" d="M21.14,21.271C20.01,20.787,19.557000000000002,19.452,19.557000000000002,19.452S19.047,19.755000000000003,19.047,18.907C19.047,18.058,19.557000000000002,19.452,20.067,16.178C20.067,16.178,21.48,15.753,21.199,12.238000000000001H20.859C20.859,12.238000000000001,21.709000000000003,8.479000000000001,20.859,7.206000000000001C20.01,5.933000000000002,19.671000000000003,5.085000000000001,17.801000000000002,4.4780000000000015C15.932000000000002,3.8710000000000013,16.614,3.9920000000000018,15.255000000000003,4.054000000000001C13.896000000000003,4.115000000000001,12.763000000000002,4.903000000000001,12.763000000000002,5.326000000000001C12.763000000000002,5.326000000000001,11.914000000000001,5.387000000000001,11.575000000000001,5.751000000000001C11.235000000000001,6.115000000000001,10.669,7.811000000000002,10.669,8.236S10.952,11.510000000000002,11.235000000000001,12.116L10.898000000000001,12.238C10.615000000000002,15.753,12.030000000000001,16.178,12.030000000000001,16.178C12.539000000000001,19.451,13.049000000000001,18.058,13.049000000000001,18.907C13.049000000000001,19.755,12.539000000000001,19.452,12.539000000000001,19.452S12.087000000000002,20.787000000000003,10.955000000000002,21.271C9.823000000000002,21.754,3.540000000000002,24.361,3.0290000000000017,24.907C2.5180000000000016,25.455,2.576000000000002,28,2.576000000000002,28H29.52C29.52,28,29.579,25.455,29.067,24.907C28.556,24.36,22.272,21.754,21.14,21.271Z" stroke-width="0" transform="matrix(0.9375,0,0,0.9375,0,0)" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path></svg></span></span></a></div>
      <div class="Smanag pay"><a href="/pzPayment/paymentMnt.php"><span class="hidden">급여관리</span><span class="morph"><span class="livicon child" data-name="balance" data-size="30" data-color="#fff" data-hovercolor="#fff" data-animate="true" data-eventtype="hover" data-onparent="true" data-loop="false" data-iteration="1" id="livicon-9" style="width: 30px; height: 30px;"><svg height="30" version="1.1" width="30" xmlns="http://www.w3.org/2000/svg" style="overflow: hidden; position: relative; left: -0.599976px; top: -0.400009px;" id="canvas-for-livicon-9"><desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Rapha챘l 2.1.0</desc><defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs><path fill="#ffffff" stroke="none" d="M6.024,15.772C4.886,16.547,3.078,19.65,3.524,20.602C4.182,22.011,8.692,22.82,10.317,20.726C11.168,19.634999999999998,9.139,16.46,7.941000000000001,15.771999999999998C7.9350000000000005,15.338,9.066,14.271999999999998,9.066,14.271999999999998S7.660000000000001,14.365999999999998,7.472,14.708999999999998C7.472,14.052999999999997,7.6080000000000005,13.604999999999997,7.6080000000000005,13.604999999999997S6.597,14.115999999999996,6.6290000000000004,14.708999999999996C6.2540000000000004,14.146999999999997,4.941000000000001,13.896999999999997,4.941000000000001,13.896999999999997S6.049,15.173,6.024,15.772Z" stroke-width="0" opacity="1" transform="matrix(0.9375,0,0,0.9375,0,-22.5)" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 1;"></path><path fill="#ffffff" stroke="none" d="M27,14.888C27,14.397,26.463,14,25.801,14H24.198999999999998C23.537,14,23,14.397,23,14.888C23,15.379,23.276,16,23.552,16S24.052,16.243,24.052,16.488S23.827,17,23.552,17S23,17.478,23,18.067V20.927C23,21.517,23.537,21.993,24.199,21.993H25.801000000000002C26.463,21.993,27.000000000000004,21.516,27.000000000000004,20.927V18.067C27,17.478,26.775,17,26.5,17S26,16.733,26,16.488S26.225,16,26.5,16S27,15.379,27,14.888Z" stroke-width="0" opacity="1" transform="matrix(0.9375,0,0,0.9375,0,-22.5)" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 1;"></path><path fill="#ffffff" stroke="none" d="M8,5H7L11,20.003H3L7,5H6L2,20.003V21.005C2,22.11,4.237,24,7,24S12,22.11,12,21.005C12,20.14,12,20.003,12,20.003L8,5Z" transform="matrix(0.9375,0,0,0.9375,0,0)" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><path fill="#ffffff" stroke="none" d="M26,5H25L29,20.002000000000002H21L25,5H24L20,20.002000000000002V21.004C20,22.109,22.237,24,25,24S30,22.109,30,21.004C30,20.139000000000003,30,20.002000000000002,30,20.002000000000002L26,5Z" transform="matrix(0.9375,0,0,0.9375,0,0)" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><path fill="#ffffff" stroke="none" d="M25.801,6H6.2C5.537,6,5,5.552,5,5S5.537,4,6.2,4H25.801C26.463,4,27,4.447,27,5S26.463,6,25.801,6Z" transform="matrix(0.9375,0,0,0.9375,0,0)" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path><path fill="#ffffff" stroke="none" d="M18,26.102V3.2C18,2.537,17.463,2,16.801,2H15.198999999999998C14.537,2,14,2.537,14,3.2V26.101C9.993,26.509,7,28.044,7,28.997C7,29.86,7,29.983999999999998,7,29.997H25V28.997C25,28.045,22.007,26.51,18,26.102Z" stroke-width="0" transform="matrix(0.9375,0,0,0.9375,0,0)" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path></svg></span></span></a></div>
    </div>
  </div>


<!-- 회원가입창 -->
<div class="content">
    <div class="joinWrap">
    
    <form id="joinForm" action="/join" method="post">
    <h3 class="tit" style="padding-top:10px;"><span class="hidden"></span><img src="${pageContext.request.contextPath}/resources/img/join_title_02.png" alt="정보입력"></h3>
    <div class="joinInfo">
      <h3 class="tit"><img src="${pageContext.request.contextPath}/resources/img/join_tit_01.png" alt="가입정보"></h3>
      <table cellpadding="0" cellspacing="0">
        <tbody>
          <tr>
            <th>ID</th>
            <td><input type="text" name="kanrisha_uid" id="frmSignUpIden" class="inputM" maxlength="12" style="ime-mode:disabled;"><span class="small">英数字で入力してください。</span><span id="disErrorId" class="errorMsg"></span></td>
          </tr>
          <tr>
            <th>パスワード</th>
            <td><input type="password" name="kanrisha_pw" id="frmSignUpPass" class="inputM" maxlength="16"><span class="small">8~16文字で入力してください。</span><span id="disErrorPW" class="errorMsg"></span></td>
          </tr>
          <tr>
            <th class="last">パスワード確認</th>
            <td class="last"><input type="password" name="confirm_pw" id="frmSignUpPassCmp" class="inputM" maxlength="16"><span class="small">同じパスワードをもう一度入力してください。</span><span id="disErrorPWCmp" class="errorMsg"></span></td>
          </tr>
        </tbody>
      </table>
    </div><!-- joinInfo -->
    
    <div class="chargeInfo">
      <h3 class="tit"><img src="${pageContext.request.contextPath}/resources/img/join_tit_03.png" alt="담당자 정보"></h3>
      <table cellpadding="0" cellspacing="0">
        <tbody>
          <tr>
            <th>管理者名</th>
            <td><input type="text" name="kanrisha_nm" id="frmSignUpOper" class="inputM" maxlength="15"><span id="disErrorOper" class="errorMsg"></span></td>
          </tr>
          <tr>
            <th>電話番号</th>            
            <td><input type="text" name="renraku_tel" id="frmSignUpOper" class="inputM" maxlength="15"><span id="disErrorOper" class="errorMsg"></span></td>
          </tr>
<!--           <tr>
            <th>인증번호</th>
            <td><input type="text" name="frmSignUpAuthNumber" id="frmSignUpAuthNumber" class="inputM" maxlength="10"><span class="small">수신된 인증번호를 정확히 입력해주세요.</span><span id="disErrorAuthNum" class="errorMsg"></span></td>
          </tr> -->
          <tr>
            <th class="last email">メールアドレス</th>
            <td class="last email">
              <input type="text" name="renraku_email" id="frmSignUpMailId" class="inputM" maxlength="30">
              <label for="frmSignUpMailOk"><input type="checkbox" id="frmSignUpMailOk" class="emailAcc" value="1"><span class="none anchor">メール受信同意</span></label><span id="disErrorMail" class="errorMsg"></span>
              <div class="clear"></div>
              <span class="small">メールアドレスは、ID/パスワードの検索に使用されるため、正確に入力してください。<br><span class="color">メール受信をしない場合、イベント、景品、割引案内などの特典を受け取れないかもしれません。</span></span>
            </td>
          </tr>
        </tbody>
      </table>
    </div><!-- chargeInfo -->
    
    <!-- 회원가입버튼 -->
    <div class="freeJoinBtn">
    <button type="submit" name="btnFreeSignUp">
    <img src="${pageContext.request.contextPath}/resources/img/join_free_btn.png" alt="무료 회원가입">
    </button>
    </div>
    </form>
  </div>
  </div>


<!-- <div class="container">
    <form id="joinForm" action="/join" method="post">
        <h2>회원 가입</h2>
        <div>
            <label for="id" id="id-label">아이디:</label> <input type="text" name="kanrisha_uid">
        </div>
        <div>
            <label for="pw" id="pw-label">비밀번호:</label> <input type="password" name="kanrisha_pw">
        </div>
        <div>
            <label for="pw-confirm" id="pw-confirm-label">비밀번호 확인:</label> <input type="password" name="confirm_pw">
        </div>
        <div>
            <label for="name" id="name-label">이름:</label> <input type="text" name="kanrisha_nm">
        </div>
        <div>
            <label for="tel" id="tel-label">전화번호:</label> <input type="text" name="renraku_tel">
        </div>
        <div>
            <label for="email" id="email-label">이메일:</label> <input type="text" name="renraku_email">
        </div>
        <div class="button-container">
            <input type="submit" value="회원 가입" class="search-button" onclick="validateAndSubmit()">
        </div>
    </form>
</div>


 -->

<%@include file="../includes/footer.jsp"%>
