<%@page import="java.sql.PreparedStatement"%>
<%@page import="smartit.u1classm.DBUtill"%>
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
	<jsp:useBean id="UserSs" scope="session" class="smartit.u1classm.UIDSession"></jsp:useBean>
		<%
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String birthday = request.getParameter("birthday");
		
		Connection conn = DBUtill.getMySqlConnection();
		String sql = "update classmuser set name = ?, birthday = ?, email = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, birthday);
		pstmt.setString(3, email);
		
		pstmt.executeUpdate();
		
		UserSs.setName(name);
		UserSs.setBirthday(birthday);
		UserSs.setEmail(email);
		response.sendRedirect("ExMainLogin.jsp");
		%>
	</body>
</html>