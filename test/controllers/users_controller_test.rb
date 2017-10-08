require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get show" do
    user = users(:one)
    get user_url(user)
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should get edit" do
    user = users(:one)
    get edit_user_url(user)
    assert_response :success
  end

  test "post create" do
    upload = ActionDispatch::Http::UploadedFile.new({
      :filename => 'test_image.jpeg',
      :content_type => 'image/jpeg',
      :tempfile => File.new("#{Rails.root}/public/test_image.jpeg")
    })

    post 'http://localhost:3000/users', params: { user: { email: "test@email", image: upload } }
    assert_response :redirect
  end

  test "put update" do
    upload = ActionDispatch::Http::UploadedFile.new({
      :filename => 'test_image.jpeg',
      :content_type => 'image/jpeg',
      :tempfile => File.new("#{Rails.root}/public/test_image.jpeg")
    })

    put 'http://localhost:3000/users/1', params: { user: { image: upload } }
    assert_response :redirect
  end

  test "delete destroy" do
    user = users(:one)
    delete 'http://localhost:3000/users/1', params: { id: user.id }
    assert_response :redirect
  end

end
