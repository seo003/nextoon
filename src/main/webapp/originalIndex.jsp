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
					<li><a href="#">자유게시판</a></li>
					<li><a href="#">추천게시판</a></li>
					<li><a href="#">덕질게시판</a></li>
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
					<li><a href="#">
							<h3>자유게시판</h3>
							<p>웹툰에 대한 모든 하고싶은말을 적어주세요!</p>
					</a></li>
					<li><a href="#">
							<h3>추천게시판</h3>
							<p>이 웹툰 괜찮은데? 추천해주세요!</p>
					</a></li>
					<li><a href="#">
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

		<!-- Main -->
		<div id="main">

			<!-- Post -->
			<article class="post">
				<header>
					<div class="title">
						<h2>
							<a href="single.html">Magna sed adipiscing</a>
						</h2>
						<p>Lorem ipsum dolor amet nullam consequat etiam feugiat</p>
					</div>
					<div class="meta">
						<time class="published" datetime="2015-11-01">November 1,
							2015</time>
						<a href="#" class="author"><span class="name">Jane Doe</span><img
							src="images/avatar.jpg" alt="" /></a>
					</div>
				</header>
				<a href="single.html" class="image featured"><img
					src="images/pic01.jpg" alt="" /></a>
				<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus
					nisl. Sed mattis nunc id lorem euismod placerat. Vivamus porttitor
					magna enim, ac accumsan tortor cursus at. Phasellus sed ultricies
					mi non congue ullam corper. Praesent tincidunt sed tellus ut
					rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies
					congue gravida diam non fringilla.</p>
				<footer>
					<ul class="actions">
						<li><a href="single.html" class="button large">Continue
								Reading</a></li>
					</ul>
					<ul class="stats">
						<li><a href="#">General</a></li>
						<li><a href="#" class="icon solid fa-heart">28</a></li>
						<li><a href="#" class="icon solid fa-comment">128</a></li>
					</ul>
				</footer>
			</article>

			<!-- Post -->
			<article class="post">
				<header>
					<div class="title">
						<h2>
							<a href="single.html">Ultricies sed magna euismod enim vitae
								gravida</a>
						</h2>
						<p>Lorem ipsum dolor amet nullam consequat etiam feugiat</p>
					</div>
					<div class="meta">
						<time class="published" datetime="2015-10-25">October 25,
							2015</time>
						<a href="#" class="author"><span class="name">Jane Doe</span><img
							src="images/avatar.jpg" alt="" /></a>
					</div>
				</header>
				<a href="single.html" class="image featured"><img
					src="images/pic02.jpg" alt="" /></a>
				<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus
					nisl. Sed mattis nunc id lorem euismod placerat. Vivamus porttitor
					magna enim, ac accumsan tortor cursus at. Phasellus sed ultricies
					mi non congue ullam corper.</p>
				<footer>
					<ul class="actions">
						<li><a href="single.html" class="button large">Continue
								Reading</a></li>
					</ul>
					<ul class="stats">
						<li><a href="#">General</a></li>
						<li><a href="#" class="icon solid fa-heart">28</a></li>
						<li><a href="#" class="icon solid fa-comment">128</a></li>
					</ul>
				</footer>
			</article>

			<!-- Post -->
			<article class="post">
				<header>
					<div class="title">
						<h2>
							<a href="single.html">Euismod et accumsan</a>
						</h2>
						<p>Lorem ipsum dolor amet nullam consequat etiam feugiat</p>
					</div>
					<div class="meta">
						<time class="published" datetime="2015-10-22">October 22,
							2015</time>
						<a href="#" class="author"><span class="name">Jane Doe</span><img
							src="images/avatar.jpg" alt="" /></a>
					</div>
				</header>
				<a href="single.html" class="image featured"><img
					src="images/pic03.jpg" alt="" /></a>
				<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus
					nisl. Sed mattis nunc id lorem euismod placerat. Vivamus porttitor
					magna enim, ac accumsan tortor cursus at. Phasellus sed ultricies
					mi non congue ullam corper. Praesent tincidunt sed tellus ut
					rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies
					congue gravida diam non fringilla. Cras vehicula tellus eu ligula
					viverra, ac fringilla turpis suscipit. Quisque vestibulum rhoncus
					ligula.</p>
				<footer>
					<ul class="actions">
						<li><a href="single.html" class="button large">Continue
								Reading</a></li>
					</ul>
					<ul class="stats">
						<li><a href="#">General</a></li>
						<li><a href="#" class="icon solid fa-heart">28</a></li>
						<li><a href="#" class="icon solid fa-comment">128</a></li>
					</ul>
				</footer>
			</article>



			<!-- Pagination 페이징 처리-->
			<ul class="actions pagination">
				<li><a href="" class="disabled button large previous">Previous
						Page</a></li>
				<li><a href="#" class="button large next">Next Page</a></li>
			</ul>

		</div>

		<!-- Sidebar -->
		<section id="sidebar">

			<!-- Intro -->
			<section id="intro">
				<a href="#" class="logo"><img src="images/logo.jpg" alt="" /></a>
				<header>
					<h2>NEXTOON</h2>
					<p>
						Another fine responsive site template by <a
							href="http://html5up.net">HTML5 UP</a>
					</p>
				</header>
			</section>

			<!-- Mini Posts -->
			<section>
				<div class="mini-posts">

					<!-- Mini Post -->
					<article class="mini-post">
						<header>
							<h3>
								<a href="single.html">Vitae sed condimentum</a>
							</h3>
							<time class="published" datetime="2015-10-20">October 20,
								2015</time>
							<a href="#" class="author"><img src="images/avatar.jpg"
								alt="" /></a>
						</header>
						<a href="single.html" class="image"><img
							src="images/pic04.jpg" alt="" /></a>
					</article>

					<!-- Mini Post -->
					<article class="mini-post">
						<header>
							<h3>
								<a href="single.html">Rutrum neque accumsan</a>
							</h3>
							<time class="published" datetime="2015-10-19">October 19,
								2015</time>
							<a href="#" class="author"><img src="images/avatar.jpg"
								alt="" /></a>
						</header>
						<a href="single.html" class="image"><img
							src="images/pic05.jpg" alt="" /></a>
					</article>

					<!-- Mini Post -->
					<article class="mini-post">
						<header>
							<h3>
								<a href="single.html">Odio congue mattis</a>
							</h3>
							<time class="published" datetime="2015-10-18">October 18,
								2015</time>
							<a href="#" class="author"><img src="images/avatar.jpg"
								alt="" /></a>
						</header>
						<a href="single.html" class="image"><img
							src="images/pic06.jpg" alt="" /></a>
					</article>

					<!-- Mini Post -->
					<article class="mini-post">
						<header>
							<h3>
								<a href="single.html">Enim nisl veroeros</a>
							</h3>
							<time class="published" datetime="2015-10-17">October 17,
								2015</time>
							<a href="#" class="author"><img src="images/avatar.jpg"
								alt="" /></a>
						</header>
						<a href="single.html" class="image"><img
							src="images/pic07.jpg" alt="" /></a>
					</article>

				</div>
			</section>

			<!-- Posts List -->
			<section>
				<ul class="posts">
					<li>
						<article>
							<header>
								<h3>
									<a href="single.html">Lorem ipsum fermentum ut nisl vitae</a>
								</h3>
								<time class="published" datetime="2015-10-20">October 20,
									2015</time>
							</header>
							<a href="single.html" class="image"><img
								src="images/pic08.jpg" alt="" /></a>
						</article>
					</li>
					<li>
						<article>
							<header>
								<h3>
									<a href="single.html">Convallis maximus nisl mattis nunc id
										lorem</a>
								</h3>
								<time class="published" datetime="2015-10-15">October 15,
									2015</time>
							</header>
							<a href="single.html" class="image"><img
								src="images/pic09.jpg" alt="" /></a>
						</article>
					</li>
					<li>
						<article>
							<header>
								<h3>
									<a href="single.html">Euismod amet placerat vivamus
										porttitor</a>
								</h3>
								<time class="published" datetime="2015-10-10">October 10,
									2015</time>
							</header>
							<a href="single.html" class="image"><img
								src="images/pic10.jpg" alt="" /></a>
						</article>
					</li>
					<li>
						<article>
							<header>
								<h3>
									<a href="single.html">Magna enim accumsan tortor cursus
										ultricies</a>
								</h3>
								<time class="published" datetime="2015-10-08">October 8,
									2015</time>
							</header>
							<a href="single.html" class="image"><img
								src="images/pic11.jpg" alt="" /></a>
						</article>
					</li>
					<li>
						<article>
							<header>
								<h3>
									<a href="single.html">Congue ullam corper lorem ipsum dolor</a>
								</h3>
								<time class="published" datetime="2015-10-06">October 7,
									2015</time>
							</header>
							<a href="single.html" class="image"><img
								src="images/pic12.jpg" alt="" /></a>
						</article>
					</li>
				</ul>
			</section>

			<!-- About -->
			<section class="blurb">
				<h2>About</h2>
				<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus
					nisl. Sed mattis nunc id lorem euismod amet placerat. Vivamus
					porttitor magna enim, ac accumsan tortor cursus at phasellus sed
					ultricies.</p>
				<ul class="actions">
					<li><a href="#" class="button">Learn More</a></li>
				</ul>
			</section>

			<!-- Footer -->
			<section id="footer">
				<ul class="icons">
					<li><a href="#" class="icon brands fa-twitter"><span
							class="label">Twitter</span></a></li>
					<li><a href="#" class="icon brands fa-facebook-f"><span
							class="label">Facebook</span></a></li>
					<li><a href="#" class="icon brands fa-instagram"><span
							class="label">Instagram</span></a></li>
					<li><a href="#" class="icon solid fa-rss"><span
							class="label">RSS</span></a></li>
					<li><a href="#" class="icon solid fa-envelope"><span
							class="label">Email</span></a></li>
				</ul>
				<p class="copyright">
					&copy; Untitled. Design: <a href="http://html5up.net">HTML5 UP</a>.
					Images: <a href="http://unsplash.com">Unsplash</a>.
				</p>
			</section>

		</section>

	</div>

	<!-- Scripts -->
	<script src="js/jquery.min.js"></script>
	<script src="js/browser.min.js"></script>
	<script src="js/breakpoints.min.js"></script>
	<script src="js/util.js"></script>
	<script src="js/main.js"></script>

</body>
</html>