Feature: Search News
  As a user
  I want to search for news
  So that I can find relevant news articles

  Scenario: Search for news
    Given the app is on the home page
    When I enter "flutter" in the search field
    And I press the search button
    Then I should see a list of news articles with the title "Flutter"
    And I should see the search field with the text "flutter"

  Scenario: Clear search results
    Given the app is on the home page
    When I enter "flutter" in the search field
    And I press the search button
    And I press the clear button
    Then I should not see any news articles
    And I should see an empty search field

  Scenario: Toggle theme
    Given the app is on the home page
    When I tap on the theme menu
    Then I should see the dark theme option
    When I select the dark theme option
    Then I should see the app in dark theme
    When I tap on the theme menu again
    Then I should see the light theme option
    When I select the light theme option
    Then I should see the app in light theme

  Scenario: Loading news
    Given the app is on the home page
    When I wait for 2 seconds
    Then I should see a loading indicator

  Scenario: News load failure
    Given the app is on the home page
    When I wait for 2 seconds
    Then I should see a failure message "News Load Operation Failure."