class FollowingsController < ApplicationController
  before_action :load_follow_user, only: :index

  def index
    @title = t ".following"
    @users = @user.following.paginate page: params[:page], per_page: Settings.per_page
    render "users/show_follow"
  end
end
