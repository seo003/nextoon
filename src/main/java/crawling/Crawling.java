package crawling;

import java.time.Duration;
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
		//웹 드라이버, 크롬 드라이버 설정
		System.setProperty("webdriver.chrome.driver", "driver/chromedriver.exe");
		WebDriver driver = new ChromeDriver();
		
		String URL = "https://comic.naver.com/webtoon";
		
		driver.get(URL);
//		System.out.println(driver.getPageSource());
		
		waitUntilPageLoad(driver);
		
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(100));
		
		//웹툰 제목/링크 여러개 가져오기
		List<WebElement> titleElements = wait.until(ExpectedConditions.visibilityOfAllElementsLocatedBy(By.cssSelector(".ContentTitle__title_area--x24vt")));
		
		String webTitle;
		String webLink;
		String month;
        for (WebElement titleElement : titleElements) {
            // 제목 가져오기
            WebElement textElement = titleElement.findElement(By.className("text"));
            webTitle = textElement.getText();
            System.out.println("webTitle: " + webTitle);

            // 링크 가져오기
            webLink = titleElement.getAttribute("href");
            System.out.println("webLink: " + webLink);
            webLink.substring(webLink.length() - 3);
            
        }
		 
		 
		 driver.quit();
	}

	private static void waitUntilPageLoad(WebDriver driver) {
	    WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));
	    wait.until(webDriver ->
	            String.valueOf(((JavascriptExecutor) webDriver).executeScript("return document.readyState"))
	                    .equals("complete"));
	}
	
	public void crawling() {
	}

}
