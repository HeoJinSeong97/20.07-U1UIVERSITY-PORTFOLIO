<%@page import="smartit.u1classm.DBUtill"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" 
		contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<!-- 로그아웃시 UIDSession에 저장된 정보를 삭제한다. -->
		<jsp:useBean id="UserSs" scope="session" class="smartit.u1classm.UIDSession"></jsp:useBean>
		<%
		session.invalidate();
		String id = UserSs.getId();
		
		Connection conn = DBUtill.getMySqlConnection();
		String sql = "delete from realtimeuser where id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.executeUpdate();
		%>
		<jsp:forward page="ExMain.jsp"></jsp:forward>
	</body>
</html>