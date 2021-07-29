class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      #TODO: success logic, log them in!
      # If the user exists AND the password entered is correct.
      if user
        # Save the user id inside the browser cookie. 
        # logged in when they navigate around our website.
        session[:user_id] = user.id
        redirect_to '/'
      else
      #TODO: failure, render login form!
        # If user's login doesn't work, send them back to the login form.
        redirect_to '/login'
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end