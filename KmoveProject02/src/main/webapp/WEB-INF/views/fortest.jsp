<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="./includes/header.jsp"%>



<label for="monthInput">Select Month:</label>
<input type="month" id="monthInput" name="kizoku_ym" value="${testym}">

<script>
	// <input type='month'> 요소를 찾습니다.
	const monthInput = document.getElementById('monthInput');

	// <input> 요소의 값이 변경될 때마다 이벤트를 처리하는 함수를 등록합니다.
	monthInput.addEventListener('input', function() {
		// 변경된 값 가져오기
		const newValue = monthInput.value;

		// Ajax를 사용하여 서버에 값 전송
		$.ajax({
			type : 'GET',
			url : '/fortest', // 실제 경로에 맞게 수정
			data : {
				kizoku_ym : newValue
			},
			success : function(response) {
				// 성공적으로 서버에 전송된 경우 추가 작업 수행
				console.log(response);
			},
			error : function(error) {
				console.error(error);
			}
		});
	});
</script>




<%@include file="./includes/footer.jsp"%>
