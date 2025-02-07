package demo.function.mobile;

import java.io.IOException;

public class Adb {

    private static void exec(String cmd) {
        try {
            Runtime.getRuntime().exec(cmd);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    public static void run(String cmd) {
        exec(cmd);
    }

    public static void clearAppData() {
        run("adb shell pm clear com.axlehire.drive.staging");
    }
}
