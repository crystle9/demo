Feature: Sign in
include: sessions.helper
  Scenario: User can sign in in the home page
  Given I have an account
  Given I'm in the home page
  When I click link "Sign in"
  And complete a sign_in form correctly
  Then I get the profile page