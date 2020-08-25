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
    @categories = Category.all
    @task_users = TaskUser.all
    if @task.save
      flash[:success] = "投稿しました"
      redirect_to root_url
    else
      render "tasks/new"
    end
  end

  private

  def task_params
    params.require(:task).permit(:category_id, :task_users_id, :task_name, :message, :end_date, :temp_memo, :start_date, :priority, :cont_memo)
  end

end
