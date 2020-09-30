class TasksController < ApplicationController

  def show
  end

  def new
    @task = Task.new
  end

  def index
  end

  def create
    @task = Task.new(task_params)
  end

  private

  def task_params
    params.require(:task).permit(:category_id, :task_users_id, :task_name, :message, :end_date, :temp_memo, :start_date, :priority, :cont_memo)
  end

end
