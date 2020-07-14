class Exercise < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true
  validates :calories, :duration, presence: true, numericality: { greater_than: 0 }
end
