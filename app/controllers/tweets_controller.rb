class TweetsController < ApplicationController
  def index
    @tweets = Tweet.includes(:user).order(created_at: :desc)
  end
end
