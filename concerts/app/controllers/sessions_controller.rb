class SessionsController < ApplicationController
  protect_from_forgery with: :exception

  def new
  end

  def create
    user = User.find_or_create_by(:uid => auth['uid']) do |user|
   user.name = auth['info']['name']
 end
 session[:user_id] = user.try(:id)
  end

  def login
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      flash[:success] = "Successfully logged in!"
      session[:user_id] = @user.id
      redirect_to user_concerts_path(@user)
    else
      flash[:notice] = "Invalid username or password"
      render :new
    end
    end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
