class User < ActiveRecord::Base

  has_secure_password

  before_save { self.email = email.strip.downcase}

  validates :name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    email_stripped = email.strip.downcase
    @user = User.where

    @user = User.find_by email: email_stripped

    if !@user
      nil
    else
      authenticate = @user.authenticate(password)
      if authenticate
        @user
      else
        nil
      end
      
    end
  end
end