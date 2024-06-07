Feature: News Page


  Scenario: User toggles theme using app bar menu
    Given the app is running
    When I tap the menu button on the app bar
    And I tap {'Dark'} text
    Then the app theme changes to the selected theme
    When I tap the menu button on the app bar
    And I tap {'Light'} text
    Then the app theme changes to the selected theme
    When I tap the menu button on the app bar
    And I tap {'System'} text
    Then the app theme changes to the selected theme


  Scenario: User opens the app and news articles are fetched
    Given I launch the News App
    Then circular progress indicator is displayed initially
    And I wait {5} int seconds
    And The News App displays a list of news articles

  Scenario: User share article
    Given List of news articles is displayed
    When I tap the share button on a specific article card
    Then the app should provide sharing options

  Scenario: User opens a news article
    Given List of news articles is displayed
    When I tap on specific article card
    Then I should see a detailed view of the selected article

  Scenario: Search for news
    Given the app is running
    When I enter {'biden'} text into search field
    And I tap {Icons.search} icon
    And I wait
    Then I should see the article with the text {"biden"} text

