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
			<div class="title">
				<h2>
					<a href="recommendBbs.jsp">추천게시판</a>
				</h2>
				<p>이 웹툰 괜찮은데? 추천해주세요!</p>
				<a href="bbsWrite.jsp" class="button large next">글쓰기</a>
			</div>
		</header>
		<div class="table-wrapper">
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>좋아요</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td><a href="bbsView.jsp">게시물제목제목제목제목제목게시물제목제목제목제목제목</a></td>
						<td>작성자</td>
						<td>2023/11/18 00:23</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>게시물제목제목제목제목제목</td>
						<td>작성자</td>
						<td>2023/11/18 00:23</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>게시물제목제목제목제목제목게시물제목제목제목제목제목</td>
						<td>작성자</td>
						<td>2023/11/18 00:23</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>게시물제목제목제목제목제목게시물제목</td>
						<td>작성자</td>
						<td>2023/11/18 00:23</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td>게시물제목제목제목제목제목제목</td>
						<td>작성자</td>
						<td>2023/11/18 00:23</td>
						<td>18</td>
					</tr>
				</tbody>
			</table>
		</div>
		<ul class="actions pagination">
			<li><a href="#" class="button large next">Previous Page</a></li>
			<li><a href="#" class="button large next">Next Page</a></li>
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