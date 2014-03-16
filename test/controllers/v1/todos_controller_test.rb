require 'test_helper'

class V1::TodosControllerTest < ActionController::TestCase
  test 'raises error if unauthorized' do
    get(:index)
    assert_response :unauthorized
  end

  test 'indexes todos' do
    create_user
    10.times { @user.todos << Todo.new(text:'test') }
    @user.save
    get(:index, api_key: @user.api_key)
    assert_response 200
    assert JSON.parse(@response.body).length == 10
  end

  test 'creates todos' do
    create_user
    post(:create, api_key: @user.api_key, todo: {text: 'testing', date: Date.today} )
    assert @user.todos.count == 1
  end

  test 'destroys todos' do
    create_user
    10.times { @user.todos << Todo.new(text:'test') }
    @user.save
    delete(:destroy, api_key: @user.api_key, id: @user.todo_ids.first )
    assert @user.todos.count == 9
  end

  test 'updates todos' do 
    create_user
    10.times { @user.todos << Todo.new(text:'test') }
    @user.save
    put(:update, api_key: @user.api_key, id: @user.todo_ids.first, todo: { text: 'changed', date: Date.today}  )
    assert @user.reload.todos.first.text == 'changed'
  end



  # test "the truth" do
  #   assert true
  # end
end
