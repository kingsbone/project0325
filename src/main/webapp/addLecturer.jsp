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
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	int next_id = 0;
	try{
		sql = "SELECT MAX(idx) FROM lecturer0321";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			next_id = rs.getInt(1)+1;
		}else{
			next_id = 1;
		}
	}catch(Exception e){
		System.out.println("member 테이블 읽기 오류");
		System.out.println("SQL:" + e.getMessage());
	}
		
		
%>
<section>
<h2 style=text-align:center;>강사 추가</h2>
	<div class="container">
        <form action="addLecturerProcess.jsp" method="POST" onsubmit="return checkForm()">
            <table>
                <tr>
                    <td><label for="idx">강사 ID:</label></td>
                    <td><input type="text" id="idx" name="idx"value="<%=next_id %>" required ></td>
                </tr>
                <tr>
                    <td><label for="name">강사 명:</label></td>
                    <td><input type="text" id="name" name="name" required></td>
                </tr>
                <tr>
                    <td><label for="major">전공:</label></td>
                    <td><input type="text" id="major" name="major" required></td>
                </tr>
                <tr>
                    <td><label for="field">세부 전공:</label></td>
                    <td><input type="text" id="field" name="field" required></td>
                </tr>
            </table>
            <div class="buttons">
                <button type="button" onclick="window.location.href='lecturerList.jsp'" class="register-btn">목록</button>
                <button type="submit" class="register-btn">등록</button>
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