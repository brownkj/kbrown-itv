When(/^I scroll down$/) do
  page.execute_script "window.scrollBy(0, 500)"
end

When(/^I scroll to the bottom$/) do
  scroll_to_bottom
end

Given(/^I visit the Hub main page$/) do
  visit '/'
end