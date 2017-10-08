require 'base64'
require 'test_helper'
 
class UserModeImageUploaderTest < ActiveSupport::TestCase
    
    test "Image Upload" do
        user = User.new

        user.email = "testinq@email.com"
        user.image = Base64.encode64(File.read("#{Rails.root}/public/test_image.jpeg"))
        
        assert user.valid?, user.errors.full_messages.inspect
    end
end
