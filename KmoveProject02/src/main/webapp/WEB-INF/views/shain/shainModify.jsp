<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>社員修正</title>
</head>
<body>
<h1>社員修正</h1>
    <form action="/shainModify" method="post">
    <div id="imagePreview">
    <img id="previewImage" src="/shain/display?shain_no=${shain.shain_no}" width="200" height="200">
</div>
<input type="file" id="fileInput" name="uploadFile" multiple>
<h3>基本情報</h3>
<table id="shainModifyTable" border="" >
	<tr><td>
        <label for="shain_no">修正する社員番号</label></td>
        <td><input type="text" id="shain_no" name="shain_no" value="${shain.shain_no}" required></td></tr>
	<tr><td>
        <label for="shain_nm">氏名</label></td>
        <td><input type="text" id="shain_nm" name="shain_nm" value="${shain.shain_nm}" required></td></tr>
	<tr><td>
        <label for="address">住所</label></td>
        <td><input type="text" id="address" name="address" value="${shain.address}"></td></tr>
	<tr><td>
        <label for="birth">生年月日:</label></td>
        <td><input type="date" id="birth" name="birth" value="${shain.birth}"></td></tr>
	<tr><td>
        <label for="busho_nm">部署</label></td>
        <td><select id="busho_nm" name="busho_nm">
            <c:forEach var="busho" items="${bushoList}">
                <option value="${busho.busho_nm}" ${busho.busho_nm eq shain.busho_nm ? 'selected' : ''}>${busho.busho_nm}</option>
            </c:forEach>
        </select></td></tr>
	<tr><td>
        <label for="yakushoku_nm">役職</label></td>
        <td><select id="yakushoku_nm" name="yakushoku_nm">
            <c:forEach var="yakushoku" items="${yakushokuList}">
                <option value="${yakushoku.yakushoku_nm}" ${yakushoku.yakushoku_nm eq shain.yakushoku_nm ? 'selected' : ''}>${yakushoku.yakushoku_nm}</option>
            </c:forEach>
        </select></td></tr>
	<tr><td>
        <label for="koyo_keitai">雇用形態</label></td>
        <td><select id="koyo_keitai" name="koyo_keitai">
            <option value="正社員" ${'正社員' eq shain.koyo_keitai ? 'selected' : ''}>正社員</option>
            <option value="契約社員" ${'契約社員' eq shain.koyo_keitai ? 'selected' : ''}>契約社員</option>
        </select></td></tr>
	<tr><td>
        <label for="renraku_tel">連絡先</label></td>
        <td><input type="text" id="renraku_tel" name="renraku_tel" value="${shain.renraku_tel}"></td></tr>
	<tr><td>
        <label for="renraku_email">E-Mail</label></td>
        <td><input type="text" id="renraku_email" name="renraku_email" value="${shain.renraku_email}"></td></tr>
	<tr><td>
        <label for="nyusha_ymd">入社日</label></td>
        <td><input type="date" id="nyusha_ymd" name="nyusha_ymd" value="${shain.nyusha_ymd}"></td></tr>
	<tr><td>
        <label for="kihon_pay">基本給:</label></td>
        <td><input type="number" id="kihon_pay" name="kihon_pay" value="${shain.kihon_pay}"></td></tr>
    <tr><td>
        <label for="ginko_nm">銀行名</label></td>
        <td><select id="ginko_nm" name="ginko_nm">
            <option value="国民銀行" ${'国民銀行' eq shain.ginko_nm ? 'selected' : ''}>国民銀行</option>
            <option value="企業銀行" ${'企業銀行' eq shain.ginko_nm ? 'selected' : ''}>企業銀行</option>
        </select></td></tr>
	<tr><td>
        <label for="koza_num">口座番号</label></td>
        <td><input type="text" id="koza_num" name="koza_num" value="${shain.koza_num}"></td></tr>
</table>

<h3>経歴</h3>
<table id="shainCareerModifyTable" border="" >
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
					<td><input type="text" name="shainCareerList[0].kaisha_nm" value="${shainCareerList[0].kaisha_nm}"></td>
					<td><input type="date" name="shainCareerList[0].nyusha_ymd2" value="${shainCareerList[0].nyusha_ymd2}"></td>
					<td><input type="date" name="shainCareerList[0].taishoku_ymd2" value="${shainCareerList[0].taishoku_ymd2}"></td>
					<td><input type="text"
						name="shainCareerList[0].saishu_yakushoku" value="${shainCareerList[0].saishu_yakushoku}"></td>
					<td><input type="text" name="shainCareerList[0].taishoku_jiyu" value="${shainCareerList[0].taishoku_jiyu}"></td>
				</tr>

				<tr>
					<td><input type="text" name="shainCareerList[1].kaisha_nm" value="${shainCareerList[1].kaisha_nm}"></td>
					<td><input type="date" name="shainCareerList[1].nyusha_ymd2" value="${shainCareerList[1].nyusha_ymd2}"></td>
					<td><input type="date" name="shainCareerList[1].taishoku_ymd2" value="${shainCareerList[1].taishoku_ymd2}"></td>
					<td><input type="text" name="shainCareerList[1].saishu_yakushoku" value="${shainCareerList[1].saishu_yakushoku}"></td>
					<td><input type="text" name="shainCareerList[1].taishoku_jiyu"  value="${shainCareerList[1].taishoku_jiyu}"></td>
				</tr>
			</tbody>
		</table>

<h3>学力</h3>
<table id="shainEduModifyTable" border="">
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
							<option value="" ${shainEduList[0].gakureki_kb eq '' ? 'selected' : ''}>選択</option>
							<option value="小学校" ${shainEduList[0].gakureki_kb eq '小学校' ? 'selected' : ''}>小学校</option>
							<option value="中学校" ${shainEduList[0].gakureki_kb eq '中学校' ? 'selected' : ''}>中学校</option>
							<option value="高等学校" ${shainEduList[0].gakureki_kb eq '高等学校' ? 'selected' : ''}>高等学校</option>
							<option value="大学校" ${shainEduList[0].gakureki_kb eq '大学校' ? 'selected' : ''}>大学校</option>
							<option value="修士" ${shainEduList[0].gakureki_kb eq '修士' ? 'selected' : ''}>修士</option>
							<option value="博士" ${shainEduList[0].gakureki_kb eq '博士' ? 'selected' : ''}>博士</option>
					</select></td>
					<td><input type="month" name="shainEduList[0].nyugaku_ym" value="${shainEduList[0].nyugaku_ym}"></td>
					<td><input type="month" name="shainEduList[0].sotsugyo_ym" value="${shainEduList[0].sotsugyo_ym}"></td>
					<td><input type="text" name="shainEduList[0].gakko_nm" value="${shainEduList[0].gakko_nm}"></td>
					<td><input type="text" name="shainEduList[0].senko" value="${shainEduList[0].senko}"></td>
					<td><select name="shainEduList[0].jyotai">
							<option value=""
								${shainEduList[0].jyotai eq '' ? 'selected' : ''}>選択</option>
							<option value="卒業"
								${shainEduList[0].jyotai eq '卒業' ? 'selected' : ''}>卒業</option>
							<option value="修了"
								${shainEduList[0].jyotai eq '修了' ? 'selected' : ''}>修了</option>
							<option value="自退"
								${shainEduList[0].jyotai eq '自退' ? 'selected' : ''}>自退</option>
							<option value="在学中"
								${shainEduList[0].jyotai eq '在学中' ? 'selected' : ''}>在学中</option>

					</select></td>
				</tr>
				<tr>
					<td><select name="shainEduList[1].gakureki_kb">
								<option value="" ${shainEduList[1].gakureki_kb eq '' ? 'selected' : ''}>選択</option>
							<option value="小学校" ${shainEduList[1].gakureki_kb eq '小学校' ? 'selected' : ''}>小学校</option>
							<option value="中学校"${shainEduList[1].gakureki_kb eq '中学校' ? 'selected' : ''}>中学校</option>
							<option value="高等学校"${shainEduList[1].gakureki_kb eq '高等学校' ? 'selected' : ''}>高等学校</option>
							<option value="大学校"${shainEduList[1].gakureki_kb eq '大学校' ? 'selected' : ''}>大学校</option>
							<option value="修士">${shainEduList[1].gakureki_kb eq '修士' ? 'selected' : ''}>修士</option>
							<option value="博士"${shainEduList[1].gakureki_kb eq '博士' ? 'selected' : ''}>博士</option>
					</select></td>
					<td><input type="month" name="shainEduList[1].nyugaku_ym" value="${shainEduList[1].nyugaku_ym}"></td>
					<td><input type="month" name="shainEduList[1].sotsugyo_ym" value="${shainEduList[1].sotsugyo_ym}"></td>
					<td><input type="text" name="shainEduList[1].gakko_nm" value="${shainEduList[1].gakko_nm}"></td>
					<td><input type="text" name="shainEduList[1].senko" value="${shainEduList[1].senko}"></td>
					<td><select name="shainEduList[1].jyotai">
							<option value=""
								${shainEduList[1].jyotai eq '' ? 'selected' : ''}>選択</option>
							<option value="卒業"
								${shainEduList[1].jyotai eq '卒業' ? 'selected' : ''}>卒業</option>
							<option value="修了"
								${shainEduList[1].jyotai eq '修了' ? 'selected' : ''}>修了</option>
							<option value="自退"
								${shainEduList[1].jyotai eq '自退' ? 'selected' : ''}>自退</option>
							<option value="在学中"
								${shainEduList[1].jyotai eq '在学中' ? 'selected' : ''}>在学中</option>
					</select></td>
			</tbody>
		</table>



		<br>
        <button type="submit">保存</button>

    </form>
    
		<script>
			// 입력할 날짜 문자열
			var nyushaDateString = "2024-01-23 00:00:00";

			// 날짜 형식 변환
			var formattedNyushaDate = new Date(nyushaDateString).toISOString()
					.split('T')[0];

			// input 요소에 날짜 설정
			document.getElementById('nyusha_ymd').value = formattedNyushaDate;
			
			// 폼 제출 함수
			  function submitForm() {
			    var form = document.querySelector('form'); // 폼 선택
			    var formData = new FormData(form); // 폼 데이터 객체 생성

			    // 폼 데이터에 파일이 있는지 확인
			    if (formData.get('uploadFile')) {
			      // 폼을 서버로 전송
			      fetch('/shainModify', {
			        method: 'POST',
			        body: formData
			      })
			      .then(response => {
			        // 서버 응답 처리
			        if (response.ok) {
			          // 성공 시 동작
			          console.log('업로드 성공!');
			          window.location.href = 'shainList';
			        } else {
			          // 실패 시 동작
			          console.error('업로드 실패');
			        }
			      })
			      .catch(error => {
			        console.error('업로드 중 에러 발생:', error);
			      });
			    } else {
			      console.log('파일을 선택하세요.');
			    }
			  }

			  // 저장 버튼 클릭 시 폼 제출 함수 호출
			  document.querySelector('button[type="submit"]').addEventListener('click', function(event) {
			    event.preventDefault(); // 기본 제출 동작 막기
			    submitForm(); // 폼 제출 함수 호출
			  });
			  
			  const fileInput = document.getElementById('fileInput');
			  const previewImage = document.getElementById('previewImage');

			  fileInput.addEventListener('change', function(event) {
			      const file = event.target.files[0];

			      if (file) {
			          const reader = new FileReader();

			          reader.onload = function(e) {
			              const imageUrl = e.target.result; // 이미지 URL 설정
			              previewImage.src = imageUrl; // 이미지 대체
			          };

			          reader.readAsDataURL(file); // 파일을 읽어서 이미지 URL로 변환
			      }
			  });
		</script>
    
</body>
</html>