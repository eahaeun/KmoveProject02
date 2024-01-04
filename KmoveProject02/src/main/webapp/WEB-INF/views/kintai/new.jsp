<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가 조회</title>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

</head>

<body>
    <h1>휴가 조회</h1>
    
    <select name="koyo_keitai" id="koyo_keitai">
        <option value="구분별">雇用形態</option>
        <c:forEach items="${koyoKeitaiList}" var="koyoKeitai">
            <option value="${koyoKeitai}">${koyoKeitai}</option>
        </c:forEach>
    </select>
    
    <select name="busho_nm" id="busho_nm">
        <option value="">部署</option>
        <c:forEach items="${BushoList}" var="busho">
            <option value="${busho.busho_nm}">${busho.busho_nm}</option>
        </c:forEach>
    </select>
    
    <table border="1" width="100%">
        <thead>
            <tr>
                <th>구분</th>
                <th>사원번호</th>
                <th>성명</th>
                <th>부서</th>
                <th>직위</th>
                <th>전체</th>
                <th>사용</th>
                <th>잔여</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="shain">
                <tr>
                    <td>${shain.koyo_keitai}</td>
                    <td>${shain.shain_no}</td>
                    <td>${shain.shain_nm}</td>
                    <td>${shain.busho_nm}</td>
                    <td>${shain.yakushoku_nm}</td>
                    <td>${shain.kyuka}</td>

                    <td>
                        <c:forEach items="${khour}" var="khour">
                            <c:if test="${khour.shain_no eq shain.shain_no}">
                                ${khour.total_kintai_hour}
                            </c:if>
                        </c:forEach>
                    </td>
                    <td>
                        <c:forEach items="${khour}" var="khour">
                            <c:if test="${khour.shain_no eq shain.shain_no}">
                                ${shain.kyuka - khour.total_kintai_hour}
                            </c:if>
                        </c:forEach>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <br>
    
	<div id="kyukaModal" class="modal">
		<div class="modal-content">		
			<table border="1" width="100%">
    	        <thead>
        	        <tr>
            	        <th>입력날자</th>
                    	<th>근태항목</th>
                    	<th>시작</th>
                    	<th>종료</th>
                    	<th>일수</th>
	                </tr>
    	        </thead>
        	    <tbody id="modalBody">
             	</tbody>
     	   </table>
		</div>
	</div>
	
	
	
	
	<script>
    $(document).ready(function(){
 
        $("#koyo_keitai, #busho_nm").change(function(){
            var koyo_keitai = $("#koyo_keitai").val();
            var busho_nm = $("#busho_nm").val();
            

            $("tbody tr").hide();
            

            $("tbody tr").each(function(){
                var shain_koyo_keitai = $(this).find("td:eq(0)").text();
                var shain_busho_nm = $(this).find("td:eq(3)").text();
                
                if((koyo_keitai === "구분별" || shain_koyo_keitai === koyo_keitai) &&
                   (busho_nm === "" || shain_busho_nm === busho_nm)){
                    $(this).show();
                }
            });
        });
        

        $("tbody tr").click(function () {
            var shain_no = $(this).find("td:eq(1)").text();
            sendShainNoToServer(shain_no);
            console.log(shain_no);
        });
        
        function openkyukaModal() {
            document.getElementById('kyukaModal').style.display = 'block';
        }

        $(document).on('click', '#openModalBtn', function() {
            openkyukaModal();
        });
        
        $('#kyukaModal').on('shown.bs.modal', function () {
            updateTable(response);
        });
        
        function updateTable(data) {
        	console.log("받아온 데이터:", data);
            // 테이블의 tbody를 가져옴
            var tbody = document.getElementById("modalBody");

            // 기존의 테이블 내용 제거
            tbody.innerHTML = "";

            // 받아온 데이터를 이용하여 새로운 행 추가
            for (var i = 0; i < data.length; i++) {
                var row = tbody.insertRow(i);

                // 각 셀에 데이터 추가
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                var cell4 = row.insertCell(3);
                var cell5 = row.insertCell(4);

                cell1.innerHTML = data[i].nyuryoku_ymd;
                cell2.innerHTML = data[i].kintai_km;
                cell3.innerHTML = data[i].kaishi_ymd;
                cell4.innerHTML = data[i].shuryo_ymd;
                cell5.innerHTML = data[i].kintai_hour;
            }
        }
        
        
        
        
        
        <ul>
        <li class="w_50   tit"><strong>번호</strong></li>
        <li class="w_92  tit"><strong>입력일자</strong></li>
        <li class="w_88  tit"><strong>휴가항목</strong></li>
        <li class="w_88  tit"><strong>근태항목</strong></li>
        <li class="w_150  tit"><strong>기간</strong></li>
        <li class="w_60  tit"><strong>일수</strong></li>
        <li class="w_135  tit"><strong>적요</strong></li>
        </ul>
        
        
        

        function sendShainNoToServer(shain_no) {

            $.ajax({
                type: "POST",
                url: "/kintaihistory/remain",
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

	</body>
	
</html>