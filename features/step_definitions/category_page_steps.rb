Given(/^I visit the (.*) category page$/) do |category_id|
  hub_category_page.load_page("#{category_id}")
end

Then(/^I should be on the category page$/) do
  expect(hub_category_page).to be_all_there
end

Then(/^I should see the cookie section$/) do
  expect(hub_category_page.cookies).to be_all_there
end

Then(/^I should see the primary navigation$/) do
  expect(hub_category_page.primary_nav).to be_all_there
end

Then(/^I should see the footer$/) do
  expect(hub_category_page.footer).to be_all_there
end

Then(/^I should see the category navigation$/) do
  expect(hub_category_page.category_navigation.cat_links.count).to eql 8
  expect(hub_category_page.category_navigation.active_category).to be_visible
end

Then(/^I should see the category heading$/) do
  expect(hub_category_page.cat_heading).to be_visible
end

Then(/^I should see available programmes$/) do
  expect(hub_category_page).to have_programmes
  hub_category_page.programmes.each do |prog|
    expect(prog).to have_programme_title
    expect(prog).to have_episode_count
    expect(prog).to have_programme_description
  end
end

Then(/^only the first (\d+) programmes should be visible$/) do |programme_number|
  (0..(programme_number.to_i-1)).each do |i|
    hub_category_page.programmes[i].wait_until_programme_image_visible
    hub_category_page.programmes[i].wait_until_programme_title_visible
    hub_category_page.programmes[i].wait_until_episode_count_visible
    hub_category_page.programmes[i].wait_until_programme_description_visible
  end
  expect(hub_category_page.programmes[programme_number.to_i]).to have_no_programme_image
  expect(hub_category_page.programmes[programme_number.to_i].programme_title).to_not be_visible
  expect(hub_category_page.programmes[programme_number.to_i].episode_count).to_not be_visible
  expect(hub_category_page.programmes[programme_number.to_i].programme_description).to_not be_visible
end

Then(/^more programmes should be visible$/) do
  (0..11).each do |i|
    hub_category_page.programmes[i].wait_until_programme_image_visible
    hub_category_page.programmes[i].wait_until_programme_title_visible
    hub_category_page.programmes[i].wait_until_episode_count_visible
    hub_category_page.programmes[i].wait_until_programme_description_visible
  end
end

Then(/^all programmes should be visible$/) do
  hub_category_page.programmes.last.wait_until_programme_image_visible
  hub_category_page.programmes.last.wait_until_programme_title_visible
  hub_category_page.programmes.last.wait_until_episode_count_visible
  hub_category_page.programmes.last.wait_until_programme_description_visible
end

Then(/^all programmes should have at least (\d+) episode available for viewing$/) do |arg1|
  step "I scroll to the bottom"
  hub_category_page.programmes.each do |programme|
    expect(programme.episode_count.text.to_i).to be >= 1
  end
end

When(/^I click on a programme$/) do
  hub_category_page.programmes[0].programme_title.click
end

Then(/^I should be taken to the programme page$/) do
  programme_page.wait_until_primary_nav_visible
  expect(programme_page).to have_episodes
end
