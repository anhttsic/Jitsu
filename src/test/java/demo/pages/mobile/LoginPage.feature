Feature: Login app

  Background:
    * def loginPage = read(mobilePage + 'loginPage.json')

  @login
  Scenario: Login app
    * call read(mobilePage + 'Common.feature@input_text') {xpath: #(loginPage.username), val: #(user.username)}
    * call read(mobilePage + 'Common.feature@input_text') {xpath: #(loginPage.password), val: #(user.password)}
    * call read(mobilePage + 'Common.feature@click_element') {xpath: #(loginPage.loginBtn)}