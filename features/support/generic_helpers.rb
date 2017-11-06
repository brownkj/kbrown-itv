def wait_for
  Timeout.timeout(Capybara.default_max_wait_time) do
    begin
      loop until yield
    rescue # rubocop:disable Lint/HandleExceptions
      # ignored
    end
  end
end

def wait_for_document_ready
  wait_for { page.evaluate_script('document.readyState').eql? 'complete' }
end

def scroll_to_bottom
  WaitUntil.wait_until(3, "Browser hasn't reached bottom of page") do
    page.execute_script "window.scrollBy(0, window.innerHeight)"
    y_position=page.evaluate_script "window.scrollY"
    browser_height=page.evaluate_script "window.innerHeight"
    page_length=page.evaluate_script "document.body.offsetHeight"
    (y_position+browser_height).eql?(page_length)
  end
end

module WaitUntil
  def self.wait_until(timeout = 10, message = nil, &block)
    wait = Selenium::WebDriver::Wait.new(timeout: timeout, message: message)
    wait.until(&block)
  end
end
