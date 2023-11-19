<%@page import="DAO.LikeyDAO"%>
<%@page import="DAO.BbsDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
public static String getClientIP(HttpServletRequest request) {
	String ip = request.getHeader("X-FORWARDED-FOR");
	if (ip == null || ip.length() == 0) {
		ip = request.getHeader("Proxy-Client-IP");
	}
	if (ip == null || ip.length() == 0) {
		ip = request.getHeader("WL-Proxy-Client-IP");
	}
	if (ip == null || ip.length() == 0) {
		ip = request.getRemoteAddr();
	}
	return ip;
}
%>
<%
String userId=null;
	
	if(session.getAttribute("loginId")!=null) {
		userId=(String)session.getAttribute("loginId");
	}
	
	if (userId==null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 되어있지 않습니다.');");
		script.println("location.href='login.jsp';");
		script.println("</script>");
		script.close();
	}
	
	request.setCharacterEncoding("UTF-8");
	String bbsID = null;
	
	if(request.getParameter("bbsID") != null) {
		bbsID = request.getParameter("bbsID");
	}
	BbsDAO bbsDAO = new BbsDAO();
	LikeyDAO likeyDAO = new LikeyDAO();
	int result = likeyDAO.like(userId, bbsID, getClientIP(request));
	if(result == 1) {
		result = bbsDAO.like(bbsID);
		if(result == 1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('추천이 완료되었습니다.')");
	script.println("history.back();");
	script.println("</script>");
	script.close();
		}else {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('데이터 베이스 오류.')");
	script.println("history.back();");
	script.println("</script>");
	script.close();
		}
	}else {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('이미 좋아요를 누른 글입니다.')");
	script.println("history.back();");
	script.println("</script>");
	script.close();
		}
%>