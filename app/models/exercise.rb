class Exercise < ApplicationRecord
  has_one_attached :image

  validates :name, :calories, :date, :duration, presence: true
end
