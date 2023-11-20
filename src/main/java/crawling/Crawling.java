package crawling;

import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class Crawling {
	public static void main(String[] args) {
		// 웹 드라이버, 크롬 드라이버 설정
		System.setProperty("webdriver.chrome.driver", "driver/chromedriver.exe");
		WebDriver driver = new ChromeDriver();

		String URL = "https://comic.naver.com/webtoon";

		driver.get(URL);
//		System.out.println(driver.getPageSource());

		waitUntilPageLoad(driver);

		WebDriverWait waitHome = new WebDriverWait(driver, Duration.ofSeconds(100));

		// 웹툰 제목/링크 모음 여러개 가져오기
		List<WebElement> titleElements = waitHome.until(ExpectedConditions
				.visibilityOfAllElementsLocatedBy(By.cssSelector(".ContentTitle__title_area--x24vt")));
		// url 저장할 링크
		List<String> linkList = new ArrayList<>();

		String webTitle;
		String webLink;

		for (WebElement titleElement : titleElements) {
			// 링크 가져오기
			webLink = titleElement.getAttribute("href");
			linkList.add(webLink);
//			System.out.println("webLink: " + webLink);
		}
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
//					System.out.println("currentURL: " + currentUrl);
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
					WebElement monthElement = infoElement
							.findElement(By.className("ContentMetaInfo__info_item--utGrf"));
					String monthValue = monthElement.getText();
					System.out.println("요일/나이: " + monthValue);
					// 요약 가져오기
					WebElement summaryElement = infoElement
							.findElement(By.className("EpisodeListInfo__summary--Jd1WG"));
					String summaryValue = summaryElement.getText();
					System.out.println("요약: " + summaryValue);
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

	public void crawling() {
	}

}
