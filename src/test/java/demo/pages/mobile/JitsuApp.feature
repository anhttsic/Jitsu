Feature: Jitsu mobile app

  @startApp
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
    * def MobileFactory = Java.type('demo.function.mobile.MobileFactory')
    * def mobile = MobileFactory.init(driver)