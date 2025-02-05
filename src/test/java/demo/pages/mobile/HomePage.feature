Feature: Home page

  Background:
    * def homePage = read(mobilePage + 'homePage.json')

    @goToProfile
    Scenario: Go to profile
      * call read(mobilePage + 'Common.feature@click_element') {xpath: #(homePage.profileBtn)}