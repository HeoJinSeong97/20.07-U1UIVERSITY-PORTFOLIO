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
	<form action="FreeMemoList.jsp" method="post" name = "hiddenNext">
		<%
		request.setCharacterEncoding("utf-8");
		
		String type = request.getParameter("type");
		String id = request.getParameter("id");
		String txtarea = request.getParameter("txtarea");
		String title = request.getParameter("memotitle");
		
		if(type.equals("일반")){
			type = "nomal";
		}else if(type.equals("자유")){
			type = "free";
		}
		
		Connection conn = DBUtill.getMySqlConnection();
		String sql = "insert into memotable (id, memo, type, title) values (?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, txtarea);
		pstmt.setString(3, type);
		pstmt.setString(4, title);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		DBUtill.close(conn);
		%>
		<input type="hidden" name = "type" value="<%=type%>">
		<input type="hidden" name = "ifcheck" value="pass">
		</form>
		<script type="text/javascript">
		document.hiddenNext.submit();
		</script>
	</body>
</html>