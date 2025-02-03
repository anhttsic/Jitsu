package demo.hooks;

import com.intuit.karate.RuntimeHook;
import com.intuit.karate.core.ScenarioEngine;
import com.intuit.karate.core.ScenarioRuntime;
import com.intuit.karate.core.Step;
import com.intuit.karate.http.HttpRequest;
import com.intuit.karate.http.Response;

public class BaseHook implements RuntimeHook {
    @Override
    public void afterScenario(ScenarioRuntime sr) {
        if (sr.caller.depth == 0) {
            ScenarioEngine.get().evalKarateExpression("screenshot()");
        }
    }

    @Override
    public boolean beforeStep(Step step, ScenarioRuntime sr) {
        System.out.println(step.getPrefix());
        System.out.println(step.getFeature().getName());
        System.out.println(step.getText());
        return true;
    }

    @Override
    public void afterHttpCall(HttpRequest request, Response response, ScenarioRuntime sr) {
    }
}
