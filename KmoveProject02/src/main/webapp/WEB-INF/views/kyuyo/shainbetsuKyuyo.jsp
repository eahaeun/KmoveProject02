<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@include file="../includes/modalheader.jsp"%>
<%@include file="../includes/menu.jsp"%>


<div id="main_container">
  <!-- 타이틀 이미지 -->
    <div class="sub_titimg">
	    <ul>
	    <li class="tit_img p_r7"><img src="../resources/img/paylist_tit_img.gif" width="70" height="68" alt="사원별 급여내역" title="사원별 급여내역"></li>
	    <li class="p_t10"><img src="../resources/img/paylist_tit_01.png" width="150" height="25" alt="사원별 급여내역" title="사원별 급여내역"></li>
	    <li class="p_t5">社員の給与明細を一目で確認できるメニューが提供されています。検索期間と社員を確認してください。</li>
	    </ul>
    </div>
    
    <hr><!-- end sub titimg -->


 <!-- 사원관리 -->
<div class="main_titimg wp_100">

<!-- 검색 & 정렬 -->
<form name="frmEmployeeSearch" id="frmEmployeeSearch">
  <div class="e_total">
    <div class="border_paysearch_2 wp_99 ">
      <ul class="bold w_80 p_t5 c">* 期間選択 </ul>
      <ul><input name="start_ym" id="start_ym" type="month" class="border w_85 height_22 p_l5 c frmCalendar hasDatepicker">~<input name="end_ym" id="end_ym" type="month" class="border w_85 height_22 p_l5 c frmCalendar hasDatepicker"></ul>
      <ul class="bold w_85 p_t5 c">* 社員選択 </ul>
      <ul>
      	<input id="modalBtn" type="text" value="" class="border w_85 height_22 p_l5 anchor" placeholder="選択">
      </ul>
      <ul class="p_t1"><span name="btnSearchEmployee" id="btnSearchEmployee" class="anchor"><img src="../resources/img/btn_s_search.png" width="23px" height="23px" alt="사원 검색" title="사원검색" class="p_l5 "></span></ul>
      <ul class="p_t1"><input type="image" value="급여내역 조회" src="../resources/img/btn_paylist.png" width="95px" height="23px" alt="급여내역 조회" title="급여내역 조회" class="p_l5 "></ul>
    </div> <!-- end border_paysearch_2 -->
  </div> <!-- end e_total -->
  
  <hr class="hr_0">

<!-- 사원별 급여내역 리스트 -->
</form>
<div class="e_total">
	<div id="table1" style="width:74.4%">
	<p class="caption"></p>
	<ul>
		<li class="tit" style="width:467.8px;">月別給与明細</li>
		<li class="bold c b_red" style="width:407px;">社会保険明細</li>
	</ul>
	
	<!-- 헤더 -->
	<ul>
		<li class="w_105 tit_s bold "><a href="#" class="c_linkblue"><strong>帰属年月</strong></a></li>
		<li class="w_120 tit_s bold">支給総額</li>
		<li class="w_120 tit_s bold">控除総額</li>
		<li class="w_120 tit_s bold">差引総額</li>
		
		<li class="w_100 tit_s bold">国民年金</li>
		<li class="w_100 tit_s bold">健康保険</li>
		<li class="w_105 tit_s bold">介護保険</li>
		<li class="w_100 tit_s bold">雇用保険</li>
	</ul>
	
	<!-- 내용 -->
	<ul class="clsRows">
		 <li class="w_105 ">未選択</li>
		 <li class="w_120 a_r"><span class="private_mr8">0</span></li>
		 <li class="w_120 a_r"><span class="private_mr8">0</span></li>
		 <li class="w_120 a_r"><span class="private_mr8">0</span></li>
		 <li class="w_100 a_r"><span class="private_mr8">0</span></li>
		 <li class="w_100 a_r"><span class="private_mr8">0</span></li>
		 <li class="w_105 a_r"><span class="private_mr8">0</span></li>
		 <li class="w_100 a_r"><span class="private_mr8">0</span></li>
	</ul>
	
	<!-- 합계 -->
	<ul class="b_yellow ">
		 <li class="w_105 bold p_t3">합계</li>
		 <li class="w_120 a_r"><span class="private_mr8"></span></li>
		 <li class="w_120 a_r"><span class="private_mr8"></span></li>
		 <li class="w_120 a_r"><span class="private_mr8"></span></li>
		 <li class="w_100 a_r"><span class="private_mr8"></span></li>
		 <li class="w_100 a_r"><span class="private_mr8"></span></li>
		 <li class="w_105 a_r"><span class="private_mr8"></span></li>
		 <li class="w_100 a_r"><span class="private_mr8"></span></li>
	</ul>
	
	  </div><!-- end table1 -->
</div><!-- end e_total -->


<div class="btn c" style="margin-left: -130px;">
	<li>
	<input name="btnKyuyoReg" id="btnKyuyoReg" type="image" src="../resources/img/btn_xls_down_s.png" hspace="15">
	<a href="/kyuyo/kyuyoDaicho"><img title="급여대장 목록" src="../resources/img/btn_pay_list.png" hspace="0" alt="급여대장 목록"></a>
	</li>
</div>
    
	</div><!-- end main_titimg(사원관리) -->
</div><!-- end main container -->





<!-- 모달 -->
<div id="myModal" class="modal">
  <div class="modal-content" style="width:625px; height:500px;">
    <div id="pop01" class="w_620">
    	<ul class="tit">
			<li>給与詳細を確認する社員選択</li>
		</ul>
		
		<ul class="part">
      	<div class="pop_search_l5 w_590 height_30 top-10">
	        <li>
	        	<input name="searchInput" id="searchInput" type="text" class="text" placeholder="社員検索" onkeyup="filterTable()">
	        </li>
	        
	        <li class="p_t1"><input type="image" value="사원검색" src="../resources/img/btn_s_search.png" width="23px" height="23px" class="p_l5 ">
	        </li>
	        
	        <li class="p_t1 p_l5">
	        	<a href="#none"><img name="btnAllView" id="btnAllView" type="image" value="전체보기" src="../resources/img/btn_list_all.png" width="74px" height="23px" style="cursor:pointer"></a>
	        </li>
      	</div>
      	
      <div class="pop_table_ecard w_590">
        <p class="caption"></p>
          <ul>
            <li class="w_100   tit"><strong>雇用形態</strong></li>
            <li class="w_100  tit"><strong>社員番号</strong></li>
            <li class="w_88  tit"><strong>氏名</strong></li>
            <li class="w_105  tit"><strong>部署</strong></li>
            <li class="w_102  tit"><strong>役職</strong></li>
            <li class="w_88  tit"><strong>在職状態</strong></li>
          </ul>
      </div>
          
      <div id="disContentList" class="holiday disContentList" style="width:617px">
       <div id="table_dil_data" class="pop_table_ecard" style="width:590px">
       
      　　　<c:forEach var="shain" items="${shainjyoho}">
	        <ul id="ulEmployee" onclick="goKyuyoJyoho('${shain.shain_no}')" style="cursor:pointer;">
	          <li class="w_100 c">${shain.koyo_keitai}</li>
	          <li class="w_100 c">${shain.shain_no}</li>
	          <li class="w_88 c">${shain.shain_nm}</li>
	          <li class="w_105 c">${shain.busho_nm}</li>
	          <li class="w_102 c">${shain.yakushoku_nm}</li>
	          <li class="w_88 c">${shain.zaishoku_st}</li>
	        </ul>
    	</c:forEach>

       <hr class="hr_5">
       
       </div><!-- end table_dil_data -->
      </div><!-- end disContentList -->
          
	    </div>
    </div><!-- end modal content -->
</div><!-- end modal -->



<script>
function openModal() {
	document.getElementById('myModal').style.display = 'block';
}

// 모달 닫기 함수
function closeModal() {
	document.getElementById('myModal').style.display = 'none';
}

//선택한 사원 정보 표시 함수 (AJAX를 이용한 데이터 요청)
function goKyuyoJyoho(shain_no) {
	
	var startYearMonth = document.getElementById('start_ym').value;
    var endYearMonth = document.getElementById('end_ym').value;
	console.log("selected YM : " + startYearMonth + " ~ " + endYearMonth);
    
	$.ajax({
        url: '/kyuyo/kyuyoJyoho', // 여기에 컨트롤러의 URL을 입력하세요
        type: 'GET',
        data: { shain_no: shain_no,
            	start_ym: startYearMonth,
            	end_ym: endYearMonth
           	}, // 선택된 사원 번호, 선택 년월 기간을 전송
           dataType: 'xml', 
        success: function(data) {
            
            var totalSikyuPay = 0;
            var totalKojyoPay = 0;
            var totalKokuminNenkin = 0;
            var totalKenkoHoken = 0;
            var totalChoukiRyouyohoken = 0;
            var totalKoyouHoken = 0;
            var kyuyoJyohoCount = 0;
            
          	//테이블 정보 가져오기	
			var tableContainer = document.getElementById("table1");	
			
			//기존 정보 삭제
			while (tableContainer.children.length > 3) {
        		tableContainer.removeChild(tableContainer.lastChild);
		    }
			
            $(data).find('kyuyoJyoho').each(function() {
				
				var kizoku_ym = $(this).find('kizoku_ym').text();
				var sikyu_pay = $(this).find('sikyu_pay').text();
				var kojyo_pay = $(this).find('kojyo_pay').text();
				var difference = parseInt(sikyu_pay, 10) - parseInt(kojyo_pay, 10);
				
				console.log(kizoku_ym + sikyu_pay + kojyo_pay + difference);
				var shainData = $(data).find('shainjyoho').filter(function() {
				    return $(this).find('shain_no').text() === shain_no;
				});
				
				var shain_nm = shainData.find('shain_nm').text();
				var kihon_pay = shainData.find('kihon_pay').text();
				
				modalBtn.value = shain_nm;
				var kokuminNenkin = kihon_pay * 0.045;
				var kenkoHoken = kihon_pay * 0.03545;
				var choukiRyouyohoken = Math.floor(kihon_pay * 0.03545 * 0.0645 / 10) * 10;
				var koyouHoken = kihon_pay * 0.009;
				
				totalKokuminNenkin += parseInt(kokuminNenkin, 10);
				totalKenkoHoken += parseInt(kenkoHoken, 10);
				totalChoukiRyouyohoken += parseInt(choukiRyouyohoken, 10);
				totalKoyouHoken += parseInt(koyouHoken, 10);
				totalSikyuPay += parseInt(sikyu_pay, 10);
				totalKojyoPay += parseInt(kojyo_pay, 10);
				
				kyuyoJyohoCount = $(data).find('kyuyoJyoho').length;
				
				var newRow = document.createElement("ul");
				newRow.className = "clsRows";
				
				newRow.innerHTML = 
				    '<li class="w_105">' + kizoku_ym + '</li>' +
				    '<li class="w_120 a_r"><span class="private_mr8">' + parseInt(sikyu_pay, 10).toLocaleString() + '</span></li>' +
				    '<li class="w_120 a_r"><span class="private_mr8">' + parseInt(kojyo_pay, 10).toLocaleString() + '</span></li>' +
				    '<li class="w_120 a_r"><span class="private_mr8">' + parseInt(difference, 10).toLocaleString() + '</span></li>' +
				    '<li class="w_100 a_r"><span class="private_mr8">' + parseInt(kokuminNenkin, 10).toLocaleString() + '</span></li>' +
				    '<li class="w_100 a_r"><span class="private_mr8">' + parseInt(kenkoHoken, 10).toLocaleString() + '</span></li>' +
				    '<li class="w_105 a_r"><span class="private_mr8">' + parseInt(choukiRyouyohoken, 10).toLocaleString() + '</span></li>' +
				    '<li class="w_100 a_r"><span class="private_mr8">' + parseInt(koyouHoken, 10).toLocaleString() + '</span></li>';


		    // 기존 리스트를 새로운 리스트로 갱신
				tableContainer.appendChild(newRow);
			});
            
         	// 합계를 나타내는 ul 요소
            var totalUl = document.createElement("ul");
            totalUl.className = "b_yellow";

            // 각 li 요소의 내용 설정
            totalUl.innerHTML =
                '<li class="w_105 bold p_t3">합계</li>' +
                '<li class="w_120 a_r"><span class="private_mr8">' + parseInt(totalSikyuPay, 10).toLocaleString() + '</span></li>' +
                '<li class="w_120 a_r"><span class="private_mr8">' + parseInt(totalKojyoPay, 10).toLocaleString() + '</span></li>' +
                '<li class="w_120 a_r"><span class="private_mr8">' + parseInt((totalSikyuPay - totalKojyoPay), 10).toLocaleString() + '</span></li>' +
                '<li class="w_100 a_r"><span class="private_mr8">' + parseInt(totalKokuminNenkin, 10).toLocaleString() + '</span></li>' +
                '<li class="w_100 a_r"><span class="private_mr8">' + parseInt(totalKenkoHoken, 10).toLocaleString() + '</span></li>' +
                '<li class="w_105 a_r"><span class="private_mr8">' + parseInt(totalChoukiRyouyohoken, 10).toLocaleString() + '</span></li>' +
                '<li class="w_100 a_r"><span class="private_mr8">' + parseInt(totalKoyouHoken, 10).toLocaleString() + '</span></li>';


            // 합계를 나타내는 ul 요소를 컨테이너 요소에 추가
			tableContainer.appendChild(totalUl);
				
			closeModal();
        },
        error: function() {
            // 오류 발생 시 처리할 코드
            alert('오류가 발생했습니다.');
        }
    });
}

//모달 버튼 클릭 시 모달 열기
document.getElementById('modalBtn').addEventListener('click', openModal);


function filterTable() {
	  // 입력된 검색어 가져오기
	  var input = document.getElementById('searchInput'); // 만약 다른 ID를 사용하고 싶다면 해당 ID로 변경
	  console.log("searchInput : " + searchInput);
	  var filter = input.value.toUpperCase();

	  // 테이블과 행 가져오기
	  var table = document.getElementById('table_dil_data');
	  var ulElements = table.getElementsByTagName('ul');

	  // 각 행을 반복하며 필터링 적용
	  for (var i = 0; i < ulElements.length; i++) {
	    var lis = ulElements[i].getElementsByTagName('li');
	    var found = false; // 검색어 일치 여부

	    // 각 li에 대해 검색어 일치 확인
	    for (var j = 0; j < lis.length; j++) {
	      var li = lis[j];
	      if (li) {
	        var txtValue = li.textContent || li.innerText;
	        if (txtValue.toUpperCase().indexOf(filter) > -1) {
	          found = true;
	          break;
	        }
	      }
	    }

	    // 검색어에 일치하는 경우 행을 보이게 하고, 아닌 경우 숨김 처리
	    if (found) {
	      ulElements[i].style.display = '';
	    } else {
	      ulElements[i].style.display = 'none';
	    }
	  }
	}

//전체보기 버튼 클릭 시 숨겨진 li 요소들을 모두 보이게 처리하는 함수
document.getElementById('btnAllView').addEventListener('click', function() {
    var table_dil_data = document.getElementById('table_dil_data');
    var ulElements = table_dil_data.getElementsByTagName('ul');

    // 각 행을 반복하며 모두 보이게 처리
    for (var i = 0; i < ulElements.length; i++) {
        ulElements[i].style.display = '';
    }
});

//버튼 클릭 시 페이지 이동 함수
document.getElementById('btnKyuyoReg').addEventListener('click', function() {
    window.location.href = '/kyuyo/kyuyokanrishokigamen';
});

//모달 밖 클릭시 모달close
var myModal = document.getElementById('myModal');

window.addEventListener('click', function(event) {
	if (event.target === myModal) {
		closeModal();
	}
});
</script>














<%@include file="../includes/footer.jsp"%>