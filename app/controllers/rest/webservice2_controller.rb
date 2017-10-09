class Rest::Webservice2Controller < ApplicationController
	def verify_user
		user = User.where(email: params[:email]).first
		
		if user.nil?
			message, status = { "message" => "No encontrado" }, 404 
		else 
			if user.image == params[:image]

				message, status = { "message" => "OK" }, 200
			else
				message, status = { "message" => "No autorizado" }, 401
			end
		end

		render json: message, status: status
	end

	private

	def user_params
		params.require(:user).permit(:email, :image)
	end
end
