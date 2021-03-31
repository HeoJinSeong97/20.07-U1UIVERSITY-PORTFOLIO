<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="smartit.u1classm.DBUtill"%>
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
		<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		int birthday = Integer.parseInt(request.getParameter("yy")+request.getParameter("mm")+request.getParameter("dd"));
		
		Connection conn = DBUtill.getMySqlConnection();
		String sql = "insert into classmuser (id, password, name, birthday, email) values (?, ?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		pstmt.setString(3, name);
		pstmt.setInt(4, birthday);
		pstmt.setString(5, "null");
		
		pstmt.executeUpdate();
		

		DBUtill.close(conn);
		
		response.sendRedirect("Login.jsp");
		%>
		<%=birthday %>
		<%=password %>
		<%=id %>
		<%=name %>
	</body>
</html>