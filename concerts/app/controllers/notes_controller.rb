class NotesController < ApplicationController
    before_action :set_user

    def index
        @notes = @user.notes
        respond_to do |format|
            format.html {render 'notes/index', :layout => false}
            format.json {render json: @notes}
          end
    end

    def create
        @note = @user.notes.build(note_params)
        if @note.save
        render 'notes/show', :layout => false
        else
        render 'users/show'
        end
    end

    

    private

    def note_params
        params.require(:note).permit(:content)
    end

    def set_user
        @user = User.find_by(params[:user_id])
    end
end
