Feature: Jitsu mobile app

  @mobile
  Scenario: Start app
    * def capabilities = read(mobileConfig + 'capabilities.json')
    * def config = capabilities[desiredCapabilities]
    * def driverConfig = read(mobileConfig + 'mobileConfig.json')
    * set driverConfig
      | path         | value               |
      | type         | desiredCapabilities |
      | webDriverUrl | mobileDriverUrl     |
    * configure driver = driverConfig
    * driver config
    * configure retry = {count: 3, interval: 2000}

    * waitFor("//android.widget.EditText[@hint='USERNAME/EMAIL']").click().input('auto_244332')
    * waitFor("//android.widget.EditText[@hint='PASSWORD']").click().input('Testing1!')
    * waitFor("@Log In").click()
    * waitFor("//*[contains(@content-desc,'Profile')]").click()
    * waitFor("@Tutorials").click()
    * waitFor("@Assigned Route").click()
    * optional("@Start Tutorial").click()
    * waitFor("@Quit tutorial").click()
    * waitFor("@Yes, quit tutorial").click()
    * delay(5000)