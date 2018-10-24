class ConcertsController < ApplicationController
   skip_before_action :verify_authenticity_token
  def index
    @user = User.find(params[:user_id])
      if session[:user_id] = @user.id
        render :index
      else
        redirect_to root_path
      end
  end



  def new
    @user = User.find_by(params[:user_id])
  end


  def buy_tickets
    @user = User.find_by(params[:user_id])
    ticket = Ticket.new(user_id: params[:user_id], concert_id: params[:concert_id])
    flash[:notice] = ticket.purchaseticket(@user)
    flash[:success] = flash[:notice] if flash[:notice] == "Success"
    redirect_to user_concerts_path(@user)
  end

  def refund
    ticket = Ticket.find(params[:ticket_id])
    concert = ticket.concert
    user = ticket.user
      if concert.time.to_i > Time.now.to_i
        user.money = user.money + concert.cost
        user.save(validate: false)
        ticket.delete
        flash[:success] = "Successfully Refunded."
      else
        flash[:notice] = "You cannot refund a ticket that has already expired!"
      end
      redirect_to user_concerts_path(user)
  end

  def most_popular
      @concert = Concert.find(Ticket.top)
    end

end
