<%@ page import="DAO.BbsDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DTO.BbsDTO" %>
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
    <script>
        function isLogin(loginId) {
            if (loginId == "null") {
                alert("로그인이 필요합니다.");
                location.href = "sign.jsp";
                return false;
            }
            return true;
        }
    </script>
</head>
<!-- Main -->
<div id="main">
    <!-- Post -->
    <article class="post">
        <header>
            <div class="title">
                <h2>
                    <a href="recommendBbs.jsp">덕질게시판</a>
                </h2>
                <p>내 애가 짱이다! 마음껏 덕질해주세요!</p>
                <a href="bbsWrite.jsp?bbsType=fan" class="button large next" onclick="return isLogin('<%=loginId%>')">글쓰기</a>
            </div>
        </header>
        <div class="table-wrapper">
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
                    int pageNumber = 1;
                    if (request.getParameter("pageNumber") != null) {
                        pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
                    }
                    System.out.println("loginId: " + loginId);
                    BbsDAO bbsDAO = new BbsDAO();
                    ArrayList<BbsDTO> list = bbsDAO.getFanList(pageNumber);
                    if (list.isEmpty()) {
                %>
                    <tr>
                        <td colspan="4"> 게시물이 존재하지 않습니다.</td>
                    </tr>
                <%
                    }
                    for (int i = 0; i < list.size(); i++) {
                %>
                <tr>
                    <td class="tdTitle"><a href="bbsView.jsp?bbsId=<%=list.get(i).getBbsId()%>"><%=list.get(i).getBbsTitle()%></a></td>
                    <td class="tdUserId"><%=list.get(i).getUserId()%></td>
                    <td class="tdDate"><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분"%>
                    </td>
                    <td class="tdLike"><%=list.get(i).getLikeCount()%>
                    </td>
                </tr>
                <%}%>
                </tbody>
            </table>
        </div>


        <ul class="actions pagination">
            <li><a href="recommendBbs.jsp?pageNumber=<%= pageNumber -1 %>" class="button large next">Previous Page</a>
            </li>
            <li><a href="recommendBbs.jsp?pageNumber=<%= pageNumber +1 %>" class="button large next">Next Page</a></li>
        </ul>
    </article>

</div>


</div>

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>

</body>
</html>