<%@page import="DAO.BbsDAO" %>
<%@page import="DTO.BbsDTO" %>
<%@page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String userId = null;
    String bbsType = null;
    if (session.getAttribute("loginId") != null) {
        userId = (String) session.getAttribute("loginId");
    }
    if (request.getParameter("bbsType") != null) {
        bbsType = (String) request.getParameter("bbsType");
    }
//로그인 한 사람만 글을 쓸 수 있음
    if (userId == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인이 되어있지 않습니다.');");
        script.println("location.href='../sign.jsp';");
        script.println("</script>");
        script.close();
    }

    int bbsId = 0;
    if (request.getParameter("bbsId") != null) {
        bbsId = Integer.parseInt(request.getParameter("bbsId"));
    }
    if (bbsId == 0) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않은 게시글입니다.');");
        if (bbsType.equals("recommend")) {
            script.println("location.href='../recommendBbs.jsp'");
        } else if (bbsType.equals("free")) {
            script.println("location.href='../freeBbs.jsp'");
        } else if (bbsType.equals("fan")) {
            script.println("location.href='../fanBbs.jsp'");
        }
        script.println("</script>");
        script.close();
    }
//게시글 작성자와 로그인한 유저가 같은지 확인
    BbsDTO bbs = new BbsDAO().getBbs(bbsId);
    if (!userId.equals(bbs.getUserId())) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('권한이 없습니다.')");
        script.println("location.href='../bbsView.jsp?bbsId=" + bbsId);
        script.println("</script>");
        script.close();
    } else {
        if (request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null ||
                request.getParameter("bbsTitle").equals("") || request.getParameter("bbsContent").equals("")) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력이 안 된 사항이 있습니다.')");
            script.println("history.back()");
            script.println("</script>");
            script.close();
        } else {
            BbsDAO bbsDAO = new BbsDAO();
            int result = bbsDAO.update(bbsId, request.getParameter("bbsTitle"), request.getParameter("bbsContent"));

            if (result == -1) {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('글 수정하기에 실패했습니다.')");
                script.println("history.back()");
                script.println("</script>");
                script.close();
            } else {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('글 수정하기 성공')");
                if (bbsType.equals("recommend")) {
                    script.println("location.href='../recommendBbs.jsp'");
                } else if (bbsType.equals("free")) {
                    script.println("location.href='../freeBbs.jsp'");
                } else if (bbsType.equals("fan")) {
                    script.println("location.href='../fanBbs.jsp'");
                }
                script.println("</script>");
                script.close();
                System.out.println("수정완료");
            }
        }
    }

%>