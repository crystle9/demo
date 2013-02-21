Feature: protect pages
Scenario: prevent user visit profile without authentication
Given I have an account
When I visit my profile but have not signed in
Then I'll be told "have not signed in" in "div.error"