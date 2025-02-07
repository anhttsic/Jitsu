@android
Feature: Mobile app Jitsu

  Background:
    * def user = utils.user.find(x => x.id == 'demo')
    * call read(mobilePage + 'JitsuApp.feature@startApp')

  @mobile
  Scenario Outline: Demo mobile app
    * call read(mobilePage + 'LoginPage.feature@login') {user: #(user)}
    * call read(mobilePage + 'HomePage.feature@goToProfile')
    * call read(mobilePage + 'ProfilePage.feature@clickTutorials')
    * call read(mobilePage + 'ProfilePage.feature@verifyDisplaySection')
    * call read(mobilePage + 'ProfilePage.feature@clickAssignRoute')
#    * call read(mobilePage + 'Common.feature@get_toast_msg')
    * def toastMsg = mobile.getElement('//android.widget.Toast').text
    * print toastMsg
    * assert (toastMsg == 'Tutorial is successfully created') || (toastMsg == 'A tutorial has previously been created in Active Assignment Tab')
    * call read(mobilePage + 'HomePage.feature@waitForActiveAssignment')
    * call read(mobilePage + 'HomePage.feature@clickStartTutorialIfExist')
    * call read(mobilePage + 'HomePage.feature@quitTutorial')
#    * call read(mobilePage + 'Common.feature@click_element') {xpath: '@Quit tutorial'}
#    * call read(mobilePage + 'Common.feature@click_element') {xpath: '@Yes, quit tutorial'}

    Examples:
      | times |
      | 1     |
#      | 1     |
#      | 1     |
#      | 1     |
#      | 1     |