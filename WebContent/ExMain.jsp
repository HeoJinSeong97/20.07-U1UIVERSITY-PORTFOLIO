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
		<title>Class Share</title>
		<style type="text/css">
		@import url('https://fonts.googleapis.com/css2?family=Raleway&display=swap');
		/*body 초기화*/
		body {
		  margin: 0;
		  padding: 0;
		  font-family: 'Raleway', sans-serif;
		  display: flex;
		  flex-flow: column nowrap;
		  justify-content: center;
		  align-items: center;
		  overflow-x: hidden;  
		  background-size: cover;
		  background: url("backg.jpg");
		}
		#table1 {
		background-color: #fff;
		
		}
		#mainicon {
		text-decoration: none;
		color: white;
		text-shadow: -2px 0 #B2CCFF, 0 2px #B2CCFF, 2px 0 #B2CCFF, 0 -2px #B2CCFF;
		font-size: 60px;
		}
		.mainI {
		text-align: center;
		}
		/* 슬라이드바 */
		ul,li{list-style:none;}
    .slide{height:300px;width:1500px;hidden;position:relative;}
    .slide li{position:absolute;left:0;right:0;top:0;bottom:0;opacity:0;transition:1s;}
    .slide li:nth-child(1){background:url("B2.png"); background-position: bottom;background-size: cover;}
    .slide li:nth-child(2){background:url("B3.png"); background-position: bottom;background-size: cover;}
    .slide li:nth-child(3){background:url("B2.png"); background-position: bottom;background-size: cover;}
    .slide li:nth-child(4){background:url("B3.png"); background-position: bottom;background-size: cover;}
    .slide input{display:none;}
    .slide .bullet{position:absolute;bottom:20px;left:0;right:0;text-align:center;z-index:10;}
    .slide .bullet label{width:10px;height:10px;border-radius:10px;border:2px solid #666;display:inline-block;background:#fff;font-size:0;transition:0.5s;cursor:pointer;}

    /* 슬라이드 조작 */
    #pos1:checked ~ ul li:nth-child(1),
    #pos2:checked ~ ul li:nth-child(2),
    #pos3:checked ~ ul li:nth-child(3),
    #pos4:checked ~ ul li:nth-child(4){opacity:1;}

    /* bullet 조작 */
    #pos1:checked ~ .bullet label:nth-child(1),
    #pos2:checked ~ .bullet label:nth-child(2),
    #pos3:checked ~ .bullet label:nth-child(3),
    #pos4:checked ~ .bullet label:nth-child(4){background:#666;}
		
		/* 드롭다운메뉴 */
		nav {
  width: 100%;
  display: flex;
  justify-content: center;
  position: relative;
  background: linear-gradient(90deg, #100BA3, #4641D9, #6A65FD, #8E89FF, #C4BFFF);
}
		ul, li {
  margin: 0;
  padding: 0;
  list-style: none;
}

#main-menu > li {
  float: left;
  position: relative;
}

#main-menu > li > a {
  font-size: 0.85rem;
  color: rgba(255,255,255,0.85);
  text-align: center;
  text-decoration: none;
  letter-spacing: 0.05em;
  display: block;
  padding: 14px 36px;
  border-right: 1px solid rgba(0,0,0,0.15);
  text-shadow: 1px 1px 1px rgba(0,0,0,0.2);
}

#main-menu > li:nth-child(1) > a {
  border-left: 1px solid rgba(0,0,0,0.15);
}

#sub-menu {
  position: absolute;
    width: 100%;
  background: #4641D9;
  opacity: 0;
  visibility: hidden;
  transition: all 0.15s ease-in;
}

#sub-menu > li {
  padding: 16px 28px;
  border-bottom: 1px solid rgba(0,0,0,0.15);
}

#sub-menu > li >  a {
  color: rgba(255,255,255,0.6);
  text-decoration: none;
  font-size: 12px;
}

#main-menu > li:hover #sub-menu {
  opacity: 1;
  z-index: 10;
  visibility: visible;
}

#sub-menu > li >  a:hover {
 text-decoration: underline;
}
/* 드롭다운 끝 */
		/* 로그인버튼 및 회원가입/찾기 */
		.L1 {
		margin-top: -20px;
		}
		.userId-s-s {
		margin-top: -20px;
		}
		.userId-s-s a{
		font-size: 8px;
		text-decoration: none;
		color: black;
		}
		.userId-s-s a:hover{
		text-decoration: underline;
		color: #B5B2FF;
		}
		#LoginBtn {
		border: 0;
		background: none;
		display: block;
		margin: 20px auto;
		text-align: center;
		border:  2px solid #3498db;
		padding: 14px 40px;
		width: 200px;
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

/* 이미지바 */
	.slide2{height:300px;width:300px;hidden;position:relative; z-index: 4;}
    .slide2 li{position:absolute;left:0;right:0;top:0;bottom:0;opacity:0;transition:1s;}
    .slide2 li:nth-child(1){background:url("B1.png");background-size: cover; background-position: center;}
    .slide2 li:nth-child(2){background:url("B4.png");background-size: cover; background-position: center;}
    .slide2 li:nth-child(3){background:url("B1.png");background-size: cover; background-position: center;}
    .slide2 li:nth-child(4){background:url("B4.png");background-size: cover; background-position: center;}
    .slide2 input{display:none;}
    .slide2 .bullet2{position:absolute;bottom:20px;left:0;right:0;text-align:center;z-index:10;}
    .slide2 .bullet2 label{width:10px;height:10px;border-radius:10px;border:2px solid #666;display:inline-block;background:#fff;font-size:0;transition:0.5s;cursor:pointer;}
	
   	/* 슬라이드 조작 */
    #ipos1:checked ~ ul li:nth-child(1),
    #ipos2:checked ~ ul li:nth-child(2),
    #ipos3:checked ~ ul li:nth-child(3),
    #ipos4:checked ~ ul li:nth-child(4){opacity:1;}

    /* bullet 조작 */
    #ipos1:checked ~ .bullet2 label:nth-child(1),
    #ipos2:checked ~ .bullet2 label:nth-child(2),
    #ipos3:checked ~ .bullet2 label:nth-child(3),
    #ipos4:checked ~ .bullet2 label:nth-child(4){background:#666;}
    
    /* 게시판설정 */
    .tableBox {
    text-align: left;
    margin-top: -270px;
    font-size: 10px;
    }
    .tableBox h3{
    	font-size: 15px;
    }
    .tableBox table {
    text-decoration: none;
    margin-top: 10px;
    margin-left: 30px;
    width: 900px;
    border: white;
    }
    .tableBox table a{
    color: black;
    text-decoration: none;
    }
    .tableBox table tr{
    height:30px;
    }
     .tableBox table td{
     height:20px;
    border: 2px solid #BDBDBD;
	border-radius: 12px;
    }
 .t1 a{
 font-size: 10px;
 float: right;
 margin-top: 14px;

 }
 .t2 a{
 font-size: 10px;
 float: right;
 margin-top: 14px;
 }
 
 
   
		</style>
	</head>
	<body>
	<%request.setCharacterEncoding("utf-8"); %>
		<form action="#" method = "post">
			<div class="mainI">
				<a id="mainicon" href="#">Class Share</a>
			</div>
			<br>
			<br>
			<hr>
			<div class="slide">
				<input type="radio" name="pos" id="pos1" checked> 
				<input type="radio" name="pos" id="pos2"> 
				<input type="radio" name="pos" id="pos3"> 
				<input type="radio" name="pos" id="pos4">
				<ul>						<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
				<p class="bullet">
					<label for="pos1">1</label> <label for="pos2">2</label> 
					<label for="pos3">3</label> <label for="pos4">4</label>
				</p>
			</div>
			<hr>
			<nav role="navigation">
				<div class = "menu">
						<ul id="main-menu">
							<li><a href = "#">Smart IT</a>
								<ul id = "sub-menu">
									<li><a href="FreeMemoList.jsp?type=김문정&ifcheck=unpass">김문정교수님</a></li>
									<li><a href="FreeMemoList.jsp?type=박충식&ifcheck=unpass">박충식교수님</a></li>
									<li><a href="FreeMemoList.jsp?type=김재홍&ifcheck=unpass">김재홍교수님</a></li>
									<li><a href="FreeMemoList.jsp?type=최제영&ifcheck=unpass">최제영교수님</a></li>
								</ul>
							</li>
							<li><a href = "#">Automotive Software</a>
								<ul id = "sub-menu">
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
								</ul>
							</li>
							<li><a href = "#">Beauty Care</a>
								<ul id = "sub-menu">
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
								</ul>
							</li>
							<li><a href = "#">Other Class</a>
								
							</li>
							<li><a href = "http://www.u1.ac.kr/html/kr/">U1 University</a></li>
							<li><a href = "#">Service center</a>
							<ul id = "sub-menu">
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</nav>
				<br>
				<table align = "center" border="1" cellpadding = "5" cellspacing = "0" id="table1">
				<tr>
					<th width="300" rowspan="2">
					<!-- 이미지바 -->
						<div class="slide2">
							<input type="radio" name="ipos" id="ipos1" checked> 
							<input type="radio" name="ipos" id="ipos2"> 
							<input type="radio" name="ipos" id="ipos3"> 
							<input type="radio" name="ipos" id="ipos4">
							<ul>						<li></li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
							</ul>
							<p class="bullet2">
								<label for="ipos1">1</label> <label for="ipos2">2</label> 
								<label for="ipos3">3</label> <label for="ipos4">4</label>
							</p>
						</div>
					</th>
					<th width="950" rowspan="3">
					<!-- 게시판 table -->
						<div class="tableBox">
							<div class="TBox1">
								<div class="t1">
									<h3>자유게시판<a href="FreeMemoList.jsp?type=free&ifcheck=unpass">더보기</a></h3>
								</div>
								<hr>
								<table height = "100" border="1" cellpadding="0" cellspacing="0">
									<%
									try{
										Connection conn = DBUtill.getMySqlConnection();
										String sql = "select * from memotable where type = ?";
										PreparedStatement pstmt = conn.prepareStatement(sql);
										pstmt.setString(1, "free");
										ResultSet rs = pstmt.executeQuery();
										rs.next();
										for(int i = 0;i<5;i++){
											%>
											<tr height="20">
												<td height="40"><%=rs.getInt("idx")%>&nbsp;&nbsp;<a href="ViewMemo.jsp?type=free&ifpass=unpass&idx=<%=rs.getInt("idx")%>"><%=rs.getString("title")%></a></td>
											</tr>
											<%rs.next();
										}
									}catch(SQLException e){
										%>
										<tr>
											<td>등록된 게시물이 없습니다.</td>
										</tr>
										<%}
									%>
								</table>
							</div>
							<div  class = "TBox2">
								<div class="t2">
									<h3>일반게시판<a href="FreeMemoList.jsp?type=nomal&ifcheck=pass">더보기</a></h3>
								</div>
								<hr>
								<table height = "100" border="1">
									<%
									try{
										Connection conn = DBUtill.getMySqlConnection();
										String sql = "select * from memotable";
										PreparedStatement pstmt = conn.prepareStatement(sql);
										ResultSet rs = pstmt.executeQuery();
										rs.next();
										for(int i = 0;i<5;i++){
											%>
											<tr height="20">
												<td height="40"><%=rs.getInt("idx")%>&nbsp;&nbsp;<a href="ViewMemo.jsp?type=nomal&ifpass=unpass&idx=<%=rs.getInt("idx")%>"><%=rs.getString("title")%></a></td>
											</tr>
											<%rs.next();
										}
									}catch(SQLException e){
										%>
										<tr>
											<td>등록된 게시물이 없습니다.</td>
										</tr>
										<%}
									%>
								</table>
							</div>
						</div>
					</th>
					<th width="200" height="200">
						<div class = "L1">
							<input type="button" value="Login" id="LoginBtn" onclick="location.href='Login.jsp'">
							<div class="userId-s-s">
							<a href="UserInsert.jsp" >회원가입/</a>
							<a href="serchid.jsp" >아이디 비밀번호 찾기</a>
							</div>
						</div>
					</th>
				</tr>
					<tr >
					
					<%
						try{
							Connection conn = DBUtill.getMySqlConnection();
							String sql = "select count(*) from realtimeuser";
							PreparedStatement pstmt = conn.prepareStatement(sql);
							ResultSet rs = pstmt.executeQuery();
							rs.next();
							int totalCount = rs.getInt(1);
							
							%>
							<th rowspan="2" >현재 접속자수<br><%=totalCount %></th> 
							
							<%
						}catch(SQLException e){
							
						}
					%>
					</tr>
					<tr height="400">
					
					</tr>
				</table>
				<br>
				<br>
				<br>
				<br>
				<br>
		</form>
	</body>
</html>