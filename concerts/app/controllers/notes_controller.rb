class NotesController < ApplicationController
    before_action :set_user
    def new
        @note = Note.new
    end

    def index
        @notes = @user.notes


    end

    def create
       
        @note = @user.notes.build(note_params)
        if @note.save!
        render 'notes/show', :layout => false
        else
        render 'users/show'
        end
    end

    def show
        @note = @user.notes
    end

    private

    def note_params
        params.permit(:content)
    end

    def set_user
        @user = User.find(params[:user_id])
    end
end
