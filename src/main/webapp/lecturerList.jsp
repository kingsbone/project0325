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

	<h2 style=text-align:center;>강사 목록</h2>
	<div class="container">
	<table>
		<tr>
			<td>강사코드</td>
			<td>강사명</td>
			<td>전공</td>
			<td>세부전공</td>
			<td>관리</td>
		</tr>
		<%@ include file="dbconn.jsp" %>
		
		<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int totalCount = 0;
	Statement stmt = null;
	ResultSet countRs = null;
	String countSql = "SELECT COUNT(*) AS total FROM lecturer0321";
	    
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
				총 <%=totalCount %>명의 강사가 있습니다.
		</caption>
		
		
		
<%
	
	String sql = "select * from lecturer0321";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	int counter = 1;
	while(rs.next()){
		String idx = rs.getString("idx");
		String name = rs.getString("name");
		String major = rs.getString("major");
		String field = rs.getString("field");
	
		
	
%>
		<tr>
			<td><%=idx %></td>
			<td><%=name %></td>
			<td><%=major %></td>
			<td><%=field %></td>
			<td>			
				<a href="lecturerUpdate.jsp?id=<%=idx %>">수정/</a>
				<a href="lecturerDelete.jsp?id=<%=idx %>" onclick="if(!confirm('정말 삭제하시겠습니까?'))return false;">삭제</a>
			</td>
		</tr>
<% 	
		}
%>	
	</table>
		<div class="buttons">
			<button class="register-btn" onclick="window.location.href='addLecturer.jsp'">작성</button>
		</div>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>