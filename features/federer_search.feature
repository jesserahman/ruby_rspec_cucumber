Feature: Wikipedia has correct birthday and grand slam count of Roger Federer
In order to verify Federer's birthday and grand slam count are correct in Wikipedia
As a user of Wikipedia
I want do go to Federer's wikipedia article from google and check that his birthday and grand slam count are correct

Scenario: Federer google search
  Given I have the ability to search google
  When I search for Roger Federer in google
  Then I should see the link to Federer's Wikipedia Article appear
  And I should be able to click the link and view the wikipedia article

Scenario: Verify Roger Federer's birthday
  Given I am on Roger Federer's wiki article
  Then I should be able to verify that his birthday is correct 

Scenario: Verify Roger Federer grand slam count
  Given I am on Roger Federer's wiki article
  Then I should be able to verify that his grand slam count is correct 




 