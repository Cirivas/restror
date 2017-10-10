class Rest::Webservice1Controller < ApplicationController
	include Webservice

	def login
		if Rails.env.production?
		    uri = "http://restror.herokuapp.com/rest/verify_user/" + params[:email]
		else
		    uri = "http://localhost:3000/rest/verify_user/" + params[:email]
		end
		
		body = {
		  "image" => params[:image]
		}

		response = request_to_uri(uri, body)

		render json: JSON.parse(response.body), status: response.code
	end

	private

	def user_params
		params.require(:user).permit(:email, :image)
	end
end
