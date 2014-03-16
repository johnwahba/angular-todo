require 'test_helper'

class V1::UsersControllerTest < ActionController::TestCase
  test 'create new user' do
    post(:create, {email: 'test@gmail.com', password: 'password', password_confirmation: 'password'})
    user =  User.find_by(email: 'test@gmail.com')
    assert_not_nil user
    assert user.authenticate('password')
  end
end
