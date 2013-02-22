Feature: admin can see and delete all users
Scenario: admin can see all users
Given I have an admin account
And I'm in the home page
When I click link "Users"
Then I can see users in a list