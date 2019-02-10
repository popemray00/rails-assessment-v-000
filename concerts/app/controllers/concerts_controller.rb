class ConcertsController < ApplicationController
  before_action :set_user  
   skip_before_action :verify_authenticity_token
  def index
    @user = current_user
    @concerts = Concert.all
    @concert = @user.concerts
    respond_to do |format|
      format.html {render 'concerts/index', :layout => false}
      format.json {render json: @concerts}
    end
  end


  def show
    @concert = Concert.find(params[:id])
    

    respond_to do |format|
      format.html {render 'concerts/show'}
      format.json {render json: @concert}
    end
  end

  def create
    @concert = Concert.new(concert_params)
    respond_to do |format|
    if @concert.save
      params[:id] = @concert.id
      format.html {render 'concerts/show', :layout => false}
      format.json {render json: @concert}
    else
      format.html {render 'concerts/show', :layout => false}
      format.json {render json: @concert}
    end
  end
  end


  def buy_tickets
    @user = User.find_by(params[:user_id])
    ticket = Ticket.new(user_id: params[:user_id], concert_id: params[:concert_id])
    ticket.save
    flash[:notice] = ticket.purchaseticket(@user.id)
    flash[:success] = flash[:notice] if flash[:notice] == "Success"
    redirect_to user_path(@user)
  end

  def refund
    @user = User.find_by(params[:user_id])
    ticket = Ticket.find(params[:ticket_id])
    concert = ticket.concert
    ticket.user
      if concert.time.to_i > Time.now.to_i
        @user.money = @user.money + concert.cost
        @user.save(validate: false)
        ticket.delete
        flash[:success] = "Successfully Refunded."
      else
        flash[:notice] = "You cannot refund a ticket that has already expired!"
      end
      redirect_to user_path(@user)
  end

  def most_popular
      @concert = Concert.find(Ticket.top)
    end

  

  def concert_data
    @concert = Concert.find_by(params[:id])
    @user = User.find_by(params[:id])
    
    respond_to do |format|
      format.html {render 'concerts/show'}
      format.json {render json: @concert}
    end
  end
  private

  def concert_params
    params.require(:user).permit(:id, :title, :min_age, :cost, :time)
  end

  def set_user
    @user = current_user
  end

end
