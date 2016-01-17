class UsersController < ApplicationController

	def create
  		user = User.create(user_params)
  		if user 
  			log_in user
  			return render status: 201, json: { message: "User created"}
  		else 
  			return render status: 400, json: {error: "Could not create user"}
		end
  	end
end

private

 	def user_params
    	params.require(:user).permit(:name, :username, :phone_number, :password)
          	                        #:password_confirmation)
  end
