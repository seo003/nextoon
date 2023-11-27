<%@ page import="java.io.PrintWriter" %>
<%@ page import="DTO.BbsDTO" %>
<%@ page import="DAO.BbsDAO" %><%--
  Created by IntelliJ IDEA.
  User: 김서영
  Date: 2023-11-27
  Time: 오후 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    String userId=null;
    String bbsType=null;

    if(session.getAttribute("loginId")!=null) {
        userId=(String)session.getAttribute("loginId");
    }
    if(request.getParameter("bbsType")!=null) {
        bbsType=(String)request.getParameter("bbsType");
    }
//로그인 한 사람만 글을 쓸 수 있음
    if (userId==null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인이 되어있지 않습니다.');");
        script.println("loaction.href='login.jsp';");
        script.println("</script>");
    }

    int bbsId = 0;
    if(request.getParameter("bbsId") != null) {
        bbsId = Integer.parseInt(request.getParameter("bbsId"));
    }
    if(bbsId == 0){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않은 게시글입니다.');");
        script.println("loaction.href='bbs.jsp';");
        script.println("</script>");
    }

    BbsDTO bbs = new BbsDAO().getBbs(bbsId);
    if(!userId.equals(bbs.getUserId())){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('권한이 없습니다.')");
        script.println("location.href='bbs.jsp'");
        script.println("</script>");
    } else {
        BbsDAO bbsDAO = new BbsDAO();
        int result = bbsDAO.delete(bbsId);
        if(result == -1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('글 수정하기에 실패했습니다.')");
            script.println("history.back()");
            script.println("</script>");
        } else {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('글 삭제하기 성공')");
            if(bbsType.equals("recommend")) {
                script.println("location.href='../recommendBbs.jsp'");
            } else if(bbsType.equals("free")) {
                script.println("location.href='../freeBbs.jsp'");
            } else if(bbsType.equals("fan")) {
                script.println("location.href='../fanBbs.jsp'");
            }
            script.println("</script>");
        }
    }

%>