class UsersController < ApplicationController


	def index
	    @users = User.all
	end


	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
	 if @user.save
	    redirect_to root_url
	else
	  render 'new'
	end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
	 if @user.update_attributes(user_params)
	    flash[:success] = "Profile updated"
	    redirect_to @user

	  # Handle a successful update.
	else
	  render 'edit'
	end
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User deleted."
		redirect_to root_path
	end

	private

	def user_params
	  params.require(:user).permit(:name, :age, :address)
	end

end
