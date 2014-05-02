class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  
  def create
    @user = User.find_by(username: params[:username])
    #raise @user.to_yaml
    if @user
      session[:username] = @user.username
      redirect_to articles_path
    else
      redirect_to login_path
    end
  end


  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end
end