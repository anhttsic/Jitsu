package demo.function;

import com.intuit.karate.driver.Driver;

public class WebAction {
    private Driver instance;

    public WebAction(Driver driver) {
        this.instance = driver;
    }

    private Driver getDriver() {
        return instance;
    }
}
