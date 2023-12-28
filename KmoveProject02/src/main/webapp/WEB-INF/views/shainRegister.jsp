<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<form action="/shainRegister" method="post">
    <label for="shain_no">Employee Number:</label>
    <input type="text" id="shain_no" name="shain_no" required><br>

    <label for="shain_nm">Employee Name:</label>
    <input type="text" id="shain_nm" name="shain_nm" required><br>

    <label for="address">Address:</label>
    <input type="text" id="address" name="address" required><br>

    <label for="birth">Birth Date:</label>
    <input type="text" id="birth" name="birth" placeholder="YYYY-MM-DD" required><br>

    <label for="busho_nm">Department Name:</label>
    <input type="text" id="busho_nm" name="busho_nm" required><br>

    <label for="yakushoku_nm">Position:</label>
    <input type="text" id="yakushoku_nm" name="yakushoku_nm" required><br>

    <label for="kihon_pay">Basic Pay:</label>
    <input type="number" id="kihon_pay" name="kihon_pay" required><br>

    <label for="renraku_tel">Contact Number:</label>
    <input type="text" id="renraku_tel" name="renraku_tel" required><br>

    <label for="renraku_email">Email:</label>
    <input type="email" id="renraku_email" name="renraku_email" required><br>

    <label for="nyusha_ymd">Entry Date:</label>
    <input type="date" id="nyusha_ymd" name="nyusha_ymd" placeholder="YYYY-MM-DD" required><br>

    <label for="ginko_nm">Bank Name:</label>
    <input type="text" id="ginko_nm" name="ginko_nm" required><br>

    <label for="koza_num">Account Number:</label>
    <input type="text" id="koza_num" name="koza_num" required><br>

    <label for="koyo_keitai">Employment Type:</label>
    <input type="text" id="koyo_keitai" name="koyo_keitai" required><br>

    <button type="submit">Submit</button>
</form>

<!-- <form action="shainRegister" method="post">
    <label>사원번호:</label>
    <input type="text" id="shain_no" name="shain_no"><br>

    <label>기본급:</label>
    <input type="text" id="kihon_pay" name="kihon_pay"><br>

    <label for="birth">입사일:</label>
    <input type="date" id="nyusha_ymd" name="nyusha_ymd" placeholder="YYYY-MM-DD" required><br>

	<button type="submit">Submit</button>
</form> -->
   
</body>

</html>
