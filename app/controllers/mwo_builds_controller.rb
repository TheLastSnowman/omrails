class MwoBuildsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  # GET /mwo_builds
  def index
    @mwo_builds = MwoBuild.all
  end

  # GET /mwo_builds/1
  def show
    @mwo_build = MwoBuild.find(params[:id])
  end

  # GET /mwo_builds/new
  def new
    @mwo_build = current_user.mwo_builds.new
  end

  # GET /mwo_builds/1/edit
  def edit
    @mwo_build = current_user.mwo_builds.find(params[:id])
  end

  # POST /mwo_builds
  def create
    @mwo_build = current_user.mwo_builds.new(mwo_build_params)
    if @mwo_build.save
      redirect_to @mwo_build, notice: 'Mech build was successfully created.'
     else
      render :new
    end
  end

  # PATCH/PUT /mwo_builds/1
  def update
    @mwo_build = current_user.mwo_builds.find(params[:id])
    if @mwo_build.update(mwo_build_params)
      redirect_to @mwo_build, notice: 'Mech build was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mwo_builds/1
  def destroy
    @mwo_build = current_user.mwo_builds.find(params[:id])
    @mwo_build.destroy
    redirect_to mwo_builds_url, notice: 'Mech build was successfully deleted.'
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def mwo_build_params
      params.require(:mwo_build).permit(:name, :mech, :url, :comments)
    end
end