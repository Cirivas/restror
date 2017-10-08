require 'test_helper'

class Rest::Webservice2ControllerTest < ActionDispatch::IntegrationTest
	test "webservice responses" do
		user = users(:one)

		puts user.image.class

		post rest_verify_user_path(user.email), params: { 'image' => user.image }
		assert_response :success
	end
end
