Feature: Sign up

  Scenario: users can sign up and will be requested to complete a form
    Given I'm in the home page 
    When I click link "Sign up"
    Given my name is "shu", email is "shu@gmail.com", and password is "12345"
    When I click button "submit"
    Then I get the profile page