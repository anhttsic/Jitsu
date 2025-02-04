@android
Feature: Mobile app Jitsu

  Background:
    * def user = utils.user.find(x => x.id == 'demo')
    * call read(mobilePage + 'JitsuApp.feature@startApp')

  @mobile
  Scenario: Demo mobile app
    * waitFor("//android.widget.EditText[@hint='USERNAME/EMAIL']").click().input(user.username)
    * waitFor("//android.widget.EditText[@hint='PASSWORD']").click().input(user.password)
    * waitFor("@Log In").click()
    * waitFor("//*[contains(@content-desc,'Profile')]").click()
    * waitFor("@Tutorials").click()
    * waitFor("@Assigned Route").click()
    * optional("@Start Tutorial").click()
    * waitFor("@Quit tutorial").click()
    * waitFor("@Yes, quit tutorial").click()
    * delay(5000)