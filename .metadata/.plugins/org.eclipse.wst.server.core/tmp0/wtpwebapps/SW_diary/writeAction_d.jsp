<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="diary.DiaryDAO"%>
    <%@ page import="java.io.PrintWriter" %>
        <%@ page import="javax.servlet.http.HttpSession" %>
    <% request.setCharacterEncoding("UTF-8"); %>
    <jsp:useBean id="diary" class="diary.Diary" scope="page">
		<jsp:setProperty name="diary" property="diaryContent"/>
		<jsp:setProperty name="diary" property="weather"/>
    </jsp:useBean>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Diary</title>
</head>
<body>
	<%
		String userID = null;
		String userAge = (String) session.getAttribute("userAge");
		if(session.getAttribute("userID")!=null){
			userID = (String) session.getAttribute("userID");
		}
		if(userID ==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요'.)");
			script.println("location.href='login_d.jsp'");
			script.println("</script>");
		}
		else{
			if(diary.getDiaryContent()==null||diary.getWeather()==null)
					{
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('입력이 안된 사항이 있습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}
					else{
						DiaryDAO diaryDAO = new DiaryDAO();
						int result = diaryDAO.write(userID,diary.getDiaryContent(),userAge,diary.getWeather());
						if(result==-1)
						{
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('글쓰기에 실패했습니다.')");
							script.println("history.back()");
							script.println("</script>");
						}
						else 
						{
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("location.href='day.jsp'");
							script.println("</script>");
						}
					}
					
		}
	%>
</body>
</html>'