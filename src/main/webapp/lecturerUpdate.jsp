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
	String sql = "select * from lecturer0321 where idx=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	if(rs.next()){
		
		String idx = rs.getString("idx");
		String name = rs.getString("name");
		String major = rs.getString("major");
		String field = rs.getString("field");
	
%>



<section>
<h2 style=text-align:center;>고객정보 등록화면</h2>
	<div class="container">
        <form action="lecturerUpdateProcess.jsp" method="POST" onsubmit="return checkForm()">
            <table>
                <tr>
                    <td><label for="idx">강사 ID:</label></td>
                    <td><input type="text" id="idx" name="idx" value="<%=idx %>" required ></td>
                </tr>
                <tr>
                    <td><label for="name">강사 명:</label></td>
                    <td><input type="text" id="name" name="name" value="<%=name %>" required></td>
                </tr>
                <tr>
                    <td><label for="major">전공:</label></td>
                    <td><input type="text" id="major" name="major" value="<%=major %>" required></td>
                </tr>
                <tr>
                    <td><label for="field">세부 전공:</label></td>
                    <td><input type="text" id="field" name="field" value="<%=field %>" required></td>
                </tr>
            </table>
            <div class="buttons">
                <button type="button" onclick="window.location.href='lecturerList.jsp'" class="register-btn">목록</button>
                <button type="submit" class="register-btn">등록</button>
            </div>
        </form>
    </div>
    <%
	}
    %>
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