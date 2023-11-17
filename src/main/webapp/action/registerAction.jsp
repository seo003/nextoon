<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="users.UserDAO"%>
<%@ page import="users.UserDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("UTF-8");
String userId = null;
String userName = null;
String userPw = null;
String userPwCheck = null;
String userPhone = null;
String userEmail = null;

if (request.getParameter("id") != null) { //getElementBy같은느낌
	userId = (String) request.getParameter("id");
}

if (request.getParameter("name") != null) {
	userName = (String) request.getParameter("name");
}

if (request.getParameter("password") != null) {
	userPw = (String) request.getParameter("password");
}

if (request.getParameter("passwordCheck") != null) {
	userPwCheck = (String) request.getParameter("passwordCheck");
}

if (request.getParameter("number") != null) {
	userPhone = (String) request.getParameter("number");
}

if (request.getParameter("email") != null) {
	userEmail = (String) request.getParameter("email");
}

if (userId == "" || userName == "" || userPw == "" || userPwCheck == "" || userPhone == "" || userEmail == "") {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('입력이 안 된 사항이 있습니다. " + userId + " " + userName + " " + userPw + " " + userPwCheck + " "
	+ userPhone + " " + userEmail + "')");
	script.println("history.back();");
	script.println("</script>");
	script.close();
	return;
}

if (!userPw.equals(userPwCheck)) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('비밀번호가 일치하지 않습니다." + userId + " " + userName + " " + userPw + " " + userPwCheck + " "
	+ userPhone + " " + userEmail + "')");
	script.println("history.back();");
	script.println("</script>");
	script.close();
	return;
}

UserDAO userDAO = new UserDAO();
int result = userDAO.join(userId, userName, userPw, userPhone, userEmail);
if (result == 1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('회원가입에 성공했습니다.');");
	script.println("location.href='sign.jsp';");
	script.println("</script>");
	script.close();
	return;
} else if (result == -1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.print("alert('데이터베이스오류");
	script.println("history.back();");
	script.println("</script>");
	script.close();
	return;
}
%>