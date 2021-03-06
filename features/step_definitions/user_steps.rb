Given /^I\'m in the home page$/ do
  visit(root_path)
end

When /^I? ?visit path "(.*?)"$/ do |path|
  visit(path)
end

When /^I? ?click link "(.*?)"$/ do |link|
  find_link(link).click
end

When /^I? ?click button "(.*?)"$/ do |button|
  click_button(button)
end

When /^I? ?complete a sign_in form correctly$/ do
  fill_in("session[email]", :with => User.first.email)
  fill_in("session[password]", :with => User.first.password)
end

Then /^complete a edit_profile table$/ do
  fill_in("profile[name]", :with => "my_new_name")
end

Then /^if my password or email is incorrect$/ do
  visit(new_session_path)
  fill_in("session[email]", :with => @user.email)
  fill_in("session[password]", :with => '323223')
  click_button("Sign in")
end

Given /^my email is "(.*?)", and password is "(.*?)"$/ do |email,password|
  page.fill_in 'user[email]', :with => email
  page.fill_in 'user[password]', :with => password
  page.fill_in 'user[password_confirmation]', :with => password
end

Then /^I\'ll be told "(.*?)" in "(.*?)"$/ do |info, place|
  rege = Regexp.new '^.*'+info+'.*$'
  find(place).should have_content rege
end

Then /^I should see error_info$/ do
  puts find('div.error').text
end

Then /^I should see a notice$/ do
  puts find('div.notice').text
end

Then /^I? ?get the profile page$/ do
  puts page.first('div.main').text
  puts "there is a bug in sign_in feature"
end

Given /^I have an account$/ do
  @user = FactoryGirl.create(:user)
  puts User.count
end

Given /^I have an admin account$/ do
  @user = FactoryGirl.create(:user, :id => 9)
  puts User.first.id
end

Then /^I can see users in a list$/ do
  within("div.main") do
    all('ol.users li').map do |li|
      puts li.text
    end
  end
end
