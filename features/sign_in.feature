Feature: Sign in
  Scenario: User can sign in in the home page
  Given I'm in the home page
  When I click link "Sign in"
  And complete a sign_in form correctly
  Then get the profile page
  But if my password or email is incorrect
  Then I'll be told "[i,I]valid" in "div.error"
