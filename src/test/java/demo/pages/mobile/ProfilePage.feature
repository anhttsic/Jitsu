Feature: Home page

  Background:
    * def profilePage = read(mobilePage + 'profilePage.json')

  @clickTutorials
  Scenario: Choose Tutorials
    * mobile.getElement(profilePage.tutorialsBtn).click()
#    * call read(mobilePage + 'Common.feature@click_element') {xpath: #(profilePage.tutorialsBtn)}

  @verifyDisplaySection @screenshot
  Scenario: Verify display 3 sections
    * match mobile.getElement(profilePage.assignedRoute).attribute('content-desc') == 'Assigned Route'
    * match mobile.getElement(profilePage.directBooking).attribute('content-desc') == 'Direct Booking'
    * match mobile.getElement(profilePage.ticketBooking).attribute('content-desc') == 'Ticket Booking'
#    * call read(mobilePage + 'Common.feature@verify_content') {xpath: #(profilePage.assignedRoute), expected: 'Assigned Route'}
#    * call read(mobilePage + 'Common.feature@verify_content') {xpath: #(profilePage.directBooking), expected: 'Direct Booking'}
#    * call read(mobilePage + 'Common.feature@verify_content') {xpath: #(profilePage.ticketBooking), expected: 'Ticket Booking'}

  @clickAssignRoute
  Scenario: Choose Assign Route
    * mobile.getElement(profilePage.assignedRoute).click()
#    * call read(mobilePage + 'Common.feature@click_element') {xpath: #(profilePage.assignedRoute)}