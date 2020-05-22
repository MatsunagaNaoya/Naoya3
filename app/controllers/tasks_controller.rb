class TasksController < ApplicationController
  before_action :set_user
  
  def index
    @tasks = @user.tasks
  end

  def show
    @comment = @task.comments.build
  end

  def new
    @task = Task.new
  end
  
  def create
    @task = @user.tasks.build(task_params)
    if @task.save
      flash[:success] = "タスク新規作成しました。"
      redirect_to user_tasks_url @user
    else
      render :new
    end
  end

  def edit
    
  end
  
    private
    
    def set_user
       @user = User.find(params[:user_id])
    end
    
    def task_params
      params.require(:task).permit(:title,:note,:user_id)

    end
end