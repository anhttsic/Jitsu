package demo.function.mobile;

import com.intuit.karate.driver.Driver;

public class MobileFactory {

    public static MobileAction init(Driver driver) {
        if (driver.getClass().getSimpleName().toLowerCase().contains("android"))
            return new Android(driver);
        if (driver.getClass().getSimpleName().toLowerCase().contains("ios"))
            return new IOS(driver);
        return null;
    }
}
