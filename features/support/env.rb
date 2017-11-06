require 'site_prism'
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'
require 'require_all'

Capybara.configure do |config|
  config.default_max_wait_time = 10
  config.app_host = 'https://www.itv.com/hub'
  config.match = :prefer_exact
  config.ignore_hidden_elements = false
  config.visible_text_only = true
  if ENV['DRIVER'].eql? nil
    config.default_driver = :chrome
  else
    config.default_driver = ENV['DRIVER'].to_sym
  end
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara::Screenshot.register_driver(:chrome) do |driver, path|
  driver.browser.save_screenshot(path)
end

SitePrism.configure do |config|
  config.use_implicit_waits = true
end
