Feature: Common action mobile

  Background:
    * def commonPage = read(mobilePage + 'CommonPage.json')
    * if(driver.elementIds(commonPage.pop).length > 0) mobile.avadaKedavra()
    * configure afterScenario =
      """
        if(driver.elementIds(commonPage.pop).length > 0) mobile.avadaKedavra()
      """

  @click_element
  Scenario: Click Element
    * waitFor(xpath).click()

  @input_text
  Scenario: Input Text
    * waitFor(xpath).click().clear().input(val)

  @verify_display_text
  Scenario: Verify text display
    * match text(xpath) == expected

  @verify_content
  Scenario: Verify text content
    * match attribute(xpath, 'content-desc') == expected

  @get_toast_msg
  Scenario: Get Toast Msg
    * def toastMsg = waitFor(commonPage.toast).text