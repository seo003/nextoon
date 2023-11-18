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

	<!-- Post -->
	<article class="post">
		<header>
			<form method="post" action="action/writeAction.jsp">
				<div class="title">
					<h2>
						제목<input id="bbsTitle" type="text" name="bbsTitle">
					</h2>
				</div>

			</form>
		</header>
		내용
		<textarea id="bbsContent" name="bbsContent" maxlength="2048"></textarea>
		<br>
		<input type="submit" class="button large next" value="글쓰기" style="margin-left:90%;">
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