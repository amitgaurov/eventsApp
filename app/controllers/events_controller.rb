class EventsController < ApplicationController
	def index
	    @events = Event.all
	end


	def show
		@event = Event.find(params[:id])
	end

	def new
		@event  = Event.new
	end

	def create
		@event  = Event.new(event_params)
	 if @event.save
	    redirect_to root_url
	else
	  render 'new'
	end
	end

	def edit
		@event  = Event.find(params[:id])
	end

	def update
		@event  = Event.find(params[:id])
	 if @event .update_attributes(event_params)
	    flash[:success] = "Profile updated"
	    redirect_to @event 

	  # Handle a successful update.
	else
	  render 'edit'
	end
	end

	def destroy
		Event.find(params[:id]).destroy
		flash[:success] = "event deleted."
		redirect_to root_path
	end

	private

	def event_params
	  params.require(:event).permit(:date, :place, :user_id)
	end
end
