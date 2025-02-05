Feature: Weather homepage

  Background:
    * def homePage = read(webPage + 'WeatherHomePage.json')

  @openWebPage
  Scenario: Open chrome
    * driver weatherUrl
    * def WebAction = Java.type('demo.function.WebAction')
    * def web = new WebAction(driver)

  @search_city
  Scenario: search city
    * input(homePage.searchCity, searchValue)
    * click(homePage.searchBtn)
    * click(homePage.searchResult)
    * waitForUrl('city')

  @verify_display_city_name
  Scenario: verify display city name
    * match text(homePage.displayCityName).trim() == expected

  @verify_display_datetime
  Scenario: verify display datetime
    * def nowLocalDate = utils.dateUtils.localDate(format)
    * match text(homePage.displayDateTime).trim() == nowLocalDate

  @verify_temperature
  Scenario: verify temperature
    * match text(homePage.displayTemperature).trim() == expected