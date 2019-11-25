<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>오늘의 교환일기_join</title>
<meta http-equiv="Content-Type"
      charset="UTF-8" name=viewport content="width=device-width, initial-scale=1, user-scalable=0">
<style type="text/css">
		@font-face { 
			font-family: 'Chosunilbo_myungjo';
		 	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Chosunilbo_myungjo.woff') format('woff'); 
		 	font-weight: normal; 
			 font-style: normal; 
		}
		
		body{
			margin: 0px auto;
			background-color: #FFFFFF;
			box-sizing : border-box;
			font-family: Chosunilbo_myungjo;
		}
		
		
		div.top{
			background: #00218c;
		    position: fixed;
			top:0;
		    left: 0;
		    right: 0;
			box-sizing : border-box;
		    height: 70px;
		    z-index: 1;
		    margin: 0;
		    padding: 0;
		}
		p.join{
			position: relative;
			padding-top: 30%;
			text-align: center;
		
		}
		
		footer{
			position: relative; 
			padding-top: 70;
			bottom: 0; 
			width: 100%;
			text-align: center;
			 }
			 
		
		div>input{
			font-size: 100%;	
			width: 80%;
			height:5%;
			border:1px solid #00218c;
			padding:5px;
			margin-top: 10%;
			margin-left: 10%;
			font-family: Chosunilbo_myungjo;
			font-size: 1.3em;
		
		}
		
		input.signup{
			top: 69%;
			left: 55%;
			font-size: 100%;
			width: 35%;
			border:none;
			height: 9%;
		
		}
		
		select{
			width: 80%; 
			height: 5%; 
			border: 1px soild #00218c; 
			margin-top:10%; 
			margin-left: 10%;
			border-radius: 0px;
			padding: 5px;
			font-family: Chosunilbo_myungjo;
			font-size: 1.3em;
		}
		
		input.signup{
			width: 80%;
			background-color: #00218c;
			color: #FFFFFF;
			font-size: 2em;
			height: 8%;
			margin-left: 10%;
			margin-top: 15%;
			font-family: Chosunilbo_myungjo;
		
		}


</style>
</head>

<body>
<div class="top"></div>
<p class="join">
<img src="images/join.png" style="max-width: 80%; height: auto;" >
</p>


	<form method="post" action="joinAction_d.jsp">
	<div class="login">
		<input class="id" type="text" class="form-control" name="userID" maxlength="20" placeholder="아이디">
		<input class="pw" type="password" class="form-control" name="userPassword" maxlength="20" placeholder="비밀번호">
		<input class="email" type="text" class="form-control" name="userEmail" maxlength="50" placeholder="이메일">
		<select name="userAge">
			<option value="">연령대</option>
			<option value="10대">10대</option>
			<option value="20대">20대</option>
			<option value="30대">30대</option>
			<option value="40대">40대</option>
			<option value="50대">50대</option>
		</select>
	</div>
		<input type="submit" class="signup" value="회원가입">
	</form>



<footer>
	<img src="images/logo.png" style="max-width: 10%;">
</footer>

</body>

</html>