class FavoritesController < ApplicationController
  before_filter :require_login

  def create
    @tweet    = Tweet.find(params[:tweet_id])
    @favorite = @tweet.favorites.build(user: current_user)

    if @favorite.save
      redirect_to tweets_url, notice: "you favorited!"
    else
      redirect_to tweets_url, notice: "you've alrady favorited!"
    end
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @favorite = @tweet.favorites.find_by!(user_id: current_user.id)
    @favorite.destroy
    redirect_to tweets_url, notice: "you unfavorited!"
  end
end
