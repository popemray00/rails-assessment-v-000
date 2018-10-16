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
  end


  def buy_tickets
    @user = User.find_by(session[:user_id])
    ticket = Ticket.new(user_id: session[:user_id], concert_id: params[:concert_id])
    flash[:notice] = ticket.purchaseticket
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

    private

    #def concert_params
    #    params.require(:concert).permit(:title, :min_age, :cost, :time, :user_id, :concert_id, :purchaseticket)
    #end

    def purchaseticket
      if (user.age >= concert.min_age) && (user.money >= concert.cost) && (!user.concerts.find {|c| c.showtime == concert.showtime})
        user.money = user.money - concert.cost
        user.save(validate: false)
        self.save
        "Success"
      elsif (user.age < concert.min_age)
         "Sorry, you don't meet the minimum age to attend this show!"
      elsif (user.money < concert.cost)
         "Sorry, you don't have enough money to make this purchase"
       elsif user.concerts.find {|c| c.showtime == concert.showtime}
         "You already have a ticket for this concert."
      end

    end
end
