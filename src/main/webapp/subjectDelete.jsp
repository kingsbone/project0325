<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt = null;
	String id = request.getParameter("id");
	String sql = "delete from sub0321 where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.executeUpdate();
%>
<script>
	alert("삭제 성공");
	location.href = "subjectList.jsp";
</script>
</body>
</html>