class WordsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_word, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @beginners = words_for_level('Beginner')
    @intermediates = words_for_level('Intermediate')
    @advanceds = words_for_level('Advanced')
    @words = Word.includes(:user).order(:content)
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    if @word.save
      redirect_to words_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @word.update(word_params)
      redirect_to words_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @word.destroy
    redirect_to word_path
  end

  def edit
    unless user_signed_in? && current_user == @word.user
      redirect_to root_path
      return
    end
  end

  def update
    if @word.update(word_params)
      redirect_to word_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_word
    @word = Word.find(params[:id])
  end

  def correct_user
    redirect_to root_path, alert: "Not authorized" unless @word.user == current_user
  end
  
  def words_for_level(level_name)
    level_id = Level.find_by(name: level_name).id
    Word.includes(:user).where(level_id: level_id).order(:content)
  end

  def word_params
    params.require(:word).permit(
      :content,
      :level_id,
      :meaning,
      :phonetic_symbol,
      :part_of_speech,
      :etymology,
      :example_sentence,
      :other,
      :image
    ).merge(user_id: current_user.id)
  end
end
