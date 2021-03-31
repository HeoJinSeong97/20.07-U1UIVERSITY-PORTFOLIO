<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
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
		<%
		String id = request.getParameter("id");
		try{
			Connection conn = DBUtill.getMySqlConnection();
			String sql = "select id from classmuser where id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			out.print(rs.getString("id")+"\n"+"사용 불가능한 아이디 입니다.");
			rs.close();
			pstmt.close();
			conn.close();
		}catch(SQLException e){			
			out.println("사용 가능한 아이디 입니다.");
		}
		%>
	</body>
</html>