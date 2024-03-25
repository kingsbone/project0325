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
	String studno = request.getParameter("studno");
	String name = request.getParameter("name");
	String dept = request.getParameter("dept");
	String position = request.getParameter("position");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	String hobby = request.getParameter("hobby");
	String sql = "update stud0321 set name=?,dept=?,position=?,address=?,phone=?,hobby=? where studno=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, dept);
	pstmt.setString(3, position);
	pstmt.setString(4, address);
	pstmt.setString(5, phone);
	pstmt.setString(6, hobby);
	pstmt.setString(7, studno);
	
	pstmt.executeUpdate();
%>
<script>
	alert("고객 수정 성공");
	location.href="studInfoList.jsp";
</script>
</body>
</html>