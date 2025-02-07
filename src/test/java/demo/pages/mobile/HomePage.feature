Feature: Home page

  Background:
    * def homePage = read(mobilePage + 'homePage.json')

  @goToProfile
  Scenario: Go to profile
    * mobile.waitForDisplayed(homePage.profileBtn).click()
#      * call read(mobilePage + 'Common.feature@click_element') {xpath: #(homePage.profileBtn)}

  @waitForActiveAssignment
  Scenario: Wait for active assignment screen
    * mobile.waitForDisplayed(homePage.activeAssignment)

  @clickStartTutorialIfExist
  Scenario: Click start tutorial if exist
    * if(mobile.isDisplayed(homePage.startTutorial)) mobile.getElement(homePage.startTutorial).click()

  @quitTutorial
  Scenario: Quit tutorial
    * mobile.getElement(homePage.quitTutorial).click()
    * mobile.getElement(homePage.yesQuit).click()