package demo;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import demo.hooks.BaseHook;
import org.junit.jupiter.api.Test;

public class TestRunner {

    @Test
    void testRunner() {
        Results results = Runner
                .path("classpath:demo/features")
                .tags("@api")
                .hook(new BaseHook())
                .parallel(1);
    }
}
