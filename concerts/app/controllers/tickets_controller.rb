class TicketsController < ApplicationController


    def new
        current_user
        @ticket = Ticket.new
    end

    def index
      if current_user
        render :index
      else
        redirect_to root_path
      end
    end

    def create
        current_user
        @ticket = Ticket.new(ticket_params)
        if @ticket.save
        flash[:success] = "Ticket!!!"
        redirect_to user_tickets_path(current_user)
        else
        redirect_to new_user_ticket_path(current_user)
        end
    end


    private

    def ticket_params
        params.require(:ticket).permit(:notes)
      end

end
