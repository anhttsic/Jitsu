package demo.function.mobile;

import com.intuit.karate.driver.Driver;
import com.intuit.karate.driver.DriverElement;
import com.intuit.karate.driver.Element;
import com.intuit.karate.driver.appium.AppiumDriver;
import demo.function.hack.ElementGuard;
import lombok.extern.slf4j.Slf4j;

import java.util.HashMap;
import java.util.Map;

@Slf4j
public class MobileAction {
    private static String ELEMENT = "element";
    private Driver instance;

    public MobileAction(Driver driver) {
        this.instance = driver;
    }

    protected AppiumDriver getDriver() {
        return (AppiumDriver) instance;
    }

    public void avadaKedavra() {
        Map<String, Object> params = new HashMap<>();
        params.put("command", "input tap 100 100");
        getDriver().script("mobile: shell", params);
    }

    public Element getElement(String locator) {
        getDriver().elementId(locator);
        return ElementGuard.guard(DriverElement.locatorExists(getDriver(), locator));
    }

    public boolean isDisplayed(String locator) {
        try {
            String elementId = getDriver().elementId(locator);
            return getDriver().getHttp().path(ELEMENT, elementId, "displayed").get().json().get("value");
        } catch (Exception e) {
            return false;
        }
    }

    public Element waitForDisplayed(String locator) {
        return (Element) getDriver().waitUntil(() -> {
            boolean isDisplayed = isDisplayed(locator);
            return !isDisplayed ? null : ElementGuard.guard(DriverElement.locatorExists(getDriver(), locator));
        });
    }
}
