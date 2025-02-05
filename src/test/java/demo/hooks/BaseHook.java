package demo.hooks;

import com.intuit.karate.RuntimeHook;
import com.intuit.karate.core.ScenarioRuntime;

public class BaseHook implements RuntimeHook {
    @Override
    public void afterScenario(ScenarioRuntime sr) {
        if (!sr.engine.evalKarateExpression("karate.get('driver')").isNull()) {
            if (sr.caller.depth == 0 || sr.scenario.getTagsEffective().contains("screenshot") && !sr.isFailed())
                sr.engine.evalKarateExpression("screenshot()");
        }
    }
}
