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
	String sql = "select * from sub0321 join lecturer0321 on sub0321.lecturer = lecturer0321.idx where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	if(rs.next()){
		
		String id1 = rs.getString("id");
		String subject_name = rs.getString("subject_name");
		String credit = rs.getString("credit");
		String lecturer = rs.getString("lecturer");
		String week = rs.getString("week");
		String start_hour = rs.getString("start_hour");
		String end_hour = rs.getString("end_hour");
	
%>




<h2 style=text-align:center;>교과목 수정</h2>
	<div class="container">
        <form action="subjectUpdate.jsp" method="POST" onsubmit="return checkForm()">
            <table>
                <tr>
                    <td><label for="id">교과목 코드:</label></td>
                    <td><input type="text" id="id" name="id1" value="<%=id1 %>" required ></td>
                </tr>
                <tr>
                    <td><label for="subject_name">과목명:</label></td>
                    <td><input type="text" id="subject_name" name="subject_name" value="<%=subject_name %>" required></td>
                </tr>
                <tr>
                    <td><label for="credit">학점:</label></td>
                    <td><input type="text" id="credit" name="credit" value="<%=credit %>" required></td>
                </tr>
                <tr>
                    <td><label for="lecturer">담당 강사:</label></td>
                    <td>
                    	<select class="lecturer" name="lecturer">
						    <option value="">-강사 선택-</option>
						    <%
						    sql = "select name,idx from lecturer0321";
							pstmt = conn.prepareStatement(sql);
							rs = pstmt.executeQuery();
							
						    while(rs.next()){
								String idx = rs.getString("idx");
								String name = rs.getString("name");
						    %>
						    <option value="<%=idx %>"<%if(lecturer.equals(idx)){ %>selected<%} %>><%=name %></option>
							<%
						    }								
            				%>			    
					  
						</select>
                    </td>
                </tr>
                
                <tr>
                    <td><label for="week">요일:</label></td>
                    <td>
                    	<input type="radio" name="week" <%= week.equals("1") ? "checked" : "" %> value="1">월
						<input type="radio" name="week" <%= week.equals("2") ? "checked" : "" %> value="2">화
						<input type="radio" name="week" <%= week.equals("3") ? "checked" : "" %> value="3">수
						<input type="radio" name="week" <%= week.equals("4") ? "checked" : "" %> value="4">목
						<input type="radio" name="week" <%= week.equals("5") ? "checked" : "" %> value="5">금
						<input type="radio" name="week" <%= week.equals("6") ? "checked" : "" %> value="6">토
						<p> </p><br>
					</td>
                </tr>
                <tr>
                    <td><label for="start_time">시작:</label></td>
                    <td><input type="text" id="start_time" name="start_time" placeholder="0900(숫자4자리)" value="<%=start_hour %>" required></td>
                 </tr>
                <tr>
                    <td><label for="end_time">종료:</label></td>
                    <td><input type="text" id="end_time" name="end_time" placeholder="1230(숫자4자리)" value="<%=end_hour %>" required></td>
                </tr>
                
            </table>
             <div class="buttons">
                <button type="button" onclick="window.location.href='subjectList.jsp'" class="register-btn">목록</button>
                <button type="submit" class="register-btn">등록</button>
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