require 'spec_helper'

# Capybara and RSpec setup
Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.default_driver = :selenium_chrome
Capybara.run_server = false
Capybara.default_max_wait_time = 10

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Capybara::RSpecMatchers
end


# Declare methods
def search_for_federer
 fill_in('lst-ib', :with => "Roger Federer")
 find(:id, 'lst-ib').native.send_keys(:enter)
end

def verify_birthday
 birthday = "8 August 1981"
 birthday_text = "born 8 August 1981"

 birthday_section = page.find(:xpath, '//*[@id="mw-content-text"]/table[1]/tbody/tr[4]/td').text


 first_paragraph_section = page.find(:xpath, '//*[@id="mw-content-text"]/p[1]').text
 
 expect(birthday_section).to have_content(birthday)
 expect(first_paragraph_section).to have_content(birthday_text)
end

def verify_slam_count
 number_of_slams = "18 Grand Slam singles titles"

 second_paragraph_section = page.find(:xpath, '//*[@id="mw-content-text"]/p[2]').text
 
 expect(second_paragraph_section).to have_content(number_of_slams)
end


# TRUMP SPEC
describe 'Roger Federer fact check' do

 it 'goes to google, searches for Roger Federer, finds a wikiarticle and varifies his birthday and grand slam count' do
   visit "https://www.google.com/"
   
   # Search for Roger Federer
   expect(page).to have_css('#lst-ib')
   search_for_federer

   # Find and check wikipedia page for birthday and birthplace
   expect(page).to have_content('Wikipedia')
   click_on('Wikipedia')
   verify_birthday
   verify_slam_count
 end

end