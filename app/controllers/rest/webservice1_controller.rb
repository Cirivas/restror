class Rest::Webservice1Controller < ApplicationController

	def login
		client = HTTPClient.new

		extHeaders = [["Content-type","application/json"]]

		body = { "image" => params[:image] }
		response = client.post(rest_verify_user_url(params[:email]) , body.to_json, extHeaders)

		render json: JSON.parse(response.content), status: response.status
	end

	private

	def user_params
		params.require(:user).permit(:email, :image)
	end
end
