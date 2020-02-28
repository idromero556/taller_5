Feature: Search route

  Scenario: As a user I want to be able to search an specific route
    Given I press "Paraderos"               
    #button to remove the splash screen
    When I press "Rutas"
    #to open te router
    And I press "URBANO"
    #to see the SITP routes
    And I press "search_button"
    #to filter a route
    And I enter text "t11" into field with id "search_src_text"
    And I press search button
    #to select a route
    And I wait for progress
    And I press "Calle 222 » Alpes"
    And I wait for progress
    Then I should see "Recorrido"

