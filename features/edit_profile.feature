Feature: can edit profile
Scenario: user can edit his profile if has logged in
Given I'm in the home page
And click link "Sign up"
And my email is "test@a.cn", and password is "12345"
When I click button "submit"
Then click link "Profile"
And complete a edit_profile table
And click button "Update"
Then I get the profile page