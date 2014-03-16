class V1::TodosController < ApplicationController
  before_action :authenticate

  def index
    @todos = @user.todos    
  end

  def show
    
  end

  def create
    @user.todos << Todo.new(todo_params)
    @user.save
    head :ok
  end

  def destroy
    @user.todos.find(params[:id]).destroy
    head :ok
  end

  def update
    @todo = @user.todos.find(params[:id])
    if @todo
      @todo.update_attributes(todo_params)
    else
      head :unauthorized and return
    end 
    
  end

  def authenticate
    @user = User.find_by(api_key: params[:api_key])
    head :unauthorized and return unless params[:api_key] && @user
  end


  private


  def todo_params
    params.require(:todo).permit(:text, :due_date, :priority, :complete)
  end

end
