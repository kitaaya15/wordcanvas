class TweetsController < ApplicationController
  def index
    @tweets = Tweet.includes(:user).order(created_at: :desc)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def edit
  end

  def search
    @tweets = SearchTweetsService.search(params[:keyword])
    render :index
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content, :image)
  end
end
