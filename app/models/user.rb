class User < ActiveRecord::Base
=begin
Feature: I can encipher password
I need lock in digest
Give me a password
I add the first lock associated with timestamp
And get salt
I add the second lock on salt and password
As encrypted_password and save in Database

Feature: I can authenticate user via email and password
Give me user's email and password
I'll find user by email firstly
and encipher the password and compare it with encrypted_password in Database
Return user if matched
Else return nil

Feature: authenticate user via id and salt

=end
  # for password encryption
  require 'digest'

  attr_accessor :password
  attr_accessible :email, :name, :password_confirmation, :password
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :presence => true

  # unique email, case_insensitive
  validates :email, :presence => true, :format => { :with => email_regex },
  :uniqueness => { :case_sensitive => false }
  validates :password, :length => { :within => 5..10 }, :confirmation => true

  # encipher password and save in user.encrypted_password
  before_save :encrypt_password

  # check password offered by attempter, return true or false
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  # Class method, authenticate with email and password, return nil or user
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end

  # Class method, authenticate cookie, return nil or user
  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  private

    # give me password, I encipher it and save it in encrypted_password
    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end
    
    # lock 2
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    # lock 1
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    # lock
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end

end
