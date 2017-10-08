require 'test_helper'

class UserTest < ActiveSupport::TestCase
    test "Validating user" do
        user = User.new
        assert_not user.save, "User saved without email and image"
    end
end
