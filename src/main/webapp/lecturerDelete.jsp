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
	String sql = "delete from lecturer0321 where idx=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.executeUpdate();
%>
<script>
	alert("삭제 성공");
	location.href = "lecturerList.jsp";
</script>
</body>
</html>