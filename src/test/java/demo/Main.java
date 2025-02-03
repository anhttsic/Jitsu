package demo;

import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.devtools.NetworkInterceptor;
import org.openqa.selenium.remote.http.Filter;
import org.openqa.selenium.remote.http.HttpResponse;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;
import java.util.concurrent.CopyOnWriteArrayList;

public class Main {

    public static void main(String[] args) {
        ChromeDriver driver = new ChromeDriver();
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        CopyOnWriteArrayList<HttpResponse> contentType = new CopyOnWriteArrayList<>();

        try (NetworkInterceptor ignored =
                     new NetworkInterceptor(
                             driver,
                             (Filter)
                                     next ->
                                             req -> {
                                                 HttpResponse res = next.execute(req);
                                                 System.out.println(req.getUri());
                                                 if (req.getUri().contains("AsyncDataService/GetAsyncData"))
                                                    contentType.add(res);
                                                 return res;
                                             })) {
            driver.get("https://www.google.com/");
            wait.until(_d -> contentType.size() > 1);
        }
        System.out.println(contentType);
        driver.quit();
    }
}
