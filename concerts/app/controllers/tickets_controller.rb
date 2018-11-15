
class TicketsController < ApplicationController
  before_action :set_user


    def index
      
    end

    def new
      @ticket = Ticket.new
    end

    def create
     
      @ticket = Ticket.new

     if @ticket.save!
        redirect_to @user
     else
      redirect_to @user
     end
    end

  private

  def ticket_params
    params.require(:ticket).permit(:id, :user_id, :concert_id)
  end

  
  def set_user
    @user = User.find_by(params[:user_id])
  end
end
