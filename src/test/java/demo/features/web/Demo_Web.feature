Feature: Web

  Background:
    Given driver weatherUrl

  @ui
  Scenario Outline: Demo UI
    * call read(webPage + 'WeatherHomePage.feature@search_city') {searchValue: '<searchValue>'}
    * call read(webPage + 'WeatherHomePage.feature@verify_display_city_name') {expected: '<searchValue>'}
    * call read(webPage + 'WeatherHomePage.feature@verify_display_datetime') {format: '<dateFormat>'}
    * call read(webPage + 'WeatherHomePage.feature@verify_temperature') {expected: '<temperature>'}

    Examples:
      | searchValue     | dateFormat   | temperature            |
      | Los Angeles, US | MMM d, hh:mm | #regex ^[+-]*[0-9]+°C$ |