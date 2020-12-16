class TasksController < ApplicationController
  # GET /tasks
  def index
    tasks = Task.all

    render json: tasks
  end

  # GET /tasks/1
  def show
    user = User.find(params[:id])
    tasks = user.tasks
    render json: tasks
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def task_params
    params.require(:task).permit(:desc, :time, :user_id, :category_id)
  end
end
