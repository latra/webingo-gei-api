Feature: Edit Game
  In order to allow edit game
  As an admin
  I want to edit a game settings


  Scenario: Edit game as admin
    Given I login as "admin" with password "password"
    When I edit game with id "1"
    Then The response code is 200
    And It has been edited a game with id "1"

  Scenario: Edit game as user
    Given  I login as "user" with password "password"
    When I edit game with id "1"
    Then The response code is 401
    And The error message is "you are not authorized"
    And It has not been edited a game with id "1"

  Scenario: Edit game without authenticating
    Given I'm not logged in
    When I edit game with id "1"
    Then The response code is 401
    And The error message is "you need to authenticate"
    And It has not been edited a game with id "1"

  Scenario: Edit game with incorrect id
    Given I login as "admin" with password "password"
    When I edit game with id "incorrect"
    Then The response code is 400
    And The error message is "incorrect game id"
    And It has not been edited a game with id "1"

  Scenario: Edit a deleted game
    Given I login as "admin" with password "password"
    And I register a new game with id "1" and status "2"
    When I edit game with id "1"
    Then The response code is 404
    And The error message is "the game is deleted"
    And It has not been edited a game with id "1"

  Scenario: Edit game to set a specific pricePerCard
    Given I login as "admin" with password "password"
    And There is a game with the pricePerCard 8.0 and id 2
    When I edit the game with id 2
    And I edit the pricePerCard to be 5.0 for the game with id 2
    Then The response code is 201
    And The game with id 2 has been edited

  Scenario: Edit game as admin with incorrect password
    Given Exists an admin "admin" with password "password"
    And There is a game with id 2
    When I login as "admin" with password "password1"
    Then The response code is 401
    And The error message is "Unauthorized"

  Scenario:Edit game to change the jackpot amount
    Given I login as "admin" with password "password"
    And There is a game with id 1
    When I edit the game with id 1
    And I edit the jackpot to be 500.0 for the game with id 1
    Then The response code is 201
    And The game with id 1 has been edited

  Scenario: Edit game to change the starting time
    Given I login as "admin" with password "password"
    And Exists a game with id "1"
    When I edit game with id "1"
    And I set up the starting time startAt to be "17:00 PM"
    Then The response code is 200
    And It has been edited the starting time startAt for the game with id "1"

  Scenario: Edit game to change the finishing time
    Given I login as "admin" with password "password"
    And Exists a game with id "1"
    When I edit game with id "1"
    And I set up the finishing time finishedAt to be "20:00 PM"
    Then The response code is 200
    And It has been edited the finishing time finishedAt for the game with id "1"

