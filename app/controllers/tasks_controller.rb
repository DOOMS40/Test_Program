class TasksController < ApplicationController
  before_action :authenticate_user!
  attr_accessor :tasks
  def index
    @tasks = Task.all
  end
  
  def show
    task_find
  end

  def new
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new(task_params)
    if @task.save
      redirect_to @project
    else
      render action: 'new'
    end
  end

  def edit
    task_find
  end

  def update
    task_find
    if @task.update(task_params)
      redirect_to @task.project
    else
      render action: 'edit'
    end
  end

  def destroy
    task_find
    @task.destroy
    redirect_to @task.project
  end

  private

  def task_params
     params.require(:task).permit(:name, :deadline, :status, :priority) 
      
  end

  def task_find
    @task = Task.find(params[:id])
  end
end
