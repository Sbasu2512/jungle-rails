class User < ActiveRecord::Base

  has_secure_password

  before_save { self.email = email.strip.downcase}

  validates :name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    email_stripped = email.downcase.strip
    
    user = User.find_by(email: email_stripped)
    user_authenticate = user.authenticate(password)
  
    if user && user_authenticate
      user
    else
        puts "not able to authenticate"
        nil
    end
  end

end