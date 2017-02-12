# Declare methods
def verify_birthday_wikipedia
 birthday = "8 August 1981"
 birthday_text = "born 8 August 1981"

 birthday_section = page.find(:xpath, '//*[@id="mw-content-text"]/table[1]/tbody/tr[4]/td').text


 first_paragraph_section = page.find(:xpath, '//*[@id="mw-content-text"]/p[1]').text
 
 expect(birthday_section).to have_content(birthday)
 expect(first_paragraph_section).to have_content(birthday_text)
end

def verify_slam_count_wikipedia
 number_of_slams = "18 Grand Slam singles titles"

 second_paragraph_section = page.find(:xpath, '//*[@id="mw-content-text"]/p[2]').text
 
 expect(second_paragraph_section).to have_content(number_of_slams)
end


# Step definitions
Given(/^I am on Roger Federer's wiki article$/) do
  visit "https://en.wikipedia.org/wiki/Roger_Federer"
end

Then(/^I should be able to verify that his birthday is correct$/) do
  verify_birthday_wikipedia
end

Then(/^I should be able to verify that his grand slam count is correct$/) do
  verify_slam_count_wikipedia
end