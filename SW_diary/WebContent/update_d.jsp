<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="diary.Diary" %>
<%@ page import="diary.DiaryDAO" %>
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
        if(userID==null){
        	PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.'.)");
			script.println("location.href='login.jsp'");
			script.println("</script>");
        }
        int diaryID = 0;
        if(request.getParameter("diaryID")!=null)
        {
        	diaryID = Integer.parseInt(request.getParameter("diaryID"));
        }
        if(diaryID==0){
        	PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.'.)");
			script.println("location.href='diary.jsp'");
			script.println("</script>");
        }
        Diary diary = new DiaryDAO().getDiary(diaryID);
        if(!userID.equals(diary.getUserID())){
        	PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.'.)");
			script.println("location.href='diary.jsp'");
			script.println("</script>");
        }
    %>
	<form method="post" action="updateAction_d.jsp?diaryID=<%=diaryID%>">
        	<div class="top"></div>
				<p class="title">내 일기</p>
				 <p class="ymd">
	날짜 : <%= diary.getDiaryDate().substring(0,4)+"년"+diary.getDiaryDate().substring(5,7)+"월"+diary.getDiaryDate().substring(8,10)+"일"%>
	</p>
			<div class="weather">
				날씨 :
				<%if(diary.getWeather().equals("sunny")){ %>
				<input type="radio" name="weather" value="sunny" checked> 맑음
				<%} else{ %>
				<input type="radio" name="weather" value="sunny"> 맑음
				<%} %>
				<%if(diary.getWeather().equals("cloudy")){ %>
				<input type="radio" name="weather" value="cloudy" checked> 흐림
				<%} else{ %>
				<input type="radio" name="weather" value="cloudy"> 흐림
				<%} %><%if(diary.getWeather().equals("rain")){ %>
				<input type="radio" name="weather" value="rain" checked> 비
				<%} else{ %>
				<input type="radio" name="weather" value="rain"> 비
				<%} %><%if(diary.getWeather().equals("snow")){ %>
				<input type="radio" name="weather" value="snow" checked> 눈
				<%} else{ %>
				<input type="radio" name="weather" value="snowy"> 눈
				<%} %>
			</div>
			<div class="write">
				<tr>
					<td><textarea class="form-control" name="diaryContent" maxlength="2048" placeholder="이곳에 일기를 써주세요."style="height: 500px;" ><%= diary.getDiaryContent() %></textarea></textarea></td>
				</tr>
			</div>
				<% System.out.println(userID); %>
					<input class="finish" type="submit" name="finish" value="글 수정">
			</form>

</body>
</html>