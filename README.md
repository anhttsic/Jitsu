1. Run api test
    + Step 1: Create git personal token (classic)
    + Step 1: Run command line "mvn clean test -Dtest=TestRunner "-Dkarate.options=--tags @api" -Dkarate.gitToken=(your personal token)"
    + For example: mvn clean test -Dtest=TestRunner "-Dkarate.options=--tags @api" -Dkarate.gitToken=abcd1234

2. Run web
    + Run test with chrome by maven command "mvn clean test -Dtest=TestRunner "-Dkarate.options=--tags @web" -Dkarate.headless=true"

3. Run mobile
    + Install appium server prefer version 2.x, open appium with default url 127.0.0.1 and port 4723 value by CMD "appium --relaxed-security"
    + Install SDK, open android simulator and get device id (normally is emulator-5554)
    + Download the apk file from "https://drive.google.com/file/d/1dUgCO1UbBsJhyNwshT6OhKXWTjP4prPI/view?usp=sharing"
    + Run maven command "mvn clean test -Dtest=TestRunner "-Dkarate.options=--tags @mobile" -Dkarate.deviceName="emulator-5554" -Dkarate.appPath=(path to apk file downloaded)"