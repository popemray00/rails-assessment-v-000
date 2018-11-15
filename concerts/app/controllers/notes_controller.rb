class NotesController < ApplicationController
    before_action :set_user
    def new
        @note = Note.new
    end

    def index
        @note = Note.new 
    end

    def create
        @note = @user.notes.build(note_params)
       
        if @note.save!
        redirect_to @user
        else
        render 'new'
        end
    end

    def show
        @note = @user.notes
    end

    private

    def note_params
        params.require(:note).permit(:content, :user_id)
    end

    def set_user
        @user = User.find_by(params[:user_id])
    end
end
