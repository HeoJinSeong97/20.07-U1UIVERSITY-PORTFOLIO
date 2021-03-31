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
		<title>LoginCheck</title>
	</head>
	<body>
		<jsp:useBean id="UserSs" scope="session" class="smartit.u1classm.UIDSession"></jsp:useBean>
		<%
		String id = request.getParameter("ID");
		String Password = request.getParameter("Password");
		
		Connection conn = DBUtill.getMySqlConnection();
		String sql = "select * from classmuser where id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		try{
		if(id.equals(rs.getString("id")) && Password.equals(rs.getString("password")) ){
			out.println("로그인 성공!");
			UserSs.setIdx(rs.getInt("idx"));
			UserSs.setId(rs.getString("id"));
			UserSs.setPassword(rs.getString("password"));
			UserSs.setName(rs.getString("name"));
			UserSs.setBirthday(rs.getString("birthday"));
			UserSs.setEmail(rs.getString("email"));
			
			try{
			/* 현재 접속중인 유저를 파악하기 위하여 접속자 테이블에 저장한다. */
			String sql2 = "insert into realtimeuser values(?)";
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setString(1, id);
			pstmt2.executeUpdate();
			pstmt2.close();
			}catch(SQLException e){
				
			}
			
			//out.println(UserSs.toString());
			response.sendRedirect("ExMainLogin.jsp");
		}else{%>
			<script>
				alert("로그인실패");
				history.go(-1);
			</script>
		<%}
		}catch(SQLException e){
			%>
			<script>
				alert("로그인실패");
				history.go(-1);
			</script>
		<%}
		%>
		
	</body>
</html>