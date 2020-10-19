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
    p = @project = Project.new(params_project)
    p.user =  current_user
    if p.save
      redirect_to @project
    else
      render action: 'new'
    end
  end

  def edit
    project_find
  end

  def update
      project_find
    if @project.update(params_project)
      redirect_to projects_path
    else
      render action: 'edit'
    end
  end

  def destroy
    project_find
    @project.destroy!
    redirect_to projects_path
  end


  private

  def params_project
    params.require(:project).permit(:name, :user_id)
  end

  def project_find
    @project = Project.find(params[:id])
  end
end
