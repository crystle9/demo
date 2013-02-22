Feature: protect pages
Scenario: prevent user visit profile without authentication
Given I have an account
When I visit path "/users/1/edit_profile"
Then I should see a notice