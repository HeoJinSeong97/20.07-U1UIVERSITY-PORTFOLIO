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
		<title>MemoView</title>
		<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
		<style type="text/css">
		@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap')
	;

body {
	margin: 0;
	padding: 0;
	font-family: 'Nanum Gothic', sans-serif;
	/* background: url("backg.jpg"); */
	background-size: cover;
}

.topUserinfo {
	
}

.t {
	width: 150px;
	height: 100px;
	margin-right: 10px;
	margin-top: 65px;
	align-self: center;
	float: right;
	background-color: white;
	border: 1.5px solid #B2CCFF;
	border-radius: 8px;
}
.topli1 {
	margin-left: 10px;
	margin-top: 25px;
	float: left;
	margin-right: 10px;
}

.topli2 {
	align-self: center;
}

.topli2 a {
	text-decoration: none;
	color: black;
}

.topli2 input {
	text-decoration: none;
	color: black;
	background-color: white;
	font-size: 10px;
	margin-left: 0px;
	margin-top: 10px;
	border-radius: 12px;
	padding-bottom: 1px;
}

.memologo {
	padding: 5px;
	background-color: white;
}
.h_logo {
	text-decoration: none;
	font-size: 40px;
	color: #B2CCFF;
	margin-left: 60px;
}

.L1 {
	text-align: center;
	margin-top: -20px;
}

.userId-s-s {
	margin-top: -20px;
}

.userId-s-s a {
	font-size: 8px;
	text-decoration: none;
	color: black;
}

.userId-s-s a:hover {
	text-decoration: underline;
	color: #B5B2FF;
}

#LoginBtn {
	border: 0;
	background: none;
	display: block;
	margin: 30px auto;
	text-align: left;
	border: 2px solid #3498db;
	padding: 10px 25px;
	width: 80px;
	outline: none;
	color: black;
	border-radius: 24px;
	transition: 0.25s;
	cursor: pointer;
}

#LoginBtn:hover {
	width: 25opx;
	border-color: #2ecc71;
}
tableContain {
	padding: 10px;
	width: 1450px;
	height: 500px;
	overflow: auto;
}
.tableContain table, td {
	border: 1.5px solid #B2CCFF;
	border-radius: 8px;
	
}
.tableContain table td {
text-decoration: none;
color: #8C8C8C;
}
		</style>
	</head>
	<body>
		<!-- 게시글을 보는 페이지 -->
	</body>
	<jsp:useBean id="UserSs" scope="session"
		class="smartit.u1classm.UIDSession"></jsp:useBean>
		<%
		request.setCharacterEncoding("utf-8");
		int idx = Integer.parseInt(request.getParameter("idx"));
		String ifpass = request.getParameter("ifpass");
		String type = request.getParameter("type");
		
		try{
			Connection conn = DBUtill.getMySqlConnection();
			String sql = "select * from memotable where idx = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
		
		%>
		<div class="topUserinfo">
		<div class="t">
			<%
				if (ifpass.equals("unpass")) {
			%>
			<div class="L1">
				<input type="button" value="Login" id="LoginBtn"
					onclick="location.href='Login.jsp'">
				<div class="userId-s-s">
					<a href="UserInsert.jsp">회원가입/</a> <a href="serchid.jsp">아이디
						비밀번호 찾기</a>
				</div>
			</div>
			<%
				} else {
			%>
			<div class="topli1">
				<i class="far fa-user-circle fa-3x"></i>
			</div>
			<div class="topli2">
				<h6><%=UserSs.getId()%><br> <a href="UserInfo.jsp">내정보</a><br>
					<input type="button" value="Logout"
						onclick="location.href = 'Logout.jsp'">
				</h6>
				<%
					}
				%>
			</div>
		</div>
	</div>
	<h1 align="center">
		<a href="ExMainLogin.jsp" class="h_logo"> Class Share </a>
	</h1>
	<div class="memologo">
		<%
			if (type.equals("nomal")) {
		%>
		<h1>일반게시판</h1>
		<%
			} else if (type.equals("free")) {
		%>
		<h1>자유게시판</h1>
		<%
			} else {
		%>
		<h1><%=type%>교수님 게시판
		</h1>
		<%
			}
		%>
		<br>
		<hr>
	</div>
	<div class="tableContain">
		<table border="1" width="1450" height="500">
			<tr height="40">
				<td>Title: <%=rs.getString("title") %></td>
			</tr>
			<tr height="40">
				<td>Writer: <%=rs.getString("id") %></td>
			</tr>
			<tr height="40">
				<td>Type: <%=rs.getString("type") %>
				<%if( rs.getString("id").equals(UserSs.getId()) ) {%>
					<input type="button" onclick="location.href='deleteMemo.jsp?idx=<%=rs.getInt("idx") %>&type=<%=type %>'" value="삭제" >					
				<%} %>
				</td>
			</tr>
			<tr>
				<td align="center"><%=rs.getString("memo") %></td>
			</tr>
		</table>
		<%}catch(SQLException e){%>
			<script>
				alert("잘못된 접근입니다.");
				history.go(-1);
			</script>
		<%}%>
	</div>
</html>