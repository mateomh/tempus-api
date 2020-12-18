class TasksController < ApplicationController
  before_action :user_from_token, only: %i[index create]
  # GET /tasks
  def index
    # user = check_authorization
    if @user.nil?
      render response: 'Not authorized', status: 403
    else
      tasks = @user.tasks
      render json: tasks
    end
  end

  # POST /tasks
  def create
    # user = check_authorization
    if @user.nil?
      render response: 'Not authorized', status: 403
    else
      task = Task.new(task_params)

      if task.save
        render json: task, status: :created
      else
        render json: task.errors, status: :unprocessable_entity
      end
    end
  end

  private

  def user_from_token
    @user = check_authorization
  end

  # Only allow a trusted parameter "white list" through.
  def task_params
    params.require(:task).permit(:desc, :time, :user_id, :category_id)
  end
end
