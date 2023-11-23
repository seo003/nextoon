<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.UserDAO"%>
<%@page import="java.io.PrintWriter" %>
<%@page import="DTO.UserDTO" %>
<%
String userId = (String) request.getParameter("id"); //input을 parameter로 가져와서 UserID에 넣기
String userPw = (String) request.getParameter("password");

UserDAO userDAO = new UserDAO();
int result = userDAO.login(userId, userPw);

if(result==1) {
	session.setAttribute("loginId", userId);
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인 성공')");
	script.println("location.href='../index.jsp'");
	script.println("</script>");
}
else if(result==0) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('비밀번호가 틀립니다.')");
	script.println("history.back()");
	script.println("</script>");
}
else if(result==-1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('존재하지 않는 아이디입니다.')");
	script.println("history.back()");
	script.println("</script>");
}
else if(result==-2) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('데이터베이스 오류입니다.')");
	script.println("history.back()");
	script.println("</script>");
}
%>