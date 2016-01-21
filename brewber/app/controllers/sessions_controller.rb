class SessionsController < ApplicationController
  def create
    user = User.find_by(phone_number: params[:session][:phone_number].downcase)
    if user && user.authenticate(params[:session][:password])
    	log_in user
    	return render status: 200, json: { user_info: user.to_json}
    else
    	return render status: 400, json: { error: "Failed to login"}
    end
  end
end