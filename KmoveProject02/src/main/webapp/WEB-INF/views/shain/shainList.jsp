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
    <li class="tit_img p_r7"><img src="../resources/img/eadmin_tit_img.gif" width="70" height="68" alt="사원관리" title="사원관리"></li>
    <li class="p_t10"><img src="../resources/img/eadmin_tit_01.png" width="131" height="25" alt="사원관리" title="사원관리"></li>
    <li class="p_t5">全社員の現状を確認でき、選択すると該当社員の情報ページに移動します。</li>
    </ul>
    </div><!-- end subtitimg -->
    
    <hr>
    
    
    <!-- 사원 버튼 -->
    <div class="main_titimg wp_100">

    <div class="e_total p_t10">
      <ul class="em_count em_count_work">
        <li>
          <p><img src="../resources/img/em_count_title_01.png" alt="在職者"></p>
          <div><h2 id="zaishokusha" style="line-height: 10px; cursor: pointer;">${zaishokushaCount}</h2></div>
        </li>
      </ul>
      <ul class="em_count em_count_division">
        <li>
          <p><img src="../resources/img/em_count_title_02.png" alt="正社員"></p>
          <div><h2 id="seishain" style="line-height: 10px; cursor: pointer;">${seishainCount}</h2></div>
          <i></i>
        </li>
        <li>
          <p><img src="../resources/img/em_count_title_03.png" alt="契約社員"></p>
          <div><h2 id="keiyaku" style="line-height: 10px; cursor: pointer;">${keiyakuCount}</h2></div>
          <i></i>
        </li>
        <li>
          <p><img src="../resources/img/em_count_title_04.png" alt="臨時社員"></p>
          <div><h2 id="rinji" style="line-height: 10px; cursor: pointer;">${rinjiCount}</h2></div>
          <i></i>
        </li>
        <li>
          <p><img src="../resources/img/em_count_title_05.png" alt="派遣社員"></p>
          <div><h2 id="haken" style="line-height: 10px; cursor: pointer;">${hakenCount}</h2></div>
          <i></i>
        </li>
        <li>
          <p><img src="../resources/img/em_count_title_06.png" alt="委託社員"></p>
          <div><h2 id="itaku" style="line-height: 10px; cursor: pointer;">${itakuCount}</h2></div>
          <i></i>
        </li>
        <li>
          <p><img src="../resources/img/em_count_title_07.png" alt="パートタイム"></p>
          <div><h2 id="part" style="line-height: 10px; cursor: pointer;">${partCount}</h2></div>
        </li>
      </ul>
      <ul class="em_count em_count_resign">
        <li>
          <p><img src="../resources/img/em_count_title_08.png" alt="退職者"></p>
          <div><h2 id="taishokusha" style="line-height: 10px; cursor: pointer;">${taishokushaCount}</h2></div>
        </li>
      </ul>
      <ul class="em_count em_count_total">
        <li>
          <p><img src="../resources/img/em_count_title_09.png" alt="全体社員"></p>
          <div><h2 id="allshain" style="line-height: 10px; cursor: pointer;">${allshainCount}</h2></div>
        </li>
      </ul>
    </div>
    
    <button type="button" id="currentEmployeeButton" style="display: none;">在職者</button>
	<button type="button" id="regularEmployeeButton" style="display: none;">正社員</button>
	<button type="button" id="contractEmployeeButton" style="display: none;">契約社員</button>
	<button type="button" id="temporaryEmployeeButton" style="display: none;">臨時社員</button>
	<button type="button" id="dispatchedEmployeeButton" style="display: none;">派遣社員</button>
	<button type="button" id="commissionedEmployeeButton" style="display: none;">委託社員</button>
	<button type="button" id="partTimeEmployeeButton" style="display: none;">パートタイム</button>
	<button type="button" id="formerEmployeeButton" style="display: none;">退職者</button>
	<button type="button" id="allEmployeeButton" style="display: none;">全体社員</button>
	    

	<br/><br/><br/>
	
	
	
	
    <!-- 사원관리 리스트 -->
      <div class="e_total">

        <div id="table1" style="width:1149px;">
        <p class="caption"></p>
        <ul>
        <li class="w_24 tit"><label class="label_check" for="chkBoxGrpEmployeeInfo"><input type="checkbox" id="selectAllCheckbox"/></label></li>
		<li class="tit w_74">雇用形態</li>
		<li class="tit w_100">入社日</li>
		<li class="tit w_92">社員番号</li>
		<li class="tit w_92">氏名</li>
		<li class="tit w_100">部署</li>
		<li class="tit w_90">役職</li>
		<li class="tit w_110">生年月日</li>
		<li class="tit w_120">携帯電話</li>
		<li class="tit w_165">メール</li>
		<li class="tit w_100">退職日</li>
		<li class="tit w_70">在職状態</li>
        </ul>


          <c:forEach items="${shainList}" var="shain">
	        <ul class="tmpClass anchor" style="background-color: rgb(255, 255, 255);">
	          <li class="w_24"><input type="checkbox" class="shainCheckbox" value="${shain.shain_no}"/></li>
	          <li class="w_74 goEmployeeView">${shain.koyo_keitai}</li>
	          <li class="w_100 goEmployeeView">${shain.nyusha_ymd}</li>
	          <li class="w_92 goEmployeeView">${shain.shain_no}</li>
	          <li class="w_92 goEmployeeView classEmployeeName">${shain.shain_nm}</li>
	          <li class="w_100 goEmployeeView">${shain.busho_nm}</li>
	          <li class="w_90 goEmployeeView">${shain.yakushoku_nm}</li>
	          <li class="w_110 goEmployeeView">${shain.birth}</li>
	          <li class="w_120 goEmployeeView">${shain.renraku_tel}</li>
	          <li class="w_165 a_l goEmployeeView"><span class="p_l5">${shain.renraku_email}</span></li>
	          <li class="w_100 goEmployeeView">${empty shain.taishoku_ymd ? '' : shain.taishoku_ymd}</li>
	          <li class="w_70 goEmployeeView">${shain.zaishoku_st}</li>
	        </ul>
			</c:forEach>
		
        </div><!-- end table1 -->
	</div>



	<div class="btn c">
	    <li>
	    	<button type="button" id="deleteButton" style="display:none;">削除</button>
		    <input name="btnEmployeeInsGo" id="btnEmployeeInsGo" type="image" value="신규 사원등록" src="../resources/img/btn_new_employee_s.png" alt="신규 사원등록" title="신규 사원등록">
		    <span class="p_l10"><span name="btnSelectedDel" id="btnSelectedDel" class="anchor"><img src="../resources/img/btn_select_delete_s.png" alt="선택 삭제" title="선택 삭제"></span></span>
	    </li>
    </div>
    

  </div>
	



</div>




<!-- 맨위 버튼처리 -->
<script>
document.getElementById("zaishokusha").addEventListener("click", function() {
    document.getElementById("currentEmployeeButton").click();
  });
 
document.getElementById("seishain").addEventListener("click", function() {
    document.getElementById("regularEmployeeButton").click();
});

document.getElementById("keiyaku").addEventListener("click", function() {
    document.getElementById("contractEmployeeButton").click();
});

document.getElementById("rinji").addEventListener("click", function() {
    document.getElementById("temporaryEmployeeButton").click();
});

document.getElementById("haken").addEventListener("click", function() {
    document.getElementById("dispatchedEmployeeButton").click();
});

document.getElementById("itaku").addEventListener("click", function() {
    document.getElementById("commissionedEmployeeButton").click();
});

document.getElementById("part").addEventListener("click", function() {
    document.getElementById("partTimeEmployeeButton").click();
});

document.getElementById("taishokusha").addEventListener("click", function() {
    document.getElementById("formerEmployeeButton").click();
});

document.getElementById("allshain").addEventListener("click", function() {
    document.getElementById("allEmployeeButton").click();
});

</script>




<script type="text/javascript">
	$(document).ready(function() {

		// 헤더 체크박스 클릭 시 모든 체크박스 선택 및 해제
		$("#selectAllCheckbox").click(function(){
		    $(".shainCheckbox").prop("checked", $(this).prop("checked"));
		});

		//삭제 버튼 클릭 처리
	    $("#btnSelectedDel").click(function() {
	    	console.log("btnSelectedDel clicked!");
	    	$("#deleteButton").click();
	    });
		
		$("#deleteButton").click(function(){
			console.log("delete button clicked!");
			
			// 체크된 체크박스를 반복하면서 shain_no를 배열에 추가
			var selectedShains = [];
	        $('.shainCheckbox:checked').each(function() {
	            selectedShains.push($(this).val());
	        });
			
			console.log(selectedShains);
			
			// 선택된 체크박스가 하나 이상인지 확인합니다.
	        if (selectedShains.length > 0) {
	        	$.ajax({
	                type: 'POST',
	                url: '/shain/shainDelete',
	                contentType: 'application/json',
	                data: JSON.stringify(selectedShains),
	                success: function(response) {
	                    // 서버로부터의 응답 처리
	                    console.log(response);
	                    alert('削除に成功しました。');
	                    location.reload();
	                },
	                error: function(error) {
	                    // 오류 처리
	                    console.error(error);
	                }
	            });
	        } else {
	            alert('削除するデータを選択してください。');
	        }
	});
		
		
		
		
		
		
		
		
		
		// 수정으로 이동
		$(document).on("click", ".row-clickable", function(event){
			if ($(event.target).is("input:checkbox")) {
		          return;
		       }
		    var shain_no = $(this).find("td:eq(1)").text();
		    window.location.href = "/shain/shainModify?shain_no=" + shain_no;
		});

		
		
		//전체사원 클릭
		document.getElementById("allEmployeeButton").addEventListener("click", function() {
					window.location.href = "/shain/shainList";
		});
		
		
		
		
		
		// 버튼별 ajax 요청()
		$("#regularEmployeeButton").click(function() {
			console.log("正社員");
			$.ajax({
				type : "POST",
				url : "/shain/shainList",
				data : JSON.stringify({
					koyo_keitai : "正社員"
				}),
				contentType : "application/json",
				dataType : "json",
				success : function(data) {
					updateTable(data);
					console.log("ajax success");
				},
				error : function(xhr, status, error) {
					console.log("Error:", xhr.responseText);
					console.log("Status:", status);
					console.log("Error thrown:", error);
				}
			});
		});

		$("#contractEmployeeButton").click(function() {
			$.ajax({
				type : "POST",
				url : "/shain/shainList",
				data : JSON.stringify({
					koyo_keitai : "契約社員"
				}),
				contentType : "application/json",
				dataType : "json",
				success : function(data) {
					updateTable(data); //요청 성공 시 실행 할 메서드
					console.log("ajax success")
				},
				error : function(xhr, status, error) {
					console.log("Error:", xhr.responseText);
					console.log("Status:", status);
					console.log("Error thrown:", error);
				}
			});
		});
		
		$("#temporaryEmployeeButton").click(function() {
		    $.ajax({
		        type : "POST",
		        url : "/shain/shainList",
		        data : JSON.stringify({
		            koyo_keitai : "臨時社員"
		        }),
		        contentType : "application/json",
		        dataType : "json",
		        success : function(data) {
		            updateTable(data); //요청 성공 시 실행 할 메서드
		            console.log("ajax success")
		        },
		        error : function(xhr, status, error) {
		            console.log("Error:", xhr.responseText);
		            console.log("Status:", status);
		            console.log("Error thrown:", error);
		        }
		    });
		});

		$("#dispatchedEmployeeButton").click(function() {
		    $.ajax({
		        type : "POST",
		        url : "/shain/shainList",
		        data : JSON.stringify({
		            koyo_keitai : "派遣社員"
		        }),
		        contentType : "application/json",
		        dataType : "json",
		        success : function(data) {
		            updateTable(data); //요청 성공 시 실행 할 메서드
		            console.log("ajax success")
		        },
		        error : function(xhr, status, error) {
		            console.log("Error:", xhr.responseText);
		            console.log("Status:", status);
		            console.log("Error thrown:", error);
		        }
		    });
		});

		$("#commissionedEmployeeButton").click(function() {
		    $.ajax({
		        type : "POST",
		        url : "/shain/shainList",
		        data : JSON.stringify({
		            koyo_keitai : "委託社員"
		        }),
		        contentType : "application/json",
		        dataType : "json",
		        success : function(data) {
		            updateTable(data); //요청 성공 시 실행 할 메서드
		            console.log("ajax success")
		        },
		        error : function(xhr, status, error) {
		            console.log("Error:", xhr.responseText);
		            console.log("Status:", status);
		            console.log("Error thrown:", error);
		        }
		    });
		});

		$("#partTimeEmployeeButton").click(function() {
		    $.ajax({
		        type : "POST",
		        url : "/shain/shainList",
		        data : JSON.stringify({
		            koyo_keitai : "パートタイム"
		        }),
		        contentType : "application/json",
		        dataType : "json",
		        success : function(data) {
		            updateTable(data); //요청 성공 시 실행 할 메서드
		            console.log("ajax success")
		        },
		        error : function(xhr, status, error) {
		            console.log("Error:", xhr.responseText);
		            console.log("Status:", status);
		            console.log("Error thrown:", error);
		        }
		    });
		});
		
		
		
		// 버튼별 ajax(재직/퇴직)
		$("#currentEmployeeButton").click(function() {
		    $.ajax({
		        type : "POST",
		        url : "/shain/shainList",
		        data : JSON.stringify({
		            zaishoku_st : "在職"
		        }),
		        contentType : "application/json",
		        dataType : "json",
		        success : function(data) {
		            updateTable(data); //요청 성공 시 실행 할 메서드
		            console.log("ajax success")
		        },
		        error : function(xhr, status, error) {
		            console.log("Error:", xhr.responseText);
		            console.log("Status:", status);
		            console.log("Error thrown:", error);
		        }
		    });
		});
		
		$("#formerEmployeeButton").click(function() {
		    $.ajax({
		        type : "POST",
		        url : "/shain/shainList",
		        data : JSON.stringify({
		        	zaishoku_st : "退職"
		        }),
		        contentType : "application/json",
		        dataType : "json",
		        success : function(data) {
		            updateTable(data); //요청 성공 시 실행 할 메서드
		            console.log("ajax success")
		        },
		        error : function(xhr, status, error) {
		            console.log("Error:", xhr.responseText);
		            console.log("Status:", status);
		            console.log("Error thrown:", error);
		        }
		    });
		});
		
		document.getElementById("btnEmployeeInsGo").addEventListener("click", function() {
	        window.location.href = "/shain/shainRegister";
	    });
		
		
		//테이블 갱신 함수
		function updateTable(shainList) {
		    // 기존 내용 삭제
		    var container = document.getElementById("table1");

		    while (container.children.length > 2) {
		        container.removeChild(container.lastChild);
		    }
		    
		    console.log("원래의 테이블 내용 삭제...");

		    // 받아온 shainList로 리스트 새로 생성
		    shainList.forEach(function (shain) {
		        var newUl = document.createElement("ul");
		        newUl.className = "tmpClass anchor";
		        newUl.style.backgroundColor = "rgb(255, 255, 255)";

		        // 각 항목 추가
		        newUl.innerHTML += '<li class="w_24"><input type="checkbox" class="shainCheckbox" value="' + shain.shain_no + '" /></li>';
		        newUl.innerHTML += '<li class="w_74 goEmployeeView">' + shain.koyo_keitai + '</li>';
		        newUl.innerHTML += '<li class="w_100 goEmployeeView">' + shain.nyusha_ymd + '</li>';
		        newUl.innerHTML += '<li class="w_92 goEmployeeView">' + shain.shain_no + '</li>';
		        newUl.innerHTML += '<li class="w_92 goEmployeeView classEmployeeName">' + shain.shain_nm + '</li>';
		        newUl.innerHTML += '<li class="w_100 goEmployeeView">' + shain.busho_nm + '</li>';
		        newUl.innerHTML += '<li class="w_90 goEmployeeView">' + shain.yakushoku_nm + '</li>';
		        newUl.innerHTML += '<li class="w_110 goEmployeeView">' + shain.birth + '</li>';
		        newUl.innerHTML += '<li class="w_120 goEmployeeView">' + shain.renraku_tel + '</li>';
		        newUl.innerHTML += '<li class="w_165 a_l goEmployeeView"><span class="p_l5">' + shain.renraku_email + '</span></li>';
		        newUl.innerHTML += '<li class="w_100 goEmployeeView">${empty shain.taishoku_ymd ? "" : shain.taishoku_ymd}</li>';
		        newUl.innerHTML += '<li class="w_70 goEmployeeView">' + shain.zaishoku_st + '</li>';

		        container.appendChild(newUl);
		    });
		}




});
</script>




<%@include file="../includes/footer.jsp"%>

