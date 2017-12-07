class MwoBuildsController < ApplicationController
  before_action :set_mwo_build, only: [:show, :edit, :update, :destroy]

  # GET /mwo_builds
  # GET /mwo_builds.json
  def index
    @mwo_builds = MwoBuild.all
  end

  # GET /mwo_builds/1
  # GET /mwo_builds/1.json
  def show
  end

  # GET /mwo_builds/new
  def new
    @mwo_build = MwoBuild.new
  end

  # GET /mwo_builds/1/edit
  def edit
  end

  # POST /mwo_builds
  # POST /mwo_builds.json
  def create
    @mwo_build = MwoBuild.new(mwo_build_params)

    respond_to do |format|
      if @mwo_build.save
        format.html { redirect_to @mwo_build, notice: 'Mwo build was successfully created.' }
        format.json { render :show, status: :created, location: @mwo_build }
      else
        format.html { render :new }
        format.json { render json: @mwo_build.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mwo_builds/1
  # PATCH/PUT /mwo_builds/1.json
  def update
    respond_to do |format|
      if @mwo_build.update(mwo_build_params)
        format.html { redirect_to @mwo_build, notice: 'Mwo build was successfully updated.' }
        format.json { render :show, status: :ok, location: @mwo_build }
      else
        format.html { render :edit }
        format.json { render json: @mwo_build.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mwo_builds/1
  # DELETE /mwo_builds/1.json
  def destroy
    @mwo_build.destroy
    respond_to do |format|
      format.html { redirect_to mwo_builds_url, notice: 'Mwo build was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mwo_build
      @mwo_build = MwoBuild.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mwo_build_params
      params.require(:mwo_build).permit(:user_id, :name, :mech, :url, :comments)
    end
end
