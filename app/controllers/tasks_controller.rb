class TasksController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /tasks
  def index
    @tasks = Task.all

    render json: @tasks
  end

  # GET /tasks/1
  def show
    @tasks = @user.tasks
    render json: @tasks
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

  # # PATCH/PUT /tasks/1
  # def update
  #   if @task.update(task_params)
  #     render json: @task
  #   else
  #     render json: @task.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /tasks/1
  # def destroy
  #   @task.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:desc, :time, :user_id, :category_id)
    end

end
