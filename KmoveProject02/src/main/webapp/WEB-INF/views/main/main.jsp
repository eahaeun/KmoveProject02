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
        <li class="w_210 con">${seishainCount}</li>
        </ul>
        <ul>
        <li class="w_180 tit">契約社員</li>
        <li class="w_210 con">${keiyakuCount}</li>
        </ul>
        <ul>
        <li class="w_180 tit">臨時社員</li>
        <li class="w_210 con">${rinjiCount}</li>
        </ul>
        <ul>
        <li class="w_180 tit">パートタイム</li>
        <li class="w_210 con">${partCount}</li>
        </ul>
<!--         <ul>
        <li class="w_180 tit">�Ͽ���</li>
        <li class="w_210 con">3</li>
        </ul> -->
        <ul>
        <li class="w_180 tit_total">総計</li>
        <li class="w_210 con b_yellow bold">${allshainCount}</li>
        </ul>
        </div>
      </ul>
      <ul class="top-10" style="float:right;"><input name="btnEmployeeMntGo" id="btnEmployeeMntGo" type="button" value="修正" class="btn"></ul>
    </div>
    
</div>

<hr>

<div class="main_titimg">
    <div class="p_total_tit p_t10">
      <ul class="p_b10" style="width:1080px"><img src="../resources/img/tit_p_total.png" width="63" height="17" hspace="10"></ul>
    </div>
    <div class="p_total p_b20">  
        <div id="table1" style="width:95.6%;">
        <p class="caption"></p>
        <ul>
        <li class="w_200 tit">帰属年月</li>
        <li class="w_200 tit">精算期間</li>
        <li class="w_100 tit">支給日</li>
        <li class="w_100 tit">人数</li>
        <li class="w_180 tit">支払総額</li>
        <li class="w_180 tit">控除総額</li>
        <li class="w_181 tit">差引総額</li>
         </ul>

<!--         <ul class="overColorSet">
        <li class="w_200 c ">2023-01</li>
        <li class="w_200 c">2023-01-01 ~ 2023-01-31</li>
        <li class="w_100 c">2023-02-05</li>
        <li class="w_100 c">8</li>
        <li class="w_155 con_r p_r25 bold c_blue">26,300,000</li>
        <li class="w_155 con_r p_r25 bold c_red">3,144,830</li>
        <li class="w_156 con_r p_r25 bold c_black ">23,155,170</li>
        </ul> -->
        
    </div>

  </div>  
</div>

<script>
$(document).ready(function() {

    // 페이지 로딩시 현재 연도 데이터 자동 로드
    var currentYear = new Date().getFullYear();
    $.ajax({
        type: 'GET',
        url: '/kyuyo/getKyuyoData',
        data: { kizoku_ym: currentYear },
        dataType: 'xml', // XML 데이터로 받기
        success: function(data) {
		
        	//컨테이너 요소 가져오기
        	var tableContainers = document.querySelectorAll("#table1");
        	var tableContainer = tableContainers[tableContainers.length - 1];

          //합계를 구하기 위한 변수 선언
            var totalSumSikyuPay = 0;
            var totalSumKojyoPay = 0;
            
          //데이터를 받아서 사용할 수 있게 변수에 넣음
            $(data).find('item').each(function() {
                var kizoku_ym = $(this).find('kizoku_ym').text();
                var count = $(this).find('count').text();
                var sumSikyuPay = $(this).find('sumSikyuPay').text();
                var sumKojyoPay = $(this).find('sumKojyoPay').text();
                var difference = parseInt(sumSikyuPay, 10) - parseInt(sumKojyoPay, 10);
              
                //합계 구하기
                totalSumSikyuPay += parseInt(sumSikyuPay, 10);
                totalSumKojyoPay += parseInt(sumKojyoPay, 10);
                
                //날짜 변환
                function getLastDayOfMonth(year, month) {
                	  // month에 1을 더해야 합니다. JavaScript의 getMonth()는 0부터 시작합니다.
                	  const date = new Date(year, month, 0);
                	  return date.getDate(); // 해당 월의 마지막 날짜 반환
                	}
                //월을 1월이면 01로 바꿔줌.
                function formatMonth(month) {
                	  // padStart() 함수를 사용하여 월을 두 자리 숫자로 변환합니다.
                	  return String(month).padStart(2, '0');
                	}
                
                var dateString = kizoku_ym; // 예시로 문자열 형식의 날짜

                var dateObject = new Date(dateString);
				var year = dateObject.getFullYear();
				//월은 0부터 시작하기 때문에 + 1을 해줌
				var month = formatMonth(dateObject.getMonth() + 1);
				//지급월은 다음달이기 때문에 + 2를 해줌
				var sikyuMonth = formatMonth(dateObject.getMonth() + 2);
				//지급 월이 12월이 넘어갈경우 다음年도 1월로
				if (sikyuMonth > 12) {
					   var nextYear = year + 1;
					  sikyuMonth = formatMonth(sikyuMonth - 12);
					}else{
						nextYear = year;
					}
				//마지막 일
				var lastDayOfMonth = getLastDayOfMonth(year, month);
				
				// 새로운 ul 요소 생성
	        	var newRow = document.createElement("ul");
	        	newRow.className = "anchor ulPayTotalList";
	        	
				// 각 li 요소의 내용 설정
				newRow.innerHTML =
				    '<li class="w_200 c ">' + kizoku_ym + '</li>' +
				    '<li class="w_200 c ">' + year + '-' + month + '-01 ~ ' + year + '-' + month + '-' + lastDayOfMonth + '</li>' +
				    '<li class="w_100 c ">' + nextYear + '-' + sikyuMonth + '-05</li>' +
				    '<li class="w_100 c ">' + count + '</li>' +
				    '<li class="w_155 con_r p_r25 bold c_blue">' + parseInt(sumSikyuPay, 10).toLocaleString() + ' &nbsp;&nbsp;</li>' +
				    '<li class="w_155 con_r p_r25 bold c_red">' + parseInt(sumKojyoPay, 10).toLocaleString() + ' &nbsp;&nbsp;</li>' +
				    '<li class="w_156 con_r p_r25 bold c_black ">' + (parseInt(sumSikyuPay, 10) - parseInt(sumKojyoPay, 10)).toLocaleString() + ' &nbsp;&nbsp;</li>';

				// 새로운 ul 요소를 컨테이너 요소에 추가
				tableContainer.appendChild(newRow);
            });
            
          	//합계 출력
            var totalRow = document.createElement("ul");
            totalRow.className = "b_yellow";

            totalRow.innerHTML =
                '<li class="w_200 c c_black ">合計</li>' +
                '<li class="w_200 p_t3"></li>' +
                '<li class="w_100 p_t3"></li>' +
                '<li class="w_100 p_t3"></li>' +
                '<li class="w_155 con_r p_r25 bold c_blue">' + parseInt(totalSumSikyuPay, 10).toLocaleString() + ' &nbsp;&nbsp;</li>' +
                '<li class="w_155 con_r p_r25 bold c_red">' + parseInt(totalSumKojyoPay, 10).toLocaleString() + ' &nbsp;&nbsp;</li>' +
                '<li class="w_156 con_r p_r25 bold c_black ">' + (parseInt(totalSumSikyuPay, 10) - parseInt(totalSumKojyoPay, 10)).toLocaleString() + ' &nbsp;&nbsp;</li>';

            // 새로운 합계 ul 요소를 컨테이너 요소에 추가
            tableContainer.appendChild(totalRow);
        },
        error: function() {
            alert('Error occurred while fetching data.');
        }
    });
});
</script>

<br><br>
<%@include file="../includes/footer.jsp"%>
