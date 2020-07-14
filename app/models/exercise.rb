class Exercise < ApplicationRecord
  has_one_attached :image

  validates :name, :calories, :duration, presence: true
end
