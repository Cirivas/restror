require 'test_helper'

class Rest::Webservice1ControllerTest < ActionDispatch::IntegrationTest
	test "Login" do
		user = users(:one)
		host! 'http://localhost:3000'
		post rest_login_url, params: { "email" => user.email, "image" => user.image }
		assert_response :success
	end
end
