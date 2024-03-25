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

	<h2 style=text-align:center;>교과목 목록</h2>
	<div class="container">
	<table>
		<tr>
			<td>NO</td>
			<td>강사코드</td>
			<td>담당강사</td>
			<td>과목코드</td>
			<td>과목명</td>
			<td>학점</td>
			<td>담당강사</td>
			<td>요일</td>
			<td>시작시간</td>
			<td>종료시간</td>
		</tr>
<%@ include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int totalCount = 0;
	Statement stmt = null;
	ResultSet countRs = null;
	String countSql = "SELECT COUNT(*) AS total FROM sub0321";
	    
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
				총 <%=totalCount %>개의 교과목이 있습니다.
		</caption>
		
		
		
		
		
<%
	
	String sql = " select * from sub0321 join lecturer0321 on sub0321.lecturer = lecturer0321.idx order by lecturer0321.idx";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	int counter = 1;
	while(rs.next()){
		String id = rs.getString("id");
		String subject_name = rs.getString("subject_name");
		String credit = rs.getString("credit");
		String lecturer = rs.getString("lecturer");
		String week = rs.getString("week");
		String start_hour = rs.getString("start_hour");
		String end_hour = rs.getString("end_hour");
		String idx = rs.getString("idx");
		String name = rs.getString("name");
	
	
		String wk = "";
		switch(week) {
			case "1":
				wk = "월";
				break;
			case "2":
				wk = "화";
				break;
			case "3":
				wk = "수";
				break;
			case "4":
				wk = "목";
				break;
			case "5":
				wk = "금";
				break;
			case "6":
				wk = "토";
				break;
			
			default:
				wk = "??";
		}
	
%>
		<tr>
			<td><%=counter++ %></td>
			<td><%=idx %></td>
			<td><%=name %></td>
			<td><%=id %></td>
			<td><%=subject_name %></td>
			<td><%=credit %></td>
			<td><%=lecturer %></td>
			<td><%=wk %></td>
			<td><%=start_hour %></td>
			<td><%=end_hour %></td>
			<td>			
				<a href="subjectUpdate.jsp?id=<%=id %>">수정/</a>
				<a href="subjectDelete.jsp?id=<%=id %>" onclick="if(!confirm('정말 삭제하시겠습니까?'))return false;">삭제</a>
			</td>
		</tr>
<% 	
		}
%>	
	</table>
		<div class="buttons">
			<button type="button" class="register-btn" onclick="window.location.href='addSubject.jsp'">작성</button>
		</div>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>