<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<title>오늘의 교환일기_write</title>
<meta http-equiv="Content-Type" content="text/html">
<meta http-equiv="Content-Type"
      charset="UTF-8" name=viewport content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
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
    position: relative;
	top:0;
    left: 0;
    right: 0;
	box-sizing : border-box;
    height: 70px;
    z-index: 1;
    margin: 0;
    padding: 0;
}
p.title{
	position: relative;
	text-align: center;
	font-size: 2em;
	color: #00218c;

}
p.ymd{
	text-align: center;
	font-size: 1.3em;
	color: #353c54;
}

div.weather{
	text-align: center;
	font-size: 1.3em;
	color: #353c54;

}

textarea{
	font-size: 100%;	
	width: 80%;
	height: 45%;
	border:1px solid #00218c;
	padding:5px;
	margin-top: 40px;
	margin-left: 10%;
	font-family: Chosunilbo_myungjo;
	font-size: 1.5em;
	float: top;

}


input.finish{
	width: 80%;
	background-color: #00218c;
	color: #FFFFFF;
	font-size: 2em;
	height: 8%;
	margin-left: 10%;
	margin-top: 40px;
	font-family: Chosunilbo_myungjo;
	border: none;

}



</style>
</head>
<body>
    <%
        String userID = null;
        if(session.getAttribute("userID")!=null){
            userID = (String) session.getAttribute("userID");
        }
        Date nowDate = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
        String nowFormatedDate = sdf.format(nowDate);
    %>
	
        	<form method="post" action="writeAction_d.jsp">
        	<div class="top"></div>
				<p class="title">내 일기</p>
				<p class="ymd">날짜 : <%=nowFormatedDate %></p>
				<div class="weather">
					날씨 :
					<input type="radio" name="weather" value="sunny"> 맑음
					<input type="radio" name="weather" value="cloudy"> 흐림
					<input type="radio" name="weather" value="rain"> 비
					<input type="radio" name="weather" value="snow"> 눈
				</div>
				<div class="write">
				<tr>
					<td><textarea class="form-control" name="diaryContent" maxlength="2048" placeholder="이곳에 일기를 써주세요."style="height: 500px;" ></textarea></td>
				</tr>
				</div>
					<input class="finish" type="submit" name="finish" value="작성완료">
				 
			</form>

</body>
</html>