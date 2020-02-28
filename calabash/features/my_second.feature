Feature: Route calculator

  Scenario: As a user I want to be able to calculate a route
    Given I press "Paraderos"               
    #button to remove the splash screen
    When I press "Viajar en Transmi, SITP o Taxi"
    #to open te router
    And I press "Punto de origen"
    #to remove the splash screen
    And I wait for progress
    #to wait to load ubicación
    And I press "Tu ubicación"
    #to select the origin station
    And I enter text "Las Aguas" into field with id "etSearch"
    #to write the origin station
    And I press "Zona J"
    #to select the station
    And I wait for progress
    #to wait to load the selection
    And I press "Punto de destino"
    #to select the destination station
    And I wait for progress
    #to wait to load
    And I enter text "Simon" into field with id "etSearch"
    #to write the detination station
    And I press "Simón Bolivar"
    #to select the station
    And I press "fabGo"
    #to search routes
    And I wait for progress
    #to wait to load the routes
    And I wait for progress
    #to wait to load the routes
    Then I should see "Rutas sugeridas"
