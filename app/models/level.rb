class Level < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'Beginner' },
    { id: 3, name: 'Intermediate' },
    { id: 4, name: 'Advanced' },
  ]

  include ActiveHash::Associations
  has_many :words

  end