<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>社員登録</title>
</head>
<body>
	<h1>社員登録</h1>

	<form action="/shain/shainRegister" method="post" enctype="multipart/form-data">

	<div id="imagePreview"></div>
	<input type="file" id="fileInput" name="uploadFile" multiple>
		<h3>基本情報</h3>


		<table id="shainRegisterTable" border="">
			<tr>
				<td><label for="shain_no">社員番号</label></td>
				<td><input type="text" id="shain_no" name="shain_no" required>
				</td>
			</tr>
			<tr>
				<td><label for="shain_nm">氏名</label></td>
				<td><input type="text" id="shain_nm" name="shain_nm" required>
				</td>
			</tr>
			<tr>
				<td><label for="shain_nm">住所</label></td>
				<td><input type="text" id="address" name="address"></td>
			</tr>
			<tr>
				<td><label for="birth">生年月日:</label></td>
				<td><input type="date" id="birth" name="birth"></td>
			</tr>
			<tr>
				<td><label for="busho_nm">部署</label></td>
				<td><select id="busho_nm" name="busho_nm">
						<c:forEach var="busho" items="${bushoList}">
							<option value="${busho.busho_nm}">${busho.busho_nm}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td><label for="yakushoku_nm">役職</label></td>
				<td><select id="yakushoku_nm" name="yakushoku_nm">
						<c:forEach var="yakushoku" items="${yakushokuList}">
							<option value="${yakushoku.yakushoku_nm}">${yakushoku.yakushoku_nm}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td><label for="koyo_keitai">雇用形態</label></td>
				<td><select id="koyo_keitai" name="koyo_keitai">
						<option value="選択">選択</option>
						<option value="正社員">正社員</option>
						<option value="契約社員">契約社員</option>
				</select></td>
			</tr>
			<tr>
				<td><label for="renraku_tel">連絡先</label></td>
				<td><input type="text" id="renraku_tel" name="renraku_tel">
				</td>
			</tr>
			<tr>
				<td><label for="renraku_email">E-Mail</label></td>
				<td><input type="text" id="renraku_email" name="renraku_email">
				</td>
			</tr>
			<tr>
				<td><label for="nyusha_ymd">入社日</label></td>
				<td><input type="date" id="nyusha_ymd" name="nyusha_ymd">
				</td>
			</tr>
			<tr>
				<td><label for="kihon_pay">基本給:</label></td>
				<td><input type="number" id="kihon_pay" name="kihon_pay">
				</td>
			</tr>
			<tr>
				<td><label for="ginko_nm">銀行名</label></td>
				<td><select id="ginko_nm" name="ginko_nm">
						<option value="選択">選択</option>
						<option value="国民銀行">国民銀行</option>
						<option value="企業銀行">企業銀行</option>

				</select></td>
			</tr>
			<tr>
				<td><label for="koza_num">口座番号</label></td>
				<td><input type="text" id="koza_num" name="koza_num"></td>
			</tr>
		</table>

		<h3>経歴</h3>
		<table id="shainCareerRegisterTable" border="">
			<thead>
				<tr>
					<th>会社名</th>
					<th>入社日</th>
					<th>退職日</th>
					<th>最終役職</th>
					<th>退職事由</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" name="shainCareerList[0].kaisha_nm"></td>
					<td><input type="date" name="shainCareerList[0].nyusha_ymd2"></td>
					<td><input type="date" name="shainCareerList[0].taishoku_ymd2"></td>
					<td><input type="text"
						name="shainCareerList[0].saishu_yakushoku"></td>
					<td><input type="text" name="shainCareerList[0].taishoku_jiyu"></td>
				</tr>
				<tr>
					<td><input type="text" name="shainCareerList[1].kaisha_nm"></td>
					<td><input type="date" name="shainCareerList[1].nyusha_ymd2"></td>
					<td><input type="date" name="shainCareerList[1].taishoku_ymd2"></td>
					<td><input type="text"
						name="shainCareerList[1].saishu_yakushoku"></td>
					<td><input type="text" name="shainCareerList[1].taishoku_jiyu"></td>
				</tr>

			</tbody>
		</table>

		<h3>学力</h3>
		<table id="shainEduRegisterTable" border="">
			<thead>
				<tr>
					<th>学歴区分</th>
					<th>入学年月</th>
					<th>卒業年月</th>
					<th>学校名</th>
					<th>専攻</th>
					<th>状態</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><select name="shainEduList[0].gakureki_kb">
							<option value="">選択</option>
							<option value="小学校">小学校</option>
							<option value="中学校">中学校</option>
							<option value="高等学校">高等学校</option>
							<option value="大学校">大学校</option>
							<option value="修士">修士</option>
							<option value="博士">博士</option>
					</select></td>
					<td><input type="month" name="shainEduList[0].nyugaku_ym"></td>
					<td><input type="month" name="shainEduList[0].sotsugyo_ym"></td>
					<td><input type="text" name="shainEduList[0].gakko_nm"></td>
					<td><input type="text" name="shainEduList[0].senko"></td>
					<td><select name="shainEduList[0].jyotai">
							<option value="">選択</option>
							<option value="卒業">卒業</option>
							<option value="修了">修了</option>
							<option value="自退">自退</option>
							<option value="在学中">在学中</option>
					</select></td>
				</tr>
				<tr>
					<td><select name="ShainEduList[1].gakureki_kb">
							<option value="">選択</option>
							<option value="小学校">小学校</option>
							<option value="中学校">中学校</option>
							<option value="高等学校">高等学校</option>
							<option value="大学校">大学校</option>
							<option value="修士">修士</option>
							<option value="博士">博士</option>
					</select></td>
					<td><input type="month" name="shainEduList[1].nyugaku_ym"></td>
					<td><input type="month" name="shainEduList[1].sotsugyo_ym"></td>
					<td><input type="text" name="shainEduList[1].gakko_nm"></td>
					<td><input type="text" name="shainEduList[1].senko"></td>
					<td><select name="shainEduList[1].jyotai">
							<option value="">選択</option>
							<option value="卒業">卒業</option>
							<option value="修了">修了</option>
							<option value="自退">自退</option>
							<option value="在学中">在学中</option>
					</select></td>
				</tr>
			</tbody>
		</table>
		<br>
		<button type="submit">登録</button>
	</form>


</body>
	<script type="text/javascript">
	$(document).ready(function(e) {

	    const fileInput = document.getElementById('fileInput');
	    const imagePreview = document.getElementById('imagePreview');

	    fileInput.addEventListener('change', function(event) {
	        // 기존에 있는 이미지를 미리보기 영역에서 지웁니다.
	        imagePreview.innerHTML = '';

	        const files = event.target.files;

	        if (files && files.length > 0) {
	            // 파일들을 순회하면서 처리
	            for (let i = 0; i < files.length; i++) {
	                const file = files[i];
	                const reader = new FileReader();

	                // 파일 읽기가 완료되었을 때 실행될 함수 정의
	                reader.onload = function(e) {
	                    const imageUrl = e.target.result; // 이미지 URL

	                    // 이미지를 화면에 표시하는 코드
	                    const imgElement = document.createElement('img');
	                    imgElement.src = imageUrl;
	                    imgElement.style.maxWidth = '200px'; // 이미지 너비 설정
	                    imgElement.style.maxHeight = '200px'; // 이미지 높이 설정
	                    imagePreview.appendChild(imgElement); // 이미지 미리보기 영역에 추가
	                };

	                // 파일을 읽기
	                reader.readAsDataURL(file);
	            }
	        }
	    });
	});
		
	</script>
</html>