# frozen_string_literal: true

module CapybaraHelpers
  def wait_for_valid(javascript_expression)
    page.document.synchronize do
      raise Capybara::ElementNotFound unless page.evaluate_script(javascript_expression)
    end
  end

  def wait_for_visible(selector)
    wait_for_valid %($('#{selector}:visible').length > 0)
  end

  def wait_for_ajax(timeout: Capybara.default_max_wait_time)
    start_time = Time.now
    
    initialize_fetch_tracking if page.evaluate_script('window') && !page.evaluate_script('window.__fetchRequests !== undefined')
    
    Timeout.timeout(timeout) do
      loop do
        break if finished_all_ajax_requests?
        if Time.now - start_time > timeout / 2
          puts "Warning: Still waiting for AJAX requests to complete after #{((Time.now - start_time) * 1000).round}ms"
          puts "jQuery.active: #{page.evaluate_script('window.jQuery ? jQuery.active : 0')}"
          puts "window.__activeRequests: #{page.evaluate_script('window.__activeRequests')}"
          puts "window.__fetchRequests: #{page.evaluate_script('window.__fetchRequests')}"
          puts "window.pendingXHRs: #{page.evaluate_script('window.pendingXHRs && window.pendingXHRs.length')}"
        end
        sleep 0.1
      end
    end
  rescue Timeout::Error => e
    puts "TIMEOUT ERROR: AJAX requests did not complete within #{timeout} seconds"
    puts "jQuery.active: #{page.evaluate_script('window.jQuery ? jQuery.active : 0')}"
    puts "window.__activeRequests: #{page.evaluate_script('window.__activeRequests')}"
    puts "window.__fetchRequests: #{page.evaluate_script('window.__fetchRequests')}"
    puts "window.pendingXHRs: #{page.evaluate_script('window.pendingXHRs && window.pendingXHRs.length')}"
    puts "Current URL: #{page.current_url}"
    puts "Current path: #{page.current_path}"
    
    raise e
  end

  def initialize_fetch_tracking
    return unless page.evaluate_script('window')
    
    page.execute_script(<<~JS)
      window.__fetchRequests = 0;
      if (window.fetch) {
        const origFetch = window.fetch;
        window.fetch = function(...args) {
          window.__fetchRequests++;
          return origFetch.apply(this, args).finally(() => {
            window.__fetchRequests--;
          });
        };
      }
      
      window.pendingXHRs = [];
      (function(open) {
        XMLHttpRequest.prototype.open = function() {
          this.addEventListener("readystatechange", function() {
            if (this.readyState === 4) {
              const index = window.pendingXHRs.indexOf(this);
              if (index > -1) {
                window.pendingXHRs.splice(index, 1);
              }
            }
          });
          window.pendingXHRs.push(this);
          return open.apply(this, arguments);
        };
      })(XMLHttpRequest.prototype.open);
    JS
  end

  def finished_all_ajax_requests?
    return true unless page.evaluate_script('window')
    
    no_jquery_requests = page.evaluate_script('!window.jQuery || jQuery.active === 0')
    no_active_requests = page.evaluate_script('!window.__activeRequests')
    no_fetch_requests = page.evaluate_script('!window.__fetchRequests || window.__fetchRequests === 0')
    no_xhr_requests = page.evaluate_script('!window.pendingXHRs || window.pendingXHRs.length === 0')
    
    no_jquery_requests && no_active_requests && no_fetch_requests && no_xhr_requests
  end

  def visit(url)
    page.visit(url)
    return if Capybara.current_driver == :rack_test
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until page.evaluate_script("document.readyState") == "complete"
    end
    wait_for_ajax
  end

  def wait_until_true
    Timeout.timeout(Capybara.default_max_wait_time) do
      until yield
        sleep 1
      end
    end
  end

  def js_style_encode_uri_component(comp)
    # CGI.escape encodes spaces to "+"
    # but encodeURIComponent in JS encodes them to "%20"
    CGI.escape(comp).gsub("+", "%20")
  end

  def fill_in_color(field, color)
    field.execute_script("Object.getOwnPropertyDescriptor(Object.getPrototypeOf(this), 'value').set.call(this, arguments[0]); this.dispatchEvent(new Event('input', { bubbles: true }))", color)
  end

  def have_nth_table_row_record(n, text, exact_text: true)
    have_selector("tbody tr:nth-child(#{n}) > td", text:, exact_text:, normalize_ws: true)
  end

  def get_client_time_zone
    page.evaluate_script("Intl.DateTimeFormat().resolvedOptions().timeZone")
  end

  def unfocus
    find("body").click
  end

  def accept_browser_dialog
    wait = Selenium::WebDriver::Wait.new(timeout: 30)
    wait.until do
      page.driver.browser.switch_to.alert
      true
    rescue Selenium::WebDriver::Error::NoAlertPresentError
      false
    end
    page.driver.browser.switch_to.alert.accept
  end
end
