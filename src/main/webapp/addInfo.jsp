<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="navi.jsp" %>
<%@ include file="dbconn.jsp" %>

<section>
<h2 style=text-align:center;>학사 정보 등록화면</h2>
	<div class="container">
        <form action="addInfoProcess.jsp" method="POST" onsubmit="return checkForm()">
            <table>
                <tr>
                    <td><label for="studno">학번:</label></td>
                    <td><input type="text" id="studno" name="studno" required ></td>
                </tr>
                <tr>
                    <td><label for="name">성명:</label></td>
                    <td><input type="text" id="name" name="name" required></td>
                </tr>
                <tr>
                    <td><label for="dept">학과:</label></td>
                    <td>
                    	<select class="dept" name="dept">
						    <option value="">-선택-</option>
						    <option value="1">컴퓨터공학과</option>
						    <option value="2">기계공학과</option>
						    <option value="3">전자과</option>
						    <option value="4">영문학과</option>
						    <option value="5">일어과</option>
						    <option value="6">경영학과</option>
						    <option value="7">무역학과</option>
						    <option value="8">교육학과</option>
						</select>
                    </td>
                </tr>
                
                <tr>
                    <td><label for="position">학년:</label></td>
                    <td>
                    	<input type="radio" name="position" value="1">1학년
						<input type="radio" name="position" value="2">2학년
						<input type="radio" name="position" value="3">3학년
						<input type="radio" name="position" value="4">4학년
						<p> </p><br>
					</td>
                </tr>
               
                <tr>
                    <td><label for="hobby">취미:</label></td>
                    
                    <td>
					      <label><input  type="checkbox" name="hobby" value="프로그램">프로그램</label>
					      <label><input  type="checkbox" name="hobby" value="독서">독서</label>
					      <label><input  type="checkbox" name="hobby" value="등산">등산</label>
					      <label><input  type="checkbox" name="hobby" value="여행">여행</label>
					      <label><input  type="checkbox" name="hobby" value="낚시">낚시</label>
					      <label><input  type="checkbox" name="hobby" value="영화보기">영화보기</label>
					      <label><input  type="checkbox" name="hobby" value="잠자기">잠자기</label>
					      <label><input  type="checkbox" name="hobby" value="멍때리기">멍때리기</label>     
					          
                    </td>
                </tr>
                <tr>
                    <td><label for="address">주소:</label></td>
                    <td><input type="text" id="address" name="address" placeholder="" required></td>
                </tr>
                <tr>
                    <td><label for="phone">연락처:</label></td>
                    <td><input type="text" id="phone" name="phone" placeholder="010-1111-2222" required></td>
                </tr>
                
            </table>
            <div class="buttons">
                <button type="submit" class="register-btn">등록</button>
                <button type="button" class="cancel-btn">취소</button>
            </div>
        </form>
    </div>
    <script>
function checkForm() {
    // 고객 이름 검사
    var custname = document.getElementById("custname").value;
    if (custname.trim() === "") {
        alert("이름을 입력해주세요.");
        return false;
    }

    // 고객 주소 검사
    var address = document.getElementById("address").value;
    if (address.trim() === "") {
        alert("주소를 입력해주세요.");
        return false;
    }

    // 날짜 검사
    var joindate = document.getElementById("joindate").value;
    if (joindate.trim() === "") {
        alert("날짜를 입력해주세요. (YYYYMMDD)");
        return false;
    }

    // 고객 등급 검사
    var grade = document.getElementsByName("grade")[0].value;
    if (grade === "") {
        alert("고객 등급을 선택해주세요.");
        return false;
    }
    
    // 거주지 검사
    var city = document.getElementsByName("city")[0].value;
    if (city === "") {
        alert("거주지를 선택해주세요.");
        return false;
    }

    return true; // 모든 조건을 통과하면 양식 제출
}
</script>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>