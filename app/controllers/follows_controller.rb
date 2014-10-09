class FollowsController < ApplicationController
  before_filter :require_login

  def create
    @user   = User.find(params[:user_id])
    @user.followers << current_user

    redirect_to tweets_url
  end

  def destroy
    @user   = User.find(params[:user_id])
    @follow = @user.follows.find_by!(follower_id: current_user.id)
    @follow.destroy

    redirect_to tweets_url
  end
end
