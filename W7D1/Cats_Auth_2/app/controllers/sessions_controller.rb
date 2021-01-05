class SessionsController < ApplicationController
# In the User and Session controllers, use a before_action callback to redirect the user to the cats index if the user tries to visit the login/signup pages when they're already signed in.

  def new
    @user = User.new
    render :new
  end

  def create
    #debugger #remember to use debugger to solve bugs!!!
    @user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])

    if @user
      login(@user)
      redirect_to cats_url
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end
