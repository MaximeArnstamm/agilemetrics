class SprintsController < ApplicationController
  before_action :set_project
  before_action :set_sprint, only: [:edit, :update, :destroy]

  # GET /sprints
  def index
    @sprints = @project.sprints.order(:number)

    respond_to do |format|
      format.html
      format.json { render json: @sprints }
    end
  end

  # GET /sprints/new
  def new
    last_sprint = @project.last_sprint
    if last_sprint
      @sprint = last_sprint.next_sprint
    else
      @sprint = Sprint.new
      @sprint.startDate = DateTime.now.to_date
      @sprint.endDate = DateTime.now.to_date
    end
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

  def dashboard
    @sprints = @project.sprints.order(:number)
    if !@sprints || @sprints.count == 0
      redirect_to project_sprints_url
    end

    @last_sprint = @sprints.last
    @bugs_data = @sprints.to_json(:only => [:number, :internalBugs, :externalBugs])
    @satisfaction_data = @sprints.to_json(:only => [:number, :teamSatisfaction, :clientSatisfaction])
    @velocity_data = @sprints.to_json(:only => [:endDate, :velocityForecast, :velocityReal])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sprint
      @sprint = @project.sprints.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    # Only allow a trusted parameter "white list" through.
    def sprint_params
      params.require(:sprint).permit!
    end
end
