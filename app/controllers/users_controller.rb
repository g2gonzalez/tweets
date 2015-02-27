class UsersController < ApplicationController
  	def new
		@user = User.new
  	end
	
	def show
		@user = User.find(params[:id])
	end
	
	def create
   	@user = User.new(user_params)    # Not the final implementation!
    	if @user.save
      	# if successful submission is received do the following:
			flash[:success] = "Welcome to the Sample App!"
			redirect_to @user
    	else 
			# if there are errors with the form do the following:
      	render 'new'
    	end
  	end
	
	private

   	def user_params
      	params.require(:user).permit(:name, :email, :password, :password_confirmation) # <- only parameters allowed
    	end
end
