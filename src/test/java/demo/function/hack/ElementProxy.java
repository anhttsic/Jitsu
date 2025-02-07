package demo.function.hack;

import com.intuit.karate.driver.Element;
import com.intuit.karate.driver.appium.AppiumDriver;
import lombok.extern.slf4j.Slf4j;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.util.Map;

@Slf4j
public class ElementProxy implements InvocationHandler {

    public static final String surpriseMF = "#com.axlehire.drive.staging:id/ib_bg_onboarding_viewpager";

    private final Element element;

    public ElementProxy(Element element) {
        this.element = element;
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        this.avadaKedavra();
        return method.invoke(element, args);
    }

    private void avadaKedavra() {
        log.debug("Element Proxy");
        if (ScenarioContext.getDriver() != null && !ScenarioContext.getDriver().elementIds(surpriseMF).isEmpty())
            ((AppiumDriver) ScenarioContext.getDriver()).script("mobile: shell", Map.of("command", "input tap 100 100"));
    }
}
