class TasksController < ApplicationController

  def index
    @tasks = @user.tasks.all
  end

  def show
    # @task_id = params[:id]
  end

  def new
    @task = @user.tasks.new(task_params)
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
  
    private
    
    def set_user
       @user = User.find(params[:user_id])
       
    end
    
    def task_params
      params.require(:task).permit(:title,:note,:user_id)

    end
end