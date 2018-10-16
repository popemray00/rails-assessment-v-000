class UsersController < ApplicationController

  before_action :set_user

  def home
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        flash[:success] = "Successfully Registered!"
        session[:user_id] = @user.id
        redirect_to user_concerts_path(@user)
      else
        render :new
      end
   end

   def show
     @user = set_user
   end

  private

  def user_params
    params.require(:user).permit(:username,:password,:email,:age, :password_confirmation)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
