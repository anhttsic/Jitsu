package demo.function.mobile;

import com.intuit.karate.driver.Driver;
import com.intuit.karate.driver.appium.AppiumDriver;

import java.util.HashMap;
import java.util.Map;

public class MobileAction {
    private Driver instance;

    public MobileAction(Driver driver) {
        this.instance = driver;
    }

    protected AppiumDriver getDriver() {
        return (AppiumDriver) instance;
    }

    public void resetApp() {
        Map<String, Object> params = new HashMap<>();
        params.put("command", "pm clear com.axlehire.drive.staging");
        getDriver().script("mobile: shell", params);
    }

    public void avadaKedavra() {
        Map<String, Object> params = new HashMap<>();
        params.put("command", "input tap 100 100");
        getDriver().script("mobile: shell", params);
    }
}
