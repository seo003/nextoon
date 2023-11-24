<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>NEXTOON</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="css/main.css" />
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<h1>
				<a href="index.jsp">nextoon</a>
			</h1>
			<nav class="links">
				<ul>
					<%
					String loginId = (String) session.getAttribute("loginId");
					if (loginId == null) {
					%>
					<li><a href="sign.jsp">Login</a></li>
					<%
					} else {
					%>
					<li><a href="action/logoutAction.jsp">Logout</a></li>
					<%
					}
					%>
					<li><a href="freeBbs.jsp">자유게시판</a></li>
					<li><a href="recommendBbs.jsp">추천게시판</a></li>
					<li><a href="fanBbs.jsp">덕질게시판</a></li>
				</ul>
			</nav>
			<nav class="main">
				<ul>
					<li class="search"><a class="fa-search" href="#search">Search</a>
						<form id="search" method="get" action="#">
							<input type="text" name="query" placeholder="Search" />
						</form></li>
					<li class="menu"><a class="fa-bars" href="#menu">Menu</a></li>
				</ul>
			</nav>
		</header>

		<!-- Menu -->
		<section id="menu">

			<!-- Search -->
			<section>
				<form class="search" method="get" action="#">
					<input type="text" name="query" placeholder="Search" />
				</form>
			</section>

			<!-- Links -->
			<section>
				<ul class="links">
					<li><a href="freeBbs.jsp">
							<h3>자유게시판</h3>
							<p>웹툰에 대해 하고싶은말을 뭐든지 적어주세요!</p>
					</a></li>
					<li><a href="recommendBbs.jsp">
							<h3>추천게시판</h3>
							<p>이 웹툰 괜찮은데? 추천해주세요!</p>
					</a></li>
					<li><a href="fanBbs.jsp">
							<h3>덕질게시판</h3>
							<p>내 애가 짱이다! 마음껏 덕질해주세요!</p>
					</a></li>
				</ul>
			</section>

			<!-- Actions -->
			<section>
				<ul class="actions stacked">
					<li><a href="sign.jsp" class="button large fit">Log In</a></li>
				</ul>
			</section>

		</section>

</html>