Feature: List Card
  In order to be able to see all the cards related to an User or a Game
  As an admin
  I want to be able to list all cards related to them

  Scenario: List a card as admin
    Given I login as "admin" with password "password"
    And There is a game with price 10.0 and id 1
    And There is a card with id 2 associated to the game with id 1
    When I list the cards of the game with id 1
    Then The response code is 201
    And There are 1 cards associated

  Scenario: List a card as user
    Given I login as "user" with password "password"
    And There is a game with price 10.0 and id 1
    And There is a card with id 2 associated to the game with id 1
    When I list the cards of the game with id 1
    Then The response code is 201
    And There are 1 cards associated

  Scenario: List cards without having created one
    Given I login as "user" with password "password"
    And There is a game with price 10.0 and id 1
    And There is a card with id 2 associated to the game with id 1
    And I'm not logged in
    And I login as "user2" with password "password"
    When I list the cards of the game with id 1
    Then The response code is 201
    And There are 1 cards associated

