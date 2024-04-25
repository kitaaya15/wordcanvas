class Word < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :level

  with_options presence: true do
    validates :content
  end

  validates :level_id, numericality: { other_than: 1 , message: "can't be blank"} 
end
