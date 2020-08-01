class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def index
  end
end
