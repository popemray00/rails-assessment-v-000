class UsersController < ApplicationController

  before_action :set_user
  skip_before_action :verify_authenticity_token


  def home
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html { render :new}

      format.json {render json: @user}
    end
  end

  def create
    @user = User.new(user_params)
      if @user.save
        flash[:success] = "Successfully Registered!"
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render :new
      end
   end

   def show
    @user = User.find_by(params[:id])
    @concerts = @user.concerts
    @concert = Concert.find_by(params[:id])
    @notes = @user.notes
    @note = @user.notes.build
    respond_to do |format|
      format.html { render :show}

      format.json {render json: @user}
    end
   end

   def edit
    @user = User.find(params[:id])
  end

   def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :action => 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username,:password,:email, :money, :password_confirmation, note_attributes: [:note, :id, :authenticity_token, :uft8])
  end

  def set_user
    @user = current_user
  end
end
