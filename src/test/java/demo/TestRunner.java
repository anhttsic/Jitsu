package demo;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import demo.hooks.BaseHook;
import org.junit.jupiter.api.Test;

public class TestRunner {

    //mvn clean test -Dtest=TestRunner "-Dkarate.options=--tags @mobile" -Dkarate.appPath=C:\Users\Admin\Downloads\app-staging-release.apk
    //mvn clean test -Dtest=TestRunner "-Dkarate.options=--tags @web" -Dkarate.headless=true
    //mvn clean test -Dtest=TestRunner "-Dkarate.options=--tags @api" -Dkarate.gitToken=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

    @Test
    void testRunner() {
        Results results = Runner
                .path("classpath:demo/features")
                .tags("@mobile")
                .hook(new BaseHook())
                .parallel(1);
    }
}
