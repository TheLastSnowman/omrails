class BuildsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  # GET /builds
  def index
    @builds = Build.all
  end

  # GET /builds/1
  def show
    @build = Build.find(params[:id])
  end

  # GET /builds/new
  def new
    @build = current_user.builds.new
  end

  # GET /builds/1/edit
  def edit
     @build = current_user.builds.find(params[:id])
  end

  # POST /builds
  def create
    @build = current_user.builds.new(build_params)
    if @build.save
      redirect_to @build, notice: 'Build was successfully created.'
    else
      render :new 
    end
  end

  # PATCH/PUT /builds/1
  def update
    @build = current_user.builds.find(params[:id])
    if @build.update(build_params)
      redirect_to @build, notice: 'Build was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /builds/1
  def destroy
    @build = current_user.builds.find(params[:id])
    @build.destroy
    redirect_to builds_url, notice: 'Build was successfully destroyed.'
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def build_params
      params.require(:build).permit(:ship, :name, :url, :comments)
    end
end
