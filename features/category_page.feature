Feature: Documentaries are available

As a user of ITV Hub
I want to see a list of Factual programmes
So that I can view the latest available documentaries

Background:
Given I visit the factual category page

Scenario: Page renders correctly
Then I should see the cookie section
And I should see the primary navigation
And I should see the footer
And I should see the category navigation
And I should see the category heading
And I should see available programmes

Scenario: Programme lazy loading
Then only the first 6 programmes should be visible
When I scroll down 
Then more programmes should be visible
When I scroll to the bottom
Then all programmes should be visible

Scenario: All programmes have viewable episodes
Then all programmes should have at least 1 episode available for viewing

Scenario: Selecting Programme
When I click on a programme
Then I should be taken to the programme page