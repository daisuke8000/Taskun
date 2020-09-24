class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def destory
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  def edit
    @tasks = Task.find(params[:id])
  end

  def update
    @task = Task.find(task_params)
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
    params.require(:task).permit(:task_name, :cont_memo)
  end

end
