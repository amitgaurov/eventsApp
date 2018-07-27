class InvitationsController < ApplicationController
	def new
		@invitation = Invitation.new
	end

	def create
		@invitation = Invitation.new
	 if @invitation.save
	    redirect_to root_url
	else
	  render 'new'
	end
	end 
end
