require 'test_helper'

class V1::SessionsControllerTest < ActionController::TestCase
  test 'it creates a session on login' do
    create_user
    post(:create, {email: 'test@gmail.com', password: 'password'})
    assert_not_nil @user.reload.session_token
  end

  test 'it destroys a session on logout' do
    create_user
    post(:destroy, {email: 'test@gmail.com', password: 'password'})
    assert_nil @user.reload.session_token
  end

  test 'api key does not change between sessions' do
    create_user
    post(:create, {email: 'test@gmail.com', password: 'password'})
    api_key = @user.reload.api_key
    post(:destroy, {email: 'test@gmail.com', password: 'password'})
    assert @user.reload.api_key == api_key
    post(:create, {email: 'test@gmail.com', password: 'password'})
    assert @user.reload.api_key == api_key
  end
  # test "the truth" do
  #   assert true
  # end
end
