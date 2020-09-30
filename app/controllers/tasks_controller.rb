class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
    @tasks = Task.where(id: params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path
    end
  end

  def search
    @tasks = Task.where("task_name LIKE ?", "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json {
        render json: @tasks
      }
    end
  end

  private
  def task_params
    params.require(:task).permit(:task_users_id, :task_name, :temp_memo, :end_date, :priority, :status, :start_date, :cont_memo, :is_cron, :is_share, :message)
  end

end
