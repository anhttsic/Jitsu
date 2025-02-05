@android
Feature: Mobile app Jitsu

  Background:
    * def user = utils.user.find(x => x.id == 'demo')
    * call read(mobilePage + 'JitsuApp.feature@startApp')

  @mobile
  Scenario: Demo mobile app
    * call read(mobilePage + 'LoginPage.feature@login') {user: #(user)}
    * call read(mobilePage + 'HomePage.feature@goToProfile')
    * call read(mobilePage + 'ProfilePage.feature@clickTutorials')
    * call read(mobilePage + 'ProfilePage.feature@verifyDisplaySection')
    * call read(mobilePage + 'ProfilePage.feature@clickAssignRoute')
    * call read(mobilePage + 'Common.feature@get_toast_msg')
    * print toastMsg
    * assert (toastMsg == 'Tutorial is successfully created') || (toastMsg == 'A tutorial has previously been created in Active Assignment Tab')
    * optional("@Start Tutorial").click()
    * call read(mobilePage + 'Common.feature@click_element') {xpath: '@Quit tutorial'}
    * call read(mobilePage + 'Common.feature@click_element') {xpath: '@Yes, quit tutorial'}