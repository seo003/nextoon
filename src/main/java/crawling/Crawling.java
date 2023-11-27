package crawling;

import java.awt.image.BufferedImage;
import java.io.FileOutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import DAO.CrawDAO;
import DTO.CrawDTO;
import util.DatabaseUtil;

import javax.imageio.ImageIO;

public class Crawling {
	public static void main(String[] args) {
        // 웹 드라이버 설정
        System.setProperty("webdriver.chrome.driver", "driver/chromedriver.exe");
        WebDriver driver = new ChromeDriver();

        String URL = "https://comic.naver.com/webtoon";
        driver.get(URL);
//		System.out.println(driver.getPageSource());

        waitUntilPageLoad(driver);

        WebDriverWait waitMain = new WebDriverWait(driver, Duration.ofSeconds(100));

        List<WebElement> titleElements = waitMain.until(ExpectedConditions
                .visibilityOfAllElementsLocatedBy(By.cssSelector(".ContentTitle__title_area--x24vt")));

        List<String> linkList = new ArrayList<>();    // url 저장할 링크리스트
        String webLink;
        for (WebElement titleElement : titleElements) {
            // 링크 가져오기
            webLink = titleElement.getAttribute("href");
            linkList.add(webLink);
//			System.out.println("webLink: " + webLink);
        }

        linkList = linkList.stream().distinct().collect(Collectors.toList());
        CrawDAO crawDAO = new CrawDAO();
        crawDAO.resetInfo();
        System.out.println("linkLIst: " + linkList);

        String webMonth;
        for (String link : linkList) {
            webMonth = link.substring(link.length() - 3);
            if (webMonth.equals("mon") || webMonth.equals("tue") || webMonth.equals("wed") || webMonth.equals("thu")
                    || webMonth.equals("fri") || webMonth.equals("sat") || webMonth.equals("sun")) {

                // 해당 웹툰으로 링크 이동
                driver.navigate().to(link);
                try {
                    WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));

                    //성인인증을 위한 로그인 창으로 넘어가면 다음 링크로 이동
                    String currentUrl = driver.getCurrentUrl();
                    if (currentUrl.contains("nidlogin")) {
                        continue;
                    }

                    WebElement infoElement = wait.until(ExpectedConditions
                            .visibilityOfElementLocated(By.className("EpisodeListInfo__comic_info--yRAu0")));

                    // 제목 가져오기
                    WebElement titleElement = infoElement.findElement(By.className("EpisodeListInfo__title--mYLjC"));
                    String titleValue = titleElement.getText();
                    System.out.println("제목: " + titleValue);

                    // 작가 가져오기
                    WebElement authoElement = infoElement.findElement(By.className("ContentMetaInfo__link--xTtO6"));
                    String authorValue = authoElement.getText();
                    System.out.println("작가: " + authorValue);
                    // 요일/나이 가져오기
                    WebElement monthAgeElement = infoElement
                            .findElement(By.className("ContentMetaInfo__info_item--utGrf"));
                    String monthAgeValue = monthAgeElement.getText();
                    System.out.println("요일/나이: " + monthAgeValue);
                    int index = monthAgeValue.indexOf("∙");
                    String monthValue = monthAgeValue.substring(0, index - 1);
                    String ageValue = monthAgeValue.substring(index + 2);
                    System.out.println("monthValue: " + monthValue);
                    System.out.println("ageValue: " + ageValue);

                    // 요약 가져오기
                    WebElement summaryElement = infoElement
                            .findElement(By.className("EpisodeListInfo__summary--Jd1WG"));
                    String summaryValue = summaryElement.getText();
                    System.out.println("요약: " + summaryValue);

                    // 장르
                    List<WebElement> genreElementList = infoElement.findElements(By.className("TagGroup__tag--xu0OH"));
                    String genreValue;
                    String genreValues = "";
                    for (WebElement genreElement : genreElementList) {
                        genreValue = genreElement.getText();
//						System.out.println("genreValue: "+ genreValue);
                        genreValues += genreValue + " ";
                    }
                    System.out.println("genreValues: " + genreValues);
                    //이미지
                    WebElement imageElement = infoElement.findElement(By.className("Poster__image--d9XTI"));
                    String imageUrl = imageElement.getAttribute("src");
                    System.out.println("imageUrl: " + imageUrl);

                    String fileName="";
                    try {
                        URL url = new URL(imageUrl);
                        HttpURLConnection conn = (HttpURLConnection)url.openConnection();

                        conn.setRequestProperty("Referer", imageUrl);
                        BufferedImage img = ImageIO.read(conn.getInputStream());
                        fileName = titleValue + ".png";
                        FileOutputStream out = new FileOutputStream("C:\\2023\\JSPproject\\nextoon\\src\\main\\webapp\\images\\" + fileName);
                        ImageIO.write(img, "png", out);
                        System.out.println("fileName: " + fileName);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    System.out.println("------------------");

                    //디비 저장
                    CrawDTO crawDTO = new CrawDTO();
                    crawDTO.setCrawTitle(titleValue);
                    crawDTO.setCrawAuthor(authorValue);
                    crawDTO.setCrawWeek(monthValue);
                    crawDTO.setCrawGenre(genreValues);
                    crawDTO.setCrawSummary(summaryValue);
                    crawDTO.setCrawUrl(link);
                    crawDTO.setCrawImage(fileName);
                    System.out.println(crawDTO.toString());

                    crawDAO.saveInfo(crawDTO);

                } catch (Exception e) {
                    continue;
                }

            } else {
                continue;
            }

        }
        driver.quit();
    }

	private static void waitUntilPageLoad(WebDriver driver) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));
		wait.until(webDriver -> String
				.valueOf(((JavascriptExecutor) webDriver).executeScript("return document.readyState"))
				.equals("complete"));
	}
}
