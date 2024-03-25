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

	<h2 style=text-align:center;>학사 정보 목록</h2>
	<div class="container">
	<table>
		<tr>
			<td>학번</td>
			<td>성명</td>
			<td>학과</td>
			<td>학년</td>
			<td>주소</td>
			<td>연락처</td>
			<td>취미</td>
			<td>관리</td>
		</tr>
		<%@ include file="dbconn.jsp" %>
		
		
		<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int totalCount = 0;
	Statement stmt = null;
	ResultSet countRs = null;
	String countSql = "SELECT COUNT(*) AS total FROM stud0321";
	    
	    try {
	        stmt = conn.createStatement();
	        countRs = stmt.executeQuery(countSql);
	    	if (countRs.next()) {
	            totalCount = countRs.getInt("total");
	        }
	    } catch (SQLException e) {
	      
	        e.printStackTrace();
	    }
	    
%>
		
		<caption>
				총 <%=totalCount %>개의 학사정보가 있습니다.
		</caption>
		
		
		
		
<%
	
	String sql = "select * from stud0321";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	int counter = 1;
	while(rs.next()){
		String studno = rs.getString("studno");
		String name = rs.getString("name");
		String dept = rs.getString("dept");
		String position = rs.getString("position");
		String address = rs.getString("address");
		String phone = rs.getString("phone");
		String hobby = rs.getString("hobby");
		
	
%>
		<tr>
			<td><%=studno %></td>
			<td><%=name %></td>
			<td><%=dept %></td>
			<td><%=position %></td>
			<td><%=address %></td>
			<td><%=phone %></td>
			<td><%=hobby %></td>
			<td>			
				<a href="studInfoUpdate.jsp?id=<%=studno %>">수정/</a>
				<a href="studInfoDelete.jsp?id=<%=studno %>" onclick="if(!confirm('정말 삭제하시겠습니까?'))return false;">삭제</a>
			</td>
		</tr>
<% 	
		}
%>	
	</table>
		<div class="buttons">
			<button class="register-btn" onclick="window.location.href='addInfo.jsp'">학사정보 추가</button>
		</div>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>