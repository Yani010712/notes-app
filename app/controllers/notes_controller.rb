class NotesController < ApplicationController
    protect_from_forgery except: [:index, :show, :create, :update, :destroy]
    before_action :current_note, only: [:show, :update, :destroy]

    def index
        @notes = Note.all
    end

    def show
    end
 
    def create
        @note = Note.new(note_params)
         
        @note.save
        redirect_to @note
    
     end

     def update
        @note.update(note: note_params["note"])
        redirect_to :action => 'show', :id => @note 
     end

     

     def destroy
        @note.destroy
        redirect_to :action => 'index'

     end

     private
        def note_params
            params.permit(:note)
        end

        def current_note
            @note = Note.find(params[:id])
          end
end
