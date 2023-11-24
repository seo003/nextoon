<%@ page import="DTO.CrawDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Random" %>
<%@ page import="DAO.CrawDAO" %>
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
            <form action="action/recommendAction.jsp">
                <div class="title">
                    <h2>
                        원하는 장르를 골라주세요!
                    </h2>
                    <p class="checkboxSite-group">
                        <input type="checkbox" id="romance" name="genre">
                        <label for="romance">로맨스</label>
                        <input type="checkbox" id="drama" name="genre">
                        <label for="drama">드라마</label>
                        <input type="checkbox" id="fantasy" name="genre">
                        <label for="fantasy">판타지</label>
                        <input type="checkbox" id="academy" name="genre">
                        <label for="academy">학원물</label>
                        <input type="checkbox" id="sport" name="genre">
                        <label for="sport">스포츠</label>
                        <input type="checkbox" id="history" name="genre">
                        <label for="history">무협/사극</label>
                        <input type="checkbox" id="munchkin" name="genre">
                        <label for="munchkin">먼치킨</label>
                        <input type="checkbox" id="life" name="genre">
                        <label for="life">일상</label>
                        <input type="checkbox" id="healing" name="genre">
                        <label for="healing">힐링</label>
                        <input type="checkbox" id="thriller" name="genre">
                        <label for="thriller">스릴러</label>
                        <input type="checkbox" id="action" name="genre">
                        <label for="action">액션</label>
                        <input type="checkbox" id="comedy" name="genre">
                        <label for="comedy">코미디</label>
                        <input type="checkbox" id="crime" name="genre">
                        <label for="crime">범죄</label>
                        <input type="checkbox" id="joke" name="genre">
                        <label for="joke">개그</label>
                    </p>
                    <input type="submit" class="recommendBtn button large" value="추천">
                </div>

                <div class="meta">
                    <h2>
                        원하는 사이트를 골라주세요!
                    </h2>
                    <p>
                        <input type="checkbox" id="naver" name="site"checked>
                        <label for="naver">네이버</label>
                        <input type="checkbox" id="kakaoPage" name="site">
                        <label for="kakaoPage">카카오페이지</label>
                        <input type="checkbox" id="kakao" name="site">
                        <label for="kakao">카카오</label>
                    </p>
                </div>
            </form>
        </header>
        <%
            ArrayList<CrawDTO> recommendList = (ArrayList<CrawDTO>) request.getAttribute("recommendList");
            Random random = new Random();
            int randomIndex;
            if (recommendList != null) {
                randomIndex = random.nextInt(recommendList.size());
            } else {
                CrawDAO crawDAO = new CrawDAO();
                recommendList = crawDAO.allInfo();
                randomIndex = random.nextInt(recommendList.size());
            }

            CrawDTO randomCraw = recommendList.get(randomIndex);
        %>

        <a href="single.jsp" class="image featured"><img
                src="images/pic01.jpg" alt=""/></a>
        <h2><%=randomCraw.getCrawTitle()%>
        </h2>
        <p id="summary"><%=randomCraw.getCrawSummary()%>
        </p>
        <p id="genre"><%=randomCraw.getCrawGenre()%>
        </p>
        <footer>
            <ul class="actions">
                <li><a href="<%=randomCraw.getCrawUrl()%>" class="button large">바로가기</a></li>
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