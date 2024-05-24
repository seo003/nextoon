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
    <link rel="stylesheet" href="/css/main.css"/>
</head>
<!-- Main -->
<div id="main">

    <!-- Post -->
    <article class="post">
        <header>
            <form id="recommendForm" action="action/recommendAction.jsp">
                <div class="title firstTitle" style="padding-bottom:0px; padding-top:48px;">
                    <h2>
                        원하는 장르를 골라주세요!
                    </h2>
                    <p class="checkboxSite-group">
                        <input type="checkbox" id="romance" name="genre" value="로맨스">
                        <label for="romance">로맨스</label>
                        <input type="checkbox" id="drama" name="genre" value="드라마">
                        <label for="drama">드라마</label>
                        <input type="checkbox" id="fantasy" name="genre" value="판타지">
                        <label for="fantasy">판타지</label>
                        <input type="checkbox" id="academy" name="genre" value="학원물">
                        <label for="academy">학원물</label>
                        <input type="checkbox" id="sport" name="genre" value="스포츠">
                        <label for="sport">스포츠</label>
                        <input type="checkbox" id="history" name="genre" value="무협/사극">
                        <label for="history">무협/사극</label>
                        <input type="checkbox" id="munchkin" name="genre" value="먼치킨">
                        <label for="munchkin">먼치킨</label>
                        <input type="checkbox" id="life" name="genre" value="일상">
                        <label for="life">일상</label>
                        <input type="checkbox" id="healing" name="genre" value="힐링">
                        <label for="healing">힐링</label>
                        <input type="checkbox" id="thriller" name="genre" value="스릴러">
                        <label for="thriller">스릴러</label>
                        <input type="checkbox" id="action" name="genre" value="액션">
                        <label for="action">액션</label>
                        <input type="checkbox" id="comedy" name="genre" value="코미디">
                        <label for="comedy">코미디</label>
                        <input type="checkbox" id="crime" name="genre" value="범죄">
                        <label for="crime">범죄</label>
                        <input type="checkbox" id="joke" name="genre" value="개그">
                        <label for="joke">개그</label>
                    </p>
                </div>

                <div class="title secondTitle" style="padding-top:0px; padding-bottom:5px;">

                    <input type="submit" class="recommendBtn button large" value="추천">
                </div>
            </form>


        </header>
        <%
            ArrayList<CrawDTO> recommendList = (ArrayList<CrawDTO>)request.getSession().getAttribute("recommendList");

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

        <a href="<%=randomCraw.getCrawUrl()%>" class="image featured">
            <img src="/images/<%=randomCraw.getCrawImage()%>" alt=""/></a>
        <% String title = randomCraw.getCrawTitle();
            if (title.contains("휴재")) {
                title = title.replace("휴재", "(휴재 중)");
            }
        %>
        <h2><%=title%> | <%=randomCraw.getCrawAuthor()%>
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
        <a href="index.jsp" class="logo"><img src="/images/logo.jpg" alt=""/></a>
        <header>
            <a href="index.jsp"><h2>NEXTOON</h2></a>
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
                        <a href="https://comic.naver.com/index">네이버웹툰 바로가기</a>
                    </h3>
                </header>
                <a href="https://comic.naver.com/index" class="image">
                    <img src="/images/naverWebtoon.png" alt=""/></a>
            </article>
            <article class="mini-post">
                <header>
                    <h3>
                        <a href="https://webtoon.kakao.com/">카카오웹툰 바로가기</a>
                    </h3>
                </header>
                <a href="https://webtoon.kakao.com/" class="image">
                    <img src="/images/kakaoWebtoon.png" alt=""/></a>
            </article>
            <article class="mini-post">
                <header>
                    <h3>
                        <a href="https://page.kakao.com/">카카오페이지 바로가기</a>
                    </h3>
                </header>
                <a href="https://page.kakao.com/" class="image">
                    <img src="/images/kakaoPage.png" alt=""/></a>
            </article>

        </div>
    </section>

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