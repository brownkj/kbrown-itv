When(/^I select the categories section of the navigation$/) do
  hub_main_page.primary_nav.categories.click
end

When(/^I select the "(.*)" category$/) do |category|
  hub_category_page.category_navigation.cat_links.find {|i| i.text == category}.click
end

Then(/^I should be on the (.*) category page$/) do |category|
  hub_category_page.wait_until_primary_nav_visible
  expect(hub_category_page.category_navigation.active_category.text.downcase)
  .to include category.downcase
  expect(hub_category_page.cat_heading.text.downcase).to eql category.downcase
end
