<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="./includes/header.jsp"%>

<table>
	<tr id="row1">
		<td>...</td>
		<td><button id="addButton" onclick="toggleRow('row1')">추가하기</button></td>
	</tr>
</table>

<script>
    function toggleRow(rowId) {
        // 해당 행과 버튼 요소를 가져옵니다.
        var row = document.getElementById(rowId);
        var addButton = document.getElementById("addButton");

        // "추가하기" 버튼을 숨깁니다.
        addButton.style.display = "none";

        // 입력 필드와 저장 버튼을 생성합니다.
        var saveButton = document.createElement("button");
        var inputField = document.createElement("input");

        // 입력 필드 속성 설정
        inputField.type = "text";
        inputField.name = "inputFieldName"; // 의미 있는 이름으로 변경하세요.

        // 행에 입력 필드 추가
        row.appendChild(inputField);

        // "저장하기" 버튼 생성
        saveButton.innerHTML = "저장하기";
        saveButton.onclick = function () {
            // 입력된 값을 가져옵니다.
            var value = inputField.value;

            // AJAX를 사용하여 저장 작업 수행
            $.ajax({
                url: "/register", // 서버 엔드포인트에 맞게 변경하세요.
                method: "POST", // 필요에 따라 메서드를 조정하세요 (POST, GET 등)
                data: {
                    value: value
                }, // 서버로 전송할 데이터
                success: function (response) {
                    // 성공 시 처리 로직
                    console.log("저장 성공");
                    // 필요에 따라 행 내용을 저장된 값으로 업데이트
                },
                error: function (error) {
                    // 실패 시 처리 로직
                    console.error("데이터 저장 오류", error);
                },
                complete: function () {
                    // 입력 필드와 "저장하기" 버튼을 "추가하기" 버튼으로 교체
                    addButton.style.display = "block";
                    row.removeChild(inputField);
                    row.removeChild(saveButton);
                }
            });
        };

        // 행에 "저장하기" 버튼 추가
        row.appendChild(saveButton);
    }
</script>

<br>
<br>
<br>

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal"
	data-bs-target="#exampleModal">Launch demo modal</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">부서 등록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<table border="1">
					<thead>
						<tr>
							<th>Busho Name</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="busho" items="${bushoList}" varStatus="loop">
							<tr id="row${loop.index}">
								<td>${busho.busho_nm}</td>
								<td class="action-buttons">
									<!-- 각 버튼에 클릭 이벤트와 데이터를 전달하는 스크립트 추가 -->
									<button onclick="editBusho('${busho.busho_nm}', ${loop.index})">수정</button>
									<button
										onclick="deleteBusho('${busho.busho_nm}', ${loop.index})">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>

<script>
function editBusho(bushoName, rowIndex) {
    // 행과 해당 셀의 내용을 가져옵니다.
    var row = document.getElementById('row' + rowIndex);

    // 입력 필드와 제출 버튼을 생성합니다.
    var inputField = document.createElement('input');
    inputField.type = 'text';

    var submitButton = document.createElement('button');
    submitButton.innerText = '제출';
    submitButton.onclick = function () {
        // 제출 처리를 담당하는 함수를 호출합니다.
        submitEdit(bushoName, rowIndex, inputField.value);
    };

    // 행의 내용을 입력 필드와 제출 버튼으로 교체합니다.
    row.cells[0].innerText = '';
    row.cells[0].appendChild(inputField);
    row.cells[1].innerHTML = '';
    row.cells[1].appendChild(submitButton);

}

function submitEdit(bushoName, rowIndex, newValue) {
    // 서버에 비동기적으로 데이터 수정 요청을 보냅니다.
    $.ajax({
        type: 'POST',
        url: '/bushoModify',
        data: {
            busho_nm: bushoName,
            new_value: newValue
        },
        success: function (response) {
            // 성공적인 응답을 받으면 화면을 업데이트합니다.
            alert('서버 응답: ' + response);

            // 행을 새 값으로 업데이트합니다.
            var row = document.getElementById('row' + rowIndex);
            row.cells[0].innerText = newValue;

            // 중복작업 가능하게 하기
            bushoName = newValue;
            
            // 수정 작업이 완료되면 제출 버튼 대신 수정과 삭제 버튼이 나타나게 합니다.
            var editButton = document.createElement('button');
            editButton.innerText = '수정';
            editButton.onclick = function () {
                editBusho(bushoName, rowIndex);
            };

            var deleteButton = document.createElement('button');
            deleteButton.innerText = '삭제';
            deleteButton.onclick = function () {
                deleteBusho(bushoName, rowIndex);
            };

            // 기존 내용을 초기화하고 수정 및 삭제 버튼을 추가합니다.
            row.cells[1].innerHTML = '';
            row.cells[1].appendChild(editButton);
            row.cells[1].appendChild(deleteButton);
        },
        error: function (error) {
            // 오류가 발생했을 때 처리하는 로직을 추가합니다.
            alert('오류 발생: ' + error.statusText);
        }
    });
}


    function deleteBusho(busho_nm, rowIndex) {
        // 삭제 버튼 클릭 시 AJAX 요청을 보내고, 컨트롤러에 데이터 전송
        $.ajax({
            type: "POST",
            url: "/bushoRemove",
            data: {busho_nm: busho_nm},
            success: function(response) {
                console.log("Delete button clicked for bushoNm: " + busho_nm);
                // 성공 시 필요한 동작 수행
                $("#row" + rowIndex).remove(); // 해당 행을 삭제
            },
            error: function(error) {
                console.error("Error during deleteBusho: ", error);
            }
        });
    }
</script>

<%@include file="./includes/footer.jsp"%>
