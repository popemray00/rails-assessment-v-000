class SessionsController < ApplicationController
  protect_from_forgery with: :exception

  def new
    @user = User.new
  end

  def create
    if auth
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.email = auth['info']['email']
        u.username = auth['info']['name']
        u.uid = auth['uid']
        u.password = SecureRandom.hex
      end
      @user.save
      session[:user_id] = @user.id
      render 'concerts/index'
    else
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:message] = "You have logged in successfully!"
        redirect_to user_concerts_path(@user)
      else
        flash[:message] = "Please enter a valid email/password!"
        render :new
      end
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
