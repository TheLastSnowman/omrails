class VotesController < ApplicationController
  before_action :authenticate_user!
  def create_upvote
    build = Build.find(params[:id])
    mwo_build = MwoBuild.find(params[:id])
    build.liked_by current_user
    mwo_build.liked_by current_user
    redirect_back(fallback_location: root_path)
  end

   def create_downvote
    build = Build.find(params[:id])
    mwo_build = MwoBuild.find(params[:id])
    build.disliked_by current_user
    mwo_build.disliked_by current_user
    redirect_back(fallback_location: root_path)
  end

  def destroy_upvote
    build = Build.find(params[:id])
    mwo_build = MwoBuild.find(params[:id])
    build.unliked_by current_user
    mwo_build.unliked_by current_user
    redirect_back(fallback_location: root_path)
  end

    def destroy_downvote
    build = Build.find(params[:id])
    mwo_build = MwoBuild.find(params[:id])
    build.undisliked_by current_user
    mwo_build.undisliked_by current_user
    redirect_back(fallback_location: root_path)
  end
end