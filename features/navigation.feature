Feature: Documentaries are available

As a user of ITV Hub
I want to navigate through the service
So I can find programmes I want to watch

#I have moved navigating to the page out of the category page as I feel that the category navigation itself is not part of the page

Background:
Given I visit the Hub main page

Scenario: Navigating to category
When I select the categories section of the navigation
Then I should be on the category page
When I select the "Factual" category
Then I should be on the factual category page