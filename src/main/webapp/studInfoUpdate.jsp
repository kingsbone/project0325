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
<section>
<%@ include file="dbconn.jsp" %>

<%
	String id = request.getParameter("id");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from stud0321 where studno=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	if(rs.next()){
		
		String studno = rs.getString("studno");
		String name = rs.getString("name");
		String dept = rs.getString("dept");
		String position = rs.getString("position");
		String address = rs.getString("address");
		String phone = rs.getString("phone");
		String hobby = rs.getString("hobby");
	
%>



<h2 style=text-align:center;>학사 정보 등록화면</h2>
	<div class="container">
        <form action="studInfoUpdateProcess.jsp" method="POST" onsubmit="return checkForm()">
            <table>
                <tr>
                    <td><label for="studno">학번:</label></td>
                    <td><input type="text" id="studno" name="studno" value="<%=studno %>" required ></td>
                </tr>
                <tr>
                    <td><label for="name">성명:</label></td>
                    <td><input type="text" id="name" name="name" value="<%=name %>" required></td>
                </tr>
                <tr>
                    <td><label for="dept">학과:</label></td>
                    <td>
                    	<select class="dept" name="dept">
						    <option value="">-선택-</option>
						    <option value="1" <%= dept.equals("1") ? "selected" : "" %>>컴퓨터공학과</option>
						    <option value="2" <%= dept.equals("2") ? "selected" : "" %>>기계공학과</option>
						    <option value="3" <%= dept.equals("3") ? "selected" : "" %>>전자과</option>
						    <option value="4" <%= dept.equals("4") ? "selected" : "" %>>영문학과</option>
						    <option value="5" <%= dept.equals("5") ? "selected" : "" %>>일어과</option>
						    <option value="6" <%= dept.equals("6") ? "selected" : "" %>>경영학과</option>
						    <option value="7" <%= dept.equals("7") ? "selected" : "" %>>무역학과</option>
						    <option value="8" <%= dept.equals("8") ? "selected" : "" %>>교육학과</option>
						</select>
                    </td>
                </tr>
                
                <tr>
                    <td><label for="position">학년:</label></td>
                    <td>
                    	<input type="radio" name="position" <%= position.equals("1") ? "checked" : "" %> value="1">1학년
						<input type="radio" name="position" <%= position.equals("2") ? "checked" : "" %> value="2">2학년
						<input type="radio" name="position" <%= position.equals("3") ? "checked" : "" %> value="3">3학년
						<input type="radio" name="position" <%= position.equals("4") ? "checked" : "" %> value="4">4학년
						<p> </p><br>
					</td>
                </tr>
               
                <tr>
                    <td><label for="hobby">취미:</label></td>
                    
                    <td>
					      <label><input  type="checkbox" name="hobby" <%= hobby.contains("프로그램") ? "checked" : "" %> value="프로그램">프로그램</label>
					      <label><input  type="checkbox" name="hobby" <%= hobby.contains("독서") ? "checked" : "" %> value="독서">독서</label>
					      <label><input  type="checkbox" name="hobby" <%= hobby.contains("등산") ? "checked" : "" %> value="등산">등산</label>
					      <label><input  type="checkbox" name="hobby" <%= hobby.contains("여행") ? "checked" : "" %> value="여행">여행</label>
					      <label><input  type="checkbox" name="hobby" <%= hobby.contains("낚시") ? "checked" : "" %> value="낚시">낚시</label>
					      <label><input  type="checkbox" name="hobby" <%= hobby.contains("영화보기") ? "checked" : "" %> value="영화보기">영화보기</label>
					      <label><input  type="checkbox" name="hobby" <%= hobby.contains("잠자기") ? "checked" : "" %> value="잠자기">잠자기</label>
					      <label><input  type="checkbox" name="hobby" <%= hobby.contains("멍때리기") ? "checked" : "" %> value="멍때리기">멍때리기</label>     
					          
                    </td>
                </tr>
                <tr>
                    <td><label for="address">주소:</label></td>
                    <td><input type="text" id="address" name="address" value="<%=address %>" placeholder="" required></td>
                </tr>
                <tr>
                    <td><label for="phone">연락처:</label></td>
                    <td><input type="text" id="phone" name="phone" value="<%=phone %>" placeholder="010-1111-2222" required></td>
                </tr>
                
            </table>
            <div class="buttons">
                <button type="submit" class="register-btn">등록</button>
                <button type="button" class="cancel-btn">취소</button>
            </div>
        </form>
    <%
	}
    %>
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