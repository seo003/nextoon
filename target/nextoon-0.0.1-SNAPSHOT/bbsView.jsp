<%@ page import="java.io.PrintWriter" %>
<%@ page import="DAO.BbsDAO" %>
<%@ page import="DTO.BbsDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>NEXTOON</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/css/main.css" />
</head>
<!-- Main -->
<div id="main">
	<%
		int bbsId = 0;
		if(request.getParameter("bbsId") != null) {
			bbsId = Integer.parseInt(request.getParameter("bbsId"));
		}

		if(bbsId == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='recommendBbs.jsp'");
			script.println("</script>");
		}
		BbsDTO bbsDTO = new BbsDAO().getBbs(bbsId);
	%>
	<!-- Post -->
	<article class="post">
		<header>
			<div class="title">
				<h2>
					<a href="#"><%=bbsDTO.getBbsTitle()%></a>
				</h2>
					<%
						if (loginId!=null && loginId.equals(bbsDTO.getUserId())) {
						%>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="#"><input type="button" class="button large next delete" value="삭제" ></a>
					<a href="#"><input type="button" class="button large next edit" value="수정" ></a>
				<%
					}
				%>
			</div>
			<div class="meta">
				<time class="published" datetime="2015-11-01"><%=bbsDTO.getBbsDate().substring(0,11) + bbsDTO.getBbsDate().substring(11,13) + "시" + bbsDTO.getBbsDate().substring(14,16) + "분" %></time>
				<a href="#" class="author"><span class="name">작성자</span></a>
			</div>
		</header>
		<p><%=bbsDTO.getBbsContent()%></p>

		<footer>
			<ul class="stats">
				<li><a href="#" class="icon solid fa-heart"><%=bbsDTO.getLikeCount()%></a></li>
				<li><a href="#" class="icon solid fa-comment">128</a></li>
			</ul>
		</footer>
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