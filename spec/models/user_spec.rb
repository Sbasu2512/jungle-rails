require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  #! VALIDATION TESTS
  describe 'Validations' do
    #! test 1
    it "should save if all fields are given" do
      @user = User.new( 
          name: 'Sayantan Basu',
          email: 'sayantanbasu@live.in',
          password: 'password',
          password_confirmation: 'password'
        ).save
      
      expect(@user).to eq(true)
    end
    #! test 2
    it "should validate password and password_confirmation match" do
      @user = User.create(
          name: 'Sayantan Basu',
          email: 'sayantanbasu@live.in',
          password: 'password',
          password_confirmation: 'qwerty'
      )

      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    #! test 3
    it "should validate password and password confirmation fields and should check if the password length is more than 6" do
      @user = User.create(
        name: 'Sayantan Basu',
        email: 'sayantanbasu@live.in',
        password: nil,
        password_confirmation: nil
      )

      expect(@user.errors.full_messages).to include("Password can't be blank", "Password can't be blank", "Password is too short (minimum is 6 characters)", "Password confirmation can't be blank")
      # expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    #! test 4
    it "should validate that emails are unique" do
      @user1 = User.new(
        name: "Jane Doe",
        email: "jdoe@findme.com",
        password: "a_sick_joke",
        password_confirmation: "a_sick_joke"
      ).save

      @user2 = User.create(
        name: "John Doe",
        email: "JDOE@FINDME.com",
        password: "i_dont_know",
        password_confirmation: "i_dont_know"
      )

      expect(@user1).to eq(true)

      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end
    #! test 5
    it "should validate email" do
      @user = User.create(
        name: 'Sayantan Basu',
        email: nil,
        password: 'qwerty',
        password_confirmation: 'qwerty'
      )

      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    #! test 6
    it "should validate name" do
      @user = User.create(
        name: nil,
        email: "liop@gmail.com",
        password: 'qwerty',
        password_confirmation: 'qwerty'
      )

      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
  end
  #! AUTHENTICATION TESTS
  describe '.authenticate_with_credentials' do
    #! test 7
    it 'should return the user when credentials are correct' do
      @user = User.create(
          name: 'John doe',
          email: 'test@test.com',
          password: 'password',
          password_confirmation: 'password',
        )

      authenticate =
        User.authenticate_with_credentials('test@test.com', 'password')

      expect(authenticate).to eq(@user)
    end
    #! test 8
    it 'should return nil if password do not match' do
      @user = User.create(
        name: 'Jane Smith',
        email: 'jsmith@xyz.com',
        password: '123456',
        password_confirmation: '123456',
      )
      authenticate = User.authenticate_with_credentials('jsmith@xyz.com', 'password')

      expect(authenticate).to eql(nil)
    end
    #! test 9
    it 'should return nil if email do not match' do
      @user = User.create(
        name: 'Sayantan',
        email: 'sbasu025@gmail.com',
        password: '12345',
        password_confirmation: '123456'
      )

      authenticate = User.authenticate_with_credentials('sayantanbasu@gmail.com', '123456')

      expect(authenticate).to eql(nil)
    end
    #! test 10
    it 'should not return nil if email has space before in the login form' do
      @user = User.create(
        name: 'Sayantan',
        email: 'sbasu025@gmail.com',
        password: '123456',
        password_confirmation: '123456'
      )

      authenticate = User.authenticate_with_credentials('  sbasu025@gmail.com', '123456')
      
      expect(authenticate).to eq(@user)
    end
    #! test 11
    it 'should return user if a visiitor types in wrong case for email' do
      @user = User.create(
        name: 'Sayantan',
        email: 'sbasu025@gmail.com',
        password: '123456',
        password_confirmation: '123456'
      )

      authenticate = User.authenticate_with_credentials('  sbASU025@gmail.COM', '123456')
      
      expect(authenticate).to eq(@user)
    end
  end

end
