<%@ page import="java.io.PrintWriter" %>
<%@ page import="DAO.BbsDAO" %>
<%@ page import="DTO.BbsDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.CrawDAO" %>
<%@ page import="DTO.CrawDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>NEXTOON</title>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="/css/main.css"/>

</head>
<!-- Main -->
<div id="main">
    <%
        String searchValue = (String) request.getParameter("searchText");
        BbsDAO bbsDAO = new BbsDAO();
        CrawDAO crawDAO = new CrawDAO();
        ArrayList<BbsDTO> bbsTitleSearchList = bbsDAO.getSearchList(searchValue, "bbsTitle");
        ArrayList<BbsDTO> bbsContentSearchList = bbsDAO.getSearchList(searchValue, "bbsContent");
        ArrayList<BbsDTO> bbsUserSearchList = bbsDAO.getSearchList(searchValue, "userId");
        ArrayList<CrawDTO> crawTitleSearchList = crawDAO.getSearchList(searchValue, "crawTitle");
        ArrayList<CrawDTO> crawAuthorSearchList = crawDAO.getSearchList(searchValue, "crawAuthor");
        ArrayList<CrawDTO> crawGenreSearchList = crawDAO.getSearchList(searchValue, "crawGenre");

        ArrayList<ArrayList<BbsDTO>> bbsSearchList = new ArrayList<>();
        bbsSearchList.add(bbsTitleSearchList);
        bbsSearchList.add(bbsContentSearchList);
        bbsSearchList.add(bbsUserSearchList);

        ArrayList<ArrayList<CrawDTO>> crawSearchList = new ArrayList<>();
        crawSearchList.add(crawTitleSearchList);
        crawSearchList.add(crawAuthorSearchList);
        crawSearchList.add(crawGenreSearchList);

    %>
    <!-- Post -->
    <article class="post">
        <header>
            <div class="title">
                <h2>
                    게시판 검색결과
                </h2>
            </div>
        </header>
        <%
            for (int i = 0; i < bbsSearchList.size(); i++) {
        %>
        <div class="table-wrapper">
            <div class="title">
                <h2>
                    <% String title = null;
                        if (i == 0) {
                            title = "제목";
                        } else if (i == 1) {
                            title = "내용";
                        } else if (i == 2) {
                            title = "작성자";
                        }
                    %>
                    <%=title%> 검색
                </h2>
            </div>
            <table>
                <thead>
                <tr>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>날짜</th>
                    <th>좋아요</th>
                </tr>
                </thead>
                <tbody>
                <%
                    System.out.println("bbsTitleSearchList: " + bbsTitleSearchList);
                    if (bbsSearchList.get(i).isEmpty()) {
                %>
                <tr>
                    <td colspan="4">게시물이 존재하지 않습니다.</td>
                </tr>
                <%
                    }
                    for (BbsDTO bbs : bbsSearchList.get(i)) {
                %>
                <tr>
                    <td class="tdTitle"><a href="bbsView.jsp?bbsId=<%=bbs.getBbsId()%>"><%=bbs.getBbsTitle()%>
                    </a></td>
                    <td class="tdUserId"><%=bbs.getUserId()%>
                    </td>
                    <td class="tdDate"><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시" + bbs.getBbsDate().substring(14, 16) + "분"%>
                    </td>
                    <td class="tdLike"><%=bbs.getLikeCount()%>
                    </td>
                </tr>
                <%}%>
                </tbody>
            </table>
        </div>
        <%}%>

    </article>

    <article class="post">
        <header>
            <div class="title">
                <h2>
                    웹툰 검색결과
                </h2>
            </div>
        </header>
        <%
            for (int i = 0; i < crawSearchList.size(); i++) {
        %>
        <div class="table-wrapper">
            <div class="title">
                <h2>
                    <% String title = null;
                        if (i == 0) {
                            title = "제목";
                        } else if (i == 1) {
                            title = "작가";
                        }else if (i == 2) {
                            title = "장르";
                        }
                    %>
                    <%=title%> 검색
                </h2>
            </div>
            <table>
                <thead>
                <tr>
                    <th>제목</th>
                    <th>작가</th>
                    <th>요약</th>
                    <th>장르</th>
                </tr>
                </thead>
                <tbody>
                <%
                    System.out.println("crawTitleSearchList: " + crawTitleSearchList);
                    if (crawSearchList.get(i).isEmpty()) {
                %>
                <tr>
                    <td colspan="4">해당하는 웹툰이 없습니다.</td>
                </tr>
                <%
                    }
                    for (CrawDTO craw : crawSearchList.get(i)) {
                %>
                <tr>
                    <td class="tdTitle"><a href="<%=craw.getCrawUrl()%>"><%=craw.getCrawTitle()%>
                    </a></td>
                    <td class="tdUserId"><%=craw.getCrawAuthor()%>
                    </td>
                    <%
                        String summary = craw.getCrawSummary();
                        if (summary.length() > 30) {
                            summary = summary.substring(0, 30) + "...";
                        }
                    %>
                    <td class="tdDate"><%=summary%>
                    </td>
                    <%
                        String genre = craw.getCrawGenre();
                        int hashCount = 0;
                        for (char c : genre.toCharArray()) {
                            if (c == '#') {
                                hashCount++;
                            }
                        }

                        if (hashCount >= 3) {
                            int hashIndex = 0;
                            for (int idx = 0; idx < genre.length(); idx++) {
                                if (genre.charAt(idx) == '#') {
                                    hashIndex++;
                                    if (hashIndex >= 4) {
                                        // Replace from the 3rd '#' onward with "..."
                                        genre = genre.substring(0, idx) + "...";
                                        break;
                                    }
                                }
                            }
                        }
                    %>
                    <td class="tdLike"><%=genre%>
                    </td>
                </tr>
                <%}%>
                </tbody>
            </table>
        </div>
        <%}%>
    </article>
</div>



<script src="js/jquery.min.js"></script>
<script src="js/browser.min.js"></script>
<script src="js/breakpoints.min.js"></script>
<script src="js/util.js"></script>
<script src="js/main.js"></script>

</body>
</html>