require 'faker'
namespace :db do
	  desc "Fill database with sample data"
	  task :populate => :environment do
	       Rake::Task['db:reset'].invoke
	       User.create!(
	       			  :email => "example@railstutorial.org",
				  :password => "foobar",
				  :password_confirmation => "foobar")
		Profile.create!(:name => "Example User", :user_id => 1)
		99.times do |n|
			 name = Faker::Name.name
			 email = "example-#{n+1}@railstutorial.org"
			 password = "password"
			 User.create!(	    :email => email,
					    :password => password,
					    :password_confirmation => password)
			Profile.create!(:name => name, :user_id => n)
			
		end
	end
end
