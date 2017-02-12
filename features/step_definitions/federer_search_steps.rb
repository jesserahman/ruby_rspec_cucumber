# Declare methods
def google_search_for_trump_
 fill_in('lst-ib', :with => "Roger Federer")
 find(:id, 'lst-ib').native.send_keys(:enter)
end

# Step definitions
Given(/^I have the ability to search google$/) do
  visit "https://www.google.com/"
  expect(page).to have_css('#lst-ib')
end

When(/^I search for Roger Federer in google$/) do
  google_search_for_trump_
end

Then(/^I should see the link to Federer's Wikipedia Article appear$/) do
  expect(page).to have_content('Wikipedia')
end

Then(/^I should be able to click the link and view the wikipedia article$/) do
  click_on('Wikipedia')
  expect(page).to have_content('Roger Federer')
end