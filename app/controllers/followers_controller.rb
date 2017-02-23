class FollowersController < ApplicationController
  before_action :load_follow_user, only: :index

  def index
    @title = t ".followers"
    # @user = User.find_by id: params[:user_id]
    @users = @user.followers.paginate page: params[:page], per_page: Settings.per_page
    render "users/show_follow"
  end
end
