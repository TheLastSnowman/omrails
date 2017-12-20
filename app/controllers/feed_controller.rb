class FeedController < ApplicationController
  before_action :authenticate_user!
  def show
  	@builds = Build.where(user: current_user.all_following)
  	@mwo_builds = MwoBuild.where(user: current_user.all_following)
  end
end
