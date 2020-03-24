class TasksController < ApplicationController
  def index
    # @tasks = @user.tasks
  end

  def new
    @task = Task.new
  end

  def edit
  end

end
