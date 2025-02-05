Feature: Home page

  Background:
    * def profilePage = read(mobilePage + 'profilePage.json')

  @clickTutorials
  Scenario: Choose Tutorials
    * call read(mobilePage + 'Common.feature@click_element') {xpath: #(profilePage.tutorialsBtn)}

  @verifyDisplaySection @screenshot
  Scenario: Verify display 3 sections
    * call read(mobilePage + 'Common.feature@verify_content') {xpath: #(profilePage.assignedRoute), expected: 'Assigned Route'}
    * call read(mobilePage + 'Common.feature@verify_content') {xpath: #(profilePage.directBooking), expected: 'Direct Booking'}
    * call read(mobilePage + 'Common.feature@verify_content') {xpath: #(profilePage.ticketBooking), expected: 'Ticket Booking'}

  @clickAssignRoute
  Scenario: Choose Assign Route
    * call read(mobilePage + 'Common.feature@click_element') {xpath: #(profilePage.assignedRoute)}