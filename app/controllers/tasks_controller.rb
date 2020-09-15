class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
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
    @task = Task.find(params[:id])
  end

end
