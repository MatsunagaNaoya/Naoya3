class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = "タスク新規作成しました。"
      redirect_to user_tasks_url @user
    else
      render :new
    end
  end

  def edit
    
  end
  
end
