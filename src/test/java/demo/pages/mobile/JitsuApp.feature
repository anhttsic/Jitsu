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
    * configure retry = {count: 3, interval: 2000}