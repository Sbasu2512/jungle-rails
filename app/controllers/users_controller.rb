class UsersController < ApplicationController
  def new
  end

  # method that when called, will create a new user
  def create
    # AR model which will interact with our database and create a new user
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private

  # ???
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end