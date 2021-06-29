class ProjectsController < ApplicationController
  before_action :authenticate_user!
  def index
    @projects = Project.where(user: current_user)
  end

  def show
    project_find
  end
  
  def new
  end
  
  def create
    @project = Project.new(project_params)
    @project.user =  current_user
    if @project.save
      redirect_to @project
    else
      render :new
    end
  end

  def edit
    project_find
  end

  def update
      project_find
    if @project.update(project_params)
      redirect_to projects_path
    else
      render :edit
    end
  end

  def destroy
    project_find
    @project.destroy!
    redirect_to projects_path
  end


  private

  def project_params
    params.require(:project).permit(:name, :user_id)
  end

  def project_find
    @project = Project.find(params[:id])
  end
end
