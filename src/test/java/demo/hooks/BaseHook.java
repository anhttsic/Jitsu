package demo.hooks;

import com.intuit.karate.RuntimeHook;
import com.intuit.karate.core.ScenarioRuntime;
import com.intuit.karate.driver.appium.AppiumDriver;
import demo.function.hack.ElementProxy;
import demo.function.hack.ScenarioContext;

import java.util.Map;

public class BaseHook implements RuntimeHook {

    @Override
    public boolean beforeScenario(ScenarioRuntime sr) {
        if (ScenarioContext.getDriver() != null
                && ScenarioContext.getDriver().getOptions().type.equalsIgnoreCase("android")
                && !ScenarioContext.getDriver().elementIds(ElementProxy.surpriseMF).isEmpty()
        )
            ((AppiumDriver) ScenarioContext.getDriver()).script("mobile: shell", Map.of("command", "input tap 100 100"));
        return true;
    }

    @Override
    public void afterScenario(ScenarioRuntime sr) {
        if (!sr.engine.evalKarateExpression("karate.get('driver')").isNull()) {
            if (sr.caller.depth == 0 || sr.scenario.getTagsEffective().contains("screenshot") && !sr.isFailed())
                sr.engine.evalKarateExpression("screenshot()");
        }
        if (ScenarioContext.getDriver() != null
                && ScenarioContext.getDriver().getOptions().type.equalsIgnoreCase("android")
                && !ScenarioContext.getDriver().elementIds(ElementProxy.surpriseMF).isEmpty()
        )
            ((AppiumDriver) ScenarioContext.getDriver()).script("mobile: shell", Map.of("command", "input tap 100 100"));
    }
}
