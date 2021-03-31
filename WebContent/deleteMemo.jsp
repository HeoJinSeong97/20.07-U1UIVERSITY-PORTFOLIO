<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="smartit.u1classm.DBUtill"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
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
		try{
			int idx = Integer.parseInt(request.getParameter("idx"));
			String type = request.getParameter("type");
			
			Connection conn = DBUtill.getMySqlConnection();
			String sql = "delete from memotable where idx=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			%>
			<script>
				alert('삭제성공');
			</script>
			<%
			String str = "FreeMemoList.jsp?type="+type+"&ifcheck=pass";
			response.sendRedirect(str);
		}catch(SQLException e){
			%>
			<script>
				alert('Error');
				history.go(-1);
			</script>
			<%
		}
		%>
	</body>
</html>