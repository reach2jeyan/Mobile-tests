Feature: Mobile tests
  @emulator1 @emulator2 @emulator3 @emulator4
  Scenario: As a user I want to perform all gestures in the mobile
    Given I launch the application with package name "" and apkname "" and with alert status ""
    When I tap on identifier ""
    Then I enter "" in the identifier ""
    Then I assert for element ""
    And I long press on x "" y "" for duration ""
    And I swipe ""
    And I scroll ""
    Then with xpath I assert for identifier ""
    And with xpath I tap on identifier ""
    And with xpath I enter "" in identifier ""
    And I go back
    And I background the application for duration "" seconds
    And I reboot the device
    Then I check if element with identifier "" exists is true?
    And I print the page source
    And I execute adb command ""


