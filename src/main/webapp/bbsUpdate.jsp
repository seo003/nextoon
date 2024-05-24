<%@ page import="DTO.BbsDTO" %>
<%@ page import="DAO.BbsDAO" %>
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
	String bbsId = null;

	if (request.getParameter("bbsId") != null) {
		bbsId = request.getParameter("bbsId");
	}
	BbsDTO bbsDTO = new BbsDAO().getBbs(Integer.parseInt(bbsId));
%>
	<!-- Post -->
	<article class="post">
		<form method="post" action="action/updateAction.jsp?bbsId=<%=bbsDTO.getBbsId()%>&bbsType=<%=bbsDTO.getBbsType()%>">
			<header>
				<div class="title">
					<h2>
						제목<input id="bbsTitle" type="text" name="bbsTitle"
							style="width: 100%;" value="<%=bbsDTO.getBbsTitle() %>">
					</h2>
				</div>
			</header>
			내용
			<textarea id="bbsContent" name="bbsContent" maxlength="2048"> <%=bbsDTO.getBbsContent() %></textarea>
			<br> <input type="submit" class="button large next" value="수정"
				style="margin-left: 90%;">
		</form>
	</article>

</div>


</div>

<!-- Scripts -->
<script src="js/jquery.min.js"></script>
<script src="js/browser.min.js"></script>
<script src="js/breakpoints.min.js"></script>
<script src="js/util.js"></script>
<script src="js/main.js"></script>

</body>	
</html>