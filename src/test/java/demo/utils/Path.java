package demo.utils;

import java.io.File;

public class Path {
    private Path() {

    }

    private static final String PROJECT = System.getProperty("user.dir");
    public static final String PROJECT_RESOURCE = PROJECT
            + File.separator + "src"
            + File.separator + "test"
            + File.separator + "java"
            + File.separator + "demo"
            + File.separator + "resources"
            + File.separator;
}
