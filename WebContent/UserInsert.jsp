<%@ page language="java" 
		contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Class Share : 회원가입</title>
		<style type="text/css">
		@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:ital@1&family=Kanit:wght@300&display=swap');
		
		body {
		margin: 0;
		padding: 0;
		font-family: 'Kanit', sans-serif;
		background: url("userB.jpg");
		background-size: cover;
		}
	div {
    display: block;
    }
   #header {
    position: relative;
    overflow: hidden;
    padding: 60px 0 54px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.container{
		width: 400px;
		position: absolute;
		top: 5%;
		left: 37%;
		tranform: translate(-50%,-50%);
		color: black;
		border: 1.5px solid #B2CCFF;
		padding: 30px;
		border-radius: 24px;
		text-align: center;
		background-color: white;
}
.h_logo {
text-decoration: none;
font-size: 40px;
}
#join_form {
text-align: left;
}
#header {
margin-top: -25%;
margin-bottom: -10%;
}
.join-title {
    margin: 19px 0 8px;
    font-size: 14px;
    font-weight: 700;
    color: #B2CCFF;
}
.bir_wrap, .name_wrap {
    display: table;
    width: 100%;
}
.bir_dd, .bir_mm, .bir_yy {
    display: table-cell;
    table-layout: fixed;
    width: 130px;
    vertical-align: middle;
    *display: block;
    *float: left;
}
.bir_mm+.bir_dd, .bir_yy+.bir_mm {
    padding-left: 10px;
}
.btn_area{
margin-top: 20px;
height: 70px;
text-align: center;
}
.btn_area input{
width: 400px;
height: 55px;
border-radius: 12px;
font-size: 24px;
border: 2px solid #B2CCFF;
background: #E6FFFF;
}
#mm {
height: 22px;
width: 40px;
}
.join_row input{
border-radius: 5px;
}
.duplication {
background-color: white;
height: 23px;
margin-top: 2px;
}
		</style>
		<script type="text/javascript">
		function checkID() {
			var s = document.getElementById('id').value;
			var url = "checkid.jsp?id="+ encodeURI(s);
			var name = "checkID";
			var option = "width = 250, height = 150, top = 100, left = 200, location = no"
            window.open(url, name, option);
		}
		</script>
	</head>
	<body>
	<div class="container">
		<div id="header"  role="banner">
			<h1>
				<a href="ExMain.jsp" class="h_logo">
					Class Share
				</a>
			</h1>
		</div>
		<form action="DBUsetInsert.jsp" method="post" id="join_form">
			<div class="join_row">
				<h3 class="join-title">
					<label for="id">아이디</label>
				</h3>
				<input type="text" id="id" name = "id" class="int" title="ID" maxlength="20">
				<input class = "duplication" type="button" value="중복확인" onclick="checkID()">
				<h3 class="join-title">
					<label for="pwd1">비밀번호</label>
				</h3>
				<input type="password" id="password" name = "password" class="int" title="password" maxlength="20">
				
				<h3 class="join-title">
					<label for="name">이름</label>
				</h3>
				<input type="text" id="name" name = "name" class="String" title="name" maxlength="20">
                        <h3 class="join-title"><label for="yy">생년월일</label></h3>
                        <div class="bir_wrap">
                            <div class="bir_yy">
								<span class="ps_box">
									<input type="text" id="yy" placeholder="년(4자)" aria-label="년(4자)" class="int" maxlength="4" name = "yy">
								</span>
                            </div>
                            <div class="bir_mm">
								<span class="ps_box">
									<select id="mm" class="sel" aria-label="월" name="mm">
										<option value="">월</option>
										  	 			<option value="01">
                                                            1
                                                        </option>
										  	 			<option value="02">
                                                            2
                                                        </option>
										  	 			<option value="03">
                                                            3
                                                        </option>
										  	 			<option value="04">
                                                            4
                                                        </option>
										  	 			<option value="05">
                                                            5
                                                        </option>
										  	 			<option value="06">
                                                            6
                                                        </option>
										  	 			<option value="07">
                                                            7
                                                        </option>
										  	 			<option value="08">
                                                            8
                                                        </option>
										  	 			<option value="09">
                                                            9
                                                        </option>
										  	 			<option value="10">
                                                            10
                                                        </option>
										  	 			<option value="11">
                                                            11
                                                        </option>
										  	 			<option value="12">
                                                            12
                                                        </option>
									</select>
								</span>
                            </div>
                            <div class=" bir_dd">
								<span class="ps_box">
									<input type="text" id="dd" placeholder="일" aria-label="일" class="int" maxlength="2" name="dd">
									<label for="dd" class="lbl"></label>
								</span>
                            </div>
                        </div>
			</div>
			<div class="btn_area">
            	<input type="submit" value="가입하기">
            </div>
		</form>
		</div>
	</body>
</html>