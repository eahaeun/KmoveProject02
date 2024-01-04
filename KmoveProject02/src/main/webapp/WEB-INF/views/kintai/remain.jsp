<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/modalheader.jsp"%>
<%@include file="../includes/menu.jsp"%>

<script>
// 검색
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
</script>

<div id="main_container">
  <!-- 타이틀 이미지 -->
    <div class="sub_titimg">
    <ul>
    <li class="tit_img p_r7"><img src="../resources/img/dils_tit_img.gif" width="61" height="68" alt="휴가조회" title="휴가조회"></li>
    <li class="p_t10"><img src="../resources/img/holiday_tit_01.png" width="201" height="25" alt="휴가조회" title="휴가조회"></li>
    <li class="p_t5">全社員の休暇状況を一括で確認できます。社員ごとの詳細な休暇履歴も確認できます。</li>
    </ul>
    </div>
    
    <hr>


   <!-- 사원관리 -->
<div class="main_titimg wp_100">
  <!-- 검색 & 정렬 -->
    <div class="search_box p_b10 p_l10 ">
    
	<form name="frmSrchEmployee" id="frmSrchEmployee" onsubmit="return $.fn.frmLeavItemSrchCheck();">
	<input type="hidden" name="frmEmplStatNum" id="frmEmplStatNum" value="1">
        <ul class="tit w_100 bold">* 休暇項目選択&nbsp;</ul> 
        <ul class="p_t1">
			<select name="selLvItCode" id="selLvItCode" style="width:130px;" class="goSelect">
           　		<option value="goLeaveSet">수정필요</option>
        </select>
        </ul>

        <ul class="p_l5">
        <input name="searchInput" id="searchInput" type="text" placeholder="キーワード入力" class="border w_170 height_22 p_l5" onkeyup="filterTable()"></ul>
        <ul class="p_t1">
        <input type="image" value="검색" src="../resources/img/btn_s_search.png" width="23px" height="23px" alt="검색" title="검색" class="p_l5 "></ul>
		</form>

      	<a href="/kintai/remain"><img name="btnSrchInit" id="btnSrchInit" type="image" value="전체보기" src="../resources/img/btn_list_all01.png" width="74px" height="23px" alt="전체보기" title="전체보기" class="p_l5"></a>
      
      
     	 <ul class="right p_t1" style="float:right;" id="jyoho">
          <div style="float:left; margin-left:160px;">
         	<select name="koyo_keitai" id="koyo_keitai" style="width:100px;" class="goSelect">
	            <option value="雇用形態" disabled selected>雇用形態</option>
	            <c:forEach items="${koyoKeitaiList}" var="koyoKeitai">
		            <option value="${koyoKeitai}">${koyoKeitai}</option>
		        </c:forEach>
          	</select>
          </div>
          
          <div style="float:left; margin-right:60px;">
          <select name="busho_nm" id="busho_nm" style="width:100px;" class="goSelect">
         		<option value="部署" disabled selected>部署</option>
           		<c:forEach items="${BushoList}" var="busho">
		            <option value="${busho.busho_nm}">${busho.busho_nm}</option>
		        </c:forEach>
          </select>
          </div>
      </ul>  

    </div>

   <!-- 휴가조회 리스트 -->
      <div class="e_total">
        <div id="table1">
        <p class="caption"></p>
        <ul>
        <li class="w_105 tit ">雇用形態</li>
        <li class="w_105 tit "><a href="" class="c_linkblue"><strong>社員番号</strong></a></li>
        <li class="w_100 tit"><a href="" class="c_linkblue"><strong>氏名</strong></a></li>
        <li class="w_120 tit"><a href="" class="c_linkblue"><strong>部署</strong></a></li>
        <li class="w_120 tit"><a href="" class="c_linkblue"><strong>役職</strong></a></li>
        <li class="w_170 tit">休暇項目</li>
        <li class="w_140 tit">全体</li>
        <li class="w_140 tit">使用</li>
        <li class="w_140 tit">残り</li>
        </ul>
		
		<div id="table_dil_data">
			<c:forEach items="${list}" var="shain">
		        <ul class="anchor clsListingTable shainList" data-shain-no="${shain.shain_no}">
		          <li class="w_105 ">${shain.koyo_keitai}</li>
		          <li class="w_105 ">${shain.shain_no}</li>
		          <li class="w_100 ">${shain.shain_nm}</li>
		          <li class="w_120 ">${shain.busho_nm}</li>
		          <li class="w_120 ">${shain.yakushoku_nm}</li>
		          <li class="w_170 ">수정필요</li>
		          <li class="w_140 bold">${shain.kyuka}</li>
		          <li class="w_140 bold c_blue">
			          	<c:forEach items="${khour}" var="khour">
		                      <c:if test="${khour.shain_no eq shain.shain_no}">
		                                ${khour.total_kintai_hour}
		                      </c:if>
		                </c:forEach>
		          </li>
		          <li class="w_140 bold c_red">
		          		<c:forEach items="${khour}" var="khour">
	                         <c:if test="${khour.shain_no eq shain.shain_no}">
	                                ${shain.kyuka - khour.total_kintai_hour}
	                         </c:if>
	                    </c:forEach>
		          </li>
		        </ul>
			</c:forEach>
		</div>

        </div>
    </div>

<!--     <div class="btn c">
    <li>
    <input name="btnGetPrint" id="btnGetPrint" type="image" value="인쇄하기" src="/_commonImg/btn_print_s.png" alt="인쇄하기" title="인쇄하기">
    <input name="btnGetExcel" id="btnGetExcel" type="image" value="엑셀로 다운로드" src="/_commonImg/btn_xls_down_s.png" hspace="15" alt="엑셀로 다운로드" title="엑셀로 다운로드">
    </li>
    </div> -->
 
  </div>
</div>


<!-- 모달 -->
<div id="kyukaModal" class="modal">
	<div class="modal-content" style="width: 36.5%;">		

		<ul class="tit">
    		<li><img src="../resources/img/pop_tit_holiday.png" class="p_t5"></li>
		</ul>

		<ul class="part">
          <div class="height_27 p_l15 p_t10 p_b10" style="width:500px;">
          <li class="bold c font16">休暇状況</li>
          </div>
            <div class="pop_table" style="width: 546px;">
	            <p class="caption"></p>
	            <ul>
	            <li class="w_92  tit"><strong>入力日</strong></li>
	            <li class="w_88  tit"><strong>勤怠項目</strong></li>
	            <li class="w_150  tit"><strong>開始日</strong></li>
	            <li class="w_150  tit"><strong>終了日</strong></li>
	            <li class="w_60  tit"><strong>日数</strong></li>
	            </ul>
            </div>
            
            <div id="disContentList" class="disContentList pop_table w_671 mCustomScrollbar _mCS_1">
	            <ul>
	            <li class="w_92  c">2017-01-11</li>
	            <li class="w_88  c">연차</li>
	            <li class="w_150 c ">2017-01-10</li>
	            <li class="w_150 c ">2017-01-10</li>
	            <li class="w_60  c bold c_blue">1</li>
	            </ul>
            </div>
            
        
		<hr class="hr_5">
		
    	</ul>

	</div><!-- end modal content -->
</div><!-- end modal -->
  
	
	
	
<script>
$(document).ready(function(){

	// 테이블 검색 갱신
	$("#koyo_keitai").change(function(){
	        var koyo_keitai = $("#koyo_keitai").val();
	        
	        $(".clsListingTable").hide();

	        $(".clsListingTable").each(function(){
	            var shain_koyo_keitai = $(this).find("li:eq(0)").text();
	            
	            if(shain_koyo_keitai === koyo_keitai){
	                $(this).show();
	            }
        });
	});
	
	$("#busho_nm").change(function(){
	        var busho_nm = $("#busho_nm").val();
	        
	        $(".clsListingTable").hide();

	        $(".clsListingTable").each(function(){
	            var shain_busho_nm = $(this).find("li:eq(3)").text();
	            
	            if(shain_busho_nm === busho_nm){
	                $(this).show();
	            }
        });
	});
    
	
	
	
	$('.shainList').click(function() {
		var shain_no = $(this).data('shain-no');
	    console.log("shain no : " + shain_no);
	    sendShainNoToServer(shain_no);
	});
    
	
	// 모달 오픈
    function openkyukaModal() {
        document.getElementById('kyukaModal').style.display = 'block';
    }
    
    $('#kyukaModal').on('shown.bs.modal', function () {
        updateTable(response);
    });
    
    
    // 모달 갱신 함수
    function updateTable(data) {
	    console.log("받아온 데이터:", data);
	
	    // 테이블의 tbody를 가져옴
	    var tbody = document.getElementById("disContentList");
	
	    // 기존의 테이블 내용 제거
	    tbody.innerHTML = "";
	
	    // 받아온 데이터를 이용하여 새로운 행 추가
	    for (var i = 0; i < data.length; i++) {
	        var row = document.createElement("ul");
	
	        // 각 셀에 데이터 추가
	        row.innerHTML =
	            '<li class="w_92 c">' + data[i].nyuryoku_ymd + '</li>' +
	            '<li class="w_88 c">' + data[i].kintai_km + '</li>' +
	            '<li class="w_150 c">' + data[i].kaishi_ymd + '</li>' +
	            '<li class="w_150 c">' + data[i].shuryo_ymd + '</li>' +
	            '<li class="w_60 bold c c_blue">' + data[i].kintai_hour + '</li>';
	
	        // 생성된 행을 테이블에 추가
	        tbody.appendChild(row);
	    }
	}
    
    
    

    function sendShainNoToServer(shain_no) {
        $.ajax({
            type: "POST",
            url: "/kintai/remain",
            data: { shain_no: shain_no },
            dataType: "json",
            success: function(response) {
                console.log("서버 응답:", response);
                updateTable(response);
                openkyukaModal();
            },
            error: function(error) {

                console.error("서버 통신 에러:", error);
            }
        });
    }
    

    window.onclick = function(event) {
        var modal = document.getElementById('kyukaModal');
        if (event.target === modal) {
            modal.style.display = "none";
        }
    }
 
});
</script>

<%@include file="../includes/footer.jsp" %>