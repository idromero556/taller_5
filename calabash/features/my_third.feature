Feature: Taximeter calculator

  Scenario: As a user I want to be able to calculate my taxi fee
    Given I press "Paraderos"               
    #button to remove the splash screen
    When I swipe left
    #to open te menu
    And I press "Taximetro"
    #to open te the taximeter tool
    And I press "Aeropuerto"
    #to select the option
    And I press "Noct./Fest."
    #to select the option
    And I enter text "100" into field with id "editUnits"
    Then I should see "$15.000"