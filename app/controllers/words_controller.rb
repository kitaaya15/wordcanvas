class WordsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @word = Word.find(params[:id])
  end

  private

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