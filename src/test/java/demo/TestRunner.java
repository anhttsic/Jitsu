package demo;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import demo.hooks.BaseHook;
import org.junit.jupiter.api.Test;

public class TestRunner {

    //mvn clean test -Dtest=TestRunner "-Dkarate.options=--tags @mobile" -Dkarate.appPath=C:\Users\Admin\Downloads\app-staging-release.apk

    @Test
    void testRunner() {
        Results results = Runner
                .path("classpath:demo/features")
                .tags("@web")
                .hook(new BaseHook())
                .parallel(1);
    }
}
