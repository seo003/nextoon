<%@ page import="DAO.CrawDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.CrawDTO" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: 김서영
  Date: 2023-11-24
  Time: 오후 6:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String[] selectedGenres = request.getParameterValues("genre");
    ArrayList<CrawDTO> recommendList = new ArrayList<>();
    CrawDAO crawDAO = new CrawDAO();
    if (selectedGenres == null) {
        recommendList = crawDAO.allInfo();
    } else {
        for (String genre : selectedGenres) {
//            System.out.println("genre: "+genre);
            ArrayList<CrawDTO> oneRecommendList = crawDAO.recommendInfo(genre);
            recommendList.addAll(oneRecommendList);
        }
    }

    if (!recommendList.isEmpty()) {
        request.getSession().setAttribute("recommendList", recommendList);
        response.sendRedirect("../index.jsp");
    }
%>