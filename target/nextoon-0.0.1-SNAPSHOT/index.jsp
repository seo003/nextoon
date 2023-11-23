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
    <link rel="stylesheet" href="css/main.css"/>
</head>
<!-- Main -->
<div id="main">

    <!-- Post -->
    <article class="post">
        <header>
            <div class="title">
                <h2>
                    원하는 장르를 골라주세요!
                </h2>
                <p>장르 선택하는거 넣으면 될듯</p>
            </div>
            <!--
            <div class="meta">
                <time class="published" datetime="2015-11-01">November 1,
                    2015
                </time>
                <a href="#" class="author"><span class="name">Jane Doe</span><img
                        src="images/avatar.jpg" alt=""/></a>
            </div>
            -->
        </header>
        <a href="single.jsp" class="image featured"><img
                src="images/pic01.jpg" alt=""/></a>
        <p> 여기에 제목이랑 작가 요약내용 들어가면 될듯</p>
        <footer>
            <ul class="actions">
                <li><a href="#" class="button large">바로가기</a></li>
            </ul>
        </footer>
    </article>
</div>

<!-- Sidebar -->
<section id="sidebar">

    <!-- Intro -->
    <section id="intro">
        <a href="#" class="logo"><img src="images/logo.jpg" alt=""/></a>
        <header>
            <h2>NEXTOON</h2>
            <p>
                웹툰 추천 게시판
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
                        <a href="single.html">웹툰사이트 이름</a>
                    </h3>
                </header>
                <a href="single.html" class="image"><img src="images/pic07.jpg"
                                                         alt=""/></a>
            </article>

        </div>
    </section>

    <!-- Posts List -->
    <!--
    <section>
        <ul class="posts">
            <li>
                <article>
                    <header>
                        <h3>
                            <a href="single.html">Congue ullam corper lorem ipsum dolor</a>
                        </h3>
                        <time class="published" datetime="2015-10-06">October 7,
                            2015</time>
                    </header>
                    <a href="single.html" class="image"><img src="images/pic12.jpg"
                        alt="" /></a>
                </article>
            </li>
        </ul>
    </section>
    -->

    <!-- About -->
    <section class="blurb">
        <h2>About</h2>
        <p>2023 2학기에 만든 JSP 프로젝트</p>
    </section>

    <!-- Footer -->
    <section id="footer">
        <ul class="icons">
            <li><a href="#" class="icon brands fa-twitter"><span
                    class="label">Twitter</span></a></li>
            <li><a href="#" class="icon brands fa-facebook-f"><span
                    class="label">Facebook</span></a></li>
            <li><a href="https://www.instagram.com/seo0_03/" class="icon brands fa-instagram"><span
                    class="label">Instagram</span></a></li>
            <li><a href="https://github.com/seo003" class="icon brands fa-github"><span
                    class="label">Github</span></a></li>
            <li><a href="#" class="icon solid fa-envelope"><span
                    class="label">Email</span></a></li>
        </ul>
        <p class="copyright">
            &copy; 202244005 김서영<br>
            Design : <a href="http://html5up.net">HTML5 UP</a>
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