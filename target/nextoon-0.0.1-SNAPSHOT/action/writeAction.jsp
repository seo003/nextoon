<%@page import="DAO.BbsDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String bbsTitle=null;
String bbsContent=null;
String userId=null;
	String bbsType=null;


if(request.getParameter("bbsTitle")!=null) {
	bbsTitle=(String)request.getParameter("bbsTitle");
}

if(request.getParameter("bbsContent")!=null) {
	bbsContent=(String)request.getParameter("bbsContent");
}
if(request.getParameter("bbsType")!=null) {
	bbsType=(String)request.getParameter("bbsType");
}

if(session.getAttribute("loginId")!=null) {
	userId=(String)session.getAttribute("loginId");
}

if (userId==null) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인이 되어있지 않습니다.')");
	script.println("location.href='../sign.jsp'");
	script.println("</script>");
	script.close();
}else {
	if (bbsTitle==null || bbsContent == null) { 
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
	}else{
		BbsDAO bbsDAO = new BbsDAO();
		int result = bbsDAO.write(userId, bbsType, bbsTitle, bbsContent);
		
		if(result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
		}else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기 성공')");
			if(bbsType.equals("recommend")) {
				script.println("location.href='../recommendBbs.jsp'");
			} else if(bbsType.equals("free")) {
				script.println("location.href='../freeBbs.jsp'");
			} else if(bbsType.equals("fan")) {
				script.println("location.href='../fanBbs.jsp'");
			}
			script.println("</script>");
			script.close();
		}
	}
}
%>