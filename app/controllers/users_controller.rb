class UsersController < ApplicationController
  def show
  	def show
    @user = User.find_by(username: params[:username])
    @builds = @user.builds
    @mwo_builds = @user.mwo_builds
  end
  end
end
