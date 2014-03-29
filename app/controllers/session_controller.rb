class SessionController < ApplicationController

  #here's where we're going to allow a user to have a session

  # NEW takes them to the log in page
  def new
  end

  # CREATE will actually find the username(or not) in the database
  # and then check to make sure that the password authenticates
  # If it does, then the user will be redirected to the homepage
  # If NOT, then the user will remain on the log in screen
  def create
    user = User.find_by(username: params[:username])

    if user & user.authenticate(params[:password])

      session[:user_id] = user_id
      redirect_to("/")
    else
      render(:new)
    end
  end


  # DESTROY is what allows the user to log out of the session
  # They can then log in again, otherwise, their session is kaput
  def destroy
    session[:user_id] = nil
    redirect_to(root_path)
  end

end
