class SprintsController < ApplicationController
  before_action :set_sprint, only: [:edit, :update, :destroy]
  before_action :set_project

  # GET /sprints
  def index
    @sprints = @project.sprints
  end

  # GET /sprints/new
  def new
    @sprint = Sprint.new
  end

  # GET /sprints/1/edit
  def edit
  end

  # POST /sprints
  def create
    @sprint = Sprint.new(sprint_params)
    @project.sprints << @sprint

    if @project.save
      redirect_to project_sprints_url, notice: 'Sprint was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sprints/1
  def update
    if @sprint.update(sprint_params)
      redirect_to project_sprints_url, notice: 'Sprint was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sprints/1
  def destroy
    @sprint.destroy
    redirect_to project_sprints_url, notice: 'Sprint was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sprint
      @sprint = Sprint.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    # Only allow a trusted parameter "white list" through.
    def sprint_params
      params.require(:sprint).permit!
    end
end
