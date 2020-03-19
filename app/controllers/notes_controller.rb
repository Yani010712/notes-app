class NotesController < ApplicationController
    protect_from_forgery except: [:index, :show, :create, :edit, :update, :destroy]

    def index
        @notes = Note.all
    end

    def show
        @note = Note.find(params[:id])
    end
 
    def create
        @note = Note.new(note_params)
         
        @note.save
        redirect_to @note
    
     end

     def update
        @note = Note.find(params[:id])
        @note.update(note: note_params["note"])
        redirect_to :action => 'show', :id => @note 
     end

     

     def destroy
        @note = Note.find(params[:id]).destroy
        redirect_to :action => 'index'

     end

     private
        def note_params
            params.permit(:note)
        end
end
