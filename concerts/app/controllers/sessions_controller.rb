class SessionsController < ApplicationController
  protect_from_forgery with: :exception

  def new
    @user = User.find_by(params[:user_id])
  end

  def create
    if auth
      Rails.logger.debug("+++++++++++++++++++++++++ #{auth['info']}")
     @user = User.find_or_create_by(username: auth['info']['name'])
    #  @user = User.create(username: auth['info']['name'])
        @user.email = auth['info']['email']
        @user.age = auth['info']['age']
        #u.user_id = auth['info']['user_id']
        #u.uid = auth['uid']
        #u.password = SecureRandom.hex
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
