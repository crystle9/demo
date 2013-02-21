Feature: error info when sign up
Scenario: if email is nil, it will stimulate an error info
Given I'm in the home page
And click link "Sign up"
And my name is "j", email is "", and password is "12345"
And click button "submit"
Then I'll be told "[Ii]nvalid" in "div.error"